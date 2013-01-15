using MyCMS.Model;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Security;
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
                BindingLayout();
                BindingRoles();

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
                else if (action == "add")
                {
                    ddlParentPage.SelectedValue = pageId.ToString();
                    ListItem liAnonymous = chkListRoles.Items.FindByValue("Anonymous");
                    if (liAnonymous != null)
                    {
                        liAnonymous.Selected = true;
                    }
                }
                ListItem liAdmin = chkListRoles.Items.FindByValue("Admin");
                if (liAdmin != null)
                {
                    liAdmin.Selected = true;
                    liAdmin.Enabled = false;
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
            BindingLayout();
            ddlLayout.SelectedValue = p.Layout;
            var pm = db.PagePermissions.Where(t => t.PageId == PageId).ToList();
            foreach (var item in pm)
            {
                ListItem li = chkListRoles.Items.FindByValue(item.Role);
                if (li != null)
                {
                    li.Selected = true;
                }
            }
        }

        private void BindingRoles()
        {
            chkListRoles.DataSource = Roles.GetAllRoles();
            chkListRoles.DataBind();
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
            DirectoryInfo dirLayout = new DirectoryInfo(Server.MapPath("~/Theme/Layout"));
            foreach (FileInfo item in dirLayout.GetFiles())
            {
                Files.Add(Path.GetFileNameWithoutExtension(item.Name));
            }
            ddlLayout.DataSource = Files;
            ddlLayout.DataBind();
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                string action = Request.QueryString["act"].ToString();
                int pageId = int.Parse(Request.QueryString["pid"].ToString());
                int ParentId = int.Parse(ddlParentPage.SelectedValue);
                int PageOrder = 0;
                var p = new MyCMS.Model.PageInfo();
                if (action == "update")
                {
                    p = db.Pages.Find(pageId);
                }
                p.PageName = txtPageName.Text;
                p.Title = txtTitle.Text;
                p.ParentId = ParentId;
                p.PageSEO = GetPageSEO();
                if (txtPageOrder.Text == "")
                {
                    if (action == "update")
                    {
                        PageOrder = db.Pages.Where(t => t.ParentId == ParentId && t.PageId != pageId).OrderByDescending(t => t.PageOrder).FirstOrDefault().PageOrder + 1;
                    }
                    else
                    {
                        var pageOrders = db.Pages.Where(t => t.ParentId == ParentId).ToList();
                        if (pageOrders.Count > 0)
                        {
                            PageOrder = db.Pages.Where(t => t.ParentId == ParentId).OrderByDescending(t => t.PageOrder).FirstOrDefault().PageOrder + 1;
                        }
                        else
                        {
                            PageOrder = 1;
                        }
                    }
                }
                else
                {
                    PageOrder = int.Parse(txtPageOrder.Text);
                }
                p.PageOrder = PageOrder;
                p.IsVisible = chkIsVisible.Checked;
                p.Description = txtDescription.Text;
                p.Keywords = txtKeywords.Text;
                p.Layout = ddlLayout.SelectedValue;
                if (action == "update")
                {
                    db.Entry(p).State = EntityState.Modified;
                    db.SaveChanges();
                    //Update page permissions
                    foreach (ListItem item in chkListRoles.Items)
                    {
                        var checkExist = db.PagePermissions.Where(t => t.PageId == pageId && t.Role == item.Value).ToList();
                        if (item.Selected)
                        {
                            if (checkExist.Count == 0)
                            {
                                PagePermissionInfo pm = new PagePermissionInfo();
                                pm.PageId = pageId;
                                pm.Role = item.Value;
                                db.PagePermissions.Add(pm);
                                db.SaveChanges();
                            }
                        }
                        else
                        {
                            if (checkExist.Count > 0)
                            {
                                var pm = db.PagePermissions.Where(t => t.PageId == pageId && t.Role == item.Value).FirstOrDefault();
                                db.PagePermissions.Remove(pm);
                                db.SaveChanges();
                            }
                        }
                    }
                    //Delete no longer roles
                    var pagePermissions = db.PagePermissions.Where(t => t.PageId == pageId).ToList();
                    foreach (PagePermissionInfo item in pagePermissions)
                    {
                        if (!Roles.RoleExists(item.Role))
                        {
                            db.PagePermissions.Remove(item);
                            db.SaveChanges();
                        }
                    }
                }
                else
                {
                    db.Pages.Add(p);
                    db.SaveChanges();
                    //Add page permissions
                    foreach (ListItem item in chkListRoles.Items)
                    {
                        if (item.Selected)
                        {
                            PagePermissionInfo pm = new PagePermissionInfo();
                            pm.PageId = p.PageId;
                            pm.Role = item.Value;
                            db.PagePermissions.Add(pm);
                            db.SaveChanges();
                        }
                    }
                }
                ScriptManager.RegisterClientScriptBlock(this, typeof(Page), UniqueID, "closePopup();", true);
            }
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

    }
}