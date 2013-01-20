using MyCMS.Logic;
using MyCMS.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MyCMS.Modules.Text
{
    public partial class View : BaseUserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            MyCMSContext db = new MyCMSContext();
            var list = db.Texts.Where(t => t.ModuleId == this.ModuleId).FirstOrDefault();
            if (list != null)
            {
                ltrContent.Text = list.Content;
            }
            else
            {
                if (IsEdit)
                {
                    ltrContent.Text = "<div class='warning'>No content! Please edit content.</div>";
                }
            }
            
        }
    }
}