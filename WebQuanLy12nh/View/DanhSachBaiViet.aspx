<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DanhSachBaiViet.aspx.cs" Inherits="WebLamDep.View.DanhSachBaiViet" %>
<!DOCTYPE html>
<html><head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Trang Web Làm Đẹp</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="robots" content="all,follow">
    <!-- Bootstrap CSS-->
    <link rel="stylesheet" href="../Content/trangds/bootstrap.css">
    <!-- Google fonts-->
    <link rel="stylesheet" href="../Content/trangds/css.css">
    <link rel="stylesheet" href="../Content/trangds/css_002.css">
    <!-- Lightbox-->
    <link rel="stylesheet" href="../Content/trangds/lightbox.css">
    <!-- theme stylesheet-->
    <link rel="stylesheet" href="../Content/trangds/style_002.css" id="theme-stylesheet"><link id="new-stylesheet" rel="stylesheet" href="../Content/trangds/style.css">
    <!-- Custom stylesheet - for your changes-->
    <link rel="stylesheet" href="../Content/trangds/custom.css">
    <!-- Favicon-->
    <link rel="shortcut icon" href="https://demo..com/juliette/img/favicon.6f35cd89.png">
    <!-- Tweaks for older IEs--><!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script><![endif]-->
  </head>
  <body>
    <!-- navbar-->
    <header class="header">                   
      <nav class="navbar navbar-expand-lg navbar-light py-4 index-forward bg-white">
        <div class="container d-flex justify-content-center justify-content-lg-between align-items-center">
          <ul class="list-inline small mb-0 text-dark d-none d-lg-block">
           
          </ul><a class="navbar-brand" href=""><img src="../Content/logo.png" alt="..." width="300"></a><a class="reset-anchor text-small mb-0 h6 d-none d-lg-block" href=""></a>
        </div>
      </nav>
      <nav class="navbar navbar-expand-lg navbar-light border-top border-bottom border-light">
        <div class="container">
          <ul class="list-inline small mb-0 text-dark d-block d-lg-none">
     
          </ul>
          <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span></span><span></span><span></span></button>
          <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mx-auto">
              <li class="nav-item">
                <!-- Navbar link--><a style="font-family: 'Roboto', sans-serif; margin-left: 25px;"  class="nav-link" href="trangchu.aspx">Trang Chủ</a>
              </li>
                <asp:Repeater ID="rptLoaiBai" runat="server">
                    <ItemTemplate>
              <li class="nav-item">
                <!-- Navbar link--><a style="font-family: 'Roboto', sans-serif; margin-left: 25px;"  class="nav-link" href="DanhSachBaiViet.aspx?id=<%# Eval("iMaLoaiBai") %>"><%# Eval("stenloaibai") %></a>
              </li>
                </ItemTemplate>
                </asp:Repeater>
            </ul>
          </div>
        </div>
      </nav>
    </header>
    <section class="py-5">
      <div class="container py-4">
        <div class="row">
          <!-- Blog listing-->
          <div class="col-lg-9 mb-5 mb-lg-0">
            <div class="row">
              
              <asp:Repeater ID="rptDSBaiViet" runat="server">
                  <ItemTemplate>

               <div class="col-lg-6 mb-5">   <a class="d-block mb-4" href="XemBaiViet.aspx?id=<%# Eval("iMaBaiViet") %>"><img class="img-fluid w-100" src="../IMAGES/<%# Eval("surlanh") %>" alt=""></a>
                <ul class="list-inline">
                  <li class="list-inline-item mr-2"><a class="category-link font-weight-normal" href="#"><%# Eval("stenloaibai") %></a></li>
                  <li class="list-inline-item mx-2"><a class="text-uppercase meta-link font-weight-normal" href="#"><%# Eval("sHoTen") %></a></li>
                  <li class="list-inline-item mx-2"><a class="text-uppercase meta-link font-weight-normal" href="#"><%# Eval("dngayDang") %></a></li>
                </ul>
                <h2 class="h3 mb-4"> <a class="d-block reset-anchor" href="XemBaiViet.aspx?id=<%# Eval("iMaBaiViet") %>"><%# Eval("sTieuDe") %></a></h2>
                <p class="text-muted"><%# Eval("sMoTa") %></p><a class="btn btn-link p-0 -read-more-btn" href="XemBaiViet.aspx?id=<%# Eval("iMaBaiViet") %>"><span>Read more</span></a>
              </div>
                  </ItemTemplate>
              </asp:Repeater>

            </div>
              <form runat="server" method="post">
            <!-- Pagination-->
            <nav aria-label="Page navigation example">
                <asp:Label runat="server" ID="url"></asp:Label>
              <%--<ul class="pagination">
                <li class="page-item"><a class="page-link" href="#">«</a></li>
                <li class="page-item active"><a class="page-link" href="#">1</a></li>
                <li class="page-item"><a class="page-link" href="#">2</a></li>
                <li class="page-item"><a class="page-link" href="#">»</a></li>
              </ul>--%>
            </nav>
          </div>


            <asp:HiddenField ID="pageid" runat="server"/>
            </form>
          <!-- Blog sidebar-->
          <div class="col-lg-3">
            <!-- About category-->
            <div class="card rounded-0 border-0 bg-light mb-4 py-lg-4">
              <div class="card-body text-center">
                <h2 class="h3 mb-3">Web Làm Đẹp</h2><img class="rounded-circle mb-3" src="../Content/trangds/author.jpg" alt="..." width="100">
                <p class="text-small text-muted"></p>
                <ul class="list-inline small mb-0 text-dark">
                 
                </ul>
              </div>
            </div>
            <!-- Recent posts-->
            <div class="card rounded-0 border-0 mb-4">
              <div class="card-body p-0">
                <h2 class="h5 mb-3">BÀI VỪA ĐĂNG</h2>

                  <asp:Repeater ID="rptBaiVuaDang" runat="server">
                      <ItemTemplate>

                     
                <div class="media mb-3"><a class="d-block" href="XemBaiViet.aspx?id=<%# Eval("iMaBaiViet") %>"><img class="img-fluid" src="../IMAGES/<%# Eval("surlanh") %>" alt="" width="70"></a>
                  <div class="media-body ml-3">
                    <h6> <a class="reset-anchor" href="XemBaiViet.aspx?id=<%# Eval("iMaBaiViet") %>"><%# Eval("sTieuDe") %></a></h6>
                    <p class="text-small text-muted line-height-sm mb-0"><%# Eval("sMoTa") %></p>
                  </div>
                </div>

                       </ItemTemplate>
                  </asp:Repeater>
                
              </div>
            </div>
           
            <div class="card rounded-0 border-0 mb-4">
              <div class="card-body p-0"><a class="d-block" href="#"><img class="img-fluid" src="../Content/trangds/banner.jpg" alt=""></a></div>
            </div>
          </div>
        </div>
      </div>
    </section>
    <footer class="py-4" style="background: #111">
      <div class="container text-center">
        <div class="row align-items-center">
          <div class="col-md-4 text-lg-left"><img src="../Content/logo.png" alt="..." width="120"></div>
          <div class="col-md-4 text-center">
            <div class="d-flex align-items-center flex-wrap justify-content-center">
              <h6 class="text-muted mb-0 py-2 mr-3">Liên Hệ: hoitro@beautiful.com<span class="ml-3">-</span></h6>
              <ul class="list-inline small mb-0 text-white">
              
              </ul>
            </div>
          </div>
          <div class="col-md-4 text-lg-right">
            <p class="mb-0 text-muted text-small text-heading"> <a href="" class="text-reset"></a>. </p>
          </div>
        </div>
      </div>
    </footer>
    <button class="btn btn-primary btn-sm d-none d-lg-inline-block" type="button" data-toggle="collapse" data-target="#style-switch" id="style-switch-button"><i class="fa fa-cog fa-2x"></i></button>
    <div class="collapse" id="style-switch">
     
      <p><img class="img-fluid" src="../Content/trangds/template-mac.png" alt=""></p>
      <p class="text-muted text-small"></p>
    </div>
    <!-- JavaScript files-->
    <script src="../Content/trangds/jquery.js"></script>
    <script src="../Content/trangds/bootstrap.js"></script>
    <script src="../Content/trangds/lightbox.js"></script>
    <script src="../Content/trangds/front.js"></script>
    <script src="../Content/trangds/jquery_002.js"> </script>
    <script src="../Content/trangds/demo.js"> </script>
    <!-- FontAwesome CSS - loading as last, so it doesn't block rendering-->
    <link rel="stylesheet" href="../Content/trangds/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
  
<div id="lightboxOverlay" tabindex="-1" class="lightboxOverlay" style="display: none;"></div><div id="lightbox" tabindex="-1" class="lightbox" style="display: none;"><div class="lb-outerContainer"><div class="lb-container"><img class="lb-image" src="data:image/gif;base64,R0lGODlhAQABAIAAAP///wAAACH5BAEAAAAALAAAAAABAAEAAAICRAEAOw==" alt=""><div class="lb-nav"><a class="lb-prev" aria-label="Previous image" href=""></a><a class="lb-next" aria-label="Next image" href=""></a></div><div class="lb-loader"><a class="lb-cancel"></a></div></div></div><div class="lb-dataContainer"><div class="lb-data"><div class="lb-details"><span class="lb-caption"></span><span class="lb-number"></span></div><div class="lb-closeContainer"><a class="lb-close"></a></div></div></div></div></body></html>