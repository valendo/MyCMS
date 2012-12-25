using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MyCMS.Logic
{
    public class BaseAdminUserControl : System.Web.UI.UserControl
    {
        private int _ModuleId = -1;
        public int ModuleId
        {
            get {
                if (_ModuleId == -1)
                {
                    if (Request.QueryString["mid"] != null)
                    {
                        _ModuleId = int.Parse(Request.QueryString["mid"].ToString());
                    }
                }
                return _ModuleId;
            }
            set
            {
                _ModuleId = value;
            }
        }
    }
}