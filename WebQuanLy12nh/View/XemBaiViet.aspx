<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="XemBaiViet.aspx.cs" Inherits="WebLamDep.View.XemBaiViet" %>
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
    <link rel="stylesheet" href="../Content/trangds/style.css" id="theme-stylesheet"><link id="new-stylesheet" rel="stylesheet">
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
                <!-- Navbar link--><a style="font-family: 'Roboto', sans-serif; margin-left: 25px;" class="nav-link" href="DanhSachBaiViet.aspx?id=<%# Eval("iMaLoaiBai") %>"><%# Eval("stenloaibai") %></a>
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
        <div class="row text-center">
          <div class="col-lg-8 mx-auto"><a class="category-link mb-3 d-inline-block" href="#" id="stenloaibai" runat="server">Inspiration</a>
            <h1 id="stieude" runat="server"></h1>
            <p id="smota" runat="server"></p>
            <ul class="list-inline mb-5">
              <li class="list-inline-item mx-2"><a class="text-uppercase text-muted reset-anchor" href="#" id="tennguoidang" runat="server"></a></li>
              <li class="list-inline-item mx-2"><a class="text-uppercase text-muted reset-anchor" href="#" id="thoigian" runat="server"></a></li>
            </ul>
          </div>
        </div><img class="w-100 mb-5" src="../Content/trangds/post-single-img.jpg" alt="">
        <div class="row">
          <div class="col-lg-9" id="sNooiDung" runat="server">
            <div class="col-lg-9" id="sNoiDung" runat="server"></div>
          
             <div class="col-lg-9" >
                 <h3> CÁC BÀI VIẾT KHÁC</h3>
            <ul class="list-bullets mb-5">
                <asp:Repeater ID="baiVietCungLoai" runat="server">
                    <ItemTemplate>
                          <li><a href="XemBaiViet.aspx?id=<%# Eval("iMaBaiViet") %>"><%# Eval("sTieuDe") %></a></li>
                    </ItemTemplate>
                </asp:Repeater>
            
            </ul>

                         <!-- Leave comment-->
            <h3 class="h4 mb-4">Bình Luận</h3>
            <form class="mb-5" runat="server" method="post" action="XemBaiViet.aspx" >
                <asp:HiddenField ID="maBai" runat="server" />
              <div class="row">
                <div class="form-group col-lg-6">
                 <asp:TextBox runat="server" ID="txtHoTen" CssClass="form-control" placeholder="Họ Tên" ></asp:TextBox>
                </div>
                <div class="form-group col-lg-6">
                   <asp:TextBox runat="server" ID="txtEmail" CssClass="form-control" placeholder="Email" ></asp:TextBox>
                </div>
                <div class="form-group col-lg-12">
                   <asp:TextBox runat="server" ID="txtBinhLuan" CssClass="form-control" Rows="3" TextMode="MultiLine"></asp:TextBox>
                </div>
                <div class="form-group col-lg-12">
                  <asp:Button ID="btnBL" runat="server" CssClass="btn btn-primary" Text="Gửi Bình Luận"  OnClick="btnBL_Click"/>
                </div>
              </div>
            </form>
            <!-- Post comments-->
            <h3 class="h4 mb-4">Danh Sách Các Bình Luận</h3>
            <ul class="list-unstyled comments">
             <asp:Repeater ID="rptBinhLuan" runat="server">
                    <ItemTemplate>
               <li>
                <div class="media mb-4"><img class="rounded-circle shadow-sm img-fluid" src="../Content/person.jpg" alt="" width="60">
                  <div class="media-body ml-3">
                    <p class="small mb-0 text-primary"><%# Eval("dthoigian") %>"</p>
                    <h5><%# Eval("shoten") %></h5>
                    <p class="text-muted text-small mb-2"><%# Eval("snoidung") %></p>
                  </div>
                </div>
              </li>

                    </ItemTemplate>
                </asp:Repeater>
            
            </ul>
        


               </div>
                 </div>

          <!-- Blog sidebar-->
          <div class="col-lg-3">
            <!-- About category-->
            <div class="card rounded-0 border-0 bg-light mb-4 py-lg-4">
              <div class="card-body text-center">
                <h2 class="h3 mb-3">About me</h2><img class="rounded-circle mb-3" src="../Content/trangds/author.jpg" alt="..." width="100">
                <p class="text-small text-muted">Trang Web Làm Đẹp</p>
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
           
            <!-- Ad-->
           
          </div>
              <!-- Blog sidebar-->
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
            <p class="mb-0 text-muted text-small text-heading"><a href="" class="text-reset"></a>. </p>
          </div>
        </div>
      </div>
    </footer>

    <div class="collapse" id="style-switch">
     
      
      <p><img class="img-fluid" src="../Content/trangds/template-mac.png" alt=""></p>
      <p class="text-muted text-small"></p>
    </div>
    <!-- JavaScript files-->
    <script src="../Content/trangds/jquery_002.js"></script>
    <script src="../Content/trangds/bootstrap.js"></script>
    <script src="../Content/trangds/lightbox.js"></script>
    <script src="../Content/trangds/front.js"></script>
    <script src="../Content/trangds/jquery.js"> </script>
    <script src="../Content/trangds/demo.js"> </script>
    <!-- FontAwesome CSS - loading as last, so it doesn't block rendering-->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.1/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
  
<div id="lightboxOverlay" tabindex="-1" class="lightboxOverlay" style="display: none;"></div><div id="lightbox" tabindex="-1" class="lightbox" style="display: none;"><div class="lb-outerContainer"><div class="lb-container"><img class="lb-image" src="data:image/gif;base64,R0lGODlhAQABAIAAAP///wAAACH5BAEAAAAALAAAAAABAAEAAAICRAEAOw==" alt=""><div class="lb-nav"><a class="lb-prev" aria-label="Previous image" href=""></a><a class="lb-next" aria-label="Next image" href=""></a></div><div class="lb-loader"><a class="lb-cancel"></a></div></div></div><div class="lb-dataContainer"><div class="lb-data"><div class="lb-details"><span class="lb-caption"></span><span class="lb-number"></span></div><div class="lb-closeContainer"><a class="lb-close"></a></div></div></div></div></body></html>