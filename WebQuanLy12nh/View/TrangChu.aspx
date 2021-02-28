<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TrangChu.aspx.cs" Inherits="WebLamDep.View.TrangChu" %>

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
    <link rel="stylesheet" href="../Content/frontend/bootstrap.css">
    <!-- Google fonts-->
    <link rel="stylesheet" href="../Content/frontend/css.css">
    <link rel="stylesheet" href="../Content/frontend/css_002.css">

    <link href="../Content/font-awesome.min.css" rel="stylesheet" type="text/css">
    <!-- Lightbox-->
    <link rel="stylesheet" href="../Content/frontend/lightbox.css">
    <!-- theme stylesheet-->
    <link rel="stylesheet" href="../Content/frontend/style_002.css" id="theme-stylesheet"><link id="new-stylesheet" rel="stylesheet" href="../Content/frontend/style.css">
    <!-- Custom stylesheet - for your changes-->
    <link rel="stylesheet" href="../Content/frontend/custom.css">
    <!-- Favicon-->
    <link rel="shortcut icon" href="https://demo.bootstraptemple.com/juliette/img/favicon.6f35cd89.png">
    <!-- Tweaks for older IEs--><!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script><![endif]-->

    <link href="../Content/font-awesome.min.css" rel="stylesheet" type="text/css">
  </head>
  <body>
    <!-- navbar-->
    <header class="header">                   
      <nav class="navbar navbar-expand-lg navbar-light py-4 index-forward bg-white">
        <div class="container d-flex justify-content-center justify-content-lg-between align-items-center">
          <ul class="list-inline small mb-0 text-dark d-none d-lg-block">
           
          </ul><a class="navbar-brand" href=""><img src="../Content/logo.png" alt="..." width="300"></a><a class="reset-anchor text-small mb-0 h6 d-none d-lg-block" href="login.aspx">Trang ADMIN</a>
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
             <%-- <li class="nav-item dropdown"><a class="nav-link dropdown-toggle" id="listingVariants" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Blog Listing</a>
                <div class="dropdown-menu mt-2" aria-labelledby="listingVariants"><a class="dropdown-item" href="l">Post row</a></div>
              </li>--%>


                <asp:Repeater ID="rptLoaiBai" runat="server">
                    <ItemTemplate>
              <li class="nav-item">
                <!-- Navbar link--><a style="font-family: 'Roboto', sans-serif; margin-left: 25px;" class="nav-link" href="DanhSachBaiViet.aspx?id=<%# Eval("iMaLoaiBai") %>"><%# Eval("stenloaibai") %></a>
              </li>
                </ItemTemplate>
                </asp:Repeater>


              <%--<li class="nav-item dropdown"><a class="nav-link dropdown-toggle" id="pages" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Pages</a>
                <div class="dropdown-menu mt-2" aria-labelledby="pages"><a class="dropdown-item" href="https://demo.bootstraptemple.com/juliette/index.html">Home</a><a class="dropdown-item" href="https://demo.bootstraptemple.com/juliette/listing-1.html">Listing</a><a class="dropdown-item" href="https://demo.bootstraptemple.com/juliette/post.html">Post                </a></div>
              </li>--%>
            </ul>
          </div>
        </div>
      </nav>
    </header>
    <!-- Main post-->
    <section class="bg-white pb-5">
      <div class="container-fluid px-0 pnb-4">
        <div class="row align-items-center">
          <div class="col-lg-12">
            <div class="post-thumnail"><img class="img-fluid w-100" src="../Content/frontend/home-bg.jpg" alt=""></div>
          </div>
          <div class="col-lg-10 mx-auto text-center">
             <!-- Newsletter-->
        <div class="p-4 bg-light">
          <div class="row align-items-center p-lg-3">
            <div class="col-lg-6 mb-4 mb-lg-0">
              <h2 class="h3 mb-1">Tìm Những Bài Viết Bạn Quan Tâm</h2>
              <p class="mb-0 text-small">Bài Viết CHia Sẻ Kiến Thức</p>
            </div>
            <div class="col-lg-6">
              <form action="DanhSachBaiVietTimKiem.aspx">
                <div class="input-group">
                  <input class="form-control" type="text" name="tuTimKiem" placeholder="Nhập Thông Tin Cần Tìm" aria-label="address" aria-describedby="button-addon2">
                  <div class="input-group-append ml-2">
                    <button class="btn btn-primary" id="button-addon2" type="submit">Tìm Kiếm</button>
                  </div>
                </div>
              </form>
            </div>
          </div>
        </div>
          </div>
        </div>
      </div>
    </section>
    <!-- Top categories-->
   
    <!-- Home listing-->
    <section class="pb-5">
      <div class="container pb-4">
        <div class="row">
          <div class="col-lg-9 mb-5 mb-lg-0">

               <asp:Repeater ID="rptDSBaiViet" runat="server">
                  <ItemTemplate>

            <div class="row align-items-center mb-5">
              <div class="col-lg-6"><a class="d-block post-trending mb-4" href="https://demo.bootstraptemple.com/juliette/post.html"><img class="img-fluid w-100" src="../IMAGES/<%# Eval("surlanh") %>" alt=""></a>
              </div>
              <div class="col-lg-6">
                <ul class="list-inline">
                  <li class="list-inline-item mr-2"><a class="category-link font-weight-normal" href="#"><%# Eval("stenloaibai") %><</a></li>
                  <li class="list-inline-item mx-2"><a class="text-uppercase meta-link font-weight-normal" href="#"><%# Eval("sHoTen") %></a></li>
                  <li class="list-inline-item mx-2"><a class="text-uppercase meta-link font-weight-normal" href="#"><%# Eval("dngayDang") %></a></li>
                </ul>
                <h2 class="h3 mb-4"> <a class="d-block reset-anchor" href="XemBaiViet.aspx?id=<%# Eval("iMaBaiViet") %>"><%# Eval("sTieuDe") %></a></h2>
                <p class="text-muted">
                    <%# Eval("smota") %>
                </p><a class="btn btn-link p-0 read-more-btn" href="XemBaiViet.aspx?id=<%# Eval("iMaBaiViet") %>"><span>Xem Thêm</span></a>
              </div>
            </div>

                       </ItemTemplate>
              </asp:Repeater>
          


            <blockquote class="blockquote bg-dark text-white p-4 p-lg-5 text-center mb-5">
              <p class="h4 mb-4">Làm Đẹp Cho Cuộc Sống</p>
              <footer class="blockquote-footer">
                <cite class="text-white" title="Source Title">Kiến Thức Làm Đẹp</cite>
              </footer>
            </blockquote>
       
          </div>
          <!-- Blog sidebar-->
          <div class="col-lg-3">
            <!-- About category-->
            <div class="card rounded-0 border-0 bg-light mb-4 py-lg-4">
              <div class="card-body text-center">
                <Me class="h3 mb-3">About Me<img class="rounded-circle mb-3" src="../Content/frontend/author.jpg" alt="..." width="100">
                <p class="text-small text-muted">Trang Web Chia Sẻ Kiến Thức Làm Đẹp</p>
                <ul class="list-inline small mb-0 text-dark">
                
                </ul>
              </div>
            </div>
            <!-- Recent posts-->
            <div class="card rounded-0 border-0 mb-4">
              <div class="card-body p-0">
                <h2 class="h5 mb-3">Bài Vừa Đăng</h2>
                

                  
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
         
           
          </div>
        </div>
      </div>
    </section>
    <!-- Instagram items-->
    <section>
    
      <div class="container-fluid px-0">
        <div class="row">
          <div class="col-lg-2 col-4 p-0"><a class="d-block instagram-item" href="#"><img class="img-fluid" src="../Content/frontend/instagram-1.jpg" alt="">
              <div class="instagram-item-overlay"><i class=""></i></div></a></div>
          <div class="col-lg-2 col-4 p-0"><a class="d-block instagram-item" href="#"><img class="img-fluid" src="../Content/frontend/instagram-2.jpg" alt="">
              <div class="instagram-item-overlay"><i class=""></i></div></a></div>
          <div class="col-lg-2 col-4 p-0"><a class="d-block instagram-item" href="#"><img class="img-fluid" src="../Content/frontend/instagram-3.jpg" alt="">
              <div class="instagram-item-overlay"><i class=""></i></div></a></div>
          <div class="col-lg-2 col-4 p-0"><a class="d-block instagram-item" href="#"><img class="img-fluid" src="../Content/frontend/instagram-4.jpg" alt="">
              <div class="instagram-item-overlay"><i class=""></i></div></a></div>
          <div class="col-lg-2 col-4 p-0"><a class="d-block instagram-item" href="#"><img class="img-fluid" src="../Content/frontend/instagram-5.jpg" alt="">
              <div class="instagram-item-overlay"><i class="fab fa-instagram"></i></div></a></div>
          <div class="col-lg-2 col-4 p-0"><a class="d-block instagram-item" href="#"><img class="img-fluid" src="../Content/frontend/instagram-6.jpg" alt="">
              <div class="instagram-item-overlay"><i class=""></i></div></a></div>
        </div>
      </div>
    </section>
    <footer class="py-4" style="background: #111">
      <div class="container text-center">
        <div class="row align-items-center">
          <div class="col-md-4 text-lg-left"><img src="../Content/logo.png" alt="..." width="170"></div>
          <div class="col-md-4 text-center">
            <div class="d-flex align-items-center flex-wrap justify-content-center">
              <h6 class="text-muted mb-0 py-2 mr-3">Liên Hệ: hoitro@beautiful.com<span class="ml-3">-</span></h6>
              <ul class="list-inline small mb-0 text-white">
               
              </ul>
            </div>
          </div>
          <div class="col-md-4 text-lg-right">
            
          </div>
        </div>
      </div>
    </footer>
 
    <!-- JavaScript files-->
    <script src="../Content/frontend/jquery_002.js"></script>
    <script src="../Content/frontend/bootstrap.js"></script>
    <script src="../Content/frontend/lightbox.js"></script>
    <script src="../Content/frontend/front.js"></script>
    <script src="../Content/frontend/jquery.js"> </script>
    <script src="../Content/frontend/demo.js"> </script>
   <!-- FontAwesome CSS - loading as last, so it doesn't block rendering-->
   <!--  <link rel="stylesheet" href="../Content/frontend/all.csss" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
 -->
<div id="lightboxOverlay" tabindex="-1" class="lightboxOverlay" style="display: none;"></div><div id="lightbox" tabindex="-1" class="lightbox" style="display: none;"><div class="lb-outerContainer"><div class="lb-container"><img class="lb-image" src="data:image/gif;base64,R0lGODlhAQABAIAAAP///wAAACH5BAEAAAAALAAAAAABAAEAAAICRAEAOw==" alt=""><div class="lb-nav"><a class="lb-prev" aria-label="Previous image" href=""></a><a class="lb-next" aria-label="Next image" href=""></a></div><div class="lb-loader"><a class="lb-cancel"></a></div></div></div><div class="lb-dataContainer"><div class="lb-data"><div class="lb-details"><span class="lb-caption"></span><span class="lb-number"></span></div><div class="lb-closeContainer"><a class="lb-close"></a></div></div></div></div></body></html>