using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using TimeTracking.Web.Models;

namespace TimeTracking.Web.Controllers {
  public class UsersController : ApiController {

    private TimeTrackingContext db = new TimeTrackingContext();

    // GET: api/Users
    public IEnumerable<User> GetUsers() {

      //TODO: Please load user list from Database instead of MockupData object
      return MockupData.Instance.GetUsers();
    }

  }
}
