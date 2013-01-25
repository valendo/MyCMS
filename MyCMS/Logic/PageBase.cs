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
        public void LoadControl(UserControl layoutControl, string ControlSrc, string PaneName, int ModuleId, string ModuleTitle, int PageModuleId, string Container, bool DisplayTitle)
        {
            StringBuilder sb = new StringBuilder();
            if (ControlSrc.ToLower().EndsWith(".ascx"))
            {
                PlaceHolder pchPane = (PlaceHolder)layoutControl.FindControl(PaneName);
                if (pchPane != null)
                {
                    BaseUserControl control = this.Page.LoadControl(ControlSrc) as BaseUserControl;
                    control.ModuleId = ModuleId;
                    
                    if (IsEdit)
                    {
                        sb.AppendFormat("<div class=\"dragbox\" id=\"PageModule{0}\" >", PageModuleId);
                        sb.AppendFormat("<h2><span>{0}</span>", ModuleTitle);
                        sb.AppendFormat("<a class=\"delete opIcons\" title=\"Delete\"> </a>");
                        sb.AppendFormat("<a class=\"share opIcons\" onclick=\"openPopup('Share modules','/Admin/ShareModule.aspx?pmid={0}');\" title=\"Share\"> </a>", PageModuleId);
                        sb.AppendFormat("<a class=\"setting opIcons\" onclick=\"openPopup('Module Settings','/Admin/ModuleSetting.aspx?action=edit&pmid={0}');\" title=\"Settings\"> </a>", PageModuleId);
                        sb.AppendFormat("<a class=\"edit opIcons\" onclick=\"openPopup('Edit module','/Admin/EditModule.aspx?mid={0}');\" title=\"Edit\"> </a>", ModuleId);
                        sb.AppendFormat("</h2>");
                        sb.AppendFormat("<div class=\"dragbox-content\" >");
                        pchPane.Controls.Add(new LiteralControl(sb.ToString()));
                    }
                    //add container module style
                    if (!string.IsNullOrEmpty(Container))
                    {
                        UserControl containerControl = this.Page.LoadControl("~/Theme/Container/" + Container + ".ascx") as UserControl;
                        foreach (Control ctl in containerControl.Controls)
                        {
                            if (ctl is PlaceHolder)
                            {
                                if (DisplayTitle)
                                {
                                    if (ctl.ID == "ModuleTitle")
                                    {
                                        PlaceHolder pchModuleTitle = (PlaceHolder)containerControl.FindControl("ModuleTitle");
                                        pchModuleTitle.Controls.Add(new LiteralControl(ModuleTitle));
                                    }
                                }
                                if (ctl.ID == "ModuleContent")
                                {
                                    PlaceHolder pchModuleContent = (PlaceHolder)containerControl.FindControl("ModuleContent");
                                    pchModuleContent.Controls.Add(control);
                                    pchModuleContent.Controls.Add(new LiteralControl("<div class='clear'></div>"));
                                }
                            }
                        }
                        pchPane.Controls.Add(containerControl);
                    }
                    else
                    {
                        pchPane.Controls.Add(control);
                        pchPane.Controls.Add(new LiteralControl("<div class='clear'></div>"));
                    }
                    
                    if (IsEdit)
                    {
                        pchPane.Controls.Add(new LiteralControl("</div></div>"));
                    }
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
                    int homePageId = int.Parse(db.Settings.Find("HomePage").Value);
                    if (homePageId != -1)
                    {
                        return homePageId;
                    }
                    else
                    {
                        int FirstPageId = db.Pages.FirstOrDefault().PageId;
                        if (FirstPageId > 0)
                        {
                            return FirstPageId;
                        }
                        else
                        {
                            return -1;
                        }
                    }
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

        public string Preview
        {
            get
            {
                string mode = "edit";
                if (Session["UserMode"] != null)
                {
                    if (Session["UserMode"].ToString() == "view")
                    {
                        mode = "view";
                    }
                }
                return mode;
            }
        }

        public bool IsEdit
        {
            get
            {
                bool _IsEdit = false;
                if (IsAdmin && Preview == "edit")
                {
                    _IsEdit = true;
                }
                return _IsEdit;
            }
        }

        public bool IsHost
        {
            get { return Context.User.IsInRole("host"); }
        }

        public bool IsAdmin
        {
            get { return Context.User.IsInRole("admin"); }
        }
    }
}