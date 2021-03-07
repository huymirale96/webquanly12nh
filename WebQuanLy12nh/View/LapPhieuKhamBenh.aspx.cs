using System;
using System.Collections.Generic;
using WebQuanLy12nh.Model;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Web.Script.Serialization;
using System.Web.UI.WebControls;

namespace WebQuanLy12nh.View
{
    public partial class LapPhieuKhamBenh : System.Web.UI.Page
    {
        ConnectDatabase conn = new ConnectDatabase();
        List<DvuYTe> dsDV = new List<DvuYTe>();
        protected void Page_Load(object sender, EventArgs e)
        {
            dsDV = (List<DvuYTe>)Session["danhSachDichVu"];
            if (!IsPostBack)
            {
                layDanhSachDichVu();
                TxtSoLuong.Text = "1";
                if (Request.QueryString["id"] != null)
                {
                    maLichHen.Value = Request.QueryString["id"];
                    layThongTinBenhNhan(Request.QueryString["id"]);
                    Session["danhSachDichVu"] = new List<DvuYTe>(); 
                }
            }
        }
        
                void layThongTinBenhNhan(string id)
            {
                using (SqlConnection sqlConnection = conn.connectDatabase())
                {
                    SqlCommand sqlCommand = new SqlCommand("sp_layTTbenhNhan", sqlConnection);
                    sqlCommand.CommandType = CommandType.StoredProcedure;
                    sqlCommand.Parameters.AddWithValue("@id", id);
                    SqlDataAdapter sqlDataAdapter = new SqlDataAdapter(sqlCommand);
                    DataTable dataTable = new DataTable();
                    sqlDataAdapter.Fill(dataTable);
                    txtTen.Text = "Họ Tên: "  + dataTable.Rows[0]["stenbenhnhan"].ToString();
                    txtNS.Text = "Ngày Sinh: " + DateTime.Parse(dataTable.Rows[0]["dngaysinh"].ToString()).ToString("dd/MM/yyyy");
                    txtBaoHiem.Text = "Mã Bảo Hiểm: " + dataTable.Rows[0]["sMBH"].ToString();
                    txtDiaCHi.Text = "Địa CHỉ: " + dataTable.Rows[0]["sdiachi"].ToString();
                    txtSoDienThoai.Text = "SĐT: " + dataTable.Rows[0]["sSDT"].ToString();

                    // Debug.WriteLine("nhan dc loi  " + tieuDe.Text + "  tieu de  " + dataTable.Rows[0]["stieude"].ToString());
                }
            }

        void layDanhSachDichVu()
        {

            using (SqlConnection sqlConnection = conn.connectDatabase())
            {

                SqlDataAdapter sqlDataAdapter = new SqlDataAdapter("sp_danhSachDichVu", sqlConnection);
                DataTable dataTable = new DataTable();
                sqlDataAdapter.Fill(dataTable);
                ddlListDV.DataSource = dataTable;
                ddlListDV.DataTextField = "sTenDichVu";
                ddlListDV.DataValueField = "iMaDichVu";
                ddlListDV.DataBind();
                
            }
        }

        protected void btnHoanThanh_Click(object sender, EventArgs e)
        {
            try
            {

                using (SqlConnection sqlConnection = conn.connectDatabase())
                {
                    SqlCommand sqlCommand = new SqlCommand("sp_themPhieuKham", sqlConnection);
                    sqlCommand.CommandType = CommandType.StoredProcedure;
                    sqlCommand.Parameters.AddWithValue("@maLichHen", maLichHen.Value);
                    sqlCommand.Parameters.AddWithValue("@tieuSu", txtTieuSu.Text);
                    sqlCommand.Parameters.AddWithValue("@chuanDoan", txtChuanDoan.Text);
                    sqlCommand.Parameters.AddWithValue("@canLamSang", txtCanLamSang.Text);
                    sqlCommand.Parameters.AddWithValue("@thoiGian", DateTime.Now);
                    sqlCommand.Parameters.AddWithValue("@dieuTri", txtDieuTri.Text);
                   // sqlCommand.Parameters.AddWithValue("@nguoiTao", Session["maNguoiDung"].ToString());
                    SqlParameter outPutVal = new SqlParameter("@id", SqlDbType.Int);
                    outPutVal.Direction = ParameterDirection.Output;
                    sqlCommand.Parameters.Add(outPutVal);


                    int iz = sqlCommand.ExecuteNonQuery();
                      Debug.WriteLine("nhan dc ma  " + (int)outPutVal.Value);
                    string query = "insert into tblChiTietPhieuKham values ";
                    foreach (DvuYTe dv_ in dsDV)
                    {
                        if (dsDV.IndexOf(dv_) == dsDV.Count - 1)
                        {
                            query += "(" + outPutVal.Value + "," + dv_.Id + "," + dv_.SoLuong + ")";
                        }
                        else
                        {
                            query += "(" + outPutVal.Value + "," + dv_.Id + "," + dv_.SoLuong + "),";
                        }
                       
                    }
                    using (SqlConnection sqlConnection_ = conn.connectDatabase())
                    {
                        SqlCommand sqlCommand_ = new SqlCommand(query, sqlConnection_);
                        sqlCommand.CommandType = CommandType.Text;
                        int i = sqlCommand_.ExecuteNonQuery();
                        if (i > 0)
                        {
                            Response.Redirect("thongbao.aspx?noti=Lập Phiếu Khám Thành Công" );
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                Debug.WriteLine("nhan dc loi  " + ex.Message);
            }
        }

        protected void btnThem_Click(object sender, EventArgs e)
        {
            if (dsDV != null)
            {

            }
                foreach (DvuYTe dv_ in dsDV)
            {
                if (dv_.Id == ddlListDV.SelectedValue)
                {
                    Debug.WriteLine(dv_.SoLuong + " them moi+  " + TxtSoLuong.Text);
                    dv_.SoLuong += Int32.Parse(TxtSoLuong.Text);
                    loadDsDvYTe();
                    TxtSoLuong.Text = "1";
                    return;
                }
            }
            DvuYTe dv = new DvuYTe();
            dv.Id = ddlListDV.SelectedValue;
            dv.TenDV = ddlListDV.SelectedItem.Text;
            dv.TienPhi = layGiaDV(ddlListDV.SelectedValue);
            dv.SoLuong = Int32.Parse(TxtSoLuong.Text);
            dv.TongTien = Int32.Parse(TxtSoLuong.Text) * dv.TienPhi;
            dsDV.Add(dv);
            Session["danhSachDichVu"] = dsDV;
            loadDsDvYTe();
            TxtSoLuong.Text = "1";

        }

        void loadDsDvYTe()
        {
            rptDanhSach.DataSource = dsDV;
            rptDanhSach.DataBind();
            int tongTien = 0;
            foreach (DvuYTe dv_ in dsDV)
            {
                tongTien += dv_.TongTien;

            }
            tongCong.InnerText = tongTien.ToString("N0");
        }

        int layGiaDV(string id)
        {
            using (SqlConnection sqlConnection = conn.connectDatabase())
            {
                SqlCommand sqlCommand = new SqlCommand("sp_layGiaDV", sqlConnection);
                sqlCommand.CommandType = CommandType.StoredProcedure;
                sqlCommand.Parameters.AddWithValue("@id", id);
                SqlDataAdapter sqlDataAdapter = new SqlDataAdapter(sqlCommand);
                DataTable dataTable = new DataTable();
                sqlDataAdapter.Fill(dataTable);
                return Int32.Parse(dataTable.Rows[0]["iTienPhi"].ToString());
            
                // Debug.WriteLine("nhan dc loi  " + tieuDe.Text + "  tieu de  " + dataTable.Rows[0]["stieude"].ToString());
            }
        }

        protected void btnDel_Click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)(sender);
            string id = btn.CommandArgument;
            foreach (DvuYTe dv_ in dsDV)
            {
                if (dv_.Id == id)
                {
                    dsDV.Remove(dv_);
                    loadDsDvYTe();
                    TxtSoLuong.Text = "1";
                    return;
                }
            }

        }
    }
}