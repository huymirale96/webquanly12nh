<%@ Page Title="" Language="C#" MasterPageFile="~/Layout/App.Master" AutoEventWireup="true" CodeBehind="Welcome.aspx.cs" Inherits="WebLamDep.View.Welcome" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <div class="wrapper wrapper-content animated fadeInRight">
            <div class="row">
                <div class="col-lg-12">
                    <div class="block-content block-content-full bg-primary-light" style="height: 100vh; text-align: center;">
                        <br/>
                        <i class="fa fa-newspaper-o fa-5x text-white" style="margin-top: 10px; font-size: 7em;"></i>
                        <div class="text-white-op push-15-t welcome-text">
                            Phần mềm quản lý WEBSITE CHIA SẺ KIẾN THỨC SẮC ĐẸP
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <style type="text/css">
        .welcome-text{
            font-size: 40px;
            margin-top: 10px;
        }
        @media screen and (max-width: 768px){
            .welcome-text{
                font-size: 30px;
                margin-top: 10px;
                padding-left: 15px;
                padding-right: 15px;
            }
        }
        @media screen and (max-width: 425px){
            .welcome-text{
                font-size: 25px;
                margin-top: 10px;
                padding-left: 10px;
                padding-right: 10px;
            }
        }
    </style>
</asp:Content>