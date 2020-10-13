using Chalkboard.ViewModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Chalkboard.Business
{
    public interface IRegistration
    {
        bool CheckLoginName(string email);
        bool Save(RegistrationModel registrationModel);
    }
}
