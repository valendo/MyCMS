using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MyCMS.Logic
{
    public class BaseUserControl : System.Web.UI.UserControl
    {
        public int ModuleId { get; set; }

        public BaseUserControl()
        {
        }
    }
}