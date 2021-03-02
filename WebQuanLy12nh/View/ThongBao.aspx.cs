using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebQuanLy12nh.View
{
    public partial class ThongBao : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["noti"] != null)
            {
                thongBao.InnerText = Request.QueryString["noti"];
            }
        }
    }
}