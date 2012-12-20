using MyCMS.Model;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Services;

namespace MyCMS
{
    /// <summary>
    /// Summary description for Cmd
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]
    public class Cmd : System.Web.Services.WebService
    {
        MyCMSContext db = new MyCMSContext();

        [WebMethod]
        public string HelloWorld()
        {
            return "Hello World";
        }

        [WebMethod]
        public List<ModuleDefinition> GetModules()
        {
            return db.ModuleDefinitions.ToList();
        }

        [WebMethod]
        public List<ModuleControl> GetControls(int ModuleDefId)
        {
            return db.ModuleControls.Where(t => t.ModuleDefId == ModuleDefId).ToList();
        }

        [WebMethod]
        public bool SortModules(string PageModuleId, string OldPane, string NewPane, string SortOrder)
        {
            int pageModuleId = int.Parse(PageModuleId.Replace("PageModule", ""));
            if (OldPane != NewPane)
            {
                var pageModule = db.PageModules.Find(pageModuleId);
                pageModule.PaneName = NewPane;
                db.Entry(pageModule).State = EntityState.Modified;
                db.SaveChanges();
            }
            string[] ModulePanes = SortOrder.Split('&');
            foreach (var item in ModulePanes)
            {
                string[] ModulePane = item.Split('=');
                string modules = ModulePane[1];
                if (modules != "")
                {
                    string PaneName = ModulePane[0];
                    string[] arrPageModuleId = ModulePane[1].Replace("PageModule", "").Split(',');
                    for (int i = 0; i < arrPageModuleId.Length; i++)
                    {
                        var pageModule = db.PageModules.Find(int.Parse(arrPageModuleId[i]));
                        pageModule.ModuleOrder = i;
                        db.Entry(pageModule).State = EntityState.Modified;
                        db.SaveChanges();
                    }
                }
            }
            return true;
        }
        [WebMethod]
        public bool DragModules(int ModuleDefId, int PageId, string PaneName)
        {
            Module m = new Module();
            m.ModuleDefId = ModuleDefId;
            db.Modules.Add(m);
            db.SaveChanges();
            int ModuleId = db.Modules.OrderByDescending(t => t.ModuleId).FirstOrDefault().ModuleId;
            int ModuleOrder = db.PageModules.OrderByDescending(t => t.ModuleOrder).FirstOrDefault().ModuleOrder;
            PageModule pm = new PageModule();
            pm.PageId = PageId;
            pm.ModuleId = ModuleId;
            pm.PaneName = PaneName;
            pm.ModuleOrder = ModuleOrder;
            pm.ModuleTitle = "Default";
            pm.DisplayTitle = true;
            db.PageModules.Add(pm);
            db.SaveChanges();
            return true;
        }
    }
}
