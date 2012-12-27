using MyCMS.Model;
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
                    sb.AppendFormat("<a class=\"edit opIcons\" onclick=\"openPopup('Edit module','/Admin/HandleModuleControls.aspx?action=edit&mid={0}');\"> </a>", ModuleId);
                    sb.AppendFormat("</h2>");
                    sb.AppendFormat("<div class=\"dragbox-content\" >");
                    pchPane.Controls.Add(new LiteralControl(sb.ToString()));
                    pchPane.Controls.Add(control);
                    pchPane.Controls.Add(new LiteralControl("</div></div>"));
                }
            }
        }

        //public int GetPageId(string pageSEO)
        //{
        //    if (!string.IsNullOrEmpty(pageSEO))
        //    {
        //        var page = db.Pages.Where(t => t.PageSEO == pageSEO).ToList();
        //        if (page.Count > 0)
        //        {
        //            return page.FirstOrDefault().PageId;
        //        }
        //        else
        //        {
        //            return -1;
        //        }
        //    }
        //    return -1;
        //}

        public int PageId
        {
            get
            {
                string pageSEO = Page.RouteData.Values["pageSEO"] as string;
                var page = db.Pages.Where(t => t.PageSEO == pageSEO).ToList();
                if (page.Count > 0)
                {
                    return page.FirstOrDefault().PageId;
                }
                else
                {
                    return -1;
                }
            }
        }

    }
}