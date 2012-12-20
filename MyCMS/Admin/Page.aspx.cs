using MyCMS.Model;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MyCMS.Admin
{
    public partial class Page : System.Web.UI.Page
    {
        MyCMSContext db = new MyCMSContext();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindingParentPages();
                DirectoryInfo dirTheme = new DirectoryInfo(Server.MapPath("~/Themes"));
                List<string> Folders = new List<string>();
                foreach (DirectoryInfo item in dirTheme.GetDirectories())
                {
                    Folders.Add(item.Name);
                }
                ddlTheme.DataSource = Folders;
                ddlTheme.DataBind();
                
            }
            BindingLayout();
        }

        private void BindingParentPages()
        {
            var list = db.Pages.ToList();
            ddlParentPage.DataSource = list;
            ddlParentPage.DataTextField = "PageName";
            ddlParentPage.DataValueField = "PageId";
            ddlParentPage.DataBind();
            ddlParentPage.Items.Insert(0, new ListItem("-None-", "-1"));
        }

        private void BindingLayout()
        {
            List<string> Files = new List<string>();
            DirectoryInfo dirLayout = new DirectoryInfo(Server.MapPath("~/Themes/" + ddlTheme.SelectedValue));
            foreach (FileInfo item in dirLayout.GetFiles())
            {
                Files.Add(item.Name);
            }
            ddlLayout.DataSource = Files;
            ddlLayout.DataBind();
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            var p = new MyCMS.Model.Page();
            p.PageName = txtPageName.Text;
            p.Title = txtTittle.Text;
            p.ParentId = int.Parse(ddlParentPage.SelectedValue);
            p.PageSEO = txtPageSEO.Text;
            p.PageOrder = int.Parse(txtPageOrder.Text);
            p.IsVisible = chkIsVisible.Checked;
            p.Description = txtDescription.Text;
            p.Keywords = txtKeywords.Text;
            p.Theme = ddlTheme.SelectedValue;
            p.Layout = ddlLayout.SelectedValue;
            db.Pages.Add(p);
            db.SaveChanges();
        }
    }
}