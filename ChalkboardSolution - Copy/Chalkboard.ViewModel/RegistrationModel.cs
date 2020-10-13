using Chalkboard.DatabaseModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Chalkboard.ViewModel
{
    public class RegistrationModel
    {
        public string UserName { get; set; }
        public string EmailId { get; set; }
        public string LoginName { get; set; }
        public string SchoolCode { get; set; }
        public string Password { get; set; }
        public System.DateTime CreatedDate { get; set; }
        public int Status { get; set; }
        public int CreatedBy { get; set; }
        public Nullable<int> UpdatedBy { get; set; }
        public Nullable<System.DateTime> UpdatedDate { get; set; }

    }
}
