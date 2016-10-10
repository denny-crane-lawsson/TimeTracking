using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using TimeTracking.Web.Models;

namespace TimeTracking.Web.Controllers {
  public class ProjectsController : ApiController {

    private TimeTrackingContext db = new TimeTrackingContext();

    // GET: api/Projects
    public IEnumerable<Project> GetProjects() {

      //TODO: Please load project list from Database instead of MockupData object
      return MockupData.Instance.GetProjects();
    }

  }
}
