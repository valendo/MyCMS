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
            Label1.Text = Request.QueryString["mid"].ToString();
        }

        private void LoadModuleControl(PlaceHolder ContainerControl, string controlSource)
        {
            UserControl ctl = this.Page.LoadControl(controlSource) as UserControl;
            ctl.EnableViewState = true;
            ContainerControl.Controls.Add(ctl);
        }

        private void LoadModuleControls()
        {
            int moduleId = int.Parse(Request.QueryString["mid"]);
            int moduleDefId = db.Modules.Where(t => t.ModuleId == moduleId).FirstOrDefault().ModuleDefId;
            string controlSrc = "~/Modules/" + db.ModuleDefinitions.Where(t => t.ModuleDefId == moduleDefId).FirstOrDefault().ModuleFolder + "/Edit.ascx";
            LoadModuleControl(pchEdit, controlSrc);
            
            
        }
    }
}