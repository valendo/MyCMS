using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace MyCMS.Model
{
    public class LanguageInfo
    {
        [Key]
        public int LanguageId { get; set; }
        public int ModuleId { get; set; }
        public string CultureCode { get; set; }
        public string CultureName { get; set; }
        public int SortOrder { get; set; }
        public int PageId { get; set; }
    }
}