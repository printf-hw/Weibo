﻿//------------------------------------------------------------------------------
// <auto-generated>
//     此代码已从模板生成。
//
//     手动更改此文件可能导致应用程序出现意外的行为。
//     如果重新生成代码，将覆盖对此文件的手动更改。
// </auto-generated>
//------------------------------------------------------------------------------

namespace Liquid.Models
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class LiquidEntities : DbContext
    {
        public LiquidEntities()
            : base("name=LiquidEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<Command> Command { get; set; }
        public virtual DbSet<Follow> Follow { get; set; }
        public virtual DbSet<Forward> Forward { get; set; }
        public virtual DbSet<Like> Like { get; set; }
        public virtual DbSet<Log> Log { get; set; }
        public virtual DbSet<Messsage> Messsage { get; set; }
        public virtual DbSet<User> User { get; set; }
    }
}
