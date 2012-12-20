﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace MyCMS.Model
{
    public class ModuleDefinition
    {
        [Key]
        public int ModuleDefId { get; set; }
        public string ModuleName { get; set; }
    }
}