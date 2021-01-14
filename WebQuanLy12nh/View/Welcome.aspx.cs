using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebLamDep.View
{
    public partial class Welcome : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Request.QueryString["cn"] != null)
            {
                if(String.Compare(Request.QueryString["cn"].ToString(),"dangxuat") == 0)
                {
                    Session["quyen"] = "0";
                    Response.Redirect("Login.aspx");
                }
            }
        }
    }
}