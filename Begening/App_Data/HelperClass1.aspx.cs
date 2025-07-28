using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;

namespace HelperClass1
{
    public static class Helper
    {
        public static string ConnectionString()
        {
            return ConfigurationManager.ConnectionStrings["MyDB"].ConnectionString;

        }

        public static void AvoidCacheRepeatation(HttpResponse Response)
        {
            Response.Cache.SetExpires(DateTime.UtcNow.AddMinutes(-1));
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.Cache.SetNoStore();
            Response.Cache.SetValidUntilExpires(false);
            Response.Cache.SetRevalidation(HttpCacheRevalidation.AllCaches);
            Response.CacheControl = "no-cache";
        }
    }
}