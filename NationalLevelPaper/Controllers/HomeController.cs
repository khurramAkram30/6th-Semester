using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using NationalLevelPaper.Models;
using System.Dynamic;
namespace NationalLevelPaper.Controllers
{
    public class HomeController : Controller
    {
        NatinaolLevelPaperEntities db = new NatinaolLevelPaperEntities();
        // GET: Home
        public ActionResult Index()
        {
            var events = db.Events.ToList();

            var events1 = db.Events.ToList().Where(u=>u.Winner != null);
            ViewBag.show = events1;
            return View(events);
            
        }

        [HttpPost]
        public ActionResult Index(string email)
        {
            var sub = new Subcriber();
         
            if (sub.Email == email)
            {
                ViewBag.error = "this email already exist";
            }
            else
            {
                sub.Email = email;
                db.Subcribers.Add(sub);
                db.SaveChanges();
                return RedirectToAction("Index");

            }
            return View();
        }

       
        public ActionResult Contact()
        {
            return View();
        }
[HttpPost]
        public ActionResult Contact(string name,string email,string subject,string message)
        {
            var cont = new Contact();
            cont.Name = name;
            cont.Email = email;
            cont.Subject = subject;
            cont.Message = message;
            db.Contacts.Add(cont);
            db.SaveChanges();

            ViewBag.save = "thank u for contact us";
            return View();
        }


        public ActionResult ContactDetail()
            {
             var contact = db.Contacts.ToList();

            return View(contact);
            }


        public ActionResult About()
        {

            return View();
        }


        public ActionResult MyInfo(){

            if(Session["id"] == null){
                return RedirectToAction("login","account");
            }
            else{
                var session=(int)Session["id"];
                var user = db.Users.ToList().Where(u=>u.Id == session);
                return View(user);
            }

        }

        [HttpPost]
        public ActionResult MyInfo(string username,int age,string quali,string address,string phone,string email,string pass)
        {
            var user = new User();

            user.Name = username;
            user.Age = age;
            user.Qualification = quali;
            user.Address = address;
            user.Phone = phone;
            user.Email = email;
            user.Password = pass;

           
            db.SaveChanges();

            return View("index");
        }

    }
}