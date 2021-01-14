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
    public partial class DanhSachBaiVietTimKiem : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            load_LoaiBaiViet();
            if (!IsPostBack)
            {
               
                

                if (Request.QueryString["tuTimKiem"] != null)
                {
                    danhSachBaiVietTimKiem(Request.QueryString["tuTimKiem"].ToString());
                   /// load_danhSAchBai(Request.QueryString["id"].ToString());
                    Paging(Request.QueryString["tuTimKiem"].ToString());
                    load_danhSachBaiViet4BaiMoi();
                }
            }
        }


        ConnectDatabase conn = new ConnectDatabase();

        void load_LoaiBaiViet()
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


        void danhSachBaiVietTimKiem(String tuTimKiem)
        {
            using (SqlConnection sqlConnection = conn.connectDatabase())
            {
                SqlCommand cmd = new SqlCommand("sp_danhSachBaiVietTimKiem", sqlConnection);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@tuTimKiem", tuTimKiem);
               
                SqlDataAdapter sqlDataAdapter = new SqlDataAdapter(cmd);
                
                DataTable dataTable = new DataTable();
                sqlDataAdapter.Fill(dataTable);
                rptDSBaiViet.DataSource = dataTable;
                rptDSBaiViet.DataBind();
            }
        }


        void load_danhSachBaiViet4BaiMoi()
        {
            using (SqlConnection sqlConnection = conn.connectDatabase())
            {
                SqlCommand cmd = new SqlCommand("sp_danhSach4BaiVietMoiNhat", sqlConnection);
                cmd.CommandType = CommandType.StoredProcedure;
              //  cmd.Parameters.AddWithValue("@id", id);

                SqlDataAdapter sqlDataAdapter = new SqlDataAdapter(cmd);

                DataTable dataTable = new DataTable();
                sqlDataAdapter.Fill(dataTable);
                rptBaiVuaDang.DataSource = dataTable;
                rptBaiVuaDang.DataBind();
            }
        }

        DataTable load_danhSAchBai(String tuTimKiem)
        {

            using (SqlConnection sqlConnection = conn.connectDatabase())
            {
                SqlCommand cmd = new SqlCommand("sp_danhSachBaiVietTimKiem", sqlConnection);
                cmd.CommandType = CommandType.StoredProcedure;
                //cmd.Parameters.AddWithValue("@id", id);
                cmd.Parameters.AddWithValue("@tuTimKiem", tuTimKiem);
                SqlDataAdapter sqlDataAdapter = new SqlDataAdapter(cmd);

                DataTable dataTable = new DataTable();
                sqlDataAdapter.Fill(dataTable);
                return dataTable;
            }
        }


        private void Paging(String id)
        {

            #region page for repeater
            // Starting paging here.
            PagedDataSource pds = new PagedDataSource();
            DataView dt = load_danhSAchBai(id).DefaultView;

            pds.DataSource = dt;
            pds.AllowPaging = true;
            // Show number of product in one page.
            pds.PageSize = 6;
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
                    urls += "<li  class='page-item'><a class='page-link' href='" + Request.CurrentExecutionFilePath + "?page=" + i + "'>" + i + "</a></li>";
                }
                else
                {
                    urls += "<li class='page-item active'><a class='page-link' href='" + Request.CurrentExecutionFilePath + "?page=" + i + "'>" + i + "</a></li>";
                }
            }
            url.Text = urls + "</ul>";



            #endregion

            rptDSBaiViet.DataSource = pds;
            rptDSBaiViet.DataBind();

        }
    }
}