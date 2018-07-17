using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using NationalLevelPaper.Models;


namespace NationalLevelPaper.Controllers
{
    public class EnrollementsController : Controller
    {
        // GET: Enrollement

        NatinaolLevelPaperEntities db = new NatinaolLevelPaperEntities();
        public ActionResult index()
        {
            //var multidata = new Multipledata();
            //multidata.user = db.Users.ToList();
            //multidata.events = db.Events.ToList();

            var enrollments = db.Enrollments.ToList();
            return View(enrollments);
        }

        
        public ActionResult Add()
        {
            return View();
        }

        public ActionResult Edit()
        {
            return View();
        }

        public ActionResult Delete ()
        {
            return View();
        }


    }
}