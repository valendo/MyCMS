using MyCMS.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MyCMS.Admin
{
    public partial class ModuleSetting : System.Web.UI.Page
    {
        MyCMSContext db = new MyCMSContext();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (Request.QueryString["action"] == "add")
            {
                int ModuleDefId = int.Parse(Request.QueryString["ModuleDefId"]);
                int PageId = int.Parse(Request.QueryString["PageId"]);
                string PaneName = Request.QueryString["PaneName"];
                SaveModule(ModuleDefId, PageId, PaneName);
                ScriptManager.RegisterClientScriptBlock(this, typeof(Page), UniqueID, "closePopup();", true);
            }
        }

        public void SaveModule(int ModuleDefId, int PageId, string PaneName)
        {
            ModuleInfo m = new ModuleInfo();
            m.ModuleDefId = ModuleDefId;
            db.Modules.Add(m);
            db.SaveChanges();
            int ModuleId = db.Modules.OrderByDescending(t => t.ModuleId).FirstOrDefault().ModuleId;
            int ModuleOrder = db.PageModules.OrderByDescending(t => t.ModuleOrder).FirstOrDefault().ModuleOrder;
            PageModuleInfo pm = new PageModuleInfo();
            pm.PageId = PageId;
            pm.ModuleId = ModuleId;
            pm.PaneName = PaneName;
            pm.ModuleOrder = ModuleOrder;
            pm.ModuleTitle = txtModuleTitle.Text;
            pm.DisplayTitle = true;
            db.PageModules.Add(pm);
            db.SaveChanges();
        }
    }
}