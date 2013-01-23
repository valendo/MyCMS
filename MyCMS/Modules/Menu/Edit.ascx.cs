using MyCMS.Logic;
using MyCMS.Model;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MyCMS.Modules.Menu
{
    public partial class Edit : BaseAdminUserControl
    {
        MyCMSContext db = new MyCMSContext();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //var spacer = db.Spacers.Where(t => t.ModuleId == this.ModuleId).FirstOrDefault();
                //if (spacer != null)
                //{
                //    txtHeight.Text = spacer.Height.ToString();
                //}
                CheckMenuAdded();
                BindingPages();
                BindingParentMenuItems();
                BindingMenuItems();
            }
        }

        private void CheckMenuAdded()
        {
            var menus = db.Menus.Where(t => t.ModuleId == this.ModuleId).ToList();
            if (menus.Count == 0)
            {
                var menu = new MenuInfo();
                menu.ModuleId = this.ModuleId;
                db.Menus.Add(menu);
                db.SaveChanges();
            }
            
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            //var spacer = db.Spacers.Where(t => t.ModuleId == this.ModuleId).FirstOrDefault();
            //var oSpacer = new SpacerInfo();
            //if (spacer != null)
            //{
            //    oSpacer = db.Spacers.Where(t => t.ModuleId == this.ModuleId).FirstOrDefault();
            //    oSpacer.Height = int.Parse(txtHeight.Text);
            //    db.Entry(oSpacer).State = EntityState.Modified;
            //    db.SaveChanges();
            //}
            //else
            //{
            //    oSpacer.ModuleId = this.ModuleId;
            //    oSpacer.Height = int.Parse(txtHeight.Text);
            //    db.Spacers.Add(oSpacer);
            //    db.SaveChanges();
            //}
            //ScriptManager.RegisterClientScriptBlock(this, typeof(Page), UniqueID, "closePopup();", true);
        }
        private void BindingPages()
        {
            var pages = db.Pages.Where(t => t.ParentId == -1).ToList();
            ListItemCollection list = new ListItemCollection();
            GetListPages(pages, ref list, 0);
            chkListPages.DataSource = list;
            chkListPages.DataTextField = "Text";
            chkListPages.DataValueField = "Value";
            chkListPages.DataBind();
            var MenuId = db.Menus.Where(t => t.ModuleId == this.ModuleId).FirstOrDefault().MenuId;
            var menuItems = db.MenuItems.Where(t => t.MenuId == MenuId).ToList();
            foreach (var item in menuItems)
            {
                ListItem li = chkListPages.Items.FindByValue(item.PageId.ToString());
                if (li != null)
                {
                    li.Selected = true;
                    li.Enabled = false;
                }
            }
        }

        public class CustomMenuItemInfo
        {
            public int MenuItemId { get; set; }
            public string Title { get; set; }
            public bool IsLink { get; set; }
            public string Icon { get; set; }
            public int Margin { get; set; }
        }

        private void BindingMenuItems()
        {
            List<CustomMenuItemInfo> list = new List<CustomMenuItemInfo>();
            var MenuId = db.Menus.Where(t => t.ModuleId == this.ModuleId).FirstOrDefault().MenuId;
            var menuItems = db.MenuItems.Where(t => t.MenuId == MenuId && t.ParentId == -1).ToList();
            GetAllMenuItems(menuItems, ref list, 0);
            rptMenuItems.DataSource = list;
            rptMenuItems.DataBind();
        }

        private void BindingParentMenuItems()
        {
            var menuId = db.Menus.Where(t => t.ModuleId == this.ModuleId).FirstOrDefault().MenuId;
            var menuItems = db.MenuItems.Where(t => t.MenuId == menuId && t.ParentId == -1).ToList();
            ListItemCollection list = new ListItemCollection();
            GetListMenuItems(menuItems, ref list, 0);
            ddlParent.DataSource = list;
            ddlParent.DataTextField = "Text";
            ddlParent.DataValueField = "Value";
            ddlParent.DataBind();
            ddlParent.Items.Insert(0, new ListItem("-None-", "-1"));
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

        private void GetListMenuItems(List<MenuItemInfo> menuItems, ref ListItemCollection list, int level)
        {
            string space = "";
            for (int i = 0; i < level; i++)
            {
                space += spaceChar;
            }
            foreach (var item in menuItems)
            {
                if (item.LinkType == "page")
                {
                    string title = db.Pages.Where(t => t.PageId == item.PageId).FirstOrDefault().PageName;
                    list.Add(new ListItem(Server.HtmlDecode(space + title), item.MenuItemId.ToString()));
                }
                else if (item.LinkType == "link")
                {
                    list.Add(new ListItem(Server.HtmlDecode(space + item.Title), item.MenuItemId.ToString()));
                }
                var subItems = db.MenuItems.Where(t => t.ParentId == item.MenuItemId).ToList();
                if (subItems.Count > 0)
                {
                    GetListMenuItems(subItems, ref list, level + 1);
                }
            }
        }

        private void GetAllMenuItems(List<MenuItemInfo> menuItems, ref List<CustomMenuItemInfo> list, int level)
        {
            foreach (var item in menuItems)
            {
                if (item.LinkType == "page")
                {
                    string title = db.Pages.Where(t => t.PageId == item.PageId).FirstOrDefault().PageName;
                    list.Add(new CustomMenuItemInfo() { MenuItemId = item.MenuItemId, Title = title, IsLink = false, Icon="ui-icon-document", Margin = level*10 });
                }
                else if (item.LinkType == "link")
                {
                    list.Add(new CustomMenuItemInfo() { MenuItemId = item.MenuItemId, Title = item.Title, IsLink = true, Icon = "ui-icon-link", Margin = level*10 });
                }
                var subItems = db.MenuItems.Where(t => t.ParentId == item.MenuItemId).ToList();
                if (subItems.Count > 0)
                {
                    GetAllMenuItems(subItems, ref list, level + 1);
                }
            }
        }

        private void ResetItem()
        {
            txtTitle.Text = "";
            txtLinkUrl.Text = "";
            chkOpenInNewWindow.Checked = false;
            ddlParent.SelectedValue = "-1";
        }

        protected void rptMenuItems_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName.Equals("delete_item"))
            {
                int MenuItemId = int.Parse(e.CommandArgument.ToString());
                var menuitem = db.MenuItems.Find(MenuItemId);
                db.MenuItems.Remove(menuitem);
                db.SaveChanges();
                ResetItem();
                hfMenuItemId.Value = "-1";
                btnAddMenuItem.Text = "Add menu item";
                btnCancelMenuItem.Visible = false;
            }
            else if (e.CommandName.Equals("edit_link") || e.CommandName.Equals("edit_page"))
            {
                int MenuItemId = int.Parse(e.CommandArgument.ToString());
                var menuitem = db.MenuItems.Find(MenuItemId);
                if (e.CommandName.Equals("edit_link"))
                {
                    txtTitle.Text = menuitem.Title;
                    txtLinkUrl.Text = menuitem.LinkUrl;
                    chkOpenInNewWindow.Checked = menuitem.OpenInNewWindow;
                    panelPage.Visible = false;
                    panelLink.Visible = true;
                }
                else if (e.CommandName.Equals("edit_page"))
                {
                    panelPage.Visible = true;
                    panelLink.Visible = false;
                }
                ddlParent.SelectedValue = menuitem.ParentId.ToString();
                hfMenuItemId.Value = MenuItemId.ToString();
                rbtLinkType.SelectedValue = menuitem.LinkType;
                btnAddMenuItem.Text = "Update menu item";
                btnCancelMenuItem.Visible = true;
                //disabled current menu item in parent page list
                ListItem li = ddlParent.Items.FindByValue(MenuItemId.ToString());
                if (li != null)
                {
                    li.Attributes.Add("disabled", "");
                }
            }
            BindingPages();
            BindingMenuItems();
        }

        protected void btnAddMenuItem_Click(object sender, EventArgs e)
        {
            int MenuItemId = int.Parse(hfMenuItemId.Value);
            if (rbtLinkType.SelectedValue == "page")
            {
                if (MenuItemId != -1)
                {
                    var menuItem = db.MenuItems.Find(MenuItemId);
                    menuItem.ParentId = int.Parse(ddlParent.SelectedValue);
                    db.Entry(menuItem).State = EntityState.Modified;
                    db.SaveChanges();
                    btnAddMenuItem.Text = "Add menu item";
                    btnCancelMenuItem.Visible = false;
                    hfMenuItemId.Value = "-1";
                }
                else
                {
                    int MenuId = db.Menus.Where(t => t.ModuleId == this.ModuleId).FirstOrDefault().MenuId;
                    foreach (ListItem item in chkListPages.Items)
                    {
                        if (item.Selected && item.Enabled == true)
                        {
                            var menuItem = new MenuItemInfo();
                            menuItem.MenuId = MenuId;
                            menuItem.LinkType = "page";
                            menuItem.ParentId = int.Parse(ddlParent.SelectedValue);
                            menuItem.PageId = int.Parse(item.Value);
                            menuItem.MenuOrder = 999;
                            menuItem.OpenInNewWindow = false;
                            db.MenuItems.Add(menuItem);
                            db.SaveChanges();
                        }
                    }
                }
            }
            else if (rbtLinkType.SelectedValue == "link")
            {
                if (MenuItemId != -1)
                {
                    var menuItem = db.MenuItems.Find(MenuItemId);
                    menuItem.Title = txtTitle.Text;
                    menuItem.LinkUrl = txtLinkUrl.Text;
                    menuItem.OpenInNewWindow = chkOpenInNewWindow.Checked;
                    menuItem.ParentId = int.Parse(ddlParent.SelectedValue);
                    db.Entry(menuItem).State = EntityState.Modified;
                    db.SaveChanges();
                    btnAddMenuItem.Text = "Add menu item";
                    btnCancelMenuItem.Visible = false;
                    hfMenuItemId.Value = "-1";
                }
                else
                {
                    int MenuId = db.Menus.Where(t => t.ModuleId == this.ModuleId).FirstOrDefault().MenuId;
                    var menuItem = new MenuItemInfo();
                    menuItem.MenuId = MenuId;
                    menuItem.LinkType = "link";
                    menuItem.ParentId = int.Parse(ddlParent.SelectedValue);
                    menuItem.MenuOrder = 999;
                    menuItem.Title = txtTitle.Text;
                    menuItem.LinkUrl = txtLinkUrl.Text;
                    menuItem.OpenInNewWindow = chkOpenInNewWindow.Checked;
                    db.MenuItems.Add(menuItem);
                    db.SaveChanges();
                }
            }
            BindingParentMenuItems();
            BindingPages();
            BindingMenuItems();
            ResetItem();
        }

        protected void btnCancelMenuItem_Click(object sender, EventArgs e)
        {
            ResetItem();
            hfMenuItemId.Value = "-1";
            btnAddMenuItem.Text = "Add menu item";
            btnCancelMenuItem.Visible = false;
        }

        protected void rbtLinkType_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (rbtLinkType.SelectedValue == "page")
            {
                panelPage.Visible = true;
                panelLink.Visible = false;
            }
            else if (rbtLinkType.SelectedValue == "link")
            {
                panelPage.Visible = false;
                panelLink.Visible = true;
            }
            ResetItem();
            btnAddMenuItem.Text = "Add menu item";
            btnCancelMenuItem.Visible = false;
            hfMenuItemId.Value = "-1";
        }
    }
}