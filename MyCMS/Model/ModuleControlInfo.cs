using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace MyCMS.Model
{
    public class ModuleControlInfo
    {
        [Key]
        public int ModuleControlId { get; set; }
        public int ModuleDefId { get; set; }
        public string ControlSrc { get; set; }
        public string Type { get; set; }
    }
}