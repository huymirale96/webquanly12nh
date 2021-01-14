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
    public partial class DanhSachBaiDangCuaNguoiDung : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                load_danhSAch();
                Paging();
            }
        }

        ConnectDatabase conn = new ConnectDatabase();

        void load_danhSAch()
        {
            
                rptDanhSach.DataSource = load_danhSAchBai();
                rptDanhSach.DataBind();
            Debug.WriteLine("load sd");
            
        }

       private DataTable load_danhSAchBai()
        {
            using (SqlConnection sqlConnection = conn.connectDatabase())
            {
                SqlCommand sqlCommand = new SqlCommand("sp_xemdanhsachbaidangbyidnguoidung", sqlConnection);
                sqlCommand.CommandType = CommandType.StoredProcedure;
               
                sqlCommand.Parameters.AddWithValue("@idNguoiDung", Session["maNguoiDung"].ToString());
                SqlDataAdapter sqlDataAdapter = new SqlDataAdapter(sqlCommand);
                DataTable dataTable = new DataTable();
                //Debug.WriteLine("data: so cot "+ da);
                sqlDataAdapter.Fill(dataTable);
                return dataTable;
            }
        }


        private void Paging()
        {

            #region page for repeater
            // Starting paging here.
            PagedDataSource pds = new PagedDataSource();
            DataView dt = load_danhSAchBai().DefaultView;

            pds.DataSource = dt;
            pds.AllowPaging = true;
            // Show number of product in one page.
            pds.PageSize = 15;
            // Specify sum of page.
            int numPage = pds.PageCount;
            int currentPage;
            if (Request.QueryString["page"] != null)
            {
                currentPage = Int32.Parse(Request.QueryString["page"]);
                pageid.Value = currentPage.ToString();
            }
            else
            {
                currentPage = 1;
            }
            // Because paging always start at 0.
            pds.CurrentPageIndex = currentPage - 1;
            // Show
            //Labelnv.Text = "Trang  " + currentPage + " cua " + pds.PageCount;

            string urls = "<ul class='pagination'>";
            for (int i = 1; i <= numPage; i++)
            {
                if (i != currentPage)
                {
                    urls += "<li><a href='" + Request.CurrentExecutionFilePath + "?page=" + i + "'>" + i + "</a></li>";
                }
                else
                {
                    urls += "<li class='active'><a href='" + Request.CurrentExecutionFilePath + "?page=" + i + "'>" + i + "</a></li>";
                }
            }
            url.Text = urls + "</ul>";



            #endregion

            rptDanhSach.DataSource = pds;
            rptDanhSach.DataBind();

        }

        protected void btnDuyet_Click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;
            Debug.WriteLine("nhan dc " + btn.CommandArgument.ToString());

            try
            {
                using (SqlConnection sqlConnection = conn.connectDatabase())
                {
                    SqlCommand sqlCommand = new SqlCommand("sp_DuyetBai", sqlConnection);
                    sqlCommand.CommandType = CommandType.StoredProcedure;
                    sqlCommand.Parameters.AddWithValue("@idBai", btn.CommandArgument.ToString());
                    sqlCommand.Parameters.AddWithValue("@thoiGian", DateTime.Now);
                    sqlCommand.Parameters.AddWithValue("@idNguoiDung", Session["maNguoiDung"].ToString());
                    sqlCommand.ExecuteNonQuery();
                    load_danhSAch();
                    Paging();
                }
            }
            catch (Exception exx)
            {
                Debug.WriteLine("nhan dc loi  " + exx.Message);
            }
        }
    }
}