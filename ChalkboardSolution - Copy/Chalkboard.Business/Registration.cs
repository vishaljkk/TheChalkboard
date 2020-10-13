using Chalkboard.ViewModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Chalkboard.Mapper;
using Chalkboard.DatabaseModels;
using System.Data.Entity.Validation;


namespace Chalkboard.Business
{
    public class Registration : BaseBusiness, IRegistration
    {
        public Registration()
        {
        }
        public bool CheckLoginName(string email)
        {
            if (_chalkboardEntities.UserProfiles.Count(_c => string.Compare(_c.Email, email, true) == 0) > 0)
            {
                return true;
            }
            else
            {
                return false; ;
            }
        }

        public bool Save(RegistrationModel registrationModel)
        {
            User user = _mapper.Map<User>(registrationModel);
            user.UserProfiles = new List<UserProfile>();
            user.Profiles = new List<DatabaseModels.Profile>();

            UserProfile userProfile = _mapper.Map<UserProfile>(registrationModel);
            DatabaseModels.Profile profile = _mapper.Map<DatabaseModels.Profile>(registrationModel);

            user.UserProfiles.Add(userProfile);
            user.Profiles.Add(profile);

            _chalkboardEntities.Users.Add(user);

            user.Status = 1;
            user.CreatedBy = 1;
            user.CreatedDate = DateTime.UtcNow;

            userProfile.Status = 1;
            userProfile.CreatedBy = 1;
            userProfile.CreatedDate = DateTime.UtcNow;

            profile.Status = 1;
            profile.CreatedBy = 1;
            profile.CreatedDate = DateTime.UtcNow;

            try
            {
                _chalkboardEntities.SaveChanges();
            }
            catch (DbEntityValidationException ex)
            {
                foreach (var eve in ex.EntityValidationErrors)
                {
                    foreach (var ve in eve.ValidationErrors)
                    {
                        //TODO: Log Error using log4net
                        Console.WriteLine("- Property: \"{0}\", Value: \"{1}\", Error: \"{2}\"",
                            ve.PropertyName,
                            eve.Entry.CurrentValues.GetValue<object>(ve.PropertyName),
                            ve.ErrorMessage);
                    }
                }
                return false;
            }
            return true;
        }
    }
}
