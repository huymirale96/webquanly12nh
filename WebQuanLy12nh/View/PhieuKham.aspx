<%@ Page Language="C#" MasterPageFile="~/Layout/App.Master" AutoEventWireup="true" CodeBehind="PhieuKham.aspx.cs" Inherits="WebQuanLy12nh.View.PhieuKham" %>


<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container-fluid">
        <form method="POST" class="form-horizontal" runat="server" enctype="multipart/form-data">
            <asp:HiddenField ID="maLichHen" runat="server" />
            <div class="row">
                <div class="col-md-12">
                    <h1 class="page-header">Xem Phiếu Khám Bệnh</h1>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Phiếu Khám Bệnh
                            
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="ttbn">
                                    <div class="alert alert-info">
                                        <strong>Thông Tin Bệnh Nhân</strong>
                                    </div>
                                   <div style="margin-left: 15px;">
                                    <asp:Label ID="txtTen" runat="server" CssClass="lead textHead" Text="ABC"></asp:Label>
                                    <asp:Label ID="txtDiaCHi" runat="server" CssClass="lead textHead" Text="ABC"></asp:Label>
                                    <asp:Label ID="txtSoDienThoai" runat="server" CssClass="lead textHead" Text="ABC"></asp:Label>
                                    <asp:Label ID="txtNS" runat="server" CssClass="lead textHead" Text="ABC"></asp:Label>
                                    <asp:Label ID="txtBaoHiem" runat="server" CssClass="lead textHead" Text="ABC"></asp:Label>
                                   </div>
                                </div>
                                <div style="margin-left: 20px; margin-top: 7px; margin-bottom: 50px;">
                                    <label>
                                        Tiểu Sử Bệnh:
                                    </label>
                                    <asp:TextBox ID="txtTieuSu" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="6"></asp:TextBox>

                                    <label>
                                        Cận Lâm Sàng:
                                    </label>
                                    <asp:TextBox ID="txtCanLamSang" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="6"></asp:TextBox>

                                    <label>
                                        Chuẩn Đoán:
                                    </label>
                                    <asp:TextBox ID="txtChuanDoan" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="6"></asp:TextBox>

                                    <label>
                                        Hướng Điều Trị:
                                    </label>
                                    <asp:TextBox ID="txtDieuTri" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="6"></asp:TextBox>

                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="ttbn" style="margin-left: -1px;">
                                    <div class="alert alert-info">
                                        <strong>***</strong>
                                    </div>
                                    <div style="margin-left: 15px;">
                                    <asp:Label ID="txtBacSi" runat="server" CssClass="lead textHead" Text="ABC"></asp:Label>
                                    <asp:Label ID="txtThoiian" runat="server" CssClass="lead textHead" Text="ABC"></asp:Label>
                                    </div>
                                </div>
                                <h2>Các Dịch Vụ Y Tế</h2>
                                <div>
                                    <table class="table table-bordered table-stripped">
                                        <thead>
                                            <tr>
                                                <th class="text-center">STT</th>
                                                <th class="text-center">Tên Dịch Vụ</th>
                                                <th class="text-center">Giá</th>
                                                <th class="text-center">Số Lượng</th>

                                                <th class="text-center">Tiền Phí</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <asp:Repeater ID="rptDanhSach" runat="server">
                                                <ItemTemplate>
                                                    <tr>
                                                        <td class="text-center"><%# Container.ItemIndex+1 %></td>
                                                        <td class="text-center"><%# Eval("stendichvu") %></td>
                                                        <td class="text-center"><%# Eval("iTienPhi") %></td>
                                                        <td class="text-center"><%# Eval("iSoLuong") %></td>
                                                        <td class="text-center"><%# Eval("iTongTien") %></td>
                                                    </tr>
                                                </ItemTemplate>
                                            </asp:Repeater>
                                            <tr>
                                                <td colspan="4" class="text-center">Tổng Cộng: </td>
                                                <td colspan="2" class="text-center" id="tongCong" runat="server">0</td>
                                            </tr>

                                        </tbody>


                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
    </div>

    </form>
    </div>
    <style>
     
        .ttbn {
       background-color: #3297ca;
    color: #e8f1f7;
    border-radius: 4px;
    margin-top: 5px;
    margin-left: 19px;
       height: 227px;
}
      .lead {
      display: table-header-group;
      }
    </style>
</asp:Content>
