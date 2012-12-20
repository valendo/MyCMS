using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace MyCMS.Model
{
    public class Module
    {
        [Key]
        public int ModuleId { get; set; }
        public int ModuleDefId { get; set; }
    }
}