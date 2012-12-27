using MyCMS.Model;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MyCMS.UserControls
{
    public partial class PageTree : System.Web.UI.UserControl
    {
        MyCMSContext db = new MyCMSContext();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                StringBuilder sb = new StringBuilder();
                var listPages = db.Pages.Where(t => t.ParentId == -1).OrderBy(t => t.PageOrder).ToList();
                AddNode(listPages, ref sb);
                ltrPages.Text = sb.ToString();
            }
        }
        private void AddNode(List<PageInfo> ListPages, ref StringBuilder sb)
        {
            foreach (var item in ListPages)
            {
                string pageName = item.PageName;
                string pageSEO = item.PageSEO;
                string pageId = item.PageId.ToString();
                sb.AppendFormat("<li id=\"{0}\"  data=\"url: '{1}'\">{2}", pageId, pageSEO, pageName);
                var subPages = db.Pages.Where(t => t.ParentId == item.PageId).OrderBy(t => t.PageOrder).ToList();
                if (subPages.Count > 0)
                {
                    sb.Append("<ul>");
                    AddNode(subPages, ref sb);
                    sb.Append("</ul>");
                }
            }
        }
    }
}