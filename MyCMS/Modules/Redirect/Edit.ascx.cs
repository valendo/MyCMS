using MyCMS.Logic;
using MyCMS.Model;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MyCMS.Modules.Redirect
{
    public partial class Edit : BaseAdminUserControl
    {
        MyCMSContext db = new MyCMSContext();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindingPages();
                var redirect = db.Redirects.Where(t => t.ModuleId == this.ModuleId).FirstOrDefault();
                if (redirect != null)
                {
                    BindingType(redirect.Type);
                    rbtType.SelectedValue = redirect.Type;
                    
                    if (redirect.Type == "link")
                    {
                        txtExternalUrl.Text = redirect.Url;
                    }
                    else if (redirect.Type == "file")
                    {
                        txtFile.Text = redirect.Url;
                    }
                }
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            var redirect = db.Redirects.Where(t => t.ModuleId == this.ModuleId).FirstOrDefault();
            var oRedirect = new RedirectInfo();
            string type = rbtType.SelectedValue;
            if (redirect != null)
            {
                oRedirect = db.Redirects.Where(t => t.ModuleId == this.ModuleId).FirstOrDefault();
                oRedirect.Type = type;
                if (type == "page")
                {
                    oRedirect.PageId = int.Parse(rbtPage.SelectedValue);
                }
                else if (type == "link")
                {
                    oRedirect.Url = txtExternalUrl.Text;
                }
                else if (type == "file")
                {
                    oRedirect.Url = txtFile.Text;
                }
                db.Entry(oRedirect).State = EntityState.Modified;
                db.SaveChanges();
            }
            else
            {
                oRedirect.ModuleId = this.ModuleId;
                oRedirect.Type = type;
                if (type == "page")
                {
                    oRedirect.PageId = int.Parse(rbtPage.SelectedValue);
                }
                else if (type == "link")
                {
                    oRedirect.Url = txtExternalUrl.Text;
                }
                else if (type == "file")
                {
                    oRedirect.Url = txtFile.Text;
                }
                db.Redirects.Add(oRedirect);
                db.SaveChanges();
            }
            ScriptManager.RegisterClientScriptBlock(this, typeof(Page), UniqueID, "closePopup();", true);
        }

        private void BindingType(string type)
        {
            if (type == "page")
            {
                panelPage.Visible = true;
                panelLink.Visible = false;
                panelFile.Visible = false;
            }
            else if (type == "link")
            {
                panelPage.Visible = false;
                panelLink.Visible = true;
                panelFile.Visible = false;
            }
            else if (type == "file")
            {
                panelPage.Visible = false;
                panelLink.Visible = false;
                panelFile.Visible = true;
            }
        }

        protected void rbtType_SelectedIndexChanged(object sender, EventArgs e)
        {
            BindingType(rbtType.SelectedValue);
        }

        private void BindingPages()
        {
            var pages = db.Pages.Where(t => t.ParentId == -1).ToList();
            ListItemCollection list = new ListItemCollection();
            MyCMS.Utility.GetListPages(pages, ref list, 0);
            rbtPage.DataSource = list;
            rbtPage.DataTextField = "Text";
            rbtPage.DataValueField = "Value";
            rbtPage.DataBind();
            var redirect = db.Redirects.Where(t => t.ModuleId == this.ModuleId).FirstOrDefault();
            if (rbtType.SelectedValue == "page" && redirect != null)
            {
                if (redirect.PageId != 0)
                {
                    ListItem li = rbtPage.Items.FindByValue(redirect.PageId.ToString());
                    if (li != null)
                    {
                        li.Selected = true;
                    }
                }
            }
        }

        
    }
}