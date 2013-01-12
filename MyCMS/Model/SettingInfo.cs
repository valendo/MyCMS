using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace MyCMS.Model
{
    public class SettingInfo
    {
        [Key]
        public string Key { get; set; }
        public string Value { get; set; }
    }
}