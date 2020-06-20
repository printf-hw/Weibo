using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Liquid.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Mainpage()
        {
            return View();
        }
    }
}