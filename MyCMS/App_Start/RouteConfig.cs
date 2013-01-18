using System;
using System.Collections.Generic;
using System.Web;
using System.Web.Routing;
using Microsoft.AspNet.FriendlyUrls;

namespace MyCMS
{
    public static class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            //routes.EnableFriendlyUrls();
            routes.Ignore("{resource}.axd/{*pathInfo}");
            routes.MapPageRoute(
                "AdminRoute",
                "login",
                "~/admin/login.aspx"
            );
            routes.MapPageRoute(
                "PageRoute",
                "{*pageSEO}",
                "~/Default.aspx"
            );
        }
    }
}
