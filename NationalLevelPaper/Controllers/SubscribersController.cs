using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using NationalLevelPaper.Models;
namespace NationalLevelPaper.Controllers
{
    public class SubscribersController : Controller
    {
        NatinaolLevelPaperEntities db = new NatinaolLevelPaperEntities();

        // GET: Subscribers
        public ActionResult Index()
        {
            var subscriber = db.Subcribers.ToList();
            return View(subscriber);

            
        }
    

        public ActionResult Delete()
        {
            return View();
        }


    }
}