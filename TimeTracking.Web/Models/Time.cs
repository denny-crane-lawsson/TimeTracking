using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace TimeTracking.Web.Models {
  [Table("Time")]
  public class Time {
    [Key]
    public Guid TimeID { get; set; }
    public Guid ProjectID { get; set; }
    public Guid UserID { get; set; }
    public string Description { get; set; }
    public DateTimeOffset Date { get; set; }
    public TimeSpan Start { get; set; }
    public TimeSpan Stop { get; set; }
    public DateTimeOffset? Created { get; set; }
    public DateTimeOffset? Modified { get; set; }
  }
}