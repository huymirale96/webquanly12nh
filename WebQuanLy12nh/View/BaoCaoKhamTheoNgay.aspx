<%@ Page Language="C#"   MasterPageFile="~/Layout/App.Master" AutoEventWireup="true" CodeBehind="BaoCaoKhamTheoNgay.aspx.cs" Inherits="WebQuanLy12nh.View.BaoCaoKhamTheoNgay" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container-fluid">
        <form method="POST" class="form-horizontal" runat="server" enctype="multipart/form-data">
            <div class="row">
                <div class="col-md-12">
                    <h1 class="page-header">Báo Cáo Khám Bệnh Theo Thời Gian</h1>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Danh sách 
                        </div>
                        <div class="panel-body">
                            <div class="text-center">
                                <asp:Label ID="lblNoti" runat="server" Text=""></asp:Label>
                            </div>
                       
                <div class="row">
                        <div class="col-md-2">
                         <labe style="margin:5px;">NGÀY KHÁM</labe>
                         </div>
                     <div class="col-md-3">
                         <asp:TextBox ID="ngayDau" TextMode="Date" runat="server"  CssClass="form-control"></asp:TextBox>
                      </div>
                                         <div class="col-md-4">
                         <asp:TextBox ID="ngayCuoi" TextMode="Date" runat="server"  CssClass="form-control"></asp:TextBox>
                      </div>
                     <div class="col-md-3">
                         <asp:button  ID="btnTim" CssClass="btn btn-success" runat="server" Text="Tìm Kiếm" OnClick="btnTim_Click"/>
                         </div>

                     
                
                     </div>
                      

                            <div class="col-md-12" style="margin-top:25px;">
                                <table class="table table-bordered table-stripped">
							        <thead>
								        <tr>
									        <th class="text-center">STT</th>
                                            <th class="text-center">Chuyên Khoa</th>
									        <th class="text-center">Số Lượng Khám</th>
									        <th class="text-center">Tổng Tiền Phí</th>
								        </tr>
							        </thead>
							        <tbody>
                                        <asp:Repeater ID="rptDanhSach" runat="server">
                                            <ItemTemplate>
                                                <tr>
                                                    <td class="text-center"><%# Container.ItemIndex+1 %></td>
										            <td class="text-center"><%# Eval("sTenChuyenKhoa") %></td>
                                                    <td class="text-center"><%# Eval("luotKham") %></td>
                                                    <td class="text-center"><%# chuyenSangTien(Eval("tongTien").ToString()) %></td>
                                                </tr>
                                            </ItemTemplate>

                                        </asp:Repeater>     
                                           <tr>
                                                <td  colspan="2" class="text-center">Tổng Tiền:</td>
                                                <td class="text-center" id="tongSL" runat="server">0</td>
                                                <td class="text-center" id="tongTien" runat="server">0</td>
                                            </tr>
                                         
							        </tbody>

                                    
						        </table>
                              
                            </div>


                             <div class="col-md-3">
                         <asp:button  ID="btnKNhi" CssClass="btn btn-success" runat="server" Text="BN Khoa Nhi" OnClick="btnKNhi_Click"/>
                         </div>
                              <div class="col-md-12" style="margin-top:25px;">
                                <table class="table table-bordered table-stripped">
							        <thead>
								        <tr>
									        <th class="text-center">STT</th>
                                            <th class="text-center">Tên Bệnh Nhân</th>
									      
								        </tr>
							        </thead>
							        <tbody>
                                        <asp:Repeater ID="Repeater1" runat="server">
                                            <ItemTemplate>
                                                <tr>
                                                    <td class="text-center"><%# Container.ItemIndex+1 %></td>
										            <td class="text-center"><%# Eval("sTenBenhNhan") %></td>
                                                   
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