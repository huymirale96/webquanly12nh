using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;

namespace WebQuanLy12nh
{
    public class Global : System.Web.HttpApplication
    {

        protected void Application_Start(object sender, EventArgs e)
        {

        }

        protected void Session_Start(object sender, EventArgs e)
        {
            
            Session["login"] = false;
            Session["tenTK"] = "HUY";
            Session["maNguoiDung"] = "2";
            Session["maGV"] = "";
            Session["quyen"] = "3"; //1 bs  - 3 admin  out 4
            Session["type"] = "1";
            Session["mess"] = "1";
            Session["sessId"] = Session.SessionID;
            Session.Timeout = 100;
        }

        protected void Application_BeginRequest(object sender, EventArgs e)
        {

        }

        protected void Application_AuthenticateRequest(object sender, EventArgs e)
        {

        }

        protected void Application_Error(object sender, EventArgs e)
        {

        }

        protected void Session_End(object sender, EventArgs e)
        {

        }

        protected void Application_End(object sender, EventArgs e)
        {

        }
    }
}