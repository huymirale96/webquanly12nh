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
    public partial class DanhSachPhieuKham : System.Web.UI.Page
    {
        ConnectDatabase conn = new ConnectDatabase();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ngay.Text = DateTime.Now.ToString("yyyy-MM-yy");
                layDanhSachPhieuKham(DateTime.Now.ToString("MM/dd/yyyy"));
            }

        }

        void layDanhSachPhieuKham(string ngay)
        {
            if (Session["quyen"].ToString().Equals("1"))
            {
                using (SqlConnection sqlConnection = conn.connectDatabase())
                {
                    SqlCommand sqlCommand = new SqlCommand("sp_layDSPhieuKhamTheoBacSi", sqlConnection);
                    sqlCommand.CommandType = CommandType.StoredProcedure;
                    sqlCommand.Parameters.AddWithValue("@ngay", ngay);
                    sqlCommand.Parameters.AddWithValue("@id", Session["maNguoiDung"]);
                    SqlDataAdapter sqlDataAdapter = new SqlDataAdapter(sqlCommand);
                    DataTable dataTable = new DataTable();
                    sqlDataAdapter.Fill(dataTable);
                    rptDanhSach.DataSource = dataTable;
                    rptDanhSach.DataBind();
                }
            }
            else
            {
                using (SqlConnection sqlConnection = conn.connectDatabase())
                {
                    SqlCommand sqlCommand = new SqlCommand("sp_layDSPhieuKham", sqlConnection);
                    sqlCommand.CommandType = CommandType.StoredProcedure;
                    sqlCommand.Parameters.AddWithValue("@ngay", ngay);
                    SqlDataAdapter sqlDataAdapter = new SqlDataAdapter(sqlCommand);
                    DataTable dataTable = new DataTable();
                    sqlDataAdapter.Fill(dataTable);
                    rptDanhSach.DataSource = dataTable;
                    rptDanhSach.DataBind();
                }
            }

        }
        
        protected void btnTim_Click(object sender, EventArgs e)
        {
            layDanhSachPhieuKham(ngay.Text);
            Debug.WriteLine("nhan dc ngay  " + ngay.Text);
        }
    }
}