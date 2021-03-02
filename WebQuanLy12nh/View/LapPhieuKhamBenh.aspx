<%@ Page Language="C#" MasterPageFile="~/Layout/App.Master" AutoEventWireup="true" CodeBehind="LapPhieuKhamBenh.aspx.cs" Inherits="WebQuanLy12nh.View.LapPhieuKhamBenh" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
       
    <div class="container-fluid">
        <form method="POST" class="form-horizontal" runat="server" enctype="multipart/form-data">
            <div class="row">
                <div class="col-md-12">
                    <h1 class="page-header">Phiếu Khám Bệnh</h1>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Danh sách tài khoản Quản Trị
                            <asp:Button ID="btnHoanThanh" runat="server" CssClass="btn btn-sm btn-info pull-right btnHT" OnClick="btnHoanThanh_Click" Text="Hoàn Thành"/>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div>
                                    <asp:Label ID="txtTen" runat="server" CssClass="lead textHead" Text="ABC"></asp:Label>
                                    <asp:Label ID="Label1" runat="server" CssClass="lead textHead" Text="ABC"></asp:Label>
                                    <asp:Label ID="Label2" runat="server" CssClass="lead textHead" Text="ABC"></asp:Label>
                                    <asp:Label ID="Label3" runat="server" CssClass="lead textHead" Text="ABC"></asp:Label>
                                </div>
                                <div style="margin-left: 20px; margin-top: 7px;">
                                    <label>
                                        Tiểu Sử Bệnh:
                                    </label>
                                    <asp:TextBox ID="txtTieuSu" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="3"></asp:TextBox>

                                                           <label>
                                        Cận Lâm Sàng:
                                    </label>
                                    <asp:TextBox ID="txtCanLamSang" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="3"></asp:TextBox>

                                                           <label>
                                        Chuẩn Đoán:
                                    </label>
                                    <asp:TextBox ID="txtChuanDoan" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="3"></asp:TextBox>

                                         <label>
                                        Hướng Điều Trị:
                                    </label>
                                    <asp:TextBox ID="txtDieuTri" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="3"></asp:TextBox>

                                </div>
                            </div>
                            <div class="col-md-6">
                                <h2>Các Dịch Vụ Y Tế</h2>
                                <span class="btn btn-success" style="margin-bottom: 14px;"  data-toggle="modal" data-target="#myModal">Thêm</span>
                                <div>
                                     <table class="table table-bordered table-stripped">
							        <thead>
								        <tr>
									        <th class="text-center">STT</th>
                                            <th class="text-center">Tên Dịch Vụ</th>
									        <th class="text-center">Số Lượng</th>
									        <th class="text-center">Giá</th>
									        <th class="text-center">Tiền Phí</th>
									          <th class="text-center">TÁC VỤ</th>
									        
									       
								        </tr>
							        </thead>
							        <tbody>
                                        <asp:Repeater ID="rptDanhSach" runat="server">
                                            <ItemTemplate>
                                                <tr>
                                                    <td class="text-center"><%# Container.ItemIndex+1 %></td>
                                               
                                                     </tr>
                                            </ItemTemplate>
                                        </asp:Repeater> 
                                        <tr>
                                         <td colspan="4" class="text-center">Tổng Cộng: </td>
                                         <td colspan="2" class="text-center" id="tongCong" runat="server">1000</td>
                                       </tr>

							        </tbody>

                                    
						        </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

             <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Thêm Dịch Vụ</h4>
        </div>
       
        <div class="modal-footer">
          <div class="row">
                                <div class="col-md-9">
                                    <div class="form-group">
                                        <label class="col-md-4 text-left">Tên Dịch Vụ</label>
                                        <div class="col-md-8">
                                        <asp:DropDownList ID="listDV" runat="server" CssClass="form-control"></asp:DropDownList>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-4 text-left">Số Lượng</label>
                                        <div class="col-md-8">
                                            <asp:TextBox ID="soLuong" TextMode="Number" ClientIDMode="Inherit" CssClass="form-control" runat="server" onkeypress="validateNumber()"></asp:TextBox>
                                            <asp:RegularExpressionValidator ID="da" runat="server" ControlToValidate="soLuong" ErrorMessage="*" ValidationExpression="^[1-9][0-9]*$" ForeColor="Red"></asp:RegularExpressionValidator>
                                        </div>
                                    </div>
                                    <asp:Button ID="btnThem" runat="server" CssClass="btn btn-primary" Text="Lưu" />
                                </div>
                              
                                <div class="col-md-12">
                                    <div class="pull-right">
                                        
                                      
                                </div>
                            </div>
        </div>
      </div>
      
    </div>
  </div>

        </form>
    </div>
    <style>
        .control-label-left {
            padding-top: 7px;
            margin-bottom: 0;
            text-align: left;
        }

        .textHead {
            margin-bottom: 0px !important;
            display:block;
            margin-left: 20px;
        }

        .btnHT {
        padding-bottom: 0px;
width: 150px;
        }
    </style>
</asp:Content>
