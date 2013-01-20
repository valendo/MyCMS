using MyCMS.Logic;
using MyCMS.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MyCMS.Modules.Menu
{
    public partial class View : BaseUserControl
    {
        MyCMSContext db = new MyCMSContext();
        protected void Page_Load(object sender, EventArgs e)
        {
            //var spacer = db.Spacers.Where(t => t.ModuleId == this.ModuleId).FirstOrDefault();
            //if (spacer != null)
            //{
            //    ltrContent.Text = "<div style='width:100%; height:" + spacer.Height + "px'></div>";
            //}
            //else
            //{
            //    ltrContent.Text = "<div>No spacer set! Please edit spacer.</div>";
            //}
            ltrContent.Text = "<div class='warning'>Menu has no items</div>";
        }
    }
}