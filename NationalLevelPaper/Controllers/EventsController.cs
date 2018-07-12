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
        public ActionResult Add(Event e)
        { 
        //    //for string change to dateTime format
        //    //string dateInput = date;
        //    //DateTime parsedDate = DateTime.Parse(dateInput);

        //    //string to decimal
        //    //string Fees = fees;
        //    //decimal decFees = decimal.Parse(Fees);

        //   // string to decimal
        //    string Prize = prize;
        //    decimal decPrize = decimal.Parse(Prize);

        //    //string to int
        //string e = winner;
        //int f = Convert.ToInt16(e);
            
        //    //for inserting:
        //    var events=new Event();

        //    events.Name=name;
        //    events.Image=image;
        //    events.Date = date;
        //    events.Fees =fees;
        //    events.Eligibility = eligibility;
        //    events.Spearker = speaker;
        //    events.Topics = topic;
        //    events.Prize=prize;
        //    events.Email=email;
        //    events.TermsAndCondition = "yes";
        //    events.Winner = f;

            db.Events.Add(e);

            db.SaveChanges();


            return RedirectToAction("Index","Home");
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



            db.Events.Add(events);

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

            var eventList = db.Events.ToList().Where(m=>m.Id == id);

            return View(eventList);
        }

        //[HttpPost]
        //public ActionResult EventDetail(Event events)
        //{
        //    var detail_id = db.Events.Find(events.Id);

            
        //    return View();
        //}
    
    
    
    
    
    }

}