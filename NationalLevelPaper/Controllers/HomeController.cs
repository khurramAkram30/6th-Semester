using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using NationalLevelPaper.Models;
namespace NationalLevelPaper.Controllers
{
    public class HomeController : Controller
    {
        NatinaolLevelPaperEntities db = new NatinaolLevelPaperEntities();
        // GET: Home
        public ActionResult Index()
        {
            var events = db.Events.ToList();
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

    }
}