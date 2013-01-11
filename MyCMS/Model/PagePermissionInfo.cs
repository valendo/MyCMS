using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace MyCMS.Model
{
    public class PagePermissionInfo
    {
        [Key]
        public int PagePermissionId { get; set; }
        public int PageId { get; set; }
        public string Role { get; set; }
    }
}