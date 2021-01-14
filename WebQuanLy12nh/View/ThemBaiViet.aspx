<%@ Page Language="C#" MasterPageFile="~/Layout/App.Master" AutoEventWireup="true" CodeBehind="ThemBaiViet.aspx.cs" Inherits="WebLamDep.View.ThemBaiViet" %>
<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container-fluid">
        <form method="POST" class="form-horizontal" runat="server" enctype="multipart/form-data">
            <div class="row">
                <div class="col-md-12">
                    <h1 class="page-header">----------</h1>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                           THÊM BÀI VIẾT
                        </div>
                        <div class="panel-body">
                            <div class="text-center">
                                <asp:Label ID="lblNoti" runat="server" Text="" CssClass="text-success"></asp:Label>
                            </div>
                            <div class="col-md-12">
                                                            <div class="col-md-6">
                                <div class="form-group">
                                        <label class="col-md-2 control-label-left">LOẠI BÀI ĐĂNG</label>
                                        <div class="col-md-8">
                                            <asp:DropDownList ID="ddlLoaiBia"  CssClass="form-control" runat="server"></asp:DropDownList>
                                        </div>
                                </div>
                                                                </div>
                                <div class="col-md-6">
                                <div class="form-group">
                                        <label class="col-md-4 control-label-left">HÌNH ĐẠI DIỆN</label>
                                        <div class="col-md-8">
                                           <asp:FileUpload runat="server" ID="fileAnh"  CssClass="form-control" />
                                        </div>
                                </div>
                                    </div>
                            </div>
                            <div class="col-md-12">
                                  <div class="form-group">
                                        <label class="col-md-2 control-label-left">Tiêu Đề</label>
                                        <div class="col-md-8">
                                            <asp:TextBox ID="tieuDe"  CssClass="form-control" runat="server" TextMode="MultiLine" Rows="3" ></asp:TextBox>
                                        </div>
                                </div>
                                <div class="form-group">
                                        <label class="col-md-2 control-label-left">Mô Tả</label>
                                        <div class="col-md-8">
                                            <asp:TextBox ID="mota"  CssClass="form-control" runat="server" TextMode="MultiLine" Rows="2" ></asp:TextBox>
                                        </div>
                                </div>
                                </div>
                            <div class="col-md-12">
                               
                                 <div class="form-group">
            <div class="col-md-12" style="margin: 20px;"<label class="col-md-4 control-label-left">NỘI DUNG</label></div>
             <br />
            <CKEditor:CKEditorControl ID="txtNoidung" runat="server"></CKEditor:CKEditorControl>
             </div>
                                </div>
                        </div>
                    </div>
                </div>
            </div>

            <asp:Button ID="btnHoanThanh" runat="server" CssClass="btn btn-success" Text="HOÀN THÀNH" OnClick="btnHoanThanh_Click"/>
            
           
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