using System;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Security.Cryptography;
using System.Web.UI.WebControls;
using WebQuanLy12nh.Model;


namespace WebQuanLy12nh.View
{
  
    public partial class DanhSachLichKham : System.Web.UI.Page
    {
        ConnectDatabase conn = new ConnectDatabase();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ngay.Text = DateTime.Now.ToString("yyyy-MM-yy");
                layLichKham(DateTime.Now.ToString("MM/dd/yyyy"));
              
            }
        }

      
          void layLichKham(string ngay)
        {
            Debug.WriteLine("nhan dc ngay   " + ngay);
            try
            {

                using (SqlConnection sqlConnection = conn.connectDatabase())
                {
                    SqlCommand sqlCommand = new SqlCommand("sp_dsLichKham", sqlConnection);
                    sqlCommand.CommandType = CommandType.StoredProcedure;
                    sqlCommand.Parameters.AddWithValue("@ngay", ngay);
                    sqlCommand.ExecuteNonQuery();
                    SqlDataAdapter sqlDataAdapter = new SqlDataAdapter(sqlCommand);
                    DataTable dataTable = new DataTable();
                    sqlDataAdapter.Fill(dataTable);
                    rptDanhSach.DataSource = dataTable;
                    rptDanhSach.DataBind();

                    // Debug.WriteLine("nhan dc loi  " + dataTable.Rows.Count);
                }
            }
            catch(Exception ex)
            {
                Debug.WriteLine("nhan dc loi  " + ex.Message);
            }
        }

       public string trangThai(string tt)
        {
            int i = Int32.Parse(tt);
            switch(i)
            {
                case 0: return "<span class='label-warning'>Đang Chờ Khám</label>";
                case 1: return "<span class='label label-success'>Đã Khám</label>";
                case 2: return "<span class='label label-danger'>Đã Huỷ</label>";

            }
            return "";
        }

        protected void btnTim_Click(object sender, EventArgs e)
        {
            try
            {
                layLichKham(DateTime.Parse(ngay.Text).ToString("MM/dd/yyyy"));
            }
            catch (Exception ex)
            {
                Debug.WriteLine("nhan dc loi  " + ex.Message);
            }
        }


        protected void btnDel_Click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)(sender);
            string id = btn.CommandArgument;
            try
            {
                using (SqlConnection sqlConnection = conn.connectDatabase())
                {
                    SqlCommand sqlCommand = new SqlCommand("delete from tbllichhenkham where imalichhenkham = " + id, sqlConnection);
                    sqlCommand.CommandType = CommandType.Text;
                    sqlCommand.ExecuteNonQuery();
                    layLichKham(DateTime.Parse(ngay.Text).ToString("MM/dd/yyyy"));

                }
            }
            catch (Exception ex)
            {
                Debug.WriteLine("nhan dc loi  " + ex.Message);
            }
        }
    }
    
}