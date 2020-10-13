using Chalkboard.Business;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Chalkboard.Controllers
{
    public class LoginController : BaseController
    {
        private ILogin _login;
        private ICrypto _crypto;
        public LoginController()
        {
            _login = new Login();
            _crypto = new Crypto();
        }
        // GET: Login
        public ActionResult Index(string message="")
        {
            //TODO: If cookie exist, then user needs to login directly
            return View();
        }

        [HttpPost]
        public ActionResult SetLogin(string emailID, string password, string rememberMe)
        {
            System.Diagnostics.Debug.WriteLine("entered");
            var user = _login.VerifyLogin(emailID, _crypto.Encrypt(password, true));
            if (user != null)
            {
                if (!string.IsNullOrEmpty(rememberMe) && string.Compare(rememberMe, "on", true) == 0)
                {
                    SetCookie(CreateCookieToken(emailID));

                }
                SetUser(user);
                return RedirectToAction("Index", "Profile");
            }
            else
            {
                return RedirectToAction("Index", new { @message = "Username or Password is Invalid" });
            }
        }


        private void SetCookie(string cookieToken)
        {
            var CookieToken = new HttpCookie("CookieToken")
            {
                Value = cookieToken,
                Expires = DateTime.Now.AddHours(1)
            };
            Response.SetCookie(CookieToken);
        }

        public string CreateCookieToken(string userName)
        {
            string CookietokenStr = Convert.ToString(userName) + ";" + DateTime.Now.ToString();
            CookietokenStr = _crypto.Encrypt(CookietokenStr,true);
            return CookietokenStr;
        }
    }
}