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
                        string pageSEO = "";
                        GetPageUrl(redirect.PageId, ref pageSEO);
                        pageSEO = reverseIt(pageSEO);
                        Response.Redirect(pageSEO);
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