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

            // Add Admin role.
            if (!Roles.RoleExists("Admin"))
            {
                Roles.CreateRole("Admin");
            }
            if (Membership.GetUser("admin") == null)
            {
                Membership.CreateUser("admin", "P@ssword1", "vothanhtai86@gmail.com");
                Roles.AddUserToRole("admin", "Admin");
            }

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
                "AboutRoute",
                "About",
                "~/About.aspx"
            );
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
