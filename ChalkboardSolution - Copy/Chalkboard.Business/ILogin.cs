using Chalkboard.DatabaseModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Chalkboard.Business
{
    public interface ILogin
    {
        User VerifyLogin(string userName, string password);
    }
}
