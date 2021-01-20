using WebQuanLy12nh.Model;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Security.Cryptography;

namespace WebLamDep.View
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["login"] = false;
            if (String.Compare(Session["quyen"].ToString(), "0") == 0)
            {
                Response.Redirect("welcome.aspx");
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            ConnectDatabase conn = new ConnectDatabase();
           // Response.Redirect("Welcome.aspx");
            string tai_khoan = txtTaiKhoan.Text;
            string mat_khau = txtMatKhau.Text;

            using (SqlConnection myCnn = conn.connectDatabase())
            {
                SqlCommand cmd = new SqlCommand("get_thongtintaikhoan", myCnn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Taikhoan", tai_khoan);
                cmd.Parameters.AddWithValue("@MatKhau", GetMD5(mat_khau));
                SqlDataReader rd = cmd.ExecuteReader();
                if (rd.HasRows)
                {
                    while (rd.Read())
                    {
                        if (rd["susername"].Equals(tai_khoan) && rd["spass"].Equals(GetMD5((mat_khau))) )
                        {
                            Session["login"] = true;
                            Session["tenTK"] = rd["shoten"];
                            Session["maNguoiDung"] = rd["iMaNguoiDung"];
                     
                            Session["quyen"] = rd["iMaQuyen"];
                            Debug.WriteLine("Quyen: " + rd["iMaQuyen"] + " tk: " +  rd["shoten"]);
                            Response.Redirect("Welcome.aspx");
                           
                        }
                        else
                        {
                            lblNoti.Text = "Sai tên tài khoản hoặc mật khẩu!";
                        }
                    }
                }
                else
                {
                    lblNoti.Text = "Sai tên tài khoản hoặc mật khẩu!";
                }
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