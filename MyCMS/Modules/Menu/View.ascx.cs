using MyCMS.Logic;
using MyCMS.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MyCMS.Modules.Menu
{
    public partial class View : BaseUserControl
    {
        MyCMSContext db = new MyCMSContext();
        protected void Page_Load(object sender, EventArgs e)
        {
            var menu = db.Menus.Where(t => t.ModuleId == this.ModuleId).FirstOrDefault();
            if (menu != null)
            {
                if (!IsPostBack)
                {
                    BindingMenuItems();
                }
            }
            else
            {
                ltrContent.Text = "<div class='warning'>Menu has no items</div>";
            }
            
        }

        private void BindingMenuItems()
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("<div id='menu'>");
            var MenuId = db.Menus.Where(t => t.ModuleId == this.ModuleId).FirstOrDefault().MenuId;
            var menuItems = db.MenuItems.Where(t => t.MenuId == MenuId && t.ParentId == -1).OrderBy(t => t.MenuOrder).ToList();
            if (menuItems.Count > 0)
            {
                GetMenuItems(menuItems, ref sb);
            }
            else
            {
                sb.Append("<div class='warning'>Menu has no items</div>");
            }
            sb.Append("</div>");
            ltrContent.Text = sb.ToString();
        }

        private void GetMenuItems(List<MenuItemInfo> menuItems, ref StringBuilder sb)
        {
            sb.Append("<ul>");
            foreach (var item in menuItems)
            {
                string title = "";
                string url = "";
                if (item.LinkType == "page")
                {
                    title = db.Pages.Where(t => t.PageId == item.PageId).FirstOrDefault().PageName;
                    string pageSEO = "";
                    GetPageUrl(item.PageId, ref pageSEO);
                    pageSEO = reverseIt(pageSEO);
                    url = pageSEO;
                }
                else if (item.LinkType == "link")
                {
                    title = item.Title;
                    url = item.LinkUrl;
                }
                sb.AppendFormat("<li><a href='{0}'>{1}</a>", url, title);
                var subItems = db.MenuItems.Where(t => t.ParentId == item.MenuItemId).OrderBy(t => t.MenuOrder).ToList();
                if (subItems.Count > 0)
                {
                    GetMenuItems(subItems, ref sb);
                }
                else
                {
                    sb.Append("</li>");
                }
            }
            sb.Append("</ul>");
        }

        private void GetPageUrl(int PageId, ref string url)
        {
            var page = db.Pages.Where(t => t.PageId == PageId).FirstOrDefault();
            url += page.PageSEO + ",";
            var parentPage = db.Pages.Where(t => t.PageId == page.ParentId).FirstOrDefault();
            if (parentPage != null)
            {
                GetPageUrl(parentPage.PageId, ref url);
            }
        }

        public static string reverseIt(string strSource)
        {
            strSource = strSource.Substring(0, strSource.Length - 1);
            string[] arySource = strSource.Split(new char[] { ',' });
            string strReverse = string.Empty;
            if (arySource.Length > 1)
            {
                for (int i = arySource.Length - 1; i >= 0; i--)
                {
                    if (strReverse != "")
                    {
                        strReverse = strReverse + "/" + arySource[i];
                    }
                    else
                    {
                        strReverse = arySource[i];
                    }

                }
            }
            else
            {
                strReverse = arySource[0];
            }
            return strReverse;
        }
    }
}