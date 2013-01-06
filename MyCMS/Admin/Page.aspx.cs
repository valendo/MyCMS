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
            ddlParentPage.Items.FindByValue(p.ParentId.ToString()).Attributes.Add("style", "font-weight:bold;");
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
            var pages = db.Pages.Where(t => t.ParentId == -1).ToList();
            ListItemCollection list = new ListItemCollection();
            GetListPages(pages, ref list, 0);
            ddlParentPage.DataSource = list;
            ddlParentPage.DataTextField = "Text";
            ddlParentPage.DataValueField = "Value";
            ddlParentPage.DataBind();
            ddlParentPage.Items.Insert(0, new ListItem("-None-", "-1"));
        }

        const string spaceChar = "&nbsp;&nbsp;&nbsp; ";
        private void GetListPages(List<PageInfo> pages, ref ListItemCollection list, int level)
        {
            string space = "";
            for (int i = 0; i < level; i++)
            {
                space += spaceChar;
            }
            foreach (var item in pages)
            {
                list.Add(new ListItem(Server.HtmlDecode(space + item.PageName.ToString()), item.PageId.ToString()));
                var subPages = db.Pages.Where(t => t.ParentId == item.PageId).ToList();
                if (subPages.Count > 0)
                {
                    GetListPages(subPages, ref list, level + 1);
                }
            }
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
            if (Page.IsValid)
            {
                Response.Write("Hello world");
            }

            
            //string action = Request.QueryString["act"].ToString();
            //int pageId = int.Parse(Request.QueryString["pid"].ToString());
            //int ParentId = int.Parse(ddlParentPage.SelectedValue);
            //int PageOrder = 0;
            //var p = new MyCMS.Model.PageInfo();
            //if (action == "update")
            //{
            //    p = db.Pages.Find(pageId);
            //}
            //p.PageName = txtPageName.Text;
            //p.Title = txtTitle.Text;
            //p.ParentId = ParentId;
            //p.PageSEO = GetPageSEO();
            //if (txtPageOrder.Text == "")
            //{
            //    if (action == "update")
            //    {
            //        PageOrder = db.Pages.Where(t => t.ParentId == ParentId && t.PageId != pageId).OrderByDescending(t => t.PageOrder).FirstOrDefault().PageOrder + 1;
            //    }
            //    else
            //    {
            //        PageOrder = db.Pages.Where(t => t.ParentId == ParentId).OrderByDescending(t => t.PageOrder).FirstOrDefault().PageOrder + 1;
            //    }
            //}
            //else
            //{
            //    PageOrder = int.Parse(txtPageOrder.Text);
            //}
            //p.PageOrder = PageOrder;
            //p.IsVisible = chkIsVisible.Checked;
            //p.Description = txtDescription.Text;
            //p.Keywords = txtKeywords.Text;
            //p.Theme = ddlTheme.SelectedValue;
            //p.Layout = ddlLayout.SelectedValue;
            //if (action == "update")
            //{
            //    db.Entry(p).State = EntityState.Modified;
            //}
            //else
            //{
            //    db.Pages.Add(p);
            //}
            //db.SaveChanges();
            //ScriptManager.RegisterClientScriptBlock(this, typeof(Page), UniqueID, "closePopup();", true);
        }

        protected string GetPageSEO()
        {
            string action = Request.QueryString["act"].ToString();
            int pageId = int.Parse(Request.QueryString["pid"].ToString());
            string pageSEO = txtPageSEO.Text.Trim();
            int ParentId = int.Parse(ddlParentPage.SelectedValue);
            if (action == "update")
            {
                var page = db.Pages.Where(t => t.PageId != pageId && t.PageSEO == pageSEO && t.ParentId == ParentId).ToList();
                if (page.Count > 0)
                {
                    pageSEO += "-";
                }
            }
            else
            {
                var page = db.Pages.Where(t => t.PageSEO == pageSEO && t.ParentId == ParentId).ToList();
                if (page.Count > 0)
                {
                    pageSEO += "-";
                }
            }
            return pageSEO;
        }

        protected void ddlTheme_SelectedIndexChanged(object sender, EventArgs e)
        {
            BindingLayout();
        }
    }
}