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
    public partial class XemBinhLuan : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
             //   load_LoaiBai();
                if (Request.QueryString["id"] != null)
                {
                    loadThongTinBai(Request.QueryString["id"].ToString());
                    layDanhSachBinhLuan(Request.QueryString["id"].ToString());
                }
            }
            
        }

        protected void btxXoa_Click(object sender, EventArgs e)
        {

        }

        protected void btxXoa_Click1(object sender, EventArgs e)
        {

        }

        protected void btxXoa_Click2(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;
            Debug.WriteLine("nhan dc " + btn.CommandArgument.ToString());

            try
            {
                using (SqlConnection sqlConnection = conn.connectDatabase())
                {
                    SqlCommand sqlCommand = new SqlCommand("sp_XoaBinhLuan", sqlConnection);
                    sqlCommand.CommandType = CommandType.StoredProcedure;
                    sqlCommand.Parameters.AddWithValue("@id", btn.CommandArgument.ToString());
                    sqlCommand.ExecuteNonQuery();
                    layDanhSachBinhLuan(maBai.Value);
                }
            }
            catch (Exception exx)
            {
                Debug.WriteLine("nhan dc loi  " + exx.Message);
            }
        }

        ConnectDatabase conn = new ConnectDatabase();
        private void layDanhSachBinhLuan(String id)
        {
            maBai.Value = id;
            using (SqlConnection sqlConnection = conn.connectDatabase())
            {
                SqlCommand sqlCommand = new SqlCommand("sp_xembinhluan", sqlConnection);
                sqlCommand.CommandType = CommandType.StoredProcedure;
                sqlCommand.Parameters.AddWithValue("@id", id);
                SqlDataAdapter sqlDataAdapter = new SqlDataAdapter(sqlCommand);
                DataTable dataTable = new DataTable();
                sqlDataAdapter.Fill(dataTable);
                rptDanhSach.DataSource = dataTable;
                rptDanhSach.DataBind();

                // lay so luong cmt
                soLuongcmt.Text = "Có: " + dataTable.Rows.Count.ToString() + " Bình Luận";
            }
        }

      

        void loadThongTinBai(String id)
        {
            using (SqlConnection sqlConnection = conn.connectDatabase())
            {

                SqlDataAdapter sqlDataAdapter = new SqlDataAdapter("select * from tblbaiviet where iMaBaiViet= " + id, sqlConnection);
                DataTable dataTable = new DataTable();
                sqlDataAdapter.Fill(dataTable);
              
                tieuDe.Text = dataTable.Rows[0]["stieude"].ToString();
               
                // Debug.WriteLine("nhan dc loi  " + tieuDe.Text + "  tieu de  " + dataTable.Rows[0]["stieude"].ToString());
            }
        }
    }
}