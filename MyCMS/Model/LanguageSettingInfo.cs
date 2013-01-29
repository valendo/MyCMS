using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace MyCMS.Model
{
    public class LanguageSettingInfo
    {
        [Key, DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int ModuleId { get; set; }
        public string Type { get; set; }
        public bool HideCurrent { get; set; }
    }
}