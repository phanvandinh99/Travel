using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace WebTravelMVC
{
    public class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");
            routes.MapRoute(
            name: "Default",
            url: "{controller}/{action}/{id}",
            defaults: new { Controller = "Home", action = "Index", id = UrlParameter.Optional },
            namespaces: new[] { "WebTravelMVC.Areas.Common.Controllers" }
        ).DataTokens.Add("Area", "Common");
        }
    }
}
