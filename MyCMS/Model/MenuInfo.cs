using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace MyCMS.Model
{
    public class MenuInfo
    {
        [Key]
        public int MenuId { get; set; }
        public int ModuleId { get; set; }
    }
    public class MenuItemInfo
    {
        [Key]
        public int MenuItemId { get; set; }
        public int MenuId { get; set; }
        public int ParentId { get; set; }
        public string LinkType { get; set; }
        public string Title { get; set; }
        public int PageId { get; set; }
        public string LinkUrl { get; set; }
        public int MenuOrder { get; set; }
        public bool OpenInNewWindow { get; set; }
    }
}