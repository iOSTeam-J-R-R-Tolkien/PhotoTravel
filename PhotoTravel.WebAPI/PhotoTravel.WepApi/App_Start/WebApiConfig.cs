using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Http;

namespace PhotoTravel.WepApi
{
    public static class WebApiConfig
    {
        public static void Register(HttpConfiguration config)
        {
            // Web API configuration and services
            config.Routes.MapHttpRoute(
               name: "UserApi",
               routeTemplate: "api/users/{action}/{id}",
               defaults: new
               {
                   controller = "users",
                   id = RouteParameter.Optional
               }
            );
            // Web API routes
            config.MapHttpAttributeRoutes();

            config.Routes.MapHttpRoute(
                name: "DefaultApi",
                routeTemplate: "api/{controller}/{id}",
                defaults: new { id = RouteParameter.Optional }
            );
        }
    }
}
