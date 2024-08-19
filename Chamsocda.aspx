<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Chamsocda.aspx.cs" 
    Inherits="Doan_thuchanhnghenghiep.Chamsocda" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style  type="text/css">
body{background-color: #FEFBF4;}
.sanpham{
    width: 100%;
    margin-right: 40px;  
    margin-left: 40px;
    flex: 3; 
    margin-left: 10px;
    margin:5px 5px 5px 5px;
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
    justify-content: space-between; 
    align-items: flex-start;

 }
.tenloai {
    flex: 1; 
    margin-right: 10px;

}
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cph_homecontent" runat="server">
    <p style="font-family: 'Segoe UI'; color: black; font-size: 32px; text-align: center;">CHĂM SÓC DA</p><br />
<!-- Hiển thị danh sách sản phẩm loại chống nắng --> 
        <section class="container">
            <div class="tenloai">
                <p style="font-family: 'Segoe UI'; color: black; font-size: 32px; text-align: center;">Chống nắng</p><br />
            </div>
        <div class="sanpham">
         <asp:DataList ID="lstSanPham" runat="server"  DataKeyNames="MaSP"
                        DataSourceID="srcl1" RepeatColumns="3" style="text-align: left" Width="100%">
            <ItemTemplate>
                <div class="item-container">
                    <asp:Image ID="imgSanPham" runat="server" Height="350px" 
                                ImageUrl='<%# Eval("HinhSP") %>' Width="287px" /><br />
                <div class="tensanpham">
                    <asp:HyperLink ID="lnkSanPham" runat="server" NavigateUrl='<%# "Chonsanpham.aspx?MaSP=" + Eval("MaSP") %>' 
                                   Text='<%# Eval("TenSP") %>' ForeColor="Black" Font-Names="Segoe UI"  Font-Underline="False" Font-Size="16px">
                    </asp:HyperLink><br />
                </div>
                <div style="text-align: right">
                    <asp:Label ID="lblDonGia" runat="server" 
                                Text='<%# Eval("GiaBan","{0:0,000 VNĐ}") %>' Font-Names=" Segoe UI" Font-Size="24px" Font-Weight="true" >
                    </asp:Label>
                </div><br /></div>
            </ItemTemplate>
        </asp:DataList>
       </div>
    <asp:SqlDataSource ID="srcl1" runat="server" ConnectionString="<%$ ConnectionStrings:QLMPConnectionString %>" 
    SelectCommand="SELECT MaSP, TenSP, GiaBan, HinhSP FROM SanPham  where MaloaiSP='LSP01'"></asp:SqlDataSource>    
<!-- Hiển thị danh sách sản phẩm loại tẩy trang -->
    </section>
    <section class="container">
        <div class="tenloai">
            <p style="font-family: 'Segoe UI'; color: black; font-size: 32px; text-align: center;">Tẩy trang</p><br />
        </div>
        <div class="sanpham">
            <asp:DataList ID="DataList1" runat="server"  DataKeyNames="MaSP"
                          DataSourceID="srcl2" RepeatColumns="3" style="text-align: left" Width="100%">
                <ItemTemplate>
                    <div class="item-container">
                        <asp:Image ID="imgSanPham" runat="server" Height="350px" ImageUrl='<%# Eval("HinhSP") %>' Width="287px"/><br />
                        <div class="tensanpham">
                        <asp:HyperLink ID="lnkSanPham" runat="server" NavigateUrl='<%# "Chonsanpham.aspx?MaSP=" + Eval("MaSP") %>' 
                                        Text='<%# Eval("TenSP") %>' ForeColor="Black" Font-Names="Segoe UI"  Font-Underline="False" Font-Size="16px">
                        </asp:HyperLink><br />
                        </div>
                        <div style="text-align: right">
                            <asp:Label ID="lblDonGia" runat="server" Text='<%# Eval("GiaBan","{0:0,000 VNĐ}") %>' 
                                Font-Names=" Segoe UI" Font-Size="24px" Font-Weight="true" ></asp:Label>
                        </div><br /></div>
    </ItemTemplate>
</asp:DataList>
            </div>
<asp:SqlDataSource ID="srcl2" runat="server" 
    ConnectionString="<%$ ConnectionStrings:QLMPConnectionString %>" 
    SelectCommand="SELECT MaSP, TenSP, GiaBan, HinhSP FROM SanPham  where MaloaiSP='LSP02'"></asp:SqlDataSource>
<!-- Hiển thị danh sách sản phẩm loại sửa rửa mặt -->        
    </section>
            <section class="container">
            <div class="tenloai">
                <p style="font-family: 'Segoe UI'; color: black; font-size: 32px; text-align: center;">Sửa rửa mặt</p><br />
            </div>
        <div class="sanpham">
         <asp:DataList ID="DataList2" runat="server"  DataKeyNames="MaSP"
        DataSourceID="srcl3" RepeatColumns="3" style="text-align: left" Width="100%">
    <ItemTemplate>
        <div class="item-container">
        <asp:Image ID="imgSanPham" runat="server" Height="350px" ImageUrl='<%# Eval("HinhSP") %>' Width="287px" /><br />
        <div class="tensanpham">
        <asp:HyperLink ID="lnkSanPham" runat="server" NavigateUrl='<%# "Chonsanpham.aspx?MaSP=" + Eval("MaSP") %>' 
            Text='<%# Eval("TenSP") %>' ForeColor="Black" Font-Names="Segoe UI"  Font-Underline="False" Font-Size="16px">
        </asp:HyperLink><br /> </div>
            <div style="text-align: right">
        <asp:Label ID="lblDonGia" runat="server" 
            Text='<%# Eval("GiaBan","{0:0,000 VNĐ}") %>' Font-Names=" Segoe UI" Font-Size="24px" Font-Weight="true" >
        </asp:Label>
                </div> <br /></div>
    </ItemTemplate>
</asp:DataList>
            </div>
<asp:SqlDataSource ID="srcl3" runat="server" 
    ConnectionString="<%$ ConnectionStrings:QLMPConnectionString %>" 
    SelectCommand="SELECT MaSP, TenSP, GiaBan, HinhSP FROM SanPham  where MaloaiSP='LSP03'"> </asp:SqlDataSource>
<!-- Hiển thị danh sách sản phẩm loại tẩy tế bào chết -->        
    </section>
            <section class="container">
            <div class="tenloai">
                <p style="font-family: 'Segoe UI'; color: black; font-size: 32px; text-align: center;">Tẩy tế bào chết</p><br />
            </div>
        <div class="sanpham">
         <asp:DataList ID="DataList3" runat="server"  DataKeyNames="MaSP"
        DataSourceID="srcl4" RepeatColumns="3" style="text-align: left" Width="100%">
    <ItemTemplate>
        <div class="item-container">
        <asp:Image ID="imgSanPham" runat="server" Height="350px" ImageUrl='<%# Eval("HinhSP") %>' Width="287px" /><br />
        <div class="tensanpham">
        <asp:HyperLink ID="lnkSanPham" runat="server" NavigateUrl='<%# "Chonsanpham.aspx?MaSP=" + Eval("MaSP") %>' 
            Text='<%# Eval("TenSP") %>' ForeColor="Black" Font-Names="Segoe UI"  Font-Underline="False" Font-Size="16px">
        </asp:HyperLink><br /></div>
            <div style="text-align: right">
        <asp:Label ID="lblDonGia" runat="server" 
            Text='<%# Eval("GiaBan","{0:0,000 VNĐ}") %>' Font-Names=" Segoe UI" Font-Size="24px" Font-Weight="true" >
        </asp:Label>
                </div><br /></div>
    </ItemTemplate>
</asp:DataList>
            </div>
<asp:SqlDataSource ID="srcl4" runat="server" 
    ConnectionString="<%$ ConnectionStrings:QLMPConnectionString %>" 
    SelectCommand="SELECT MaSP, TenSP, GiaBan, HinhSP FROM SanPham  where MaloaiSP='LSP04'"></asp:SqlDataSource>
    </section>
<!-- Hiển thị danh sách sản phẩm loại mặt nạ -->
    <section class="container">
            <div class="tenloai">
                <p style="font-family: 'Segoe UI'; color: black; font-size: 32px; text-align: center;">Mặt nạ</p><br />
            </div>
        <div class="sanpham">
         <asp:DataList ID="DataList4" runat="server"  DataKeyNames="MaSP"
        DataSourceID="srcl5" RepeatColumns="3" style="text-align: left" Width="100%">
    <ItemTemplate>
        <div class="item-container">
        <asp:Image ID="imgSanPham" runat="server" Height="350px" ImageUrl='<%# Eval("HinhSP") %>' Width="287px" /> <br />
        <div class="tensanpham">
        <asp:HyperLink ID="lnkSanPham" runat="server" NavigateUrl='<%# "Chonsanpham.aspx?MaSP=" + Eval("MaSP") %>' 
            Text='<%# Eval("TenSP") %>' ForeColor="Black" Font-Names="Segoe UI"  Font-Underline="False" Font-Size="16px">
        </asp:HyperLink> <br />
        </div>
            <div style="text-align: right">
        <asp:Label ID="lblDonGia" runat="server" 
            Text='<%# Eval("GiaBan","{0:0,000 VNĐ}") %>' Font-Names=" Segoe UI" Font-Size="24px" Font-Weight="true" >
        </asp:Label>
                </div> <br /></div>
    </ItemTemplate>
</asp:DataList>
            </div>
<asp:SqlDataSource ID="srcl5" runat="server" 
    ConnectionString="<%$ ConnectionStrings:QLMPConnectionString %>" 
    SelectCommand="SELECT MaSP, TenSP, GiaBan, HinhSP FROM SanPham  where MaloaiSP='LSP05'">
    </asp:SqlDataSource>
<!-- Hiển thị danh sách sản phẩm loại nước cân bằng -->
    </section>
            <section class="container">
            <div class="tenloai">
                <p style="font-family: 'Segoe UI'; color: black; font-size: 32px; text-align: center;">Nước cân bằng</p><br />
            </div>
        <div class="sanpham">
         <asp:DataList ID="DataList5" runat="server"  DataKeyNames="MaSP"
        DataSourceID="srcl6" RepeatColumns="3" style="text-align: left" Width="100%">
    <ItemTemplate>
        <div class="item-container">
        <asp:Image ID="imgSanPham" runat="server" Height="350px" ImageUrl='<%# Eval("HinhSP") %>' Width="287px" /> <br />
        <div class="tensanpham">
        <asp:HyperLink ID="lnkSanPham" runat="server" NavigateUrl='<%# "Chonsanpham.aspx?MaSP=" + Eval("MaSP") %>' 
            Text='<%# Eval("TenSP") %>' ForeColor="Black" Font-Names="Segoe UI"  Font-Underline="False" Font-Size="16px">
        </asp:HyperLink><br />
        </div>
            <div style="text-align: right">
        <asp:Label ID="lblDonGia" runat="server" 
            Text='<%# Eval("GiaBan","{0:0,000 VNĐ}") %>' Font-Names=" Segoe UI" Font-Size="24px" Font-Weight="true" >
        </asp:Label>
                </div><br />  </div>
    </ItemTemplate>
</asp:DataList>
            </div>
<asp:SqlDataSource ID="srcl6" runat="server" 
    ConnectionString="<%$ ConnectionStrings:QLMPConnectionString %>" 
    SelectCommand="SELECT MaSP, TenSP, GiaBan, HinhSP FROM SanPham  where MaloaiSP='LSP06'">
    </asp:SqlDataSource>
<!-- Hiển thị danh sách sản phẩm loại tinh chất -->        
    </section>
            <section class="container">
            <div class="tenloai">
                <p style="font-family: 'Segoe UI'; color: black; font-size: 32px; text-align: center;">Tinh chất</p><br />
            </div>
        <div class="sanpham">
         <asp:DataList ID="DataList6" runat="server"  DataKeyNames="MaSP"
        DataSourceID="srcl7" RepeatColumns="3" style="text-align: left" Width="100%">
    <ItemTemplate>
        <div class="item-container">
        <asp:Image ID="imgSanPham" runat="server" Height="350px"  ImageUrl='<%# Eval("HinhSP") %>' Width="287px" /><br />
        <div class="tensanpham">
        <asp:HyperLink ID="lnkSanPham" runat="server" NavigateUrl='<%# "Chonsanpham.aspx?MaSP=" + Eval("MaSP") %>' 
            Text='<%# Eval("TenSP") %>' ForeColor="Black" Font-Names="Segoe UI"  Font-Underline="False" Font-Size="16px">
        </asp:HyperLink><br /></div>
            <div style="text-align: right">
        <asp:Label ID="lblDonGia" runat="server" 
            Text='<%# Eval("GiaBan","{0:0,000 VNĐ}") %>' Font-Names=" Segoe UI" Font-Size="24px" Font-Weight="true" >
        </asp:Label>
                </div> <br /></div>
    </ItemTemplate>
</asp:DataList>
            </div>
<asp:SqlDataSource ID="srcl7" runat="server" 
    ConnectionString="<%$ ConnectionStrings:QLMPConnectionString %>" 
    SelectCommand="SELECT MaSP, TenSP, GiaBan, HinhSP FROM SanPham  where MaloaiSP='LSP07'">
    </asp:SqlDataSource>
    </section>
<!-- Hiển thị danh sách sản phẩm loại dưỡng da -->
            <section class="container">
            <div class="tenloai">
                <p style="font-family: 'Segoe UI'; color: black; font-size: 32px; text-align: center;">Dưỡng da</p><br />
            </div>
        <div class="sanpham">
         <asp:DataList ID="DataList7" runat="server"  DataKeyNames="MaSP"
        DataSourceID="srcl8" RepeatColumns="3" style="text-align: left" Width="100%">
    <ItemTemplate>
        <div class="item-container">
        <asp:Image ID="imgSanPham" runat="server" Height="350px" ImageUrl='<%# Eval("HinhSP") %>' Width="287px" /><br />
        <div class="tensanpham">
        <asp:HyperLink ID="lnkSanPham" runat="server" NavigateUrl='<%# "Chonsanpham.aspx?MaSP=" + Eval("MaSP") %>' 
            Text='<%# Eval("TenSP") %>' ForeColor="Black" Font-Names="Segoe UI"  Font-Underline="False" Font-Size="16px">
        </asp:HyperLink><br /></div>
            <div style="text-align: right">
        <asp:Label ID="lblDonGia" runat="server" 
            Text='<%# Eval("GiaBan","{0:0,000 VNĐ}") %>' Font-Names=" Segoe UI" Font-Size="24px" Font-Weight="true" >
        </asp:Label>
                </div><br /></div>
    </ItemTemplate>
</asp:DataList>
            </div>
<asp:SqlDataSource ID="srcl8" runat="server" 
    ConnectionString="<%$ ConnectionStrings:QLMPConnectionString %>" 
    SelectCommand="SELECT MaSP, TenSP, GiaBan, HinhSP FROM SanPham  where MaloaiSP='LSP08'">
    </asp:SqlDataSource>       
    </section>
<!-- Hiển thị danh sách sản phẩm loại xịt khoáng -->
    <section class="container">
            <div class="tenloai">
                <p style="font-family: 'Segoe UI'; color: black; font-size: 32px; text-align: center;">Xịt khoáng</p><br />
            </div>
        <div class="sanpham">
         <asp:DataList ID="DataList8" runat="server"  DataKeyNames="MaSP"
        DataSourceID="srcl9" RepeatColumns="3" style="text-align: left" Width="100%">
    <ItemTemplate>
        <div class="item-container">
        <asp:Image ID="imgSanPham" runat="server" Height="350px" 
             ImageUrl='<%# Eval("HinhSP") %>' Width="287px" /> <br />
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
<asp:SqlDataSource ID="srcl9" runat="server" 
    ConnectionString="<%$ ConnectionStrings:QLMPConnectionString %>" 
    SelectCommand="SELECT MaSP, TenSP, GiaBan, HinhSP FROM SanPham  where MaloaiSP='LSP09'">
    </asp:SqlDataSource>
    </section>
</asp:Content>
