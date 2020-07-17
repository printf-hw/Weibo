using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Liquid.Models
{
    public class ViewTable
    {
        public List<User>   Userss { get; set; }
        public List<Log> Logss { get; set; }
        public List<Like> Likess { get; set; }
        public List<Follow> Followss { get; set; }
        public List<Command> Commandss { get; set; }
        public List<Forward> Forwardss { get; set; }
    }
}