using MyCMS.Logic;
using MyCMS.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MyCMS.Modules.Redirect
{
    public partial class View : BaseUserControl
    {
        MyCMSContext db = new MyCMSContext();
        protected void Page_Load(object sender, EventArgs e)
        {
            var redirect = db.Redirects.Where(t => t.ModuleId == this.ModuleId).FirstOrDefault();
            if (redirect != null)
            {
                if (!Context.User.IsInRole("admin"))
                {
                    if (redirect.Type == "page")
                    {
                        Response.Redirect(MyCMS.Utility.GetPageUrl(redirect.PageId));
                    }
                    else if (redirect.Type == "link" || redirect.Type == "file")
                    {
                        Response.Redirect(redirect.Url);
                    }
                }
                else
                {
                    string name = "url " + redirect.Url;
                    if (redirect.Type == "page")
                    {
                        name = "page " + db.Pages.Where(t => t.PageId == redirect.PageId).FirstOrDefault().PageName;
                    }
                    else if (redirect.Type == "file")
                    {
                        name = "file " + redirect.Url;
                    }
                    ltrContent.Text = "<div class='warning'>This module send non administrators to " + name + "</div>";
                }
            }
            else
            {
                ltrContent.Text = "<div class='warning'>No url redirect was set</div>";
            }
        }

        
    }
}