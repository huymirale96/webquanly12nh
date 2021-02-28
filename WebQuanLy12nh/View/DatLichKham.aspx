<%@ Page Language="C#"  MasterPageFile="~/Layout/App.Master"  AutoEventWireup="true" CodeBehind="DatLichKham.aspx.cs" Inherits="WebQuanLy12nh.View.DatLichKham" %>


<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .dropListCK {
            width: 356px;
            margin-left: 25px;
        }
        .rdBTN {
            margin-left: 20px;
        }

        .dsChuyenKhoa {
            display: none;
        }

        .form-control {
            margin-bottom: 14px !important;
        }
        

      

    </style>

    <div class="container-fluid">
        <div class="row">
            <div class="col-md-12">
                <h2 class="page-header">TẠO LỊCH KHÁM </h2>
            </div>
        </div>
        <div class="row">
            <div class="col-md-6">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        Chọn Bác Sĩ - Chuyên Khoa
                    </div>
                    <div class="panel-body">
                        <div class="row">
                            <div class="text-center">
                                <asp:Label ID="lblNoti" runat="server" CssClass="text-success" Text=""></asp:Label>
                                <br />
                                 <asp:Label ID="lbnoti2" CssClass="text-success" runat="server"></asp:Label>
                            </div>
                            <form method="post" runat="server" class="form-horizontal">
                                <asp:HiddenField ID="maBS" runat="server"/>
                                 <asp:HiddenField ID="ngayKham" runat="server"/>
                                <div class="col-md-6_" style="padding:10px;" id="chonChuyenKhoa" runat="server">
                                    <div class="form-group">
                                         <label class="col-md-3 control-label-left">Chuyên Khoa:</label>
                                        <div class="col-md-9">
                                           <asp:DropDownList ID="ddlChuyenKhoa" runat="server"  CssClass="form-control"></asp:DropDownList>
                                        </div>
                                    </div>

                                                                        <div class="form-group"  style="margin-top:15px;">
                                        <label class="col-md-3 control-label-left">Ngày Khám</label>
                                        <div class="col-md-9">
                                          <asp:TextBox TextMode="Date" runat="server"  CssClass="form-control" ID="txtNgayKham" ></asp:TextBox>
                                        </div>
                                    </div>
                                   
                                    <div class="form-group">
                                        <label class="col-md-3 control-label-left">Giới tính</label>
                                        <div class="col-md-6">
                                           <asp:RadioButton runat="server" ID="nam"  GroupName="1quyen" Text="NAM"/>
                                           <asp:RadioButton runat="server" ID="nu" GroupName="1quyen" TEXT="NỮ"/>
                                        </div>
                                        <div class="col-md-3">
                                                <asp:Button ID="chonBS" runat="server" CssClass="btn btn-default" OnClick="chonBS_Click" Text="Chọn"/>
                                        </div>
                                    </div>
                                  <h3>Danh Sách Bác Sĩ</h3>
                             <div class="col-md-12">
                                <table class="table table-bordered table-stripped">
							        <thead>
								        <tr>
									        <th class="text-center">STT</th>
									        <th class="text-center">Tên Bác Sĩ</th>
									       
									        <th class="text-center"> Tiền Phí</th>
                                              <th class="text-center"> Tác Vụ</th>
								        </tr>
							        </thead>
							        <tbody>
                                        <asp:Repeater ID="rptBS" runat="server">
                                            <ItemTemplate>
                                                <tr>
										            <td class="text-center"><%# Container.ItemIndex+1 %></td>
										            <td class="text-center"><%# Eval("shoten") %></td>
										            
											        <td class="text-center">
                                                        <a href="DatLichKham.aspx?cn=bs&id=<%# Eval("imanguoidung") %>&tenBS=<%# Eval("shoten") %>&ngaykham=<%#  ngaykham() %>" class="label label-danger">Chọn</a>
												    </td>
									            </tr>
                                            </ItemTemplate>
                                        </asp:Repeater>
							        </tbody>
						        </table>
                            </div>



                                </div>
                                <div class="col-md-6">
                                   
                                  
                                </div>
                                <div class="col-md-12">
                                    <div class="pull-left">
                                       
                                       
                                    </div>
                                </div>
                           
                        </div>
                    </div>
                </div>
            </div>


             <div class="col-md-6" style="background-color: #fff; " id="panelBN" runat="server">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        Thông Tin Bệnh Nhân
                    </div>
                    <div class="panel-body">
                        <div class="row">
                            <div class="text-center">
                                
                            </div>
                                <div class="col-md-6_" style="padding:0px;">
                                 
                                    <div class="form-group" style="margin-top:15px;" >
                                        <label class="col-md-3 control-label-left">Họ Tên:</label>
                                        <div class="col-md-9">
                                            <asp:TextBox ID="txtTen" runat="server" CssClass="form-control" />
                                        </div>
                                    </div>

                                     <div class="form-group"  style="margin-top:15px;">
                                        <label class="col-md-3 control-label-left">Địa Chỉ:</label>
                                        <div class="col-md-9">
                                            <asp:TextBox ID="txtDC" runat="server" CssClass="form-control" />
                                        </div>
                                    </div>
                                   
                                    <div class="form-group"  style="margin-top:15px;">
                                        <label class="col-md-3 control-label-left">Giới tính</label>
                                        <div class="col-md-9">
                                           <asp:RadioButton runat="server" ID="RadioButton1"  GroupName="gt_" Text="NAM"/>
                                           <asp:RadioButton runat="server" ID="RadioButton2" GroupName="gt_" TEXT="NỮ"/>
                                        </div>
                                    </div>

                                    <div class="form-group"  style="margin-top:15px;">
                                        <label class="col-md-3 control-label-left">Ngày Sinh</label>
                                        <div class="col-md-9">
                                          <asp:TextBox TextMode="Date" runat="server"  CssClass="form-control" ID="txtNS" ></asp:TextBox>
                                        </div>
                                    </div>

                                    
                                    <div class="form-group"  style="margin-top:15px;">
                                        <label class="col-md-3 control-label-left">Số điện thoại</label>
                                        <div class="col-md-9">
                                            <asp:TextBox ID="txtSDT" MaxLength="10" runat="server" CssClass="form-control" />
                                        </div>
                                    </div>
                                    <div class="form-group"  style="margin-top:15px;">
                                        <label class="col-md-3 control-label-left">Mã Bảo Hiểm: </label>
                                        <div class="col-md-9">
                                            <asp:TextBox ID="txtBH" runat="server" CssClass="form-control" />
                                        </div>
                                    </div>

                                      <div class="form-group"  style="margin-top:15px;">
                                        <label class="col-md-3 control-label-left">Note: </label>
                                        <div class="col-md-9">
                                            <asp:TextBox ID="txtNote" runat="server" TextMode="MultiLine" Rows="3" CssClass="form-control" />
                                        </div>
                                    </div>
                                
                                </div>
                                <div class="col-md-6">
                                   
                                  
                                </div>
                                <div class="col-md-12">
                                    <div class="pull-left">
                                       
                                       <asp:Button ID="btnSave" runat="server" CssClass="btn btn-primary" OnClick="btnSave_Click" Text="Lưu" />
                                    </div>
                                </div>
                           
                        </div>
                    </div>
                </div>
              </div>
        
        
        </div>
    </div>
</form>
    <style>
        .control-label-left{
            padding-top: 7px;
            margin-bottom: 0;
            text-align: left;
        }
    </style>
</asp:Content>