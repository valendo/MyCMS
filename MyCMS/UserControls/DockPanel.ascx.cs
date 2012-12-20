using MyCMS.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MyCMS.UserControls
{
    public partial class DockPanel : System.Web.UI.UserControl
    {
        MyCMSContext db = new MyCMSContext();
        protected void Page_Load(object sender, EventArgs e)
        {
            StringBuilder sb = new StringBuilder();
            var list = db.ModuleDefinitions.ToList();
            foreach (var item in list)
            {
                sb.AppendFormat("<li id=\"{0}\"><a href=\"#\">{1}</a></li>",item.ModuleDefId, item.ModuleName);
            }
            ltModules.Text = sb.ToString();
        }
    }
}