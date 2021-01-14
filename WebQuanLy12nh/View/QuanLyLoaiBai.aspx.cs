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
                layDanhSachLoaiBai();
                
            }
        
        }
        ConnectDatabase conn = new ConnectDatabase();
        private void layDanhSachLoaiBai()
        {
            
            using (SqlConnection sqlConnection = conn.connectDatabase())
            {

                SqlDataAdapter sqlDataAdapter = new SqlDataAdapter("sp_danhSachLoaiBai", sqlConnection);
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
                    layDanhSachLoaiBai();
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
                SqlCommand sqlCommand = new SqlCommand("sp_themLoaiBai", sqlConnection);
                sqlCommand.CommandType = CommandType.StoredProcedure;
                sqlCommand.Parameters.AddWithValue("@loaiBai", tenLoaiBai.Text);
           
                sqlCommand.ExecuteNonQuery();
                layDanhSachLoaiBai();
            }
        }
    }
}
//Response.Redirect(Request.UrlReferrer.ToString());