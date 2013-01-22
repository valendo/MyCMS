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
        }

        public class CustomMenuItemInfo
        {
            public int MenuItemId { get; set; }
            public string Title { get; set; }
            public bool IsLink { get; set; }
            public string Icon { get; set; }
        }

        private void BindingMenuItems()
        {
            List<CustomMenuItemInfo> listItems = new List<CustomMenuItemInfo>();
            var MenuId = db.Menus.Where(t => t.ModuleId == this.ModuleId).FirstOrDefault().MenuId;
            var list = db.MenuItems.Where(t => t.MenuId == MenuId).ToList();
            if (list.Count > 0)
            {
                foreach (var item in list)
                {
                    if (item.LinkType == "page")
                    {
                        string title = db.Pages.Where(t => t.PageId == item.PageId).FirstOrDefault().PageName;
                        listItems.Add(new CustomMenuItemInfo() { MenuItemId = item.MenuItemId, Title = title, IsLink = false, Icon = "ui-icon-document" });
                    }
                    else if (item.LinkType == "link")
                    {
                        listItems.Add(new CustomMenuItemInfo() { MenuItemId = item.MenuItemId, Title = item.Title, IsLink = true, Icon = "ui-icon-link" });
                    }
                }
            }
            rptMenuItems.DataSource = listItems;
            rptMenuItems.DataBind();
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

        protected void btnAddPageItems_Click(object sender, EventArgs e)
        {
            int MenuId = db.Menus.Where(t => t.ModuleId == this.ModuleId).FirstOrDefault().MenuId;
            foreach (ListItem item in chkListPages.Items)
            {
                if (item.Selected)
                {
                    var menuItem = new MenuItemInfo();
                    menuItem.MenuId = MenuId;
                    menuItem.LinkType = "page";
                    menuItem.ParentId = -1;
                    menuItem.PageId = int.Parse(item.Value);
                    menuItem.MenuOrder = 999;
                    menuItem.OpenInNewWindow = false;
                    db.MenuItems.Add(menuItem);
                    db.SaveChanges();
                }
            }
            BindingMenuItems();
        }

        private void ResetLinkItem()
        {
            txtTitle.Text = "";
            txtLinkUrl.Text = "";
            chkOpenInNewWindow.Checked = false;
        }

        protected void btnAddLinkItem_Click(object sender, EventArgs e)
        {
            int MenuItemId = int.Parse(hfMenuItemId.Value);
            if (MenuItemId != -1)
            {
                var menuItem = db.MenuItems.Find(MenuItemId);
                menuItem.Title = txtTitle.Text;
                menuItem.LinkUrl = txtLinkUrl.Text;
                menuItem.OpenInNewWindow = chkOpenInNewWindow.Checked;
                db.Entry(menuItem).State = EntityState.Modified;
                db.SaveChanges();
                btnAddLinkItem.Text = "Add link item";
                btnCancelLinkItem.Visible = false;
                ResetLinkItem();
                hfMenuItemId.Value = "-1";
            }
            else
            {
                int MenuId = db.Menus.Where(t => t.ModuleId == this.ModuleId).FirstOrDefault().MenuId;
                var menuItem = new MenuItemInfo();
                menuItem.MenuId = MenuId;
                menuItem.LinkType = "link";
                menuItem.ParentId = -1;
                menuItem.MenuOrder = 999;
                menuItem.Title = txtTitle.Text;
                menuItem.LinkUrl = txtLinkUrl.Text;
                menuItem.OpenInNewWindow = chkOpenInNewWindow.Checked;
                db.MenuItems.Add(menuItem);
                db.SaveChanges();
                ResetLinkItem();
            }
            BindingMenuItems();
        }

        protected void rptMenuItems_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName.Equals("edit_item"))
            {
                int MenuItemId = int.Parse(e.CommandArgument.ToString());
                var menuitem = db.MenuItems.Find(MenuItemId);
                txtTitle.Text = menuitem.Title;
                txtLinkUrl.Text = menuitem.LinkUrl;
                chkOpenInNewWindow.Checked = menuitem.OpenInNewWindow;
                hfMenuItemId.Value = MenuItemId.ToString();
                TabMenuItem.ActiveTab = TabPanelLink;
                btnAddLinkItem.Text = "Update link item";
                btnCancelLinkItem.Visible = true;
            }
            else if (e.CommandName.Equals("delete_item"))
            {
                int MenuItemId = int.Parse(e.CommandArgument.ToString());
                var menuitem = db.MenuItems.Find(MenuItemId);
                db.MenuItems.Remove(menuitem);
                db.SaveChanges();
            }
            BindingMenuItems();
        }

        protected void btnCancelLinkItem_Click(object sender, EventArgs e)
        {
            ResetLinkItem();
            hfMenuItemId.Value = "-1";
            btnAddLinkItem.Text = "Add link item";
            btnCancelLinkItem.Visible = false;
        }
    }
}