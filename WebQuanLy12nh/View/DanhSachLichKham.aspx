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
                                            <th class="text-center">Mã Hẹn Khám</th>
									        <th class="text-center">HỌ TÊN BỆNH NHÂN</th>
									        <th class="text-center">ĐỊA CHỈ</th>
									        <th class="text-center">SĐT</th>
                                            <th class="text-center">BÁC SĨ</th>
                                             <th class="text-center">CHUYÊN KHOA</th>
                                             <th class="text-center">Ngày Tạo</th>
                                             <th class="text-center">Trạng Thái</th>
									          <th class="text-center">TÁC VỤ</th>
									        
									       
								        </tr>
							        </thead>
							        <tbody>
                                        <asp:Repeater ID="rptDanhSach" runat="server">
                                            <ItemTemplate>
                                                <tr>
                                                    <td class="text-center"><%# Container.ItemIndex+1 %></td>
                                                    <td class="text-center" style='width: 10%;'>MH<%# Eval("imalichhenkham") %></td>
										            <td class="text-center"><%# Eval("stenbenhnhan") %></td>
                                                    <td class="text-center"><%# Eval("sdiachi") %></td>
										         
                                                    <td class="text-center"><%# Eval("sSDT") %></td>
                                                    <td class="text-center"><%# Eval("shoten") %></td>
                                 
                                                    <td class="text-center"><%# Eval("stenchuyenkhoa")%></td>
                                                    <td class="left"  style='width: 10%;'><%# Eval("dthoigiantao") %></td>
                                                     <td class="text-center"><%# trangThai(Eval("itrangthai").ToString()) %></td>
                                               

                                                     <td class="text-center">  <asp:LinkButton ID="btnDel"  CssClass="btn btn-xs btn-danger" ToolTip="Xoá " runat="server" OnClick="btnDel_Click" OnClientClick="return confirm('Bạn có chắc chắn xoá ?')" CommandArgument='<%# Eval("imalichhenkham") %>'><i class="fa fa-times" aria-hidden="true"></i></asp:LinkButton></td>
										          
                                                     </tr>
                                            </ItemTemplate>
                                        </asp:Repeater>                                                     <td class="text-center"><%# trangThai(Eval("itrangthai").ToString()) %></td>
                                         
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