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
    public partial class PhieuKham : System.Web.UI.Page
    {
        ConnectDatabase conn = new ConnectDatabase();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["id"] != null)
                {
                    layThongTinPhieuKham(Request.QueryString["id"]);
                    layDanhSachDichVu(Request.QueryString["id"]);
                }
            }

        }

        void layThongTinPhieuKham(string id)
        {
            using (SqlConnection sqlConnection = conn.connectDatabase())
            {
                SqlCommand sqlCommand = new SqlCommand("sp_layTTphieuKham", sqlConnection);
                sqlCommand.CommandType = CommandType.StoredProcedure;
                sqlCommand.Parameters.AddWithValue("@id", id);
                SqlDataAdapter sqlDataAdapter = new SqlDataAdapter(sqlCommand);
                DataTable dataTable = new DataTable();
                sqlDataAdapter.Fill(dataTable);
                txtTen.Text = "Họ Tên: " + dataTable.Rows[0]["stenbenhnhan"].ToString();
                txtNS.Text = "Ngày Sinh: " + DateTime.Parse(dataTable.Rows[0]["dngaysinh"].ToString()).ToString("dd/MM/yyyy");
                txtBaoHiem.Text = "Mã Bảo Hiểm: " + dataTable.Rows[0]["sMBH"].ToString();
                txtDiaCHi.Text = "Địa CHỉ: " + dataTable.Rows[0]["sdiachi"].ToString();
                txtSoDienThoai.Text = "SĐT: " + dataTable.Rows[0]["sSDT"].ToString();
                txtTieuSu.Text =  dataTable.Rows[0]["sTieuSuBenh"].ToString();
                txtCanLamSang.Text =  dataTable.Rows[0]["sCanLamSang"].ToString();
                txtChuanDoan.Text = dataTable.Rows[0]["sChuanDoan"].ToString();
                txtDieuTri.Text =  dataTable.Rows[0]["sHuongDieuTri"].ToString();
                txtBacSi.Text = "Bác Sĩ Khám: " + dataTable.Rows[0]["shoten"].ToString();
                txtThoiian.Text = "Thời Gian Khám: " + DateTime.Parse(dataTable.Rows[0]["dThoiGianTao"].ToString()).ToString("hh:mm dd/MM/yyyy");
                Debug.WriteLine("sHuongDieuTri" + dataTable.Rows[0]["sHuongDieuTri"].ToString());
                // Debug.WriteLine("nhan dc loi  " + tieuDe.Text + "  tieu de  " + dataTable.Rows[0]["stieude"].ToString());
            }
        }

         void layDanhSachDichVu(string id)
        {

            using (SqlConnection sqlConnection = conn.connectDatabase())
            {
                SqlCommand sqlCommand = new SqlCommand("sp_layDVyteCuaPhieuKham", sqlConnection);
                sqlCommand.CommandType = CommandType.StoredProcedure;
                sqlCommand.Parameters.AddWithValue("@id", id);
                SqlDataAdapter sqlDataAdapter = new SqlDataAdapter(sqlCommand);
                DataTable dataTable = new DataTable();
                sqlDataAdapter.Fill(dataTable);
                rptDanhSach.DataSource = dataTable;
                rptDanhSach.DataBind();
                int tongTien = 0;
                foreach (DataRow dr in dataTable.Rows)
                {
                    tongTien += Int32.Parse(dr["iTongTien"].ToString());

                }
                tongCong.InnerText = tongTien.ToString("N0");
                Debug.WriteLine("table" + dataTable.Rows.Count);
            }
        }
    }
}