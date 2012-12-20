using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace MyCMS.Model
{
    public class PageModuleInfo
    {
        [Key]
        public int PageModuleId { get; set; }
        public int PageId { get; set; }
        public int ModuleId { get; set; }
        public string PaneName { get; set; }
        public int ModuleOrder { get; set; }
        public string ModuleTitle { get; set; }
        public bool DisplayTitle { get; set; }
    }
}