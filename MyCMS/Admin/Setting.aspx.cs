using MyCMS.Model;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MyCMS.Admin
{
    public partial class Setting : System.Web.UI.Page
    {
        MyCMSContext db = new MyCMSContext();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindingPages();
                BindingData();
            }
        }

        protected void BindingData()
        {
            ddlPages.SelectedValue = MyCMS.Utility.GetSettingByKey("HomePage");
            txtSiteTitle.Text = MyCMS.Utility.GetSettingByKey("SiteTitle");
        }

        private void BindingPages()
        {
            var pages = db.Pages.Where(t => t.ParentId == -1).ToList();
            ListItemCollection list = new ListItemCollection();
            GetListPages(pages, ref list, 0);
            ddlPages.DataSource = list;
            ddlPages.DataTextField = "Text";
            ddlPages.DataValueField = "Value";
            ddlPages.DataBind();
            ddlPages.Items.Insert(0, new ListItem("-None-", "-1"));
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

        protected void btnSave_Click(object sender, EventArgs e)
        {
            //update home page
            var settingHomePage = db.Settings.Find("HomePage");
            settingHomePage.Value = ddlPages.SelectedValue;
            db.Entry(settingHomePage).State = EntityState.Modified;
            db.SaveChanges();
            ScriptManager.RegisterClientScriptBlock(this, typeof(Page), UniqueID, "closePopup();", true);
            //update site title
            var settingTitle = db.Settings.Find("SiteTitle");
            settingTitle.Value = txtSiteTitle.Text;
            db.Entry(settingTitle).State = EntityState.Modified;
            db.SaveChanges();
        }
    }
}