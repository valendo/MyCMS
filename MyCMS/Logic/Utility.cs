using MyCMS.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MyCMS
{
    static class Utility
    {
        public static string GetSettingByKey(string key)
        {
            MyCMSContext db = new MyCMSContext();
            return db.Settings.Find(key).Value;
        }
        
    }
}