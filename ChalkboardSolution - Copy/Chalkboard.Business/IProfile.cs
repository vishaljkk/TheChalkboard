using Chalkboard.DatabaseModels;
using Chalkboard.ViewModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Chalkboard.Business
{
    public interface IProfile
    {
        List<ProfileModel> GetProfiles(int userId);
        ProfileModel AddEditProfile(ProfileModel profile);
        bool UpdatePassword(int userId, string password);
        ProfileModel LoadProfile(int profileId);
    }
}
