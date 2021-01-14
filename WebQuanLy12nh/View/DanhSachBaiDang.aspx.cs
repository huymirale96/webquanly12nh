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
    public partial class DanhSachBaiDang : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                load_danhSAch();
                load_danhSachLoaiBai();
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

                SqlDataAdapter sqlDataAdapter = new SqlDataAdapter("sp_xemdanhsachbaidang", sqlConnection);
                DataTable dataTable = new DataTable();
                //Debug.WriteLine("data: so cot "+ da);
                sqlDataAdapter.Fill(dataTable);
                return dataTable;
            }
        }


        private void load_danhSachLoaiBai()
        {
            using (SqlConnection sqlConnection = conn.connectDatabase())
            {
               // SqlCommand cmd = new SqlCommand("select * from tblloaibai", sqlConnection);
              //  cmd.CommandType = CommandType.Text;
              //  cmd.CommandText = "select * from tblloaibai";
                SqlDataAdapter sqlDataAdapter = new SqlDataAdapter("sp_danhSachLoaiBai",sqlConnection);
                DataTable dataTable = new DataTable();
                //Debug.WriteLine("data: so cot "+ da);
                sqlDataAdapter.Fill(dataTable);
                ddlLoaiBai.DataSource = dataTable;
                ddlLoaiBai.DataTextField = "sTenLoaiBai";
                ddlLoaiBai.DataValueField = "iMaLoaiBai";
                ddlLoaiBai.DataBind();
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

        protected void ddlLoaiBai_SelectedIndexChanged(object sender, EventArgs e)
        {
            //Debug.WriteLine("ddl + " + ddlLoaiBai.SelectedValue + ddlLoaiBai.DataTextField);  
        }

        protected void btnTimLoaiBai_Click(object sender, EventArgs e)
        {
            Debug.WriteLine("ddl + " + ddlLoaiBai.SelectedValue);

            using (SqlConnection sqlConnection = conn.connectDatabase())
            {
                SqlCommand sqlCommand = new SqlCommand("sp_xemtheoloai", sqlConnection);
                sqlCommand.CommandType = CommandType.StoredProcedure;
                sqlCommand.Parameters.AddWithValue("@id", ddlLoaiBai.SelectedValue);
                SqlDataAdapter sqlDataAdapter = new SqlDataAdapter(sqlCommand);
                DataTable dataTable = new DataTable();
                //Debug.WriteLine("data: so cot "+ da);
                sqlDataAdapter.Fill(dataTable);
                rptDanhSach.DataSource = dataTable;
                rptDanhSach.DataBind();
            }
        }

        protected void btnTimKiem_Click(object sender, EventArgs e)
        {

            using (SqlConnection sqlConnection = conn.connectDatabase())
            {
                SqlCommand sqlCommand = new SqlCommand("sp_xemtheotentimkiem", sqlConnection);
                sqlCommand.CommandType = CommandType.StoredProcedure;
                sqlCommand.Parameters.AddWithValue("@ten", txtTimKiem.Text);
                SqlDataAdapter sqlDataAdapter = new SqlDataAdapter(sqlCommand);
                DataTable dataTable = new DataTable();
                //Debug.WriteLine("data: so cot "+ da);
                sqlDataAdapter.Fill(dataTable);
                rptDanhSach.DataSource = dataTable;
                rptDanhSach.DataBind();
            }
        }
    }
}