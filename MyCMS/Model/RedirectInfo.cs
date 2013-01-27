using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace MyCMS.Model
{
    public class RedirectInfo
    {
        [Key]
        public int RedirectId { get; set; }
        public int ModuleId { get; set; }
        public string Type { get; set; }
        public int PageId { get; set; }
        public string Url { get; set; }
    }
}