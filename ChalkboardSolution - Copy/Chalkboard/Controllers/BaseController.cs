using Chalkboard.DatabaseModels;
using Chalkboard.ViewModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Chalkboard.Controllers
{
    public class BaseController : Controller
    {
        protected void SetUser(User user)
        {
            Session["LoggedInUser"] = user;
        }


        protected User GetUser()
        {
            return (User)Session["LoggedInUser"];
        }

        protected ProfileModel GetSelectedProfile()
        {
            return (ProfileModel)Session["SelectedProfile"];
        }

        protected void SetSelectedProfile(ProfileModel profile)
        {
            Session["SelectedProfile"] = profile;
        }
    }
}