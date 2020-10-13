using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;
using Chalkboard.Mapper;
using AutoMapper;
using Chalkboard.ViewModel;
using Chalkboard.Business;

namespace Chalkboard.Controllers
{
    public class RegisterController : Controller
    {
        private AutoMapper.Mapper _mapper;
        private IRegistration _registration; 

        public RegisterController()
        {
            _mapper = new AutoMapper.Mapper(Mapper.MapperSetup._configuration);
            _registration = new Registration();
        }

        // GET: Register
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult SaveRegistration(RegistrationModel registrationModel)
        {
            registrationModel.Password = GeneratePassword();
            var save = _registration.Save(registrationModel);
            return Json(new { Result = save, Message = "" });
        }

        public ActionResult CheckEmailExists(string email)
        {
            return Json(new { Result = _registration.CheckLoginName(email), Message = "" }, JsonRequestBehavior.AllowGet);
        }

        private string GeneratePassword()
        {
            string password = Membership.GeneratePassword(12, 1);
            return password;
        }


    }
}