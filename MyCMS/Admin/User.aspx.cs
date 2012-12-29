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
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindData();
            }
        }

        protected void BindData()
        {
            gvUsers.DataSource = Membership.GetAllUsers();
            gvUsers.DataBind();
        }

        protected void gvUsers_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "insert")
            {
                string UserName = ((TextBox)gvUsers.FooterRow.FindControl("txtUserName")).Text;
                string Password = ((TextBox)gvUsers.FooterRow.FindControl("txtPassword")).Text;
                string Email = ((TextBox)gvUsers.FooterRow.FindControl("txtEmail")).Text;
                if (Membership.GetUser(UserName) == null)
                {
                    Membership.CreateUser(UserName, Password, Email);
                    BindData();
                }
            }
        }

        protected void AddNew(string RoleName)
        {
            //if (!Users.RoleExists(RoleName))
            //{
            //    Users.CreateRole(RoleName);
            //    BindData();
            //}
        }

        protected void gvUsers_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            //string RoleName = ((Label)gvUsers.Rows[e.RowIndex].Cells[1].FindControl("lblRoleName")).Text;
            //if (RoleName != "host" && RoleName != "admin")
            //{
            //    Users.DeleteRole(RoleName);
            //    BindData();
            //}
        }

        protected void gvUsers_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvUsers.EditIndex = e.NewEditIndex;
            BindData();
        }

        protected void gvUsers_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvUsers.EditIndex = -1;
            BindData();
        }

        protected void gvUsers_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            string UserName = ((Label)gvUsers.Rows[e.RowIndex].FindControl("lblUserName")).Text;
            string Email = ((TextBox)gvUsers.Rows[e.RowIndex].FindControl("txtEmail")).Text;
            MembershipUser user = Membership.GetUser(UserName);
            user.Email = Email;
            Membership.UpdateUser(user);
            gvUsers.EditIndex = -1;
            BindData();
        }
    }
}