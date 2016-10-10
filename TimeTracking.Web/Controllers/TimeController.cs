using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using TimeTracking.Web.Models;

namespace TimeTracking.Web.Controllers {
  public class TimeController : ApiController {

    private TimeTrackingContext db = new TimeTrackingContext();

    // GET: api/Time
    public IQueryable<Time> GetTime() {
      
      //TODO: Please implement logic to load time records from Database
      return null;
    }

  }
}