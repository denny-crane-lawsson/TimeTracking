using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace TimeTracking.Web.Models {
  [Table("Time_Tag")]
  public class Time_Tag {
    [Key]
    [Column(Order = 0)]
    public Guid TimeID { get; set; }
    [Key]
    [Column(Order = 1)]
    public Guid TagID { get; set; }
  }
}