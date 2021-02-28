using System;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Security.Cryptography;
using WebQuanLy12nh.Model;

namespace WebQuanLy12nh.View
{
    public partial class ThemTaiKhoan : System.Web.UI.Page
    {
        int maBacSi;
        protected void Page_Load(object sender, EventArgs e)
        {
            nam.Checked = true;
            admin.Checked = true;
            if (!IsPostBack)
            {
                loadListChuyenKhoa();
            }
        }

        ConnectDatabase conn = new ConnectDatabase();

        protected void btnSave_Click(object sender, EventArgs e)
        {
            try
            {
                using (SqlConnection sqlConnection = conn.connectDatabase())
                {
                    SqlCommand sqlCommand = new SqlCommand("sp_themtk", sqlConnection);
                    sqlCommand.CommandType = CommandType.StoredProcedure;
                    sqlCommand.Parameters.AddWithValue("@user", txtTenDangNhap.Text );
                    sqlCommand.Parameters.AddWithValue("@pass", GetMD5(txtMK.Text));
                    sqlCommand.Parameters.AddWithValue("@ten", txtTen.Text);
                    sqlCommand.Parameters.AddWithValue("@dt", sdt.Text);
                    sqlCommand.Parameters.AddWithValue("@mail", email.Text);
                    if (bacSi.Checked == true)
                    {
                        sqlCommand.Parameters.AddWithValue("@chuyenKhoa", chuyenKhoa.SelectedValue);
                    }
                    else
                    {
                        sqlCommand.Parameters.AddWithValue("@chuyenKhoa", "1");
                    }
                    
                   if (nam.Checked == true)
                    {
                        sqlCommand.Parameters.AddWithValue("@gt", "1");
                    }
                   else
                    {
                        sqlCommand.Parameters.AddWithValue("@gt", "0");
                    }

                    if (member.Checked == true)
                    {
                        sqlCommand.Parameters.AddWithValue("@maquyen", "2");
                    }
                    else
                    {

                        if (admin.Checked == true)
                        {
                            sqlCommand.Parameters.AddWithValue("@maquyen", "3");
                        }
                        else
                        {
                            sqlCommand.Parameters.AddWithValue("@maquyen", "1");
                        }
                    }

                    int i = sqlCommand.ExecuteNonQuery();
                    Debug.WriteLine("ChuyenKhoa:  " + chuyenKhoa.SelectedValue);
                    if (i > 0)
                    {
                        lblDaDuyet.Text = "Tạo Tài Khoản Thành Công";
                   //     lblDaDuyet.CssClass = "text-success";
                    }
                }
            }
            catch (Exception exx)
            {
                Debug.WriteLine("nhan dc loi  " + exx.Message);
            }
        }

        public void loadListChuyenKhoa()
        {
            using (SqlConnection sqlConnection = conn.connectDatabase())
            {

                SqlDataAdapter sqlDataAdapter = new SqlDataAdapter("sp_layDSChuyenKhoa", sqlConnection);
                DataTable dataTable = new DataTable();
                sqlDataAdapter.Fill(dataTable);
                chuyenKhoa.DataSource = dataTable;
                chuyenKhoa.DataValueField = "imachuyenkhoa";
                chuyenKhoa.DataTextField = "stenchuyenkhoa";
                chuyenKhoa.DataBind();
            }
        }

        public string GetMD5(string chuoi)
        {
            string str_md5 = "";
            byte[] mang = System.Text.Encoding.UTF8.GetBytes(chuoi);

            MD5CryptoServiceProvider my_md5 = new MD5CryptoServiceProvider();
            mang = my_md5.ComputeHash(mang);

            foreach (byte b in mang)
            {
                str_md5 += b.ToString("X2");
            }

            return str_md5;
        }
    }
}