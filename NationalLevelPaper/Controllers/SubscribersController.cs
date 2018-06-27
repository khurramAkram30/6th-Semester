using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace NationalLevelPaper.Controllers
{
    public class SubscribersController : Controller
    {
        // GET: Subscribers
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult Add()
        {
            return View();
        }

        public ActionResult Delete()
        {
            return View();
        }


    }
}