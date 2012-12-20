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
        public DbSet<PageInfo> Pages { get; set; }
        public DbSet<ModuleDefinitionInfo> ModuleDefinitions { get; set; }
        public DbSet<ModuleControlInfo> ModuleControls { get; set; }
        public DbSet<ModuleInfo> Modules { get; set; }
        public DbSet<PageModuleInfo> PageModules { get; set; }
        public DbSet<TextInfo> Texts { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<PageInfo>().ToTable("Pages");
            modelBuilder.Entity<ModuleDefinitionInfo>().ToTable("ModuleDefinitions");
            modelBuilder.Entity<ModuleControlInfo>().ToTable("ModuleControls");
            modelBuilder.Entity<ModuleInfo>().ToTable("Modules");
            modelBuilder.Entity<PageModuleInfo>().ToTable("PageModules");
            modelBuilder.Entity<TextInfo>().ToTable("Texts");
        }
    }
}