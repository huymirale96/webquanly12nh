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
    public partial class ThemLoaiBai : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if(Request.QueryString["ten"] != null && Request.QueryString["id"] != null)
                {
                    using (SqlConnection sqlConnection = conn.connectDatabase())
                    {
                        SqlCommand sqlCommand = new SqlCommand("sp_capNhatTenLoaiBai", sqlConnection);
                        sqlCommand.CommandType = CommandType.StoredProcedure;
                        sqlCommand.Parameters.AddWithValue("@ten", Request.QueryString["ten"].ToString());
                        sqlCommand.Parameters.AddWithValue("@id", Request.QueryString["id"].ToString());
                        sqlCommand.ExecuteNonQuery();
                      //  layDanhSachLoaiBai();
                    }
                }
                layDanhSachDichVu();
                
            }
        
        }
        ConnectDatabase conn = new ConnectDatabase();
        private void layDanhSachDichVu()
        {
            
            using (SqlConnection sqlConnection = conn.connectDatabase())
            {

                SqlDataAdapter sqlDataAdapter = new SqlDataAdapter("sp_danhSachDichVu", sqlConnection);
                DataTable dataTable = new DataTable();
                sqlDataAdapter.Fill(dataTable);
                rptLoaiBai.DataSource = dataTable;
                rptLoaiBai.DataBind();
            }
        }

        protected void btnFix_Click(object sender, EventArgs e)
        {

        }
        
        protected void btnDelete_Click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;
            Debug.WriteLine("nhan dc " + btn.CommandArgument.ToString());

            try
            {
                using (SqlConnection sqlConnection = conn.connectDatabase())
                {
                    SqlCommand sqlCommand = new SqlCommand("sp_XoaBaiDang", sqlConnection);
                    sqlCommand.CommandType = CommandType.StoredProcedure;
                    sqlCommand.Parameters.AddWithValue("@id", btn.CommandArgument.ToString());
                    sqlCommand.ExecuteNonQuery();
                    layDanhSachDichVu();
                }
            }
            catch(Exception exx)
            {
                Debug.WriteLine("nhan dc loi  " + exx.Message);
            }
        }

        protected void btnThem_Click(object sender, EventArgs e)
        {
           
            ConnectDatabase conn = new ConnectDatabase();
            using (SqlConnection sqlConnection = conn.connectDatabase())
            {
                SqlCommand sqlCommand = new SqlCommand("sp_dichVuYte", sqlConnection);
                sqlCommand.CommandType = CommandType.StoredProcedure;
                 sqlCommand.Parameters.AddWithValue("@tenDichVu", tenDichVu.Text);
                sqlCommand.Parameters.AddWithValue("@tienPhi", tienPhi.Text);

                sqlCommand.ExecuteNonQuery();
                layDanhSachDichVu();
                tienPhi.Text = "";
                tenDichVu.Text = "";
            }
        }
    }
}
//Response.Redirect(Request.UrlReferrer.ToString());