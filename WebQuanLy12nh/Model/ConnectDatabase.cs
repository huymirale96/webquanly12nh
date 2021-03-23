using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace WebQuanLy12nh.Model
{
    public class ConnectDatabase
    {
         public string strCon = @"Data Source=DESKTOP-C1VSI5K\SQLEXPRESS;Initial Catalog=webDatLich;Integrated Security=True";
     //   public string strCon = @"Data Source=DESKTOP-171AVQP;Initial Catalog=webDatLich;Integrated Security=True";


        public SqlConnection connectDatabase()
        {
            SqlConnection myCnn = new SqlConnection(strCon);
            myCnn.Open();
            return myCnn;
        }
    }
}
/*


<!DOCTYPE html>
<html lang = "en" >
    < head >
        < meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name = "viewport" content="width=device-width, initial-scale=1">
        <meta name = "description" content="">
        <meta name = "author" content="">

        <title>Lý lịch khoa học giảng viên</title>

        <!-- Bootstrap Core CSS -->
        <link href = "../Content/bootstrap.min.css" rel= "stylesheet" >

        < !--MetisMenu CSS -->
        <link href = "../Content/metisMenu.min.css" rel= "stylesheet" >

        < !--Custom CSS -->
        <link href = "../Content/startmin.css" rel= "stylesheet" >

        < !--Custom Fonts -->
        <link href = "../Content/font-awesome.min.css" rel= "stylesheet" type= "text/css" >

        < !--[if lt IE 9] >
        < script src= "https://cdnjs.cloudflare.com/ajax/libs/html5shiv/3.7.3/html5shiv.min.js" ></ script >
        < script src= "https://cdnjs.cloudflare.com/ajax/libs/respond.js/1.4.2/respond.min.js" ></ script >
        < ![endif]-- >
    </ head >
    < body >
        < div id= "wrapper" >
            < !--Navigation-- >
            < nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
                <div class="navbar-header">
                    <a class="navbar-brand" href="#">HOU</a>
                </div>

                <button type = "button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>

                <ul class="nav navbar-right navbar-top-links">
                    <li class="dropdown">
                        <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                            <i class="fa fa-user fa-fw"></i> <% Response.Write(Session["tenTK"]); %> <b class="caret"></b>
                        </a>
                        <ul class="dropdown-menu dropdown-user">
                            <li>
                                <a href = "doiMatKhau.aspx" >< i class="fa fa-eercast fa-fw"></i> Đổi mật khẩu</a>
                            </li>
                            <li class="divider"></li>
                            <li>
                                <a href = "Login.aspx" >< i class="fa fa-sign-out fa-fw"></i> Đăng xuất</a>
                                </li>
                        </ul>
                    </li>
                </ul>
                <!-- /.navbar-top-links -->

                <div class="navbar-default sidebar" role="navigation">
                    <div class="sidebar-nav navbar-collapse">
                        <ul class="nav" id="side-menu">
                            <% if((int) Session["quyen"] == 2) { %>
                            <li>
                                <a href = "#" >< i class="fa fa-briefcase fa-fw"></i> Hồ sơ lý lịch khoa học<span class="fa arrow"></span></a>
                                <ul class="nav nav-second-level">
                                    <li>
                                        <a href = "ThongTinLyLich.aspx" > Thông tin lý lịch khoa học</a>
                                    </li>
                                    <li>
                                        <a href = "BoSungLyLich.aspx" > Bổ sung lý lịch khoa học</a>
                                    </li>
                                </ul>
                                <!-- /.nav-second-level -->
                            </li>
                            <% } %>
                            <% if((int) Session["quyen"] == 1) { %>
                            <li>
                                <a href = "#" >< i class="fa fa-archive fa-fw"></i> Quản lý hồ sơ khoa học<span class="fa arrow"></span></a>
                                <ul class="nav nav-second-level">
                                    <li>
                                        <a href = "quanLyHoSoKhoaHoc.aspx?status=load" > Danh sách hồ sơ khoa học</a>
                                    </li>
                                    <li>
                                        <a href = "#" > Cập nhật hồ sơ lý lịch</a>
                                    </li>
                                </ul>
                                <!-- /.nav-second-level -->
                            </li>
                            <li>
                                <a href = "#" >< i class="fa fa-outdent fa-fw"></i> Quản lý báo cáo thống kê<span class="fa arrow"></span></a>
                                <ul class="nav nav-second-level">
                                    <li>
                                        <a href = "#" > Lập báo cáo thống kê lý lịch khoa học</a>
                                        </li>
                                </ul>
                                <!-- /.nav-second-level -->
                            </li>
                            <li>
                                <a href = "#" >< i class="fa fa-cogs fa-fw"></i> Quản lý hệ thống<span class="fa arrow"></span></a>
                                <ul class="nav nav-second-level">
                                    <li>
                                        <a href = "#" > Cập nhật thông tin tài khoản</a>
                                    </li>
                                    <li>
                                        <a href = "#" > Cấp tài khoản</a>
                                        </li>
                                    <li>
                                        <a href = "#" > Khoá tài khoản</a>
                                    </li>
                                    <li>
                                        <a href = "#" > Mở khoá tài khoản</a>
                                        </li>
                                </ul>
                                <!-- /.nav-second-level -->
                            </li>
                            <% } %>
                        </ul>
                    </div>
                </div>
            </nav>
            <div id = "page-wrapper" >
                < asp:ContentPlaceHolder ID = "MainContent" runat="server">
                </asp:ContentPlaceHolder>
            </div>
        </div>
        <!-- jQuery -->
        <script src = "../Scripts/jquery.min.js" ></ script >

        < !--Bootstrap Core JavaScript -->
        <script src = "../Scripts/bootstrap.min.js" ></ script >

        < !--Metis Menu Plugin JavaScript -->
        <script src = "../Scripts/metisMenu.min.js" ></ script >

        < !--Custom Theme JavaScript -->
        <script src = "../Scripts/startmin.js" ></ script >
    </ body >
</ html >*/