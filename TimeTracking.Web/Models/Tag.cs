using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace TimeTracking.Web.Models {
  [Table("Tag")]
  public class Tag {
    [Key]
    public Guid TagID { get; set; }
    public string Name { get; set; }
    public DateTimeOffset? Created { get; set; }
  }
}