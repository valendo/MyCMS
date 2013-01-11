using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MyCMS.UserControls
{
    public partial class TopPanel : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnPreview_Click(object sender, ImageClickEventArgs e)
        {
            Session["IsEdit"] = false;
            Response.Redirect(Request.RawUrl);
        }

        

        

        
    }
}