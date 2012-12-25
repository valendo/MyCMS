using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Optimization;
using System.Web.Routing;
using System.Web.Security;
using MyCMS;
using System.Data.Entity;
using MyCMS.Model;

namespace MyCMS
{
    public class Global : HttpApplication
    {
        void Application_Start(object sender, EventArgs e)
        {
            // Code that runs on application startup
            BundleConfig.RegisterBundles(BundleTable.Bundles);
            AuthConfig.RegisterOpenAuth();

            Database.SetInitializer<MyCMSContext>(null);

            // Add Routes.
            
            RegisterRoutes(RouteTable.Routes);
        }

        void Application_End(object sender, EventArgs e)
        {
            //  Code that runs on application shutdown

        }

        void Application_Error(object sender, EventArgs e)
        {
            // Code that runs when an unhandled error occurs

        }

        void RegisterRoutes(RouteCollection routes)
        {
            routes.Ignore("{resource}.axd/{*pathInfo}");
            routes.MapPageRoute(
                "PageRoute",
                "{pageSEO}",
                "~/Default.aspx"
            );
            //routes.MapPageRoute(
            //    "ProductByNameRoute",
            //    "Product/{productName}",
            //    "~/ProductDetails.aspx"
            //);
        }
    }
}
