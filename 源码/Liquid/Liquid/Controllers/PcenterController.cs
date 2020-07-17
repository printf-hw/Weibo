using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Liquid.Models;
using System.ComponentModel.DataAnnotations;
using System.Data.SqlClient;

namespace Liquid.Controllers
{
    public class PcenterController : Controller
    {
        LiquidEntities db = new LiquidEntities();
        int id = 2;
        int visiter = 2;
        // GET: Pcenter

        

        public ActionResult Index()
        {
            List<User> lu = db.User.Where(a => a.UserID == id).ToList();
            List<Log> lg = db.Log.Where(a => a.UserID == id).ToList();
            List<Like> lk =db.Like.Where(a => a.UserID == id).ToList();
            List<Follow> lf = db.Follow.Where(a => a.UserID == id).ToList();
            List<Forward> lw = db.Forward .Where(a => a.UserID == id).ToList();
            List<Command> lc = db.Command.Where(a => a.UserID == id).ToList();
            var ViewTable = new ViewTable()
            {
                Userss = lu,
                Logss = lg,
                Likess =lk,
                Followss = lf,
                Forwardss = lw,
                Commandss = lc
            };
            //SqlParameter[] paras = new SqlParameter[] {
                     //new SqlParameter("@UserID",id),
                    //};
            //var gz =db.Database.SqlQuery<string>("select count(*) from Follow where UserID="+id);
            string sql = string.Format("select count(*) from Follow where UserID ={0}", id);
            int result = (int)db.Database.ExecuteSqlCommand(sql);
            int gz = db.Follow.Where(a => a.UserID == id).Count();
            int fs = db.Follow.Where(a => a.FollowUID == id).Count();
            int wb = db.Log.Where(a => a.UserID == id).Count();
            ViewBag.GZ = gz;
            ViewBag.FS = fs;
            ViewBag.WB = wb;
            
            return View(ViewTable);
        }
    }
}