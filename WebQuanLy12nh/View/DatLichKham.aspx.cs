using System;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Security.Cryptography;
using WebQuanLy12nh.Model;

namespace WebQuanLy12nh.View
{
    public partial class DatLichKham : System.Web.UI.Page
    {
        public String maBacSi = "1";
        public String chuyenKhoa = "1";
        int soLuongKhamToiDa = 30;
       
        ConnectDatabase conn = new ConnectDatabase();
        protected void Page_Load(object sender, EventArgs e)
        {
          
            if (!IsPostBack)
            {
                loadListChuyenKhoa(); 
               panelBN.Visible = false;
                lblNoti.Visible = false;
                txtNgayKham.Text = DateTime.Now.ToString("yyyy-MM-yy");
                if (Request.QueryString["cn"] != null && Request.QueryString["id"] != null && Request.QueryString["tenBS"] != null && Request.QueryString["ngaykham"] != null)
                {
                    if (kiemTraSoLuongkham(DateTime.Parse(Request.QueryString["ngaykham"].ToString()), Request.QueryString["id"].ToString(), soLuongKhamToiDa))
                    {
                        maBS.Value = maBacSi = Request.QueryString["id"];
                        panelBN.Visible = true;
                        chonChuyenKhoa.Visible = true;
                        ngayKham.Value = Request.QueryString["ngaykham"];
                        lblNoti.Visible = true;
                        lblNoti.InnerText = " Bác Sĩ: " + Request.QueryString["tenBS"];
                    }
                    else
                    {
                        chonChuyenKhoa.Visible = true;
                        lblNoti.Visible = true;
                        lblNoti.InnerText = " Bác Sĩ Đã Kín Lịch Hẹn Ngày: " + Request.QueryString["ngaykham"];
                    }



                }
            }
        }
        public string ngaykham()
        {
            return txtNgayKham.Text;
        }
        Boolean kiemTraSoLuongkham(DateTime ngay, string id, int max)
        {
            using (SqlConnection sqlConnection = conn.connectDatabase())
            {
                SqlCommand sqlCommand = new SqlCommand("sp_laySoLuongKham", sqlConnection);
                sqlCommand.CommandType = CommandType.StoredProcedure;
                sqlCommand.Parameters.AddWithValue("@id", id);
                sqlCommand.Parameters.AddWithValue("@ngay", ngay.ToString("MM/dd/yyyy"));
                SqlDataAdapter sqlDataAdapter = new SqlDataAdapter(sqlCommand);
                DataTable dataTable = new DataTable();
                sqlDataAdapter.Fill(dataTable);
                if(dataTable.Rows.Count <= max)
                {
                   
                    return true;
                  
                }
                else
                {
                    return false;
                }
               
            }
        }
        public void loadListChuyenKhoa()
        {
            
            using (SqlConnection sqlConnection = conn.connectDatabase())
            {

                SqlDataAdapter sqlDataAdapter = new SqlDataAdapter("sp_layDSChuyenKhoa", sqlConnection);
                DataTable dataTable = new DataTable();
                sqlDataAdapter.Fill(dataTable);
                ddlChuyenKhoa.DataSource = dataTable;
                ddlChuyenKhoa.DataValueField = "imachuyenkhoa";
                ddlChuyenKhoa.DataTextField = "stenchuyenkhoa";
                ddlChuyenKhoa.DataBind();

               // Debug.WriteLine("nhan dc loi  " + dataTable.Rows.Count);
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
          //  DateTime now = DateTime.Now.Date;
          //  DateTime ns_ = DateTime.Parse(txtNS.Text);
          ////  ns_.AddYears(5);
          //  int value = DateTime.Compare(now, ns_);
          //  Debug.WriteLine("nhan dc value:   " + value + "  " + now +  ns_);
            //return;
            try
            {
               using (SqlConnection sqlConnection = conn.connectDatabase())
                {
                    SqlCommand sqlCommand = new SqlCommand("sp_themBN", sqlConnection);
                    sqlCommand.CommandType = CommandType.StoredProcedure;
                    sqlCommand.Parameters.AddWithValue("@ten", txtTen.Text);
                    sqlCommand.Parameters.AddWithValue("@diachi", txtDC.Text);
                    sqlCommand.Parameters.AddWithValue("@sdt", txtSDT.Text);
                    sqlCommand.Parameters.AddWithValue("@bh", txtBH.Text);
                    sqlCommand.Parameters.AddWithValue("@ns", txtNS.Text);
                    //   sqlCommand.Parameters.AddWithValue("@mail", email.Text);


                    if (RadioButton1.Checked == true)
                    {
                        sqlCommand.Parameters.AddWithValue("@gt", "1");
                    }
                    else
                    {
                        sqlCommand.Parameters.AddWithValue("@gt", "0");
                    }
                    SqlParameter outPutVal = new SqlParameter("@id", SqlDbType.Int);

                    outPutVal.Direction = ParameterDirection.Output;
                    sqlCommand.Parameters.Add(outPutVal);
                    int iz = sqlCommand.ExecuteNonQuery();
                    Debug.WriteLine("bs:  " + maBacSi);
                    using (SqlConnection sqlConnection_ = conn.connectDatabase())
                    {
                        SqlCommand sqlCommand_ = new SqlCommand("sp_themLichKham", sqlConnection_);
                        sqlCommand_.CommandType = CommandType.StoredProcedure;
                        sqlCommand_.Parameters.AddWithValue("@benhnhan", (int)outPutVal.Value);
                        sqlCommand_.Parameters.AddWithValue("@bacSi", maBS.Value);
                        sqlCommand_.Parameters.AddWithValue("@nguoitao", Session["maNguoiDung"]);
                        sqlCommand_.Parameters.AddWithValue("@thoigiantao", DateTime.Now);
                        sqlCommand_.Parameters.AddWithValue("@ngayhen", ngayKham.Value);
                         sqlCommand_.Parameters.AddWithValue("@sphongkham", txtNote.Text);
                        int i = sqlCommand_.ExecuteNonQuery();
                        if (i > 0)
                        {
                            Response.Redirect("thongbao.aspx?noti=Đặt Lịch Khám Thành Công - Bệnh Nhân: "+ txtTen.Text);
                        }
                    }       
                }
            }
            catch(Exception ex)
            {
                Debug.WriteLine("nhan dc loi  " + ex.Message);
            }
        }

        protected void chonBS_Click(object sender, EventArgs e)
        {
            chuyenKhoa = ddlChuyenKhoa.SelectedItem.Text;
         //   lblNoti.Text = "Chuyên Khoa: " + chuyenKhoa + "  - ";

            using (SqlConnection sqlConnection = conn.connectDatabase())
            {

                SqlDataAdapter sqlDataAdapter = new SqlDataAdapter("select * from tblnguoidung where imachuyenkhoa = " + ddlChuyenKhoa.SelectedValue, sqlConnection);
                DataTable dataTable = new DataTable();
                sqlDataAdapter.Fill(dataTable);
                rptBS.DataSource = dataTable;

                rptBS.DataBind();

                lblNoti.InnerText =  "Chuyên Khoa : " + chuyenKhoa ;
              //  Debug.WriteLine("nhan dc chuem khoa  " + ddlChuyenKhoa.SelectedItem.Text + chuyenKhoa);
            }
        }
    }
}