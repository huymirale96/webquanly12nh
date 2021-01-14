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
    public partial class XemBaiViet : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            load_danhSachBaiViet4BaiMoi();
            if (Request.QueryString["id"] != null)
            {
                xemBaiViet(Request.QueryString["id"].ToString());
                load_danhSachbaiCungLoai(Request.QueryString["id"].ToString());
                load_binhLuan(Request.QueryString["id"].ToString());
            }
            load_LoaiBaiViet();
        }


        ConnectDatabase conn = new ConnectDatabase();

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

        void load_danhSachbaiCungLoai(String id)
        {
            using (SqlConnection sqlConnection = conn.connectDatabase())
            {
                SqlCommand cmd = new SqlCommand("sp_xemBaiVietCungLoai", sqlConnection);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@id", id);

                SqlDataAdapter sqlDataAdapter = new SqlDataAdapter(cmd);

                DataTable dataTable = new DataTable();
                sqlDataAdapter.Fill(dataTable);
                baiVietCungLoai.DataSource = dataTable;
                baiVietCungLoai.DataBind();
            }
        }

        void xemBaiViet(String id)
        {
            maBai.Value = id;
            using (SqlConnection sqlConnection = conn.connectDatabase())
            {
                SqlCommand cmd = new SqlCommand("sp_xemBaiVietID", sqlConnection);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@id", id);

                SqlDataAdapter sqlDataAdapter = new SqlDataAdapter(cmd);

                DataTable dataTable = new DataTable();
                sqlDataAdapter.Fill(dataTable);
                stieude.InnerHtml =  dataTable.Rows[0]["sTieuDe"].ToString();
                smota.InnerHtml = dataTable.Rows[0]["sMota"].ToString();
                sNoiDung.InnerHtml = dataTable.Rows[0]["sNoiDung"].ToString();
                stenloaibai.InnerHtml = dataTable.Rows[0]["sTenLoaiBai"].ToString();
                tennguoidang.InnerHtml = dataTable.Rows[0]["sHoTen"].ToString();
                thoigian.InnerHtml = dataTable.Rows[0]["dngaydang"].ToString();
            }
        }

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

        void load_binhLuan(string id)
        {
            using (SqlConnection sqlConnection = conn.connectDatabase())
            {
                SqlCommand cmd = new SqlCommand("sp_xembinhluan", sqlConnection);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@id", id);

                SqlDataAdapter sqlDataAdapter = new SqlDataAdapter(cmd);
                DataTable dataTable = new DataTable();
                sqlDataAdapter.Fill(dataTable);
               rptBinhLuan.DataSource = dataTable;
                rptBinhLuan.DataBind();
            }
        }

        protected void btnBL_Click(object sender, EventArgs e)
        {
            using (SqlConnection sqlConnection = conn.connectDatabase())
            {
                SqlCommand sqlCommand = new SqlCommand("sp_themBinhLuan", sqlConnection);
                sqlCommand.CommandType = CommandType.StoredProcedure;
                sqlCommand.Parameters.AddWithValue("@hoten", txtHoTen.Text);
                sqlCommand.Parameters.AddWithValue("@email", txtEmail.Text);
                sqlCommand.Parameters.AddWithValue("@noidung", txtBinhLuan.Text);
                sqlCommand.Parameters.AddWithValue("@thoigian", DateTime.Now);
                sqlCommand.Parameters.AddWithValue("@mabaiviet", maBai.Value);

                //sqlCommand.Parameters.AddWithValue("@id", btn.CommandArgument.ToString());
                int i = sqlCommand.ExecuteNonQuery();
                if (i > 0)
                {
                    Response.Redirect(Request.UrlReferrer.ToString());
                }

            }
        }
    }
}