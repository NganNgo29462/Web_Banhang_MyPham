<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Sanpham.aspx.cs" Inherits="Doan_thuchanhnghenghiep.Sanpham" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style  type="text/css">
body{
      background-color: #FEFBF4;
}
.sanpham{
     margin:5px 5px 5px 5px;
}
.sanpham{
     width: 100%;
     margin-right: 40px;  
     margin-left: 40px;
}
.item-container{
     margin-top:20px;
     width: 285px;
}
.tensanpham{
     margin-top: 20px;
     width:290px;
     height: 60px;
}
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cph_homecontent" runat="server">
    <p style="font-family: 'Segoe UI'; color: black; font-size: 32px; text-align: center;">TẤT CẢ SẢN PHẨM</p><br />
        <section>
        <div class="sanpham">
         <asp:DataList ID="lstSanPham" runat="server"  DataKeyNames="MaSP"
        DataSourceID="srcLoai" RepeatColumns="4" style="text-align: left" Width="100%">
    <ItemTemplate>
        <div class="item-container">
        <asp:Image ID="imgSanPham" runat="server" Height="350px" 
             ImageUrl='<%# Eval("HinhSP") %>' Width="287px" /><br />
        <div class="tensanpham">
        <asp:HyperLink ID="lnkSanPham" runat="server" 
            NavigateUrl='<%# "Chonsanpham.aspx?MaSP=" + Eval("MaSP") %>' 
            Text='<%# Eval("TenSP") %>' ForeColor="Black" Font-Names="Segoe UI"  Font-Underline="False" Font-Size="16px">
        </asp:HyperLink><br />
        </div>
            <div style="text-align: right">
        <asp:Label ID="lblDonGia" runat="server" 
            Text='<%# Eval("GiaBan","{0:0,000 VNĐ}") %>' Font-Names=" Segoe UI" Font-Size="24px" Font-Weight="true" >
        </asp:Label>
                </div> <br />
        </div>
    </ItemTemplate>
</asp:DataList>
            </div>
<asp:SqlDataSource ID="srcLoai" runat="server" 
    ConnectionString="<%$ ConnectionStrings:QLMPConnectionString %>" 
    SelectCommand="SELECT MaSP, TenSP, GiaBan, HinhSP FROM SanPham  ORDER BY TenSP">
    </asp:SqlDataSource>
    </section>
</asp:Content>
