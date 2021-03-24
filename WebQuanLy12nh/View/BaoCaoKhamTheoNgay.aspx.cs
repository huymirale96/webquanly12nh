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
    public partial class BaoCaoKhamTheoNgay : System.Web.UI.Page
    {
        ConnectDatabase conn = new ConnectDatabase();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ngayCuoi.Text = DateTime.Now.ToString("yyyy-MM-yy");
                ngayDau.Text = DateTime.Now.ToString("yyyy-MM-yy");
            }
        }

        public string chuyenSangTien(string x)
        {
            return Int32.Parse(x).ToString("N0");
        }

        protected void btnTim_Click(object sender, EventArgs e)
        {
                Debug.WriteLine("nhan dc ngay   " + ngayDau.Text);
                try
                {

                    using (SqlConnection sqlConnection = conn.connectDatabase())
                    {
                        SqlCommand sqlCommand = new SqlCommand("sp_baoBaoTheoNgay", sqlConnection);
                        sqlCommand.CommandType = CommandType.StoredProcedure;
                        sqlCommand.Parameters.AddWithValue("@ngayDau", (DateTime.Parse(ngayDau.Text).ToString("MM/dd/yyyy")));
                        sqlCommand.Parameters.AddWithValue("@ngayCuoi", (DateTime.Parse(ngayCuoi.Text).ToString("MM/dd/yyyy")));
                        sqlCommand.ExecuteNonQuery();
                        SqlDataAdapter sqlDataAdapter = new SqlDataAdapter(sqlCommand);
                        DataTable dataTable = new DataTable();
                        sqlDataAdapter.Fill(dataTable);
                        rptDanhSach.DataSource = dataTable;
                        rptDanhSach.DataBind();
                    int slPhieu = 0;
                    int tien = 0;
                    foreach(DataRow dr in dataTable.Rows)
                    {
                        slPhieu += Int32.Parse(dr["luotKham"].ToString());
                        tien += Int32.Parse(dr["tongTien"].ToString());
                    }
                    tongSL.InnerText = slPhieu + " Bệnh Nhân";
                    tongTien.InnerText = chuyenSangTien(tien.ToString()) + " VND";
                }
                }
                catch (Exception ex)
                {
                    Debug.WriteLine("nhan dc loi  " + ex.Message);
                }
            
        }

        protected void btnKNhi_Click(object sender, EventArgs e)
        {
            using (SqlConnection sqlConnection = conn.connectDatabase())
            {

                SqlDataAdapter sqlDataAdapter = new SqlDataAdapter("sp_bnKhoaNhi", sqlConnection);
                DataTable dataTable = new DataTable();
                sqlDataAdapter.Fill(dataTable);
                Repeater1.DataSource = dataTable;
                Repeater1.DataBind();
            }
        }
    }
}