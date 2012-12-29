using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MyCMS.Admin
{
    public partial class Role : System.Web.UI.Page
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
            gvRoles.DataSource = Roles.GetAllRoles();
            gvRoles.DataBind();
        }

        protected void gvRoles_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "insert")
            {
                string RoleName = ((TextBox)gvRoles.FooterRow.FindControl("txtRoleName")).Text;
                if (!Roles.RoleExists(RoleName))
                {
                    Roles.CreateRole(RoleName);
                    BindData();
                }
            }
        }

        protected void gvRoles_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string RoleName = ((Label)gvRoles.Rows[e.RowIndex].Cells[1].FindControl("lblRoleName")).Text;
            if (RoleName != "host" && RoleName != "admin")
            {
                Roles.DeleteRole(RoleName);
                BindData();
            }
        }

        protected void gvRoles_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvRoles.EditIndex = e.NewEditIndex;
            BindData();
        }

        protected void gvRoles_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvRoles.EditIndex = -1;
            BindData();
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
    }
}