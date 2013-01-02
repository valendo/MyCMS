﻿using MyCMS.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace MyCMS.Logic
{
    public class PageBase : System.Web.UI.Page
    {
        public MyCMSContext db = new MyCMSContext();
        public void LoadControl(UserControl layoutControl, string ControlSrc, string PaneName, int ModuleId, string ModuleTitle, int PageModuleId)
        {
            StringBuilder sb = new StringBuilder();
            if (ControlSrc.ToLower().EndsWith(".ascx"))
            {
                PlaceHolder pchPane = (PlaceHolder)layoutControl.FindControl(PaneName);
                if (pchPane != null)
                {
                    BaseUserControl control = this.Page.LoadControl(ControlSrc) as BaseUserControl;
                    control.ModuleId = ModuleId;
                    sb.AppendFormat("<div class=\"dragbox\" id=\"PageModule{0}\" >", PageModuleId);
                    sb.AppendFormat("<h2><span>{0}</span>", ModuleTitle);
                    sb.AppendFormat("<a class=\"delete opIcons\"> </a>");
                    sb.AppendFormat("<a class=\"maxmin opIcons\"> </a>");
                    sb.AppendFormat("<a class=\"setting opIcons\" onclick=\"openPopup('Module Settings','/Admin/ModuleSetting.aspx?action=edit&pmid={0}');\"> </a>", PageModuleId);
                    sb.AppendFormat("<a class=\"edit opIcons\" onclick=\"openPopup('Edit module','/Admin/EditModule.aspx?mid={0}');\"> </a>", ModuleId);
                    sb.AppendFormat("</h2>");
                    sb.AppendFormat("<div class=\"dragbox-content\" >");
                    pchPane.Controls.Add(new LiteralControl(sb.ToString()));
                    pchPane.Controls.Add(control);
                    pchPane.Controls.Add(new LiteralControl("</div><div class='clear'></div></div>"));
                }
            }
        }

        public int PageId
        {
            get
            {
                string pageSEO = Page.RouteData.Values["pageSEO"] as string;
                if (pageSEO == null)
                {
                    return -1;
                }
                if (pageSEO.Contains("?"))
                {
                    pageSEO = pageSEO.Split('?')[0];
                }
                string[] arrPages = pageSEO.Split(new char[] { '/' });
                pageSEO = arrPages[arrPages.Length - 1];
                var pages = db.Pages.Where(t => t.PageSEO == pageSEO).ToList();
                foreach (var item in pages)
                {
                    int level = 0;
                    GetCurrentLevel(item.PageId, ref level);
                    if (level == arrPages.Length)
                    {
                        return item.PageId;
                    }
                }
                return -1;
            }
        }

        private void GetCurrentLevel(int PageId, ref int level)
        {
            var page = db.Pages.Where(t => t.PageId == PageId).FirstOrDefault();
            if (page !=null)
            {
                level += 1;
                if (page.ParentId != -1)
                {
                    GetCurrentLevel(page.ParentId, ref level);
                }
            }
        }
    }
}