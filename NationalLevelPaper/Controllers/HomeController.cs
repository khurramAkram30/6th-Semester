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
            sub.Email = email;
            db.Subcribers.Add(sub);
            db.SaveChanges();
            return RedirectToAction("Index");

        }

       
        public ActionResult Contact()
        {
            return View();
        }

        public ActionResult About()
        {

            return View();
        }

    }
}