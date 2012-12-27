using MyCMS.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MyCMS.Admin
{
    public partial class HandleModuleControls : System.Web.UI.Page
    {
        MyCMSContext db = new MyCMSContext();

        protected void Page_Load(object sender, EventArgs e)
        {
            LoadModuleControls();
        }

        private void LoadModuleControl(PlaceHolder ContainerControl, string controlSource)
        {
            UserControl ctl = this.Page.LoadControl(controlSource) as UserControl;
            ctl.EnableViewState = true;
            ContainerControl.Controls.Add(ctl);
        }

        private void LoadModuleControls()
        {
            int PageId = -1;
            int ModuleDefId = -1;
            int ModuleId = -1;
            string PaneName = "";

            if (Request.QueryString["action"] == "add")
            {
                PageId = int.Parse(Request.QueryString["PageId"]);
                ModuleDefId = int.Parse(Request.QueryString["ModuleDefId"]);
                PaneName = Request.QueryString["PaneName"];
            }
            else if (Request.QueryString["action"] == "edit")
            {
                ModuleId = int.Parse(Request.QueryString["mid"]);
                ModuleDefId = db.Modules.Where(t => t.ModuleId == ModuleId).FirstOrDefault().ModuleDefId;
            }
            string controlSrc = "~/Modules/" + db.ModuleDefinitions.Where(t => t.ModuleDefId == ModuleDefId).FirstOrDefault().ModuleFolder + "/Edit.ascx";
            LoadModuleControl(pchEdit, controlSrc);
        }
    }
}