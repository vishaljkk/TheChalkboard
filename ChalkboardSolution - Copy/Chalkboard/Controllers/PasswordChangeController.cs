using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Chalkboard.Controllers
{
    public class PasswordChangeController : BaseController
    {

        // GET: PasswordChange
        public ActionResult Index(string message ="")
        {
            return View("PasswordChange");
        }
        [HttpPost]
        public ActionResult SetChange(string inputOldPassword, string inputNewPassword, string inputConfirmPassword) {
            int addition = Convert.ToInt32(inputOldPassword) + 9;
            Console.WriteLine(addition);
            //return RedirectToAction("Index", "Profile");
            //System.Diagnostics.Debug.WriteLine("entered");
            Console.WriteLine("entered");
            return RedirectToAction("Index", "Profile");
        }
    }
}