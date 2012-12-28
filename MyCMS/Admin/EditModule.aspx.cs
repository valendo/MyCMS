using MyCMS.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MyCMS.Admin
{
    public partial class EditModule : System.Web.UI.Page
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
            int ModuleId = int.Parse(Request.QueryString["mid"]);
            int ModuleDefId = db.Modules.Where(t => t.ModuleId == ModuleId).FirstOrDefault().ModuleDefId;
            string controlSrc = "~/Modules/" + db.ModuleDefinitions.Where(t => t.ModuleDefId == ModuleDefId).FirstOrDefault().ModuleFolder + "/Edit.ascx";
            LoadModuleControl(pchEdit, controlSrc);
        }
    }
}