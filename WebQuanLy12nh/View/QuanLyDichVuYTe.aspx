<%@ Page Language="C#" MasterPageFile="~/Layout/App.Master" AutoEventWireup="true"  CodeBehind="QuanLyDichVuYTe.aspx.cs" Inherits="WebQuanLy12nh.View.ThemLoaiBai" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script>
function suaLoaiBai(id, ten)
{
    //alert(ten + id);
    $("#divTenLoaiBai").html("<div class='col-md-8'> <input name='ten' class='form-control' value='" + ten + "'/>" + "<input type='hidden' name='id' class='form-control' value='" + id + "'/></div><div class='col-md-3'><input type='submit' class='btn btn-success' value = 'Cập Nhật'/>  ");
    $("#myModalSuaLoaiBai").modal();
}
    </script>

     <!-- Modal -->
  <div class="modal fade" id="myModalSuaLoaiBai" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Sửa Dịch Vụ Y Tế</h4>
        </div>
        <div class="modal-body">
            <form method="get">
          <label>Tên Loài Bài</label>
            <div id="divTenLoaiBai" class="row">
               
            </div>
                </form>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>
  
    <div class="container-fluid">
        <form method="POST" class="form-horizontal" runat="server" enctype="multipart/form-data">
            <div class="row">
                <div class="col-md-12">
                    <h1 class="page-header">QUẢN LÝ DỊCH VỤ Y TẾ</h1>
                </div>
            </div>
            <div class="row">  <div class="col-md-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Danh Sách Dịch VỤ Y Tế
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
									        <th class="text-center">Tên Dịch Vụ</th>
									       
									        <th class="text-center"> Tiền Phí</th>
                                              <th class="text-center"> Tác Vụ</th>
								        </tr>
							        </thead>
							        <tbody>
                                        <asp:Repeater ID="rptLoaiBai" runat="server">
                                            <ItemTemplate>
                                                <tr>
										            <td class="text-center"><%# Container.ItemIndex+1 %></td>
										            <td class="text-center"><%# Eval("stendichvu") %></td>
                                                    <td class="text-center"><%# Eval("itienphi") %></td>
										            
											        <td class="text-center">
                                                        <p class="btn btn-default" onclick="suaDichVu('<%# Eval("stendichvu") %>', '<%# Eval("itienphi") %>')">Sửa</p>
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
            <div class="row">
                <div class="col-md-12">
                    <div class="panel panel-default">
                        <div class="panel-heading" id="titleForm" runat="server">
                            Thêm Dịch Vụ Y Tế
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="col-md-4">Tên Dịch Vụ</label>
                                        <div class="col-md-8">
                                            <asp:TextBox ID="tenDichVu" CssClass="form-control" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-4">Tiền Phí</label>
                                        <div class="col-md-8">
                                            <asp:TextBox ID="tienPhi" CssClass="form-control" runat="server" onkeypress="validateNumber()"></asp:TextBox>
                                        </div>
                                    </div>
                                    <asp:Button ID="btnThem" runat="server" CssClass="btn btn-primary" OnClick="btnThem_Click" Text="Lưu" />
                                </div>
                                <div class="col-md-6">
                                  
                                </div>
                                <div class="col-md-12">
                                    <div class="pull-right">
                                        
                                        <%--<asp:Button ID="btnSaveFix" Visible="false" runat="server" CssClass="btn btn-primary" OnClick="btnSaveFix_Click" Text="Lưu" />
                                        <asp:Button ID="btnHuy" Visible="false" runat="server" CssClass="btn btn-default" OnClick="btnHuy_Click" Text="Huỷ" ToolTip="Huỷ chỉnh sửa" />--%>
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
        .control-label-left{
            padding-top: 7px;
            margin-bottom: 0;
            text-align: left;
        }
    </style>
</asp:Content>