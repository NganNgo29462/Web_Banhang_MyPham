<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Chamsoctoc.aspx.cs" Inherits="Doan_thuchanhnghenghiep.Chamsoctoc" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style  type="text/css">
body{
    background-color: #FEFBF4;
}
.sanpham{
     margin:5px 5px 5px 5px;
     width: 100%;
     margin-right: 40px;  
     margin-left: 40px;
     flex: 3; 
     margin-left: 10px;
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
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cph_homecontent" runat="server">
    <p style="font-family: 'Segoe UI'; color: black; font-size: 32px; text-align: center;">CHĂM SÓC TÓC</p><br />
<!-- Hiển thị danh sách sản phẩm loại dầu gội -->
        <section class="container">
            <div class="tenloai">
                <p style="font-family: 'Segoe UI'; color: black; font-size: 32px; text-align: center;">Dầu gội</p><br />
            </div>
        <div class="sanpham">
         <asp:DataList ID="lstSanPham" runat="server"  DataKeyNames="MaSP"
        DataSourceID="srcl1" RepeatColumns="3" style="text-align: left" Width="100%">
    <ItemTemplate>
        <div class="item-container">
        <asp:Image ID="imgSanPham" runat="server" Height="350px" 
             ImageUrl='<%# Eval("HinhSP") %>' Width="287px" /><br />
        <div class="tensanpham">
        <asp:HyperLink ID="lnkSanPham" runat="server" 
            NavigateUrl='<%# "Chonsanpham.aspx?MaSP=" + Eval("MaSP") %>' 
            Text='<%# Eval("TenSP") %>' ForeColor="Black" Font-Names="Segoe UI"  Font-Underline="False" Font-Size="16px">
        </asp:HyperLink> <br />
        </div>
            <div style="text-align: right">
        <asp:Label ID="lblDonGia" runat="server" 
            Text='<%# Eval("GiaBan","{0:0,000 VNĐ}") %>' Font-Names=" Segoe UI" Font-Size="24px" Font-Weight="true" >
        </asp:Label>
                </div><br />
        </div>
    </ItemTemplate>
</asp:DataList>
            </div>
<asp:SqlDataSource ID="srcl1" runat="server" 
    ConnectionString="<%$ ConnectionStrings:QLMPConnectionString %>" 
    SelectCommand="SELECT MaSP, TenSP, GiaBan, HinhSP FROM SanPham  where MaloaiSP='LSP10'">
    </asp:SqlDataSource>
    </section>
    <!-- Hiển thị danh sách sản phẩm loại kem ủ -->
    <section class="container">
            <div class="tenloai">
                <p style="font-family: 'Segoe UI'; color: black; font-size: 32px; text-align: center;">Kem ủ</p><br />
            </div>
        <div class="sanpham">
         <asp:DataList ID="DataList1" runat="server"  DataKeyNames="MaSP"
        DataSourceID="srcl2" RepeatColumns="3" style="text-align: left" Width="100%">
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
<asp:SqlDataSource ID="srcl2" runat="server" 
    ConnectionString="<%$ ConnectionStrings:QLMPConnectionString %>" 
    SelectCommand="SELECT MaSP, TenSP, GiaBan, HinhSP FROM SanPham  where MaloaiSP='LSP11'">
    </asp:SqlDataSource>  
    </section>
    <!-- Hiển thị danh sách sản phẩm loại dầu xả -->
            <section class="container">
            <div class="tenloai">
                <p style="font-family: 'Segoe UI'; color: black; font-size: 32px; text-align: center;">Dầu xả</p><br />
            </div>
        <div class="sanpham">
         <asp:DataList ID="DataList2" runat="server"  DataKeyNames="MaSP"
        DataSourceID="srcl3" RepeatColumns="3" style="text-align: left" Width="100%">
    <ItemTemplate>
        <div class="item-container">
        <asp:Image ID="imgSanPham" runat="server" Height="350px" 
             ImageUrl='<%# Eval("HinhSP") %>' Width="287px" /><br />
        <div class="tensanpham">
        <asp:HyperLink ID="lnkSanPham" runat="server" 
            NavigateUrl='<%# "Chonsanpham.aspx?MaSP=" + Eval("MaSP") %>' 
            Text='<%# Eval("TenSP") %>' ForeColor="Black" Font-Names="Segoe UI"  Font-Underline="False" Font-Size="16px">
        </asp:HyperLink> <br />
        </div>
            <div style="text-align: right">
        <asp:Label ID="lblDonGia" runat="server" 
            Text='<%# Eval("GiaBan","{0:0,000 VNĐ}") %>' Font-Names=" Segoe UI" Font-Size="24px" Font-Weight="true" >
        </asp:Label>
                </div><br />
        </div>
    </ItemTemplate>
</asp:DataList>
            </div>
<asp:SqlDataSource ID="srcl3" runat="server" 
    ConnectionString="<%$ ConnectionStrings:QLMPConnectionString %>" 
    SelectCommand="SELECT MaSP, TenSP, GiaBan, HinhSP FROM SanPham  where MaloaiSP='LSP12'">
    </asp:SqlDataSource>
    </section>
    <!-- Hiển thị danh sách sản phẩm loại nước dưỡng tóc -->
            <section class="container">
            <div class="tenloai">
                <p style="font-family: 'Segoe UI'; color: black; font-size: 32px; text-align: center;">Nước dưỡng tóc</p><br />
            </div>
        <div class="sanpham">
         <asp:DataList ID="DataList3" runat="server"  DataKeyNames="MaSP"
        DataSourceID="srcl4" RepeatColumns="3" style="text-align: left" Width="100%">
    <ItemTemplate>
        <div class="item-container">
        <asp:Image ID="imgSanPham" runat="server" Height="350px" 
             ImageUrl='<%# Eval("HinhSP") %>' Width="287px" /><br />
        <div class="tensanpham">
        <asp:HyperLink ID="lnkSanPham" runat="server" 
            NavigateUrl='<%# "Chonsanpham.aspx?MaSP=" + Eval("MaSP") %>' 
            Text='<%# Eval("TenSP") %>' ForeColor="Black" Font-Names="Segoe UI"  Font-Underline="False" Font-Size="16px">
        </asp:HyperLink> <br />
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
<asp:SqlDataSource ID="srcl4" runat="server" 
    ConnectionString="<%$ ConnectionStrings:QLMPConnectionString %>" 
    SelectCommand="SELECT MaSP, TenSP, GiaBan, HinhSP FROM SanPham  where MaloaiSP='LSP13'">
    </asp:SqlDataSource> 
    </section>
    <!-- Hiển thị danh sách sản phẩm loại tinh chất dưỡng tóc -->
            <section class="container">
            <div class="tenloai">
                <p style="font-family: 'Segoe UI'; color: black; font-size: 32px; text-align: center;">Tinh chất dưỡng tóc</p><br />
            </div>
        <div class="sanpham">
         <asp:DataList ID="DataList4" runat="server"  DataKeyNames="MaSP"
        DataSourceID="srcl5" RepeatColumns="3" style="text-align: left" Width="100%">
    <ItemTemplate>
        <div class="item-container">
        <asp:Image ID="imgSanPham" runat="server" Height="350px" 
             ImageUrl='<%# Eval("HinhSP") %>' Width="287px" />
        <br />
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
                </div><br />
        </div>
    </ItemTemplate>
</asp:DataList>
            </div>
<asp:SqlDataSource ID="srcl5" runat="server" 
    ConnectionString="<%$ ConnectionStrings:QLMPConnectionString %>" 
    SelectCommand="SELECT MaSP, TenSP, GiaBan, HinhSP FROM SanPham  where MaloaiSP='LSP14'">
    </asp:SqlDataSource>
    </section>
</asp:Content>
