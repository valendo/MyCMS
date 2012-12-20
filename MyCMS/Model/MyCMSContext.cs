using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;

namespace MyCMS.Model
{
    public class MyCMSContext : DbContext
    {
        public MyCMSContext()
            : base("DefaultConnection")
        { }
        public DbSet<Page> Pages { get; set; }
        public DbSet<ModuleDefinition> ModuleDefinitions { get; set; }
        public DbSet<ModuleControl> ModuleControls { get; set; }
        public DbSet<Module> Modules { get; set; }
        public DbSet<PageModule> PageModules { get; set; }
        public DbSet<Text> Texts { get; set; }
    }
}