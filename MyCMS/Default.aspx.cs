using MyCMS.Logic;
using MyCMS.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.ModelBinding;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace MyCMS
{
    public partial class _Default : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string pageSEO = Page.RouteData.Values["pageSEO"] as string;
                int PageId = GetPageId(pageSEO);
                if (PageId != -1)
                {
                    var page = db.Pages.Where(t => t.PageId == PageId).FirstOrDefault();
                    var pageModules = db.PageModules.Where(t => t.PageId == PageId).OrderBy(t => t.ModuleOrder).ToList();
                    //Add meta
                    AddMeta(page.Title, page.Description, page.Keywords);

                    UserControl layoutControl = this.Page.LoadControl("~/Themes/" + page.Theme + "/" + page.Layout + "") as UserControl;
                    pchDefault.Controls.Add(layoutControl);
                    foreach (var item in pageModules)
                    {
                        var module = db.Modules.Where(t => t.ModuleId == item.ModuleId).FirstOrDefault();
                        string controlSrc = "~/Modules/" + db.ModuleDefinitions.Where(t => t.ModuleDefId == module.ModuleDefId).FirstOrDefault().ModuleFolder + "/View.ascx";
                        LoadControl(layoutControl, controlSrc, item.PaneName, item.ModuleId, item.ModuleTitle, item.PageModuleId);
                    }
                }
                else
                {
                    pchDefault.Controls.Add(new LiteralControl("<h2>Page not found!!!</h2>"));
                }
            }
        }

        protected void AddMeta(string title, string description, string keywords)
        {
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
    }
}