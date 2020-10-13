using Chalkboard.Business;
using Chalkboard.ViewModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Chalkboard.Controllers
{
    public class ProfileController : BaseController
    {
        private IProfile _profile;
        private ICrypto _crypto;
        private ILogin _login;

        public ProfileController()
        {
            _login = new Login();
            _profile = new Profile();
            _crypto = new Crypto();
        }
        // GET: Profile
        public ActionResult Index()
        {
            //TODO: Provide view name for Profiles
            return View("", _profile.GetProfiles(GetUser().Id));
        }

        public ActionResult CheckPassword(string password)
        {
            var user = _login.VerifyLogin(GetUser().UserName, _crypto.Encrypt(password, true));
            return Json(new { Result = !(user == null), Message = "" }, JsonRequestBehavior.AllowGet);
        }

        public ActionResult UpdatePassword(string password)
        {
            return Json(new { Result = _profile.UpdatePassword(GetUser().Id, _crypto.Encrypt(password, true)), Message = "" });
        }

        public ActionResult AddEditProfile(ProfileModel profile)
        {
            profile = _profile.AddEditProfile(profile);
            return Json(new { Result = true, Message = "" });
        }

        public ActionResult SelectProfile(int profileId)
        {
            var profile = _profile.LoadProfile(profileId);
            SetSelectedProfile(profile);
            //TODO: Redirect to Activity Lounge page
            return RedirectToAction("");
        }
    }
}