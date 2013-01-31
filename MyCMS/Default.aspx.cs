using MyCMS.Logic;
using MyCMS.Model;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.ModelBinding;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace MyCMS
{
    public partial class _Default : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SetCulture();
            btnEdit.Visible = false;
            if (Preview == "view")
            {
                btnEdit.Visible = true;
            }
            
        if (IsEdit)
        {
            x_top.Visible = true;
            x_left.Visible = true;
            XPanelStyleSheet.Attributes.Add("href", "/Styles/xpanel.css");
            Page.ClientScript.RegisterClientScriptInclude("xpanel", "/Scripts/MyScripts/xpanel.js");
            Page.ClientScript.RegisterClientScriptInclude("dragdrop", "/Scripts/MyScripts/dragdrop.js");
        }
        else
        {
            x_top.Visible = false;
            x_left.Visible = false;
        }
                
            if (this.PageId != -1)
            {
                if (CheckPagePermissions())
                {
                    var page = db.Pages.Where(t => t.PageId == this.PageId).FirstOrDefault();
                    var pageModules = db.PageModules.Where(t => t.PageId == this.PageId).OrderBy(t => t.ModuleOrder).ToList();
                    //Add meta
                    AddMeta(page.Title, page.Description, page.Keywords);

                    UserControl layoutControl = this.Page.LoadControl("~/Theme/Layout/" + page.Layout + ".ascx") as UserControl;
                    pchDefault.Controls.Add(layoutControl);
                    foreach (var item in pageModules)
                    {
                        var module = db.Modules.Where(t => t.ModuleId == item.ModuleId).FirstOrDefault();
                        var moduleControl = db.ModuleControls.Where(t => t.ModuleDefId == module.ModuleDefId && t.Type == "view").FirstOrDefault();
                        string controlSrc = moduleControl.ControlSrc;
                        LoadControl(layoutControl, controlSrc, item.PaneName, item.ModuleId, item.ModuleTitle, item.PageModuleId, item.Container, item.DisplayTitle);
                    }
                }
                else
                {
                    Response.Redirect("/404.aspx?type=authentication");
                }
            }
            else
            {
                Response.Redirect("/404.aspx?type=notfound");
            }
        }

        protected void SetCulture()
        {
            HttpCookie cookie = Request.Cookies["culture"];
            if (cookie != null)
            {
                string currentCulture = cookie.Value;
                Thread.CurrentThread.CurrentCulture = CultureInfo.CreateSpecificCulture(currentCulture);
                Thread.CurrentThread.CurrentUICulture = CultureInfo.CreateSpecificCulture(currentCulture);
            }
            
        }

        protected bool CheckPagePermissions()
        {
            bool result = false;
            var pm = db.PagePermissions.Where(t => t.PageId == this.PageId).ToList();
            foreach (var item in pm)
            {
                if (item.Role == "Anonymous" || Context.User.IsInRole(item.Role))
                {
                    return true;
                }
            }
            return result;
        }

        protected void AddMeta(string title, string description, string keywords)
        {
            string SiteTitle = MyCMS.Utility.GetSettingByKey("SiteTitle");
            if (!string.IsNullOrEmpty(SiteTitle))
            {
                title = title + " - " + SiteTitle;
            }
            Page.Header.Title = title;
            HtmlMeta metaDescription = new HtmlMeta();
            metaDescription.Name = "description";
            metaDescription.Content = description;
            Page.Header.Controls.Add(metaDescription);

            HtmlMeta metaKeywords = new HtmlMeta();
            metaKeywords.Name = "keywords";
            metaKeywords.Content = keywords;
            Page.Header.Controls.Add(metaKeywords);

        }

        protected void btnEdit_Click(object sender, ImageClickEventArgs e)
        {
            Session["UserMode"] = "edit";
            Response.Redirect(Request.RawUrl);
        }
    }
}