<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Chonsanpham.aspx.cs" Inherits="Doan_thuchanhnghenghiep.Chonsanpham" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style8 {
            width: 150px;
        }
        .auto-style9 {
            width: 650px;
            height: 566px;
            margin-right: 10px;
        }
        .tb{
            margin-top: 90px;
            height: 580px;
            margin-bottom: 30px;
        }
        body{
            background-color: #FEFBF4;
            height: 580px;
        }
        .pricebox{
            background-color: #FEFBF4;
            border-width: 1px;
            text-align: center;
            height: 30px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cph_homecontent" runat="server" style="background-color: #FEFBF4">
    <div class="body">
    <table class="tb">
    <tr>
        <td><div class="auto-style8"></div></td>
        <td class="auto-style9">
            <div class="auto-style9">
                <asp:Image runat="server" Height="650px" Width="541px" ID="imgHinh" />
            </div>  
        </td>
        <td>
            <h3>&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="lblTenSP" runat="server" Font-Names="Plus Jakarta Sans" Font-Size="32px"></asp:Label></h3>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="lblMaSP" runat="server" ForeColor="Black" style="font-size: 24px" Font-Names="Plus Jakarta Sans"></asp:Label>
            <br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <span style="font-size: 24px; font-family: 'Plus Jakarta Sans';" >Số lượng:</span>&nbsp;
            <asp:TextBox ID="txtSoluong" runat="server" Text="1" Width="24px" Font-Size="24pt" CssClass="pricebox"></asp:TextBox>&nbsp;&nbsp;
            <asp:Label ID="lblDonVi" runat="server" style="font-size: 24px" Font-Names="Plus Jakarta Sans"></asp:Label>
            <br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="lblDonGia" runat="server" style="font-size: 24px; font-weight:bold;" Font-Names="Plus Jakarta Sans"></asp:Label><br />
            <asp:Image ID="im1"  runat="server" ImageUrl="~/Hinh/poschon2.PNG" Height="100px"  Width="600px"/><br />
            <asp:Image ID="im2" class="cnbd" runat="server" ImageUrl="~/Hinh/poschon1.PNG"  Height="100px"  Width="400px"/>
        </td>
    </tr>
    <tr><td></td><td></td>
        <td>
            <asp:Button ID="butInsert" runat="server" Text="Thêm vào giỏ hàng" onclick="butInsert_Click"
                ForeColor="White" Width="400px" height="60px" BackColor="Black" BorderStyle="None" Font-Size="20px" />
        </td>
    </tr>
</table>
    </div>
</asp:Content>


