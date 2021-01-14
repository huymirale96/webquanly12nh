<%@ Page Language="C#"  MasterPageFile="~/Layout/App.Master"  AutoEventWireup="true" CodeBehind="ThemTaiKhoan.aspx.cs" Inherits="WebLamDep.View.ThemTaiKhoan" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-12">
                <h1 class="page-header">THÊM TÀI KHOẢN</h1>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        Thông tin 
                    </div>
                    <div class="panel-body">
                        <div class="row">
                            <div class="text-center">
                                <asp:Label ID="lblNoti" runat="server" CssClass="label label-success" Text=""></asp:Label>
                                 <asp:Label ID="lblDaDuyet" CssClass="text-success" runat="server"></asp:Label>
                            </div>
                            <form method="post" runat="server" class="form-horizontal">
                                <div class="col-md-6">
                                    <div class="form-group">
                                         <label class="col-md-3 control-label-left">Họ Tên</label>
                                        <div class="col-md-9">
                                            <asp:TextBox ID="txtTen" runat="server" CssClass="form-control" />
                                        </div>
                                    </div>
                                   
                                    <div class="form-group">
                                        <label class="col-md-3 control-label-left">Giới tính</label>
                                        <div class="col-md-9">
                                           <asp:RadioButton runat="server" ID="nam"  GroupName="1quyen" Text="NAM"/>
                                           <asp:RadioButton runat="server" ID="nu" GroupName="1quyen" TEXT="NỮ"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                       
                                    </div>
                                    
                                    <div class="form-group">
                                        <label class="col-md-3 control-label-left">Số điện thoại</label>
                                        <div class="col-md-9">
                                            <asp:TextBox ID="sdtGV" MaxLength="10" runat="server" CssClass="form-control" />
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-3 control-label-left">Email</label>
                                        <div class="col-md-9">
                                            <asp:TextBox ID="emailGV" TextMode="Email" runat="server" CssClass="form-control" />
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-md-3 control-label-left">Tên Đăng Nhập</label>
                                        <div class="col-md-9">
                                            <asp:TextBox ID="txtTenDangNhap" runat="server" CssClass="form-control" />
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-md-3 control-label-left">Mật Khẩu</label>
                                        <div class="col-md-9">
                                            <asp:TextBox ID="txtMK" runat="server" CssClass="form-control" />
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-md-3 control-label-left">Quyền</label>
                                        <asp:RadioButton runat="server" ID="admin"  GroupName="quyen" Text="ADMIN"/>
                                        <asp:RadioButton runat="server" ID="member" GroupName="quyen" TEXT="MEMBER"/>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                   
                                  
                                </div>
                                <div class="col-md-12">
                                    <div class="pull-left">
                                       
                                        <asp:Button ID="btnSave" runat="server" CssClass="btn btn-primary" OnClick="btnSave_Click" Text="Lưu" />
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <style>
        .control-label-left{
            padding-top: 7px;
            margin-bottom: 0;
            text-align: left;
        }
    </style>
</asp:Content>