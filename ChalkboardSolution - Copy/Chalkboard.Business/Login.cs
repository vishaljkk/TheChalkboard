using Chalkboard.DatabaseModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Chalkboard.Business
{
    public class Login : BaseBusiness, ILogin
    {

        public Login()
        {

        }
        public User VerifyLogin(string userName, string password)
        {
            if (_chalkboardEntities.Users.Count(_u => string.Compare(_u.UserName, userName, true) == 0 && _u.Password == password) > 0)
            {
                var user = _chalkboardEntities.Users.Where(_u => string.Compare(_u.UserName, userName, true) == 0 && _u.Password == password).FirstOrDefault();
                return user;
            }
            else
            {
                return null;
            }

        }
    }
}
