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
            var menuItems = db.MenuItems.Where(t => t.MenuId == MenuId && t.ParentId == -1).OrderBy(t => t.MenuOrder).ToList();
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
                var subItems = db.MenuItems.Where(t => t.ParentId == item.MenuItemId).OrderBy(t => t.MenuOrder).ToList();
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
            txtMenuOrder.Text = "";
        }

        private void GetMenuItemDelete(ref List<int> list, List<MenuItemInfo> MenuItems)
        {
            if (MenuItems.Count > 0)
            {
                foreach (var item in MenuItems)
                {
                    list.Add(item.MenuItemId);
                    var subMenuItems = db.MenuItems.Where(t => t.ParentId == item.MenuItemId).ToList();
                    if (subMenuItems.Count > 0)
                    {
                        GetMenuItemDelete(ref list, subMenuItems);
                    }
                }
            }
        }

        protected void rptMenuItems_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName.Equals("delete_item"))
            {
                List<int> listItemDelete = new List<int>();
                int MenuItemId = int.Parse(e.CommandArgument.ToString());
                
                listItemDelete.Add(MenuItemId);
                GetMenuItemDelete(ref listItemDelete, db.MenuItems.Where(t => t.ParentId == MenuItemId).ToList());
                foreach (int item in listItemDelete)
                {
                    var menuitem = db.MenuItems.Find(item);
                    db.MenuItems.Remove(menuitem);
                    db.SaveChanges();
                }
                hfMenuItemId.Value = "-1";
                btnAddMenuItem.Text = "Add menu item";
                btnCancelMenuItem.Visible = false;
                BindingParentMenuItems();
                ResetItem();
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
                txtMenuOrder.Text = menuitem.MenuOrder.ToString();
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
            if (Page.IsValid)
            {
                int MenuItemId = int.Parse(hfMenuItemId.Value);
                int menuId = db.Menus.Where(t => t.ModuleId == this.ModuleId).FirstOrDefault().MenuId;
                int MenuOrder = -1;
                if (txtMenuOrder.Text == "")
                {
                    if (MenuItemId == -1)
                    {
                        int ParentId = int.Parse(ddlParent.SelectedValue);
                        var menuItems = db.MenuItems.Where(t => t.MenuId == menuId && t.ParentId == ParentId && t.MenuItemId != MenuItemId).ToList();
                        MenuOrder = menuItems.Count + 1;
                    }
                }
                else
                {
                    MenuOrder = int.Parse(txtMenuOrder.Text);
                }
                if (rbtLinkType.SelectedValue == "page")
                {
                    if (MenuItemId != -1)
                    {
                        var menuItem = db.MenuItems.Find(MenuItemId);
                        menuItem.ParentId = int.Parse(ddlParent.SelectedValue);
                        if (txtMenuOrder.Text != "")
                        {
                            menuItem.MenuOrder = int.Parse(txtMenuOrder.Text);
                        }
                        db.Entry(menuItem).State = EntityState.Modified;
                        db.SaveChanges();
                        btnAddMenuItem.Text = "Add menu item";
                        btnCancelMenuItem.Visible = false;
                        hfMenuItemId.Value = "-1";
                    }
                    else
                    {
                        foreach (ListItem item in chkListPages.Items)
                        {
                            if (item.Selected && item.Enabled == true)
                            {
                                if (txtMenuOrder.Text == "")
                                {
                                    if (MenuItemId == -1)
                                    {
                                        int ParentId = int.Parse(ddlParent.SelectedValue);
                                        var menuItems = db.MenuItems.Where(t => t.MenuId == menuId && t.ParentId == ParentId && t.MenuItemId != MenuItemId).ToList();
                                        MenuOrder = menuItems.Count + 1;
                                    }
                                }
                                else
                                {
                                    MenuOrder = int.Parse(txtMenuOrder.Text);
                                }
                                var menuItem = new MenuItemInfo();
                                menuItem.MenuId = menuId;
                                menuItem.LinkType = "page";
                                menuItem.ParentId = int.Parse(ddlParent.SelectedValue);
                                menuItem.PageId = int.Parse(item.Value);
                                menuItem.MenuOrder = MenuOrder;
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
                        if (txtMenuOrder.Text != "")
                        {
                            menuItem.MenuOrder = int.Parse(txtMenuOrder.Text);
                        }
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
                        menuItem.MenuOrder = MenuOrder;
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