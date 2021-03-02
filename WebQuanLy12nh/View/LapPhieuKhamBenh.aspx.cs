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
    public partial class LapPhieuKhamBenh : System.Web.UI.Page
    {
        ConnectDatabase conn = new ConnectDatabase();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                layDanhSachDichVu();
            }
        }

        void layDanhSachDichVu()
        {

            using (SqlConnection sqlConnection = conn.connectDatabase())
            {

                SqlDataAdapter sqlDataAdapter = new SqlDataAdapter("sp_danhSachDichVu", sqlConnection);
                DataTable dataTable = new DataTable();
                sqlDataAdapter.Fill(dataTable);
                listDV.DataSource = dataTable;
                listDV.DataTextField = "sTenDichVu";
                listDV.DataValueField = "iMaDichVu";
                listDV.DataBind();
                Debug.WriteLine("nhan dc  " + dataTable.Rows.Count);
            }
        }

        protected void btnHoanThanh_Click(object sender, EventArgs e)
        {

        }
    }
}