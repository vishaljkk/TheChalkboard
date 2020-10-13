using Chalkboard.DatabaseModels;
using Chalkboard.ViewModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Chalkboard.Business
{
    public class Profile : BaseBusiness, IProfile
    {
        public Profile()
        {
        }

        public ProfileModel AddEditProfile(ProfileModel profileModel)
        {
            var profile = _mapper.Map<DatabaseModels.Profile>(profileModel);
            if(profile.Id == 0)
            {
                _chalkboardEntities.Profiles.Add(profile);
            }
            else
            {
                var dbProfile =  _chalkboardEntities.Profiles.Find(profile.Id);
                dbProfile = profile;
            }
            _chalkboardEntities.SaveChanges();
            return _mapper.Map<ProfileModel>(profile);
        }

        public List<ProfileModel> GetProfiles(int userId)
        {
            var profiles = _chalkboardEntities.Profiles.Where(_p => _p.UserId == userId).ToList();
            return _mapper.Map<List<ProfileModel>>(profiles);
        }


        public bool UpdatePassword(int userId, string password)
        {
            var user = _chalkboardEntities.Users.First(_u => _u.Id == userId);
            user.Password = password;
            _chalkboardEntities.SaveChanges();
            return true;
            
        }


        public ProfileModel LoadProfile(int profileId)
        {
            var profile = _chalkboardEntities.Profiles.First(_p => _p.Id == profileId);
            return _mapper.Map<ProfileModel>(profile);
        }
    }
}
