<%@ Page Language="C#"  MasterPageFile="~/Layout/App.Master"  AutoEventWireup="true" CodeBehind="DanhSachBaiDangCuaNguoiDung.aspx.cs" Inherits="WebLamDep.View.DanhSachBaiDangCuaNguoiDung" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container-fluid">
        <form method="POST" class="form-horizontal" runat="server" enctype="multipart/form-data">
            <div class="row">
                <div class="col-md-12">
                    <h1 class="page-header">QUẢN LÝ DANH SÁCH BÀI ĐĂNG</h1>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Danh sách BÀI ĐĂNG
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
									        <th class="text-center">TIÊU ĐỀ</th>
									        <th class="text-center">MÔ TẢ</th>
									        <th class="text-center">HÌNH ẢNH</th>
                                            <th class="text-center">LOẠI TIN</th>
                                             <th class="text-center">NGƯỜI ĐĂNG</th>
									        <th class="text-center">THỜI GIAN</th>
                                              <th class="text-center">Số Lần Xem</th>
                                             <th class="text-center">TRẠNG THÁI</th>
                                            <th class="text-center">SỬA</th>
									        
									        
								        </tr>
							        </thead>
							        <tbody>
                                        <asp:Repeater ID="rptDanhSach" runat="server">
                                            <ItemTemplate>
                                                <tr>
										            <td class="text-center"><%# Container.ItemIndex+1 %></td>
										            <td class="left"><%# Eval("stieude") %></td>
                                                    <td class="left"><%# Eval("smota") %></td>
										            <td class="left"><img src="../IMAGES/<%# Eval("surlanh") %>" style="height:150px; width: 150px;" /></td>
                                                    <td class="left"><%# Eval("stenloaibai") %></td>
                                                    <td class="left"><%# Eval("shoten") %></td>
                                                    <td class="left"><%# Eval("dngaydang") %></td>
                                                     <td class="left"><%# Eval("iLanXem") %></td>
                                                     <td class="left"><%# Eval("imanguoiduyet").ToString().Equals("") ? "Chưa Duyệt" : "Đã Duyệt" %></td>
											         <td class="left"><a href="SuaBaiViet.aspx?id=<%# Eval("iMaBaiViet") %>" ><label class="label label-default">Sửa Bài Viết</label></a></td>
									            </tr>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                         
							        </tbody>

                                    
						        </table>
                                <asp:Label ID="url" runat="server" Text="Label"></asp:Label>
                                   
                                    <asp:HiddenField ID="pageid" runat="server" value="1"/>

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