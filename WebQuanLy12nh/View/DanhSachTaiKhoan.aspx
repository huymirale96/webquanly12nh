<%@ Page Language="C#"  MasterPageFile="~/Layout/App.Master"   AutoEventWireup ="true" CodeBehind="DanhSachTaiKhoan.aspx.cs" Inherits="WebQuanLy12nh.View.DanhSachTaiKhoan" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container-fluid">
        <form method="POST" class="form-horizontal" runat="server" enctype="multipart/form-data">
            <div class="row">
                <div class="col-md-12">
                    <h1 class="page-header">QUẢN LÝ DANH SÁCH TÀI KHOẢN</h1>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Danh sách tài khoản Quản Trị
                        </div>
                        <div class="panel-body">
                            <div class="text-center">
                                <asp:Label ID="lblNoti" runat="server" Text=""></asp:Label>
                            </div>
                            <div class="col-md-12">
                                <table class="table table-bordered table-stripped">
							        <thead>
								        <tr>
									        <th class="text-center">STT</th>
									        <th class="text-center">HỌ TÊN</th>
									        <th class="text-center">TÊN ĐĂNG NHẬP</th>
									        <th class="text-center">SĐT</th>
                                            <th class="text-center">EMAIL</th>
                                             <th class="text-center">QUYỀN</th>
									          <th class="text-center">TÁC VỤ</th>
									        
									       
								        </tr>
							        </thead>
							        <tbody>
                                        <asp:Repeater ID="rptDanhSach" runat="server">
                                            <ItemTemplate>
                                                <tr>
										            <td class="text-center"><%# Container.ItemIndex+1 %></td>
										            <td class="left"><%# Eval("shoten") %></td>
                                                    <td class="left"><%# Eval("susername") %></td>
										         
                                                    <td class="left"><%# Eval("sSDT") %></td>
                                                    <td class="left"><%# Eval("semail") %></td>
                                 
                                                    <td class="left"><%# Eval("iMaQuyen").ToString().Equals("2") ? "MEMBER " : "ADMIN" %></td>
                                                     <td class="text-center"><a href="SuaTaiKhoan.aspx?id=<%# Eval("imanguoidung") %>&quyen=<%# Eval("imaquyen") %>" class="btn btn-default">Sửa</a></td>   
									            </tr>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                         
							        </tbody>

                                    
						        </table>
                              
                            </div>
                        </div>
                    </div>
                </div>

                 <div class="col-md-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Danh sách tài khoản Bác Sĩ
                        </div>
                        <div class="panel-body">
                            <div class="text-center">
                                <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
                            </div>
                            <div class="col-md-12">
                                <table class="table table-bordered table-stripped">
							        <thead>
								        <tr>
									        <th class="text-center">STT</th>
									        <th class="text-center">HỌ TÊN</th>
									        <th class="text-center">TÊN ĐĂNG NHẬP</th>
									        <th class="text-center">SĐT</th>
                                            <th class="text-center">EMAIL</th>
                                             <th class="text-center">CHUYÊN KHOA</th>
									          <th class="text-center">TÁC VỤ</th>
									        
									       
								        </tr>
							        </thead>
							        <tbody>
                                        <asp:Repeater ID="rptDanhSachBS" runat="server">
                                            <ItemTemplate>
                                                <tr>
										            <td class="text-center"><%# Container.ItemIndex+1 %></td>
										            <td class="text-center"><%# Eval("shoten") %></td>
                                                    <td class="text-center"><%# Eval("susername") %></td>
										         
                                                    <td class="text-center"><%# Eval("sSDT") %></td>
                                                    <td class="text-center"><%# Eval("semail") %></td>
                                 
                                                    <td class="text-center"><%# Eval("stenchuyenkhoa") %></td>
                                                     <td class="text-center"><a href="SuaTaiKhoan.aspx?id=<%# Eval("imanguoidung") %>&quyen=<%# Eval("imaquyen") %>" class="btn btn-default">Sửa</a></td>   
									            </tr>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                         
							        </tbody>

                                    
						        </table>
                              
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            
        </form>
    </div>
    <style>
        .control-label-left{
            padding-top: 7px;
            margin-bottom: 0;
            text-align: left;
        }
    </style>
</asp:Content>