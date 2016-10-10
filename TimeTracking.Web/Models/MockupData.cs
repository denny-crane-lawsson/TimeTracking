using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TimeTracking.Web.Models {
  public class MockupData {
    private readonly static Lazy<MockupData> _instance = new Lazy<MockupData>();

    public static MockupData Instance
    {
      get
      {
        return _instance.Value;
      }
    }

    public IEnumerable<Project> GetProjects() {
      return new Project[]
      {
        new Project {
            ProjectID = new Guid("40E0931D-4591-4C20-BAE3-19AADDD5FF9A"),
            Name = "Mobile"
        },
        new Project {
            ProjectID = new Guid("CC73A080-48D7-4D88-8733-8F6E7319E116"),
            Name = "Backend"
        },
        new Project {
            ProjectID = new Guid("B1E0B8D6-A459-4A50-8F05-A39B78C81690"),
            Name = "Reporting"
        },
        new Project {
            ProjectID = new Guid("2804979E-ECEA-4559-A432-BA5201146EEB"),
            Name = "Web"
        },
        new Project {
            ProjectID = new Guid("0D364F3A-DBE4-4B46-AD86-C79C6C601761"),
            Name = "Support"
        }
      }.AsQueryable().OrderBy(x => x.Name);
    }

    public IEnumerable<User> GetUsers() {
      return new User[]
      {
        new User {
            UserID = new Guid("04CDFC3B-85EC-4EF9-A5AF-63EAA2A7700C"),
            Name = "Tara Wilson"
        },
        new User {
            UserID = new Guid("100B00CD-71DA-458C-8616-73E9E29BDC25"),
            Name = "Alan Shore"
        },
        new User {
            UserID = new Guid("B19CF060-5892-4568-9D8A-7508A5E854D5"),
            Name = "Denny Crane"
        },
        new User {
            UserID = new Guid("780D9F3E-FD57-49EF-96E3-C33338FD5A99"),
            Name = "Katie Piper"
        },
        new User {
            UserID = new Guid("EBFB36E2-0C01-4D10-AD29-C4A6E4B4EA9B"),
            Name = "Brad Chase"
        },
        new User {
            UserID = new Guid("FFAF02F7-D0FF-412E-8793-CF4C584259B6"),
            Name = "Rob Carter"
        }
      }.AsQueryable().OrderBy(x => x.Name);
    }

  }
}
