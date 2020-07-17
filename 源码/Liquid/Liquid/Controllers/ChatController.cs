using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Liquid.Models;
using System.Data;
using Newtonsoft.Json;


namespace Liquid.Controllers
{
    public class ChatController : Controller
    {
        // GET: Chat
        public ActionResult ChatIndex(int uid)
        {
            using (LiquidEntities db=new LiquidEntities())
            {
                User user = db.User.First(u=>u.UserID==uid);

                var query = db.User.Join(db.Messsage, u => u.UserID, m => m.UserID, (u, m) => new 
                {
                    UserID=u.UserID,
                    sendID = m.SendID,
                    MsgInfo = m.MessageInfo,
                    Time = m.MessgaeTime,

                }).Where(u=>u.UserID==uid).ToList();
                List<User> users = new List<User>();
                foreach (var item in query)
                {
                    User listitem = db.User.FirstOrDefault(u=>u.UserID==item.sendID);
                    if (users.Exists(u=>u==listitem))
                    {

                    }
                    else
                    {
                        users.Add(listitem);
                    }
                    
                }
                ViewBag.userlist = users;
                 return View(user);
            }

            
        }
        [HttpPost]
        public ActionResult Send(int uid,int sendid,string msgInfo,string msgtime) {
            using (LiquidEntities db=new LiquidEntities())
            {
                msgtime = Convert.ToDateTime(msgtime).ToString("yyyy-MM-dd hh:mm:ss");
                int res = db.Database.ExecuteSqlCommand("insert Messsage select UserID="+uid+",SendID="+sendid+",MessageInfo='"+msgInfo+"',MessgaeTime='"+msgtime+"'");
                return Content(res.ToString());
            }
            
        }
        
        [HttpPost]
        
        public JsonResult Show(int uid,int sendid) {
            using (LiquidEntities db=new LiquidEntities()) {
                //var msg = db.Messsage.Where(m => m.SendID == sendid).Where(m=>m.UserID==uid).ToList();
                //var tomemsg=db.Messsage.Where(m => m.SendID == uid).Where(m => m.UserID == sendid).ToList();
                //List<Messsage> list = new List<Messsage>();

                //list.AddRange(msg);

                //list.AddRange(tomemsg);
                //list.OrderBy(m => m.MessageID);
                List<Messsage> list = db.Database.SqlQuery<Messsage>("select * from Messsage where (UserID=" + uid + " or userid=" + sendid + ") and (sendid=" + uid + " or sendid=" + sendid + ") order by MessageID").ToList();
                string jsonstr = JsonConvert.SerializeObject(list);
                return Json(jsonstr);
            }
        }
    }
}