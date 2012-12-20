using MyCMS.Logic;
using MyCMS.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MyCMS
{
    public partial class _Default : PageBase
    {
        MyCMSContext db = new MyCMSContext();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                var page = db.Pages.Where(t => t.PageId == 1).FirstOrDefault();
                var pageModules = db.PageModules.Where(t => t.PageId == 1).OrderBy(t => t.ModuleOrder).ToList();

                UserControl layoutControl = this.Page.LoadControl("~/Themes/" + page.Theme + "/" + page.Layout + "") as UserControl;
                pchDefault.Controls.Add(layoutControl);
                foreach (var item in pageModules)
                {
                    var module = db.Modules.Where(t => t.ModuleId == item.ModuleId).FirstOrDefault();
                    var moduleControl = db.ModuleControls.Where(t => t.ModuleDefId == module.ModuleDefId && t.ControlType == 1).FirstOrDefault();
                    LoadControl(layoutControl, moduleControl.ControlSrc, item.PaneName, item.ModuleId, item.ModuleTitle, item.PageModuleId);
                }
            }
        }

       
    }
}