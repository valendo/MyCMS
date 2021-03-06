﻿using MyCMS.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using MyCMS.Logic;

namespace MyCMS.Modules.Text
{
    public partial class Edit : BaseAdminUserControl
    {
        MyCMSContext db = new MyCMSContext();
        protected void Page_Load(object sender, EventArgs e)
        {
            var texts = db.Texts.Where(t => t.ModuleId == this.ModuleId).ToList();
            if (texts.Count > 0)
            {
                txtContent.Text = texts.FirstOrDefault().Content;
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            var texts = db.Texts.Where(t => t.ModuleId == this.ModuleId).ToList();
            if (texts.Count > 0)
            {
                var TextId = db.Texts.Where(t => t.ModuleId == this.ModuleId).FirstOrDefault().TextId;
                var text = new TextInfo();
                text = db.Texts.Find(TextId);
                text.Content = txtContent.Text;
                db.Entry(text).State = EntityState.Modified;
                db.SaveChanges();
            }
            else
            {
                var text = new TextInfo();
                text.ModuleId = this.ModuleId;
                text.Content = txtContent.Text;
                db.Texts.Add(text);
                db.SaveChanges();
            }
            ScriptManager.RegisterClientScriptBlock(this, typeof(Page), UniqueID, "closePopup();", true);
        }
    }
}