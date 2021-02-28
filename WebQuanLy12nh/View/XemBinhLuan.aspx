<%@ Page Language="C#"  MasterPageFile="~/Layout/App.Master"   AutoEventWireup ="true" CodeBehind="XemBinhLuan.aspx.cs" Inherits="WebLamDep.View.XemBinhLuan" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container-fluid">
        <form method="POST" class="form-horizontal" runat="server" enctype="multipart/form-data">
            <asp:HiddenField ID="maBai" runat="server"/>
            <div class="row">
                <div class="col-md-12">
                    <h1 class="page-header">QUẢN LÝ DANH SÁCH Bình Luận</h1>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Danh sách
                        </div>
                        <div class="panel-body">
                            <div class="form-group">
                                        <label class="col-md-2 control-label-left">Tiêu Đề</label>
                                        <label class="col-md-2 control-label-left" style="clear: both;">
                                        <asp:Label runat="server" ID="soLuongcmt"></asp:Label></label>
                                        <div class="col-md-8">
                                            <asp:TextBox ID="tieuDe"  CssClass="form-control" runat="server" TextMode="MultiLine" Rows="3"  ReadOnly="true"  ></asp:TextBox>
                                        </div>
                                </div>
                            <div class="text-center">
                                <asp:Label ID="lblNoti" runat="server" Text=""></asp:Label>
                            </div>
                            <div class="col-md-12">
                                       
                                <table class="table table-bordered table-stripped">
							        <thead>
								        <tr>
									        <th class="text-center">STT</th>
									        <th class="text-center">HỌ TÊN</th>
									        <th class="text-center">Email</th>
									        <th class="text-center">Nội Dung</th>
                                            <th class="text-center">Thời Gian</th>
                     
									          <th class="text-center">TÁC VỤ</th>
									        
									       
								        </tr>
							        </thead>
							        <tbody>
                                        <asp:Repeater ID="rptDanhSach" runat="server">
                                            <ItemTemplate>
                                                <tr>
										            <td class="text-center"><%# Container.ItemIndex+1 %></td>
										            <td class="left"><%# Eval("shoten") %></td>
                                                    <td class="left"><%# Eval("semail") %></td>
										         
                                                    <td class="left"><%# Eval("sNoiDung") %></td>
                                                    <td class="left"><%# Eval("dThoigian") %></td>
                                 
                                                    <td class="text-center">
                                                           <asp:LinkButton ID="btxXoa" CssClass="btn btn-xs btn-primary" ToolTip="Xoá" runat="server" OnClick="btxXoa_Click2"       CommandArgument='<%# Eval("iMaBinhLuan") %>'>Xoá</asp:LinkButton>
                                                    </td>   
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
