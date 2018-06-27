using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using NationalLevelPaper.Models;
namespace NationalLevelPaper.Controllers
{
    public class AccountController : Controller
    {
        
        // GET: Account
        public ActionResult Login()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Login(string email ,string password)
        {
            var db = new NatinaolLevelPaperEntities();

            var user = db.Users.FirstOrDefault(u => u.Email == email && u.Password == password);

            if (user != null)
            {
                Session["id"] = user.Id;
                return RedirectToAction("index", "Home");
            }
            else
            {
                TempData["message"] = "invalid email or password";
                return RedirectToAction("login");
            }

            return View();
        }

        public ActionResult Register()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Register(string name,string email,string pwd)
        {
            var db = new NatinaolLevelPaperEntities();


            var user = new User();

            user.Name = name;

            user.Email = email;

            user.Password = pwd;
            
            user.UserTypeId = 3;

            db.Users.Add(user);

            db.SaveChanges();

            return RedirectToAction("login");
        }
    }
}