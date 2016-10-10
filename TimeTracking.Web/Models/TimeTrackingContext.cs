using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;

namespace TimeTracking.Web.Models {
  public class TimeTrackingContext : DbContext {
    // You can add custom code to this file. Changes will not be overwritten.
    // 
    // If you want Entity Framework to drop and regenerate your database
    // automatically whenever you change your model schema, please use data migrations.
    // For more information refer to the documentation:
    // http://msdn.microsoft.com/en-us/data/jj591621.aspx

    public TimeTrackingContext() : base("name=TimeTrackingContext") {
      this.Database.Log = s => System.Diagnostics.Debug.WriteLine(s);
    }

    public System.Data.Entity.DbSet<TimeTracking.Web.Models.Project> Projects { get; set; }
    public System.Data.Entity.DbSet<TimeTracking.Web.Models.Tag> Tags { get; set; }
    public System.Data.Entity.DbSet<TimeTracking.Web.Models.Time> Time { get; set; }
    public System.Data.Entity.DbSet<TimeTracking.Web.Models.Time_Tag> Time_Tags { get; set; }
    public System.Data.Entity.DbSet<TimeTracking.Web.Models.User> Users { get; set; }
  }
}