using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace TimeTracking.Web.Models {
  [Table("Project")]
  public class Project {
    [Key]
    public Guid ProjectID { get; set; }
    public string Name { get; set; }
    public DateTimeOffset? Created { get; set; }
  }
}