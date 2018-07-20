using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using NationalLevelPaper.Models;
namespace NationalLevelPaper.Controllers
{
    public class EventsController : Controller
    {
        NatinaolLevelPaperEntities db=new NatinaolLevelPaperEntities();
        // GET: Event
        public ActionResult Index()
        {
            var events = db.Events.ToList();
            return View(events);
        }

        public ActionResult Add()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Add(Event e , HttpPostedFileBase image)
        {

            if (image != null)
            {
                var location = Server.MapPath("~/uploading");
                var filename = location + image.FileName;
                image.SaveAs(filename);
                ViewBag.file = image.FileName;
                e.Image=filename;

                e.Winner = null;
                
            db.Events.Add(e);
            
            db.SaveChanges();
            return RedirectToAction("Index", "Home");
        
            
            }

            else
            {
                //e.Winner = null;
                //db.Events.Add(e);

                //db.SaveChanges();
                return View();
          }

         }
        
        public ActionResult Edit(int Id)
        {
            var _events = db.Events.Find(Id);



            return View(_events);
              }
         [HttpPost]
        public ActionResult Edit(Event events)
        {
            var _events = db.Events.Find(events.Id);

            _events.Name = events.Name;
            _events.Date = events.Date;
            _events.Fees = events.Fees;
            _events.Eligibility = events.Eligibility;
            _events.Spearker= events.Spearker;
            _events.Topics= events.Topics;
            _events.Prize = events.Prize;
            _events.Email = events.Email;
            _events.TermsAndCondition = events.TermsAndCondition;
            _events.Winner = events.Winner;
             
            //db.Events.Add(events);

            db.SaveChanges();

            return View();
        }

        public ActionResult Delete(int Id)
        {

            var _event = db.Events.Find(Id);
            db.Events.Remove(_event);
            db.SaveChanges();
            return RedirectToAction("Index");
    
        }
        
        public ActionResult EventDetail(int id)
        {
            //var detail_id = db.Events.Find(id);
            Session["eventid"] = id;
            
            var eventList = db.Events.ToList().Where(m=>m.Id == id);

            return View(eventList);
        }

        [HttpPost]
        public ActionResult EventDetail(int userid, int eventids)
        {

            if (Session["id"] == null)
            {
                return RedirectToAction("login","Account");
            }

            else
            {
                Enrollment enroll = new Enrollment();

                enroll.EnrollmentStatusId = 1;
                enroll.UserId = (int)Session["id"];
                enroll.EventId = (int)Session["eventid"]; ;

                db.Enrollments.Add(enroll);
                db.SaveChanges();

                ViewBag.saveData = "u are enroll";
            }
            return RedirectToAction("index","Home");
        }


        public ActionResult EventPage()
        {
            var Eventpage = db.Events.ToList();

            return View(Eventpage);
        }


            public ActionResult myeventpage()
          {
            if (Session["id"] == null)
          {
            return RedirectToAction("login","account");
        }

        int session = (int)Session["id"];
         var myevent = db.Enrollments.ToList().Where(m=>m.UserId == session && m.EnrollmentStatusId == 1);
        return View(myevent);
        }
    
    }

}