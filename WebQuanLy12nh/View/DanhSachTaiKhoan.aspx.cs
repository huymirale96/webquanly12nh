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
    public partial class DanhSachTaiKhoan : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            load_danhSAchBai();
        }

        ConnectDatabase conn = new ConnectDatabase();



        private void load_danhSAchBai()
        {
            try
            {
                using (SqlConnection sqlConnection = conn.connectDatabase())
                {

                    SqlDataAdapter sqlDataAdapter = new SqlDataAdapter("select * from tblnguoidung", sqlConnection);
                    DataTable dataTable = new DataTable();
                    //Debug.WriteLine("data: so cot "+ da);
                    sqlDataAdapter.Fill(dataTable);

                    rptDanhSach.DataSource = dataTable;
                    rptDanhSach.DataBind();
                   // return dataTable;
                }
            }
            catch (Exception exx)
            {
                Debug.WriteLine("nhan dc loi  " + exx.Message);
            }
        }
    }
}