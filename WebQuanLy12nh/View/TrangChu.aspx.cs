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
    public partial class TrangChu : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            load_LoaiBaiViet();
            load_danhSachBaiViet4BaiMoi();
            load_danhSachBaiVietXemNhieu();
        }


        ConnectDatabase conn = new ConnectDatabase();

        void load_LoaiBaiViet()
        {
            using (SqlConnection sqlConnection = conn.connectDatabase())
            {

                SqlDataAdapter sqlDataAdapter = new SqlDataAdapter("sp_danhSachLoaiBai", sqlConnection);
                DataTable dataTable = new DataTable();
                sqlDataAdapter.Fill(dataTable);
                rptLoaiBai.DataSource = dataTable;
                rptLoaiBai.DataBind();
            }
        }
        //sp_danhSachBaiVietTop4

        void load_danhSachBaiViet4BaiMoi()
        {
            using (SqlConnection sqlConnection = conn.connectDatabase())
            {
                SqlCommand cmd = new SqlCommand("sp_danhSach4BaiVietMoiNhat", sqlConnection);
                cmd.CommandType = CommandType.StoredProcedure;
                //  cmd.Parameters.AddWithValue("@id", id);

                SqlDataAdapter sqlDataAdapter = new SqlDataAdapter(cmd);

                DataTable dataTable = new DataTable();
                sqlDataAdapter.Fill(dataTable);
                rptBaiVuaDang.DataSource = dataTable;
                rptBaiVuaDang.DataBind();
            }
        }

        void load_danhSachBaiVietXemNhieu()
        {
            using (SqlConnection sqlConnection = conn.connectDatabase())
            {
                SqlCommand cmd = new SqlCommand("sp_danhSachBaiVietTop4", sqlConnection);
                cmd.CommandType = CommandType.StoredProcedure;
          
                SqlDataAdapter sqlDataAdapter = new SqlDataAdapter(cmd);

                DataTable dataTable = new DataTable();
                sqlDataAdapter.Fill(dataTable);
                rptDSBaiViet.DataSource = dataTable;
                rptDSBaiViet.DataBind();
            }
        }
    }
}