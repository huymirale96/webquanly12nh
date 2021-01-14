﻿
<%@ Page Language="C#" MasterPageFile="~/Layout/App.Master" AutoEventWireup="true"  CodeBehind="BaoCaoSoLanXemCuaMoiBai.aspx.cs" Inherits="WebLamDep.View.BaoCaoSoLanXemCuaMoiBai" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
   

  
    <div class="container-fluid">
        <form method="POST" class="form-horizontal" runat="server" enctype="multipart/form-data">
            <div class="row">
                <div class="col-md-12">
                    <h1 class="page-header"></h1>
                </div>
            </div>
            <div class="row">  <div class="col-md-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Báo Cáo Số Lượng Xem Của Mỗi Bài
                        </div>
                        <div class="panel-body">
                            <div class="text-center">
                                <asp:Label ID="lblNoti" runat="server" Text=""></asp:Label>
                            </div>
                            <div class="col-md-6">
                                <table class="table table-bordered table-stripped">
							        <thead>
								        <tr>
									        <th class="text-center">STT</th>
									        <th class="text-center">Bài Viết</th>
									       
									        <th class="text-center">Số Lượng Xem</th>
								        </tr>
							        </thead>
							        <tbody>
                                        <asp:Repeater ID="rptBaoCao" runat="server">
                                            <ItemTemplate>
                                                <tr>
										            <td class="text-center"><%# Container.ItemIndex+1 %></td>
										            <td class="text-center"><%# Eval("sTieuDe") %></td>
                                                    <td class="text-center"><%# Eval("ilanXem") %></td>
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