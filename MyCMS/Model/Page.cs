using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace MyCMS.Model
{
    public class Page
    {
        [Key]
        public int PageId { get; set; }
        public string PageName { get; set; }
        public string Title { get; set; }
        public int ParentId { get; set; }
        public string PageSEO { get; set; }
        public int PageOrder { get; set; }
        public bool IsVisible { get; set; }
        public string Description { get; set; }
        public string Keywords { get; set; }
        public string Theme { get; set; }
        public string Layout { get; set; }
    }
}