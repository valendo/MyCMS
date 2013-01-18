using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace MyCMS.Model
{
    public class SpacerInfo
    {
        [Key]
        public int SpacerId { get; set; }
        public int ModuleId { get; set; }
        public int Height { get; set; }
    }
}