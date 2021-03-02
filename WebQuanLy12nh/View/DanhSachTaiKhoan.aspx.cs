using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebQuanLy12nh.Model;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics;


namespace WebQuanLy12nh.View
{
    public partial class DanhSachTaiKhoan : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            load_danhSAchQuanTri();
            load_danhSachBS();
        }

        ConnectDatabase conn = new ConnectDatabase();



        private void load_danhSAchQuanTri()
        {
            try
            {
                using (SqlConnection sqlConnection = conn.connectDatabase())
                {

                    SqlDataAdapter sqlDataAdapter = new SqlDataAdapter("select * from tblnguoidung where imaquyen != 1", sqlConnection);
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

        private void load_danhSachBS()
        {
            try
            {
                using (SqlConnection sqlConnection = conn.connectDatabase())
                {

                    SqlDataAdapter sqlDataAdapter = new SqlDataAdapter("sp_dsBacSi", sqlConnection);
                    DataTable dataTable = new DataTable();
                 
                    sqlDataAdapter.Fill(dataTable);

                    rptDanhSachBS.DataSource = dataTable;
                    rptDanhSachBS.DataBind();
                  
                }
            }
            catch (Exception exx)
            {
                Debug.WriteLine("nhan dc loi  " + exx.Message);
            }
        }
    }
}