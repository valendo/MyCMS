using MyCMS.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MyCMS.Admin
{
    public partial class ShareModule : System.Web.UI.Page
    {
        MyCMSContext db = new MyCMSContext();
        PageModuleInfo pm = new PageModuleInfo();
        protected void Page_Load(object sender, EventArgs e)
        {
            int PageModuleId = int.Parse(Request.QueryString["pmid"]);
            pm = db.PageModules.Find(PageModuleId);
            if (!IsPostBack)
            {
                BindingData();
            }
        }

        private void BindingData()
        {
            var pages = db.Pages.Where(t => t.ParentId == -1).ToList();
            ListItemCollection list = new ListItemCollection();
            GetListPages(pages, ref list, 0);
            chkListPages.DataSource = list;
            chkListPages.DataTextField = "Text";
            chkListPages.DataValueField = "Value";
            chkListPages.DataBind();
            var pageModules = db.PageModules.Where(t => t.ModuleId == pm.ModuleId).ToList();
            foreach (var item in pageModules)
            {
                ListItem li = chkListPages.Items.FindByValue(item.PageId.ToString());
                if (li != null)
                {
                    li.Selected = true;
                    if (int.Parse(li.Value) == pm.PageId)
                    {
                        li.Enabled = false;
                    }
                }
            }
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
            if (pm != null)
            {
                foreach (ListItem item in chkListPages.Items)
                {
                    if (item.Enabled == true)
                    {
                        int currentPageId = int.Parse(item.Value);
                        if (item.Selected)
                        {
                            var pageModules = db.PageModules.Where(t => t.PageId == currentPageId && t.ModuleId == pm.ModuleId).ToList();
                            if (pageModules.Count == 0)
                            {
                                var pageModule = new PageModuleInfo();
                                pageModule.PageId = currentPageId;
                                pageModule.ModuleId = pm.ModuleId;
                                var toPage = db.Pages.Find(currentPageId);
                                UserControl layoutControl = this.Page.LoadControl("~/Theme/Layout/" + toPage.Layout + ".ascx") as UserControl;
                                string PaneName = pm.PaneName;
                                bool checkExistPaneName = false;
                                foreach (Control ctl in layoutControl.Controls)
                                {
                                    if (ctl is PlaceHolder)
                                    {
                                        if (ctl.ID == PaneName)
                                        {
                                            checkExistPaneName = true;
                                            break;
                                        }
                                    }
                                }
                                if (checkExistPaneName == false)
                                {
                                    foreach (Control ctl in layoutControl.Controls)
                                    {
                                        if (ctl is PlaceHolder)
                                        {
                                            PaneName = ctl.ID;
                                            break;
                                        }
                                    }
                                }
                                pageModule.PaneName = PaneName;
                                pageModule.ModuleOrder = pm.ModuleOrder;
                                pageModule.DisplayTitle = pm.DisplayTitle;
                                pageModule.ModuleTitle = pm.ModuleTitle;
                                db.PageModules.Add(pageModule);
                                db.SaveChanges();
                            }
                        }
                        else
                        {
                            var pageModule = db.PageModules.Where(t => t.PageId == currentPageId && t.ModuleId == pm.ModuleId).FirstOrDefault();
                            if (pageModule != null)
                            {
                                db.PageModules.Remove(pageModule);
                                db.SaveChanges();
                            }
                        }
                        ScriptManager.RegisterClientScriptBlock(this, typeof(Page), UniqueID, "closePopup();", true);
                    }
                }
            }
        }
    }
}