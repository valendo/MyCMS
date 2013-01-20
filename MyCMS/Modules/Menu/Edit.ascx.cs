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
                MenuItemEvent();
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

        private void BindingMenuItems()
        {
            StringBuilder sb = new StringBuilder();
            var MenuId = db.Menus.Where(t => t.ModuleId == this.ModuleId).FirstOrDefault().MenuId;
            var list = db.MenuItems.Where(t => t.MenuId == MenuId).ToList();
            if (list.Count > 0)
            {
                sb.Append("<ul class='sort_menu_item'>");
                foreach (var item in list)
                {
                    sb.Append("<li class='ui-state-default'>");
                    if (item.LinkType == "page")
                    {
                        string title = db.Pages.Where(t => t.PageId == item.PageId).FirstOrDefault().PageName;
                        sb.AppendFormat("<span class='ui-icon ui-icon-document'></span>{0}", title);
                    }
                    else if (item.LinkType == "link")
                    {
                        
                        sb.AppendFormat("<span class='ui-icon ui-icon-link'></span>{0}", item.Title);
                        sb.Append("<input type='image' src='/Images/icons/16/Edit.png' name='edit_item' class='edit_item' onclick=\"__doPostBack('edit_item');\" />");
                    }
                    sb.Append("<input type='image' src='/Images/icons/16/Delete.png' name='delete_item' class='delete_item' onclick=\"__doPostBack('delete_item');\" />");
                    sb.Append("</li>");
                    
                }
                sb.Append("</ul>");
            }
            else
            {
                sb.Append("<div class='warning'>No menu items added.</div>");
            }
            ltrMenuItems.Text = sb.ToString();
        }

        private void MenuItemEvent()
        {
            if (Request.Form["__EVENTTARGET"] != null)
            {
                if (Request.Form["__EVENTTARGET"] == "delete_item")
                {
                    ltrMenuItems.Text = "ok";
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

        protected void btnAddLinkItem_Click(object sender, EventArgs e)
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
            BindingMenuItems();
        }
    }
}