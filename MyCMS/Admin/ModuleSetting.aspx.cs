using MyCMS.Model;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MyCMS.Admin
{
    public partial class ModuleSetting : System.Web.UI.Page
    {
        MyCMSContext db = new MyCMSContext();
        string action = "";
        int PageModuleId = -1;
        protected void Page_Load(object sender, EventArgs e)
        {
            action = Request.QueryString["action"];
            if (!IsPostBack)
            {
                BindingContainers();
            }
            if (action == "edit")
            {
                PageModuleId = int.Parse(Request.QueryString["pmid"]);
                if (!IsPostBack)
                {
                    BindingData(PageModuleId);
                }
            }
        }

        protected void BindingData(int PageModuleId)
        {
            var pageModule = db.PageModules.Find(PageModuleId);
            txtModuleTitle.Text = pageModule.ModuleTitle;
            chkDisplayTitle.Checked = pageModule.DisplayTitle;
            ddlContainer.SelectedValue = pageModule.Container.ToString();
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (action == "add")
            {
                int ModuleDefId = int.Parse(Request.QueryString["ModuleDefId"]);
                int PageId = int.Parse(Request.QueryString["PageId"]);
                string PaneName = Request.QueryString["PaneName"];
                AddModule(ModuleDefId, PageId, PaneName);
                ScriptManager.RegisterClientScriptBlock(this, typeof(Page), UniqueID, "closePopup();", true);
            }
            else if (action == "edit")
            {
                var pageModule = db.PageModules.Find(PageModuleId);
                pageModule.ModuleTitle = txtModuleTitle.Text;
                pageModule.DisplayTitle = chkDisplayTitle.Checked;
                pageModule.Container = ddlContainer.SelectedValue;
                db.Entry(pageModule).State = System.Data.EntityState.Modified;
                db.SaveChanges();
                ScriptManager.RegisterClientScriptBlock(this, typeof(Page), UniqueID, "closePopup();", true);
            }
        }

        public void AddModule(int ModuleDefId, int PageId, string PaneName)
        {
            ModuleInfo m = new ModuleInfo();
            m.ModuleDefId = ModuleDefId;
            db.Modules.Add(m);
            db.SaveChanges();
            int ModuleId = db.Modules.OrderByDescending(t => t.ModuleId).FirstOrDefault().ModuleId;
            int ModuleOrder = db.PageModules.OrderByDescending(t => t.ModuleOrder).FirstOrDefault().ModuleOrder + 1;
            PageModuleInfo pm = new PageModuleInfo();
            pm.PageId = PageId;
            pm.ModuleId = ModuleId;
            pm.PaneName = PaneName;
            pm.ModuleOrder = ModuleOrder;
            pm.ModuleTitle = txtModuleTitle.Text;
            pm.DisplayTitle = chkDisplayTitle.Checked;
            pm.Container = ddlContainer.SelectedValue;
            db.PageModules.Add(pm);
            db.SaveChanges();
        }

        private void BindingContainers()
        {
            List<string> Files = new List<string>();
            DirectoryInfo dirLayout = new DirectoryInfo(Server.MapPath("~/Theme/Container"));
            foreach (FileInfo item in dirLayout.GetFiles())
            {
                Files.Add(Path.GetFileNameWithoutExtension(item.Name));
            }
            ddlContainer.DataSource = Files;
            ddlContainer.DataBind();
            ddlContainer.Items.Insert(0, new ListItem("-None-", ""));
        }
    }
}