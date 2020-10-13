using Chalkboard.Business;
using Chalkboard.Mapper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Chalkboard.Console
{
    class Program
    {
        static void Main(string[] args)
        {
            MapperSetup.Setup();
            ActivityLounge activityLounge = new ActivityLounge();
            var groups = activityLounge.GetAllGroups(4);
            //foreach (var item in groups)
            //{
            //    System.Console.WriteLine(item.Activities.Count);
            //    if(item.Activities.Count > 0)
            //    {
            //        var activity = item.Activities.First();
            //        System.Console.WriteLine(activity.ActivityName);
            //    }
            //}
        }
    }
}
