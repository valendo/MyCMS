﻿using System;
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
        public void LoadControl(UserControl layoutControl, string ControlSrc, string PaneName, int ModuleId, string ModuleTitle, int PageModuleId)
        {
            StringBuilder sb = new StringBuilder();
            if (ControlSrc.ToLower().EndsWith(".ascx"))
            {
                PlaceHolder pchPane = (PlaceHolder)layoutControl.FindControl(PaneName);
                if (pchPane != null)
                {
                    BaseUserControl control = this.Page.LoadControl("~/" + ControlSrc) as BaseUserControl;
                    control.ModuleId = ModuleId;
                    sb.AppendFormat("<div class=\"dragbox\" id=\"PageModule{0}\" >", PageModuleId);
                    sb.AppendFormat("<h2>{0}", ModuleTitle);
                    sb.AppendFormat("<a class=\"delete opIcons\"> </a>");
                    sb.AppendFormat("<a class=\"maxmin opIcons\"> </a>");
                    sb.AppendFormat("<a class=\"opIcons\" onclick=\"openPopup('Edit module','/Admin/HandleModuleControls.aspx?mid={0}');\"> </a>", ModuleId);
                    sb.AppendFormat("</h2>");
                    sb.AppendFormat("<div class=\"dragbox-content\" >");
                    pchPane.Controls.Add(new LiteralControl(sb.ToString()));
                    pchPane.Controls.Add(control);
                    pchPane.Controls.Add(new LiteralControl("</div></div>"));
                }
            }
        }
    }
}