using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;

namespace MyCMS.Logic
{
    public class BaseUserControl : System.Web.UI.UserControl
    {
        public int ModuleId { get; set; }

        public BaseUserControl()
        {
        }

        public string Preview
        {
            get
            {
                string mode = "edit";
                if (Session["UserMode"] != null)
                {
                    if (Session["UserMode"].ToString() == "view")
                    {
                        mode = "view";
                    }
                }
                return mode;
            }
        }

        public bool IsEdit
        {
            get
            {
                bool _IsEdit = false;
                if (IsAdmin && Preview == "edit")
                {
                    _IsEdit = true;
                }
                return _IsEdit;
            }
        }

        public bool IsHost
        {
            get { return Context.User.IsInRole("host"); }
        }

        public bool IsAdmin
        {
            get { return Context.User.IsInRole("admin"); }
        }
    }
}