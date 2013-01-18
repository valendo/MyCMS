﻿using System;
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
        //Core
        public DbSet<PageInfo> Pages { get; set; }
        public DbSet<ModuleDefinitionInfo> ModuleDefinitions { get; set; }
        public DbSet<ModuleControlInfo> ModuleControls { get; set; }
        public DbSet<ModuleInfo> Modules { get; set; }
        public DbSet<PageModuleInfo> PageModules { get; set; }
        public DbSet<PagePermissionInfo> PagePermissions { get; set; }
        public DbSet<SettingInfo> Settings { get; set; }
        //Modules
        public DbSet<TextInfo> Texts { get; set; }
        public DbSet<SpacerInfo> Spacers { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            //Core
            modelBuilder.Entity<PageInfo>().ToTable("Pages");
            modelBuilder.Entity<ModuleDefinitionInfo>().ToTable("ModuleDefinitions");
            modelBuilder.Entity<ModuleControlInfo>().ToTable("ModuleControls");
            modelBuilder.Entity<ModuleInfo>().ToTable("Modules");
            modelBuilder.Entity<PageModuleInfo>().ToTable("PageModules");
            modelBuilder.Entity<PagePermissionInfo>().ToTable("PagePermissions");
            modelBuilder.Entity<SettingInfo>().ToTable("Settings");
            //Modules
            modelBuilder.Entity<TextInfo>().ToTable("Texts");
            modelBuilder.Entity<SpacerInfo>().ToTable("module_Spacers");
        }
    }

}