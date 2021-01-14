using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebLamDep.Model;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics;


namespace WebLamDep.View
{
    public partial class BaoCaoSoBaiCuaMoiNguoi : System.Web.UI.Page
    {
        ConnectDatabase conn = new ConnectDatabase();
        protected void Page_Load(object sender, EventArgs e)
        {
            using (SqlConnection sqlConnection = conn.connectDatabase())
            {

                SqlDataAdapter sqlDataAdapter = new SqlDataAdapter("sp_baoCaoSoLuongBai", sqlConnection);
                DataTable dataTable = new DataTable();
                sqlDataAdapter.Fill(dataTable);
                rptBaoCao.DataSource = dataTable;
                rptBaoCao.DataBind();
            }
        }
    }
}