using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Http;
using System.Web.Routing;
using PhotoTravel.Data;
using PhotoTravel.Data.Migrations;

namespace PhotoTravel.WepApi
{
    public class WebApiApplication : System.Web.HttpApplication
    {
        protected void Application_Start()
        {
            //Database.SetInitializer(new MigrateDatabaseToLatestVersion<DataContext, Configuration>());
            GlobalConfiguration.Configure(WebApiConfig.Register);
            
            Database.SetInitializer(new DropCreateDatabaseIfModelChanges<DataContext>());
        }
    }
}
