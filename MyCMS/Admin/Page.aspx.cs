using MyCMS.Model;
using System;
using System.Collections.Generic;
using System.Data;
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
                string action = Request.QueryString["act"].ToString();
                int pageId = int.Parse(Request.QueryString["pid"].ToString());

                BindingParentPages();
                DirectoryInfo dirTheme = new DirectoryInfo(Server.MapPath("~/Themes"));
                List<string> Folders = new List<string>();
                foreach (DirectoryInfo item in dirTheme.GetDirectories())
                {
                    Folders.Add(item.Name);
                }
                ddlTheme.DataSource = Folders;
                ddlTheme.DataBind();
                BindingLayout();

                if (action == "update")
                {
                    BindingData(pageId);
                }
                else if (action == "delete")
                {
                    var p = db.Pages.Find(pageId);
                    db.Pages.Remove(p);
                    db.SaveChanges();
                    ScriptManager.RegisterClientScriptBlock(this, typeof(Page), UniqueID, "closePopup();", true);
                }
                
            }
        }

        private void BindingData(int PageId)
        { 
            var p = db.Pages.Where(t => t.PageId == PageId).FirstOrDefault();
            txtPageName.Text = p.PageName;
            txtTitle.Text = p.Title;
            ddlParentPage.SelectedValue = p.ParentId.ToString();
            txtPageSEO.Text = p.PageSEO;
            txtPageOrder.Text = p.PageOrder.ToString();
            chkIsVisible.Checked = p.IsVisible;
            txtDescription.Text = p.Description;
            txtKeywords.Text = p.Keywords;
            ddlTheme.SelectedValue = p.Theme;
            BindingLayout();
            ddlLayout.SelectedValue = p.Layout;
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
            string action = Request.QueryString["act"].ToString();
            int pageId = int.Parse(Request.QueryString["pid"].ToString());
            var p = new MyCMS.Model.PageInfo();
            if (action == "update")
            {
                p = db.Pages.Find(pageId);
            }
            p.PageName = txtPageName.Text;
            p.Title = txtTitle.Text;
            p.ParentId = int.Parse(ddlParentPage.SelectedValue);
            p.PageSEO = txtPageSEO.Text;
            p.PageOrder = int.Parse(txtPageOrder.Text);
            p.IsVisible = chkIsVisible.Checked;
            p.Description = txtDescription.Text;
            p.Keywords = txtKeywords.Text;
            p.Theme = ddlTheme.SelectedValue;
            p.Layout = ddlLayout.SelectedValue;
            if (action == "update")
            {
                db.Entry(p).State = EntityState.Modified;
            }
            else
            {
                db.Pages.Add(p);
            }
            db.SaveChanges();
            ScriptManager.RegisterClientScriptBlock(this, typeof(Page), UniqueID, "closePopup();", true);
        }

        protected void ddlTheme_SelectedIndexChanged(object sender, EventArgs e)
        {
            BindingLayout();
        }
    }
}