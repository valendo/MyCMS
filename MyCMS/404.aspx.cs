using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MyCMS
{
    public partial class _404 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["type"] != null)
                {
                    string type = Request.QueryString["type"];
                    if (type == "authentication")
                    {
                        ltrMsg.Text = "You don't have permission to access this page!!!";
                    }
                    else if (type == "notfound")
                    {
                        ltrMsg.Text = "Page not found!!!";
                    }
                }
            }
        }
    }
}