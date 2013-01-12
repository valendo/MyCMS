using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MyCMS.Admin
{
    public partial class User : System.Web.UI.Page
    {
        string[] rolesArray;
        MembershipUserCollection users;
        string[] usersInRole;

        protected void Page_Load(object sender, EventArgs e)
        {
            Msg.Text = "";
            if (!IsPostBack)
            {
                //Users
                BindUsers();
                //Roles/
                BindRoles();
                //User in roles
                // Bind roles to ListBox.
                rolesArray = Roles.GetAllRoles();
                RolesListBox.DataSource = rolesArray;
                RolesListBox.DataBind();
                // Bind users to ListBox.
                users = Membership.GetAllUsers();
                UsersListBox.DataSource = users;
                UsersListBox.DataBind();
            }

            string RoleName = "-1";
            if (RolesListBox.SelectedItem != null)
            {
                RoleName = RolesListBox.SelectedItem.Value;
            }
            // Show users in role. Bind user list to GridView.
            usersInRole = Roles.GetUsersInRole(RoleName);
            UsersInRoleGrid.DataSource = usersInRole;
            UsersInRoleGrid.DataBind();
        }

        #region Users
        protected void BindUsers()
        {
            gvUsers.DataSource = Membership.GetAllUsers();
            gvUsers.DataBind();
        }

        protected void gvUsers_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "insert")
            {
                if (Page.IsValid)
                {
                    string UserName = ((TextBox)gvUsers.FooterRow.FindControl("txtUserName")).Text;
                    string Password = ((TextBox)gvUsers.FooterRow.FindControl("txtPassword")).Text;
                    string Email = ((TextBox)gvUsers.FooterRow.FindControl("txtEmail")).Text;
                    if (Membership.GetUser(UserName) == null)
                    {
                        Membership.CreateUser(UserName, Password, Email);
                        BindUsers();
                    }
                }
            }
        }

        protected void gvUsers_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string UserName = ((Label)gvUsers.Rows[e.RowIndex].Cells[1].FindControl("lblUserName")).Text;
            if (UserName != "host" && UserName != "admin")
            {
                Membership.DeleteUser(UserName);
                BindUsers();
            }
        }

        protected void gvUsers_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvUsers.EditIndex = e.NewEditIndex;
            BindUsers();
        }

        protected void gvUsers_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvUsers.EditIndex = -1;
            BindUsers();
        }

        protected void gvUsers_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            if (Page.IsValid)
            {
                string UserName = ((Label)gvUsers.Rows[e.RowIndex].FindControl("lblUserName")).Text;
                string Email = ((TextBox)gvUsers.Rows[e.RowIndex].FindControl("txtEmail")).Text;
                MembershipUser user = Membership.GetUser(UserName);
                user.Email = Email;
                Membership.UpdateUser(user);
                gvUsers.EditIndex = -1;
                BindUsers();
            }
        }

        protected void gvUsers_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvUsers.PageIndex = e.NewPageIndex;
            BindUsers();
        }
        #endregion

        #region Roles
        protected void BindRoles()
        {
            gvRoles.DataSource = Roles.GetAllRoles();
            gvRoles.DataBind();
        }

        protected void gvRoles_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "insert")
            {
                if (Page.IsValid)
                {
                    string RoleName = ((TextBox)gvRoles.FooterRow.FindControl("txtRoleName")).Text;
                    if (!Roles.RoleExists(RoleName))
                    {
                        Roles.CreateRole(RoleName);
                        BindRoles();
                    }
                }
            }
        }

        protected void gvRoles_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string RoleName = ((Label)gvRoles.Rows[e.RowIndex].Cells[1].FindControl("lblRoleName")).Text;
            if (RoleName != "Admin" && RoleName != "Anonymous")
            {
                string[] currentUserRoles;
                currentUserRoles = Roles.GetUsersInRole(RoleName);
                if (currentUserRoles.Length > 0)
                {
                    Roles.RemoveUsersFromRole(currentUserRoles, RoleName);
                }
                Roles.DeleteRole(RoleName);
                BindRoles();
            }
        }

        protected void gvRoles_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvRoles.EditIndex = e.NewEditIndex;
            BindRoles();
        }

        protected void gvRoles_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvRoles.EditIndex = -1;
            BindRoles();
        }

        //protected void gvRoles_RowDataBound(object sender, GridViewRowEventArgs e)
        //{
        //    if (e.Row.RowType == DataControlRowType.DataRow)
        //    {
        //        foreach (ImageButton button in e.Row.Cells[0].Controls.OfType<ImageButton>())
        //        {
        //            if (button.CommandName == "Delete")
        //            {
        //                button.Attributes["onclick"] = "if(!confirm('Do you want to delete?')){ return false; };";
        //            }
        //        }
        //    }
        //}
        #endregion

        #region Users in roles
        public void AddUsers_OnClick(object sender, EventArgs args)
        {
            // Verify that a role is selected.
            if (RolesListBox.SelectedItem == null)
            {
                Msg.Text = "Please select a role.";
                return;
            }
            // Verify that at least one user is selected.
            if (UsersListBox.SelectedItem == null)
            {
                Msg.Text = "Please select one or more users.";
                return;
            }
            // Create list of users to be added to the selected role.
            string[] newusers = new string[UsersListBox.GetSelectedIndices().Length];

            for (int i = 0; i < newusers.Length; i++)
            {
                newusers[i] = UsersListBox.Items[UsersListBox.GetSelectedIndices()[i]].Value;
            }
            // Add the users to the selected role.
            try
            {
                Roles.AddUsersToRole(newusers, RolesListBox.SelectedItem.Value);
                // Re-bind users in role to GridView.
                usersInRole = Roles.GetUsersInRole(RolesListBox.SelectedItem.Value);
                UsersInRoleGrid.DataSource = usersInRole;
                UsersInRoleGrid.DataBind();
            }
            catch (Exception e)
            {
                Msg.Text = e.Message;
            }
        }


        public void UsersInRoleGrid_RemoveFromRole(object sender, GridViewCommandEventArgs args)
        {
            // Get the selected user name to remove.
            int index = Convert.ToInt32(args.CommandArgument);
            string username = ((DataBoundLiteralControl)UsersInRoleGrid.Rows[index].Cells[0].Controls[0]).Text;
            // Remove the user from the selected role.
            try
            {
                Roles.RemoveUserFromRole(username, RolesListBox.SelectedItem.Value);
            }
            catch (Exception e)
            {
                Msg.Text = "An exception of type " + e.GetType().ToString() +
                           " was encountered removing the user from the role.";
            }
            // Re-bind users in role to GridView.
            usersInRole = Roles.GetUsersInRole(RolesListBox.SelectedItem.Value);
            UsersInRoleGrid.DataSource = usersInRole;
            UsersInRoleGrid.DataBind();
        }
        #endregion
    }
}