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
            //int MID = ModuleControlDataProvider.GetModuleID(UserModuleID);
            //string MName = ModuleControlDataProvider.GetModuleName(UserModuleID);
            //List<ModuleControlInfo> lstModCtls = ModuleControlDataProvider.GetControlType(MID);
            //tabcount = lstModCtls.Count;
            //ShowHideTabs(lstModCtls);
            //string appPath = Request.ApplicationPath != "/" ? Request.ApplicationPath + "/" : "/";
            //foreach (ModuleControlInfo obj in lstModCtls)
            //{

            //    switch (obj.ControlType)
            //    {
            //        case "2":
            //            LoadControl(pchEdit, appPath + obj.ControlSrc, UserModuleID.ToString());
            //            break;
            //        case "3":
            //            LoadControl(lstModCtls.Count > 2 ? pchSetting : pchEdit, appPath + obj.ControlSrc, UserModuleID.ToString());
            //            break;
            //    }
            //}
            int moduleId = int.Parse(Request.QueryString["mid"]);
            int moduleDefId = db.Modules.Where(t => t.ModuleId == moduleId).FirstOrDefault().ModuleDefId;
            var moduleControls = db.ModuleControls.Where(t => t.ModuleDefId == moduleDefId).ToList();
            foreach (var item in moduleControls)
            {
                if (item.ControlType == 2)
                {
                    LoadModuleControl(pchEdit, "~/" + item.ControlSrc);
                }
                else if (item.ControlType == 3)
                {
                    LoadModuleControl(pchSetting, "~/" + item.ControlSrc);
                }
            }
            
        }
    }
}