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
    public partial class ThemBaiViet : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                load_LoaiBai();
            }
        }

        ConnectDatabase conn = new ConnectDatabase();

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
                        fileAnh.SaveAs(Server.MapPath("../IMAGES/" + fileAnh.FileName));
                        using (SqlConnection sqlConnection = conn.connectDatabase())
                        {
                            SqlCommand sqlCommand = new SqlCommand("sp_themBaiViet", sqlConnection);
                            sqlCommand.CommandType = CommandType.StoredProcedure;
                            sqlCommand.Parameters.AddWithValue("@stieude", tieuDe.Text);
                            sqlCommand.Parameters.AddWithValue("@smota",mota.Text);
                            sqlCommand.Parameters.AddWithValue("@surlanh", fileAnh.FileName);
                            sqlCommand.Parameters.AddWithValue("@dngaydang", DateTime.Now);
                            sqlCommand.Parameters.AddWithValue("@imaloaibai", ddlLoaiBia.SelectedValue);
                            sqlCommand.Parameters.AddWithValue("@imanguoidang", Session["maNguoiDung"].ToString());
                            sqlCommand.Parameters.AddWithValue("@snoidung", txtNoidung.Text);
                            //sqlCommand.Parameters.AddWithValue("@id", btn.CommandArgument.ToString());
                            int i = sqlCommand.ExecuteNonQuery();
                            if(i > 0)
                            {
                                lblNoti.Text = "Tạo Bài Viết Thành Công.";
                            }

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