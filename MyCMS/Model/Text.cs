using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace MyCMS.Model
{
    public class Text
    {
        [Key]
        public int TextId { get; set; }
        public int ModuleId { get; set; }
        public string Content { get; set; }
    }
}