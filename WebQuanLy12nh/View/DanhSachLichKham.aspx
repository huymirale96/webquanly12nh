<%@ Page Language="C#"  MasterPageFile="~/Layout/App.Master" AutoEventWireup="true" CodeBehind="DanhSachLichKham.aspx.cs" Inherits="WebQuanLy12nh.View.DanhSachLichKham" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container-fluid">
        <form method="POST" class="form-horizontal" runat="server" enctype="multipart/form-data">
            <div class="row">
                <div class="col-md-12">
                    <h1 class="page-header">QUẢN LÝ DANH SÁCH LỊCH KHÁM</h1>
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
                         <label>NGÀY KHÁM</label>
                         </div>
                   
                     <div class="col-md-4">
                         
                         <asp:TextBox ID="ngay" TextMode="Date" runat="server"  CssClass="form-control"></asp:TextBox>
                      </div>
                     <div class="col-md-5">
                         <asp:button  ID="btnTim" CssClass="btn btn-success" runat="server" Text="Tìm Kiếm" OnClick="btnTim_Click"/>
                         </div>
                
                     </div>
                      

                            <div class="col-md-12" style="margin-top:25px;">
                                <table class="table table-bordered table-stripped">
							        <thead>
								        <tr>
									        <th class="text-center">STT</th>
									        <th class="text-center">HỌ TÊN BỆNH NHÂN</th>
									        <th class="text-center">ĐỊA CHỈ</th>
									        <th class="text-center">SĐT</th>
                                            <th class="text-center">BÁC SĨ</th>
                                             <th class="text-center">CHUYÊN KHOA</th>
                                             <th class="text-center">Ngày Tạo</th>
									          <th class="text-center">TÁC VỤ</th>
									        
									       
								        </tr>
							        </thead>
							        <tbody>
                                        <asp:Repeater ID="rptDanhSach" runat="server">
                                            <ItemTemplate>
                                                <tr>
										            <td class="text-center"><%# Container.ItemIndex+1 %></td>
										            <td class="left"><%# Eval("stenbenhnhan") %></td>
                                                    <td class="left"><%# Eval("sdiachi") %></td>
										         
                                                    <td class="left"><%# Eval("sSDT") %></td>
                                                    <td class="left"><%# Eval("shoten") %></td>
                                 
                                                    <td class="left"><%# Eval("stenchuyenkhoa").ToString().Equals("1") ? "MEMBER " : "ADMIN" %></td>
                                                    <td class="left"><%# Eval("dthoigiantao") %></td>
                                                    <td class="text-center"><a href="SuaTaiKhoan.aspx?id=<%# Eval("imalichhenkham") %>" class="btn btn-default">Sửa</a></td>   
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