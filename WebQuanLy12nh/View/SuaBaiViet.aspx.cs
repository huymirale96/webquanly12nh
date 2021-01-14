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
    public partial class SuaBaiViet : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                load_LoaiBai();
                if(Request.QueryString["id"] != null)
                {
                    loadThongTinBai(Request.QueryString["id"].ToString());
                }
            }
        }

        ConnectDatabase conn = new ConnectDatabase();

        void loadThongTinBai(String id)
        {
            using (SqlConnection sqlConnection = conn.connectDatabase())
            {

                SqlDataAdapter sqlDataAdapter = new SqlDataAdapter("select * from tblbaiviet where iMaBaiViet= " + id, sqlConnection);
                DataTable dataTable = new DataTable();
                sqlDataAdapter.Fill(dataTable);
                txtNoidung.Text = dataTable.Rows[0]["snoidung"].ToString();
                mota.Text = dataTable.Rows[0]["smota"].ToString();
                tieuDe.Text = dataTable.Rows[0]["stieude"].ToString();
                maBai.Value = dataTable.Rows[0]["iMaBaiViet"].ToString();
                ddlLoaiBia.SelectedValue =  dataTable.Rows[0]["iMaLoaiBai"].ToString();

               // Debug.WriteLine("nhan dc loi  " + tieuDe.Text + "  tieu de  " + dataTable.Rows[0]["stieude"].ToString());
            }
        }

        void load_LoaiBai()
        {
            using (SqlConnection sqlConnection = conn.connectDatabase())
            {

                SqlDataAdapter sqlDataAdapter = new SqlDataAdapter("select * from tblLoaiBai", sqlConnection);
                DataTable dataTable = new DataTable();
                sqlDataAdapter.Fill(dataTable);
                ddlLoaiBia.DataSource = dataTable;
                ddlLoaiBia.DataValueField = "iMaLoaiBai";
                ddlLoaiBia.DataTextField = "sTenLoaiBai";
                ddlLoaiBia.DataBind();
            }
           // ddlLoaiBia
        }

        protected void btnHoanThanh_Click(object sender, EventArgs e)
        {
            try
            {
                if (fileAnh.FileContent.Length > 0)
                {
                    if (fileAnh.FileName.EndsWith(".jpeg") || fileAnh.FileName.EndsWith(".jpg") || fileAnh.FileName.EndsWith(".png"))
                    {
                        Debug.WriteLine("dataa:1 " + fileAnh.FileName + "  " + tieuDe.Text + mota.Text + "  " + txtNoidung.Text);
                        fileAnh.SaveAs(Server.MapPath("../IMAGES/" + fileAnh.FileName));
                        Debug.WriteLine("dataa: " + fileAnh.FileName + "  " + tieuDe.Text + "  " + mota.Text + "  " + txtNoidung.Text);
                        using (SqlConnection sqlConnection = conn.connectDatabase())
                        {
                            SqlCommand sqlCommand = new SqlCommand("update_BaiViet", sqlConnection);
                            sqlCommand.CommandType = CommandType.StoredProcedure;
                            sqlCommand.Parameters.AddWithValue("@stieude", tieuDe.Text);
                            sqlCommand.Parameters.AddWithValue("@smota",mota.Text);
                            sqlCommand.Parameters.AddWithValue("@surlanh", fileAnh.FileName);
                            sqlCommand.Parameters.AddWithValue("@maBai", maBai.Value);
                            //sqlCommand.Parameters.AddWithValue("@dngaydang", DateTime.Now);
                            sqlCommand.Parameters.AddWithValue("@imaloaibai", ddlLoaiBia.SelectedValue);
                        //    sqlCommand.Parameters.AddWithValue("@imanguoidang", Session["maNguoiDung"].ToString());
                            sqlCommand.Parameters.AddWithValue("@snoidung", txtNoidung.Text);
                            //sqlCommand.Parameters.AddWithValue("@id", btn.CommandArgument.ToString());
                            int i = sqlCommand.ExecuteNonQuery();
                            if(i > 0)
                            {
                                lblNoti.Text = "Sửa Bài Viết Thành Công.";
                            }

                        }
                    }
                }
                else
                {
                  
                        using (SqlConnection sqlConnection = conn.connectDatabase())
                        {
                            SqlCommand sqlCommand = new SqlCommand("update_BaiViet_khongAnh", sqlConnection);
                            sqlCommand.CommandType = CommandType.StoredProcedure;
                            sqlCommand.Parameters.AddWithValue("@stieude", tieuDe.Text);
                            sqlCommand.Parameters.AddWithValue("@smota", mota.Text);
                            sqlCommand.Parameters.AddWithValue("@maBai", maBai.Value);
                            //sqlCommand.Parameters.AddWithValue("@dngaydang", DateTime.Now);
                            sqlCommand.Parameters.AddWithValue("@imaloaibai", ddlLoaiBia.SelectedValue);
                            //    sqlCommand.Parameters.AddWithValue("@imanguoidang", Session["maNguoiDung"].ToString());
                            sqlCommand.Parameters.AddWithValue("@snoidung", txtNoidung.Text);
                            //sqlCommand.Parameters.AddWithValue("@id", btn.CommandArgument.ToString());
                            int i = sqlCommand.ExecuteNonQuery();
                            if (i > 0)
                            {
                                lblNoti.Text = "Sửa Bài Viết Thành Công.";
                            }

                        }
                    
                }
            }
            catch (Exception exx)
            {
                Debug.WriteLine("nhan dc loi  " + exx.Message);
            }
        }
    }
}