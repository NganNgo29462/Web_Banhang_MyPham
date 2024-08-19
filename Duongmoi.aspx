<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Duongmoi.aspx.cs" Inherits="Doan_thuchanhnghenghiep.Duongmoi" %>
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
 .container {
    display: flex;
    justify-content: space-between; /* Adjust as needed for spacing */
    align-items: flex-start; /* Align items to the top */
}

.tenloai {
    flex: 1; /* Take available space */
    margin-right: 10px; /* Adjust spacing as needed */
}

.sanpham {
    flex: 3; /* Take more space */
    margin-left: 10px; /* Adjust spacing as needed */
}
 
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cph_homecontent" runat="server">
    <p style="font-family: 'Segoe UI'; color: black; font-size: 32px; text-align: center;">DƯỠNG MÔI</p><br />

        <section class="container">
            <div class="tenloai">
                <p style="font-family: 'Segoe UI'; color: black; font-size: 32px; text-align: center;">Tẩy tế bào chết môi</p><br />

            </div>
        <div class="sanpham">
         <asp:DataList ID="lstSanPham" runat="server"  DataKeyNames="MaSP"
        DataSourceID="srcl1" RepeatColumns="3" style="text-align: left" Width="100%">
    <ItemTemplate>
        <div class="item-container">
        <asp:Image ID="imgSanPham" runat="server" Height="350px" 
             ImageUrl='<%# Eval("HinhSP") %>' Width="287px" />
        <br />
        <div class="tensanpham">
        <asp:HyperLink ID="lnkSanPham" runat="server" 
            NavigateUrl='<%# "Chonsanpham.aspx?MaSP=" + Eval("MaSP") %>' 
            Text='<%# Eval("TenSP") %>' ForeColor="Black" Font-Names="Segoe UI"  Font-Underline="False" Font-Size="16px">
        </asp:HyperLink>
        <br />
        </div>
            <div style="text-align: right">
        <asp:Label ID="lblDonGia" runat="server" 
            Text='<%# Eval("GiaBan","{0:0,000 VNĐ}") %>' Font-Names=" Segoe UI" Font-Size="24px" Font-Weight="true" >
        </asp:Label>
                </div>
        <br />
          
        </div>
    </ItemTemplate>
</asp:DataList>
            </div>
<asp:SqlDataSource ID="srcl1" runat="server" 
    ConnectionString="<%$ ConnectionStrings:QLMPConnectionString %>" 
    SelectCommand="SELECT MaSP, TenSP, GiaBan, HinhSP FROM SanPham  where MaloaiSP='LSP19'">
    </asp:SqlDataSource>
        
    </section>
            <section class="container">
            <div class="tenloai">
                <p style="font-family: 'Segoe UI'; color: black; font-size: 32px; text-align: center;">Dưỡng ẩm môi</p><br />

            </div>
        <div class="sanpham">
         <asp:DataList ID="DataList1" runat="server"  DataKeyNames="MaSP"
        DataSourceID="srcl2" RepeatColumns="3" style="text-align: left" Width="100%">
    <ItemTemplate>
        <div class="item-container">
        <asp:Image ID="imgSanPham" runat="server" Height="350px" 
             ImageUrl='<%# Eval("HinhSP") %>' Width="287px" />
        <br />
        <div class="tensanpham">
        <asp:HyperLink ID="lnkSanPham" runat="server" 
            NavigateUrl='<%# "Chonsanpham.aspx?MaSP=" + Eval("MaSP") %>' 
            Text='<%# Eval("TenSP") %>' ForeColor="Black" Font-Names="Segoe UI"  Font-Underline="False" Font-Size="16px">
        </asp:HyperLink>
        <br />
        </div>
            <div style="text-align: right">
        <asp:Label ID="lblDonGia" runat="server" 
            Text='<%# Eval("GiaBan","{0:0,000 VNĐ}") %>' Font-Names=" Segoe UI" Font-Size="24px" Font-Weight="true" >
        </asp:Label>
                </div>
        <br />
          
        </div>
    </ItemTemplate>
</asp:DataList>
            </div>
<asp:SqlDataSource ID="srcl2" runat="server" 
    ConnectionString="<%$ ConnectionStrings:QLMPConnectionString %>" 
    SelectCommand="SELECT MaSP, TenSP, GiaBan, HinhSP FROM SanPham  where MaloaiSP='LSP20'">
    </asp:SqlDataSource>
        
    </section>
           
</asp:Content>
