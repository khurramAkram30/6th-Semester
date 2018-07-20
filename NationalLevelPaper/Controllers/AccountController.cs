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
    	
        public ActionResult index()
        {
            var db = new NatinaolLevelPaperEntities();

            var users = db.Users.ToList();

            return View(users);
        }
        
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
                Session["userType"] = user.UserTypeId;
                Session["name"] = user.Name;
                

                 if (user.UserTypeId == 3) { 
 
                    return RedirectToAction("index", "Events");
                }
                else if(user.UserTypeId == 4)
                {
                    return RedirectToAction("Index", "Home");
                }
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
        public ActionResult Register(string name,int age,string qualification,string address,string phone,string email,string pwd)
        {
            var db = new NatinaolLevelPaperEntities();


            var user = new User();
            
            user.Name= name;
            user.Age = age;
            user.Qualification = qualification;
            user.Address = address;
            user.Phone = phone;
            user.Email = email;

            user.Password = pwd;
            
            user.UserTypeId = 4;

            db.Users.Add(user);

            db.SaveChanges();

            return RedirectToAction("login");
        }

        public ActionResult logout()
        {
            Session["id"] = null;

            return RedirectToAction("login","Account");


            
        }
    

    }

}