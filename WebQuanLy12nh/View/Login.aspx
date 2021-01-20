<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="WebLamDep.View.Login" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <title>Đăng nhập</title>

        <!-- Bootstrap Core CSS -->
        <link href="../Content/bootstrap.min.css" rel="stylesheet">

        <!-- MetisMenu CSS -->
        <link href="../Content/metisMenu.min.css" rel="stylesheet">

        <!-- Custom CSS -->
        <link href="../Content/startmin.css" rel="stylesheet">

        <!-- Custom Fonts -->
        <link href="../Content/font-awesome.min.css" rel="stylesheet" type="text/css">

  
    </head>
    <body>
    <div class="container">
            <div class="row">
                <div class="col-md-4 col-md-offset-4">
                    <div class="login-panel panel panel-default">
                        <div class="panel-heading">
                            <h3 class="panel-title text-center">Đăng nhập hệ thống</h3>
                        </div>
                        <div class="panel-body">
                            <form method="POST" runat="server">
                                <fieldset>
                                    <div class="form-group">
                                        <asp:TextBox ID="txtTaiKhoan" CssClass="form-control" runat="server" placeholder="Tài khoản"></asp:TextBox>
                                    </div>
                                    <div class="form-group">
                                        <asp:TextBox ID="txtMatKhau" TextMode="Password" CssClass="form-control" runat="server" placeholder="Mật khẩu"></asp:TextBox>
                                    </div>
                                    <div class="col-md-12 text-center">
                                        <asp:Label ID="lblNoti" runat="server" Text="" CssClass="text-danger"></asp:Label>
                                    </div>
                                    <!-- Change this to a button or input when using this as a form -->
                                    <asp:Button ID="btnLogin" runat="server" Text="Đăng nhập" OnClick="btnLogin_Click" CssClass="btn btn-lg btn-success btn-block" />
                                </fieldset>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- jQuery -->
        <script src="../Scripts/jquery.min.js"></script>

        <!-- Bootstrap Core JavaScript -->
        <script src="../Scripts/bootstrap.min.js"></script>

        <!-- Metis Menu Plugin JavaScript -->
        <script src="../Scripts/metisMenu.min.js"></script>

        <!-- Custom Theme JavaScript -->
        <script src="../Scripts/startmin.js"></script>
</body>
</html>
