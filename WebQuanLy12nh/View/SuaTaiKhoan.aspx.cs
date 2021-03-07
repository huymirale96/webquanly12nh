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
    public partial class SuaTaiKhoan : System.Web.UI.Page
    {
       
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
             
                if (Request.QueryString["id"] != null && Request.QueryString["quyen"] != null)
                {
                    layThongTinTaiKhoan(Request.QueryString["id"].ToString()); 
                    maNguoiDung.Value = Request.QueryString["id"].ToString();
                    maQuyen.Value = Request.QueryString["quyen"].ToString();
                }
            }
        }

        ConnectDatabase conn = new ConnectDatabase();

        void layThongTinTaiKhoan(String id)
        {
            using (SqlConnection sqlConnection = conn.connectDatabase())
            {

                SqlDataAdapter sqlDataAdapter = new SqlDataAdapter("select * from tblnguoidung where iMaNguoiDung= " + id, sqlConnection);
                DataTable dataTable = new DataTable();
                sqlDataAdapter.Fill(dataTable);
                txtTen.Text = dataTable.Rows[0]["shoten"].ToString();
                sdtGV.Text = dataTable.Rows[0]["sSDT"].ToString();
                emailGV.Text = dataTable.Rows[0]["sEmail"].ToString();
                if(Int32.Parse(dataTable.Rows[0]["imaquyen"].ToString()) == 1)
                {
                    member.Checked = true;
                }
                else
                {
                    admin.Checked = true;
                }

                if (String.Compare(dataTable.Rows[0]["bGioiTinh"].ToString(), "True") == 0)
                {
                    nam.Checked = true;
                }
                else
                {
                    nu.Checked = true;
                }
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            try
            {
                using (SqlConnection sqlConnection = conn.connectDatabase())
                {
                    SqlCommand sqlCommand = new SqlCommand("sp_capnhattk", sqlConnection);
                    sqlCommand.CommandType = CommandType.StoredProcedure;
                    sqlCommand.Parameters.AddWithValue("@id", maNguoiDung.Value);
                    
                    sqlCommand.Parameters.AddWithValue("@ten", txtTen.Text);
                    sqlCommand.Parameters.AddWithValue("@dt", sdtGV.Text);
                    sqlCommand.Parameters.AddWithValue("@mail", emailGV.Text);
                    sqlCommand.Parameters.AddWithValue("@chuyenKhoa", "1");
                    if (nam.Checked == true)
                    {
                        sqlCommand.Parameters.AddWithValue("@gt", "1");
                    }
                    else
                    {
                        sqlCommand.Parameters.AddWithValue("@gt", "0");
                    }

                   

                    if (maQuyen.Value.Equals("1"))
                    {
                        sqlCommand.Parameters.AddWithValue("@maquyen", "1");
                    }
                    else
                    {
                        if (member.Checked == true)
                        {
                            sqlCommand.Parameters.AddWithValue("@maquyen", "2");
                        }
                        else
                        {
                            sqlCommand.Parameters.AddWithValue("@maquyen", "3");
                        }
                    }
                    
    
                    int i = sqlCommand.ExecuteNonQuery();
                    Debug.WriteLine(maNguoiDung.Value + "ii  " + i);
                    if (i > 0)
                    {
                        Response.Redirect("danhsachtaikhoan.aspx");
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