using MyCMS.Logic;
using MyCMS.Model;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MyCMS.Modules.Spacer
{
    public partial class Edit : BaseAdminUserControl
    {
        MyCMSContext db = new MyCMSContext();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                var spacer = db.Spacers.Where(t => t.ModuleId == this.ModuleId).FirstOrDefault();
                if (spacer != null)
                {
                    txtHeight.Text = spacer.Height.ToString();
                }
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            var spacer = db.Spacers.Where(t => t.ModuleId == this.ModuleId).FirstOrDefault();
            var oSpacer = new SpacerInfo();
            if (spacer != null)
            {
                oSpacer = db.Spacers.Where(t => t.ModuleId == this.ModuleId).FirstOrDefault();
                oSpacer.Height = int.Parse(txtHeight.Text);
                db.Entry(oSpacer).State = EntityState.Modified;
                db.SaveChanges();
            }
            else
            {
                oSpacer.ModuleId = this.ModuleId;
                oSpacer.Height = int.Parse(txtHeight.Text);
                db.Spacers.Add(oSpacer);
                db.SaveChanges();
            }
            ScriptManager.RegisterClientScriptBlock(this, typeof(Page), UniqueID, "closePopup();", true);
        }
    }
}