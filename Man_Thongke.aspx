<%@ Page Title="" Language="C#" MasterPageFile="~/SiteManager.Master" AutoEventWireup="true" CodeBehind="Man_Thongke.aspx.cs" Inherits="Doan_thuchanhnghenghiep.Man_Thongke" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
.auto-style12 {
    width: 50px;
}
.auto-style15 {
    width: 1497px;
}
.auto-style {
    width: 1497px;
}
 .auto-style15 td{
     height: 140px;
     width: 140px;
     padding: 30px;
 }   
 .auto-style15 th{
     width: 200px;
     
     height: 300px;
 }
.lbl{
     font-family:   'Segoe UI';
     font-size: 34px;
     color: papayawhip;
}
.lblunder{
     font-family:   'Segoe UI';
     font-size: 32px;
     color: papayawhip;
     font-weight: bold;
}
.grid-view table {
    border-collapse: collapse;
    width: 100%;
}
.grid-view th, .grid-view td {
    border: 1px solid #333; 
    padding: 8px;
    text-align: left;
}
.grid-view th {
    background-color: #C5A25D;
    color: white;
    height: 70px;
    font-size: 20px;
}
.grid-view tr:nth-child(even) {
    background-color: #f2f2f2;
}
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cph_homecontent2" runat="server">
        <p style="font-family: 'Plus Jakarta Sans'; color: rgba(197, 162, 93, 1); font-size: 32px; text-align: center;">THỐNG KÊ</p><br />
    <!-- Thống kê số liệu -->
    <table class="auto-style15" border-spacing: 40px;">
    <tr>
        <td  style="background-color:#6B4723">
            <div >
                <asp:Label ID="Label1" runat="server" Text="Số khách hàng" CssClass="lbl"></asp:Label><br>
                <asp:Label ID="lblskh" runat="server" Text="Label"  CssClass="lblunder"></asp:Label>
            </div>
        </td>        
        <td style="background-color:#85582B; height: 140px;">
            <div>
                <asp:Label ID="Label2" runat="server" Text="Số hóa đơn" CssClass="lbl"></asp:Label> <br>
                <asp:Label ID="lblshd" runat="server" Text="Label" CssClass="lblunder"></asp:Label>
            </div>
        </td>
        <td style="background-color:#A16B35">
           <div CssClass="con3">
               <asp:Label ID="Label5" runat="server" Text="Số sản phẩm đã bán" CssClass="lbl"></asp:Label><br>
                <asp:Label ID="lblsp" runat="server" Text="Label" CssClass="lblunder"></asp:Label>
            </div>
        </td>
        <td style="background-color:#C4884C">
            <div CssClass="con4">
                <asp:Label ID="Label4" runat="server" Text="Tổng doanh thu" CssClass="lbl" ></asp:Label><br>
                <asp:Label ID="lbldt" runat="server" Text="Label" CssClass="lblunder" DataFormatString="{0:0,000}"></asp:Label>
            </div>
        </td>        
    </tr>
    </table>
     <!-- Thống kê loại và dòng sản phẩm -->
    <table class="auto-style15" style=" border-spacing: 40px;">
    <tr style="background-color: antiquewhite;">
        <th colspan="2" >
            <div style="font-family: 'Segoe UI Semibold'; font-size: 30px;">
                <br /><asp:Label ID="Label3" runat="server" Text="Loại sản phẩm được mua nhiều nhất" 
                    ForeColor="#6B4723" > </asp:Label><br />
                <asp:Label ID="lbllsp" runat="server" Text="Label" Font-Size="55px" ForeColor="#C4884C"></asp:Label>
            </div>
        </th>
        <th colspan="2">
            <div style="font-family: 'Segoe UI Semibold'; font-size: 30px;">
                <br /><asp:Label ID="Label6" runat="server" Text="Dòng sản phẩm được mua nhiều nhất"
                    ForeColor="#6B4723" > </asp:Label><br />
                <asp:Label ID="lbldsp" runat="server" Text="Label" Font-Size="55px" ForeColor="#C4884C"></asp:Label>
            </div>
        </th>
    </tr>
</table>
        <!-- Thống kê top 10 -->
<table class="auto-style">
    <tr>
        <td>
            <p style="font-family: 'Segoe UI Black'; color: #6B4723; font-size: xx-large; text-align: center"> Top 10 sản phẩm bán chạy nhất</p>
        </td>
        <td><div class="auto-style12"></div></td>
        <td>
            <p style="font-family: 'Segoe UI Black'; color: #6B4723; font-size: xx-large; text-align: center"> Top 10 hóa đơn có doanh thu cao nhất</p>
        </td>
    </tr>
    <tr>
        <td>
    <asp:GridView ID="grdSP" runat="server" AllowPaging="True" 
    AutoGenerateColumns="False" CellPadding="4" DataKeyNames="MaSP" DataSourceID="srcSP" GridLines="Horizontal" 
    PageSize="20" Width="100%" BackColor="White" BorderColor="#C5A25D" BorderStyle="Double" BorderWidth="3px">
    <RowStyle BackColor="White" ForeColor="#333333" />
    <Columns>               
 <asp:BoundField DataField="MaSP" HeaderText="Mã sản phẩm" ReadOnly="True" SortExpression="MaSP" >
 <HeaderStyle Width="120px" HorizontalAlign="Left" />
     <ItemStyle BorderColor="#C5A25D" BorderStyle="Solid" BorderWidth="1px" />
 </asp:BoundField>
 <asp:BoundField DataField="TenSP" HeaderText="Tên sản phẩm" >
     <HeaderStyle Width="360px" HorizontalAlign="Left" />
     <ItemStyle BorderColor="#C5A25D" BorderStyle="Solid" BorderWidth="1px" />
</asp:BoundField>
<asp:BoundField DataField="SoLuongBan" HeaderText="Số lượng bán" SortExpression="SoLuongBan">
     <HeaderStyle Width="120px" HorizontalAlign="Left"/>
    <ItemStyle BorderColor="#C5A25D" BorderStyle="Solid" BorderWidth="1px" />
</asp:BoundField>
    </Columns>
   <FooterStyle BackColor="#009FE3" ForeColor="#333333" />
    <FooterStyle ForeColor="#C5A25D" Font-size="20px"/>
    <PagerStyle BackColor="#C5A25D" ForeColor="White" HorizontalAlign="Center" />
    <SelectedRowStyle BackColor="#C5A25D" Font-Bold="True" ForeColor="White" />
    <HeaderStyle BackColor="#C5A25D" Font-Bold="True" ForeColor="White" Height="70px" Font-Size="20px"/>
</asp:GridView>
    <asp:SqlDataSource ID="srcSP" runat="server" 
ConnectionString="<%$ ConnectionStrings:QLMPConnectionString %>" 
SelectCommand="SELECT Top 10 SanPham.MaSP, TenSP, SUM(CTHoaDon.SoLuongHD) AS SoLuongBan 
            FROM SanPham  JOIN CTHoaDon  ON SanPham.MaSP = CTHoaDon.MaSP 
            GROUP BY SanPham.MaSP, SanPham.TenSP, SoLuongHD
            ORDER BY SoLuongBan DESC;">
    </asp:SqlDataSource>
        </td>
        <td ><div class="auto-style12"></div></td>
        <td>
    <asp:GridView ID="grhd" runat="server" AllowPaging="True" 
    AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Mahd" 
    DataSourceID="srchd" GridLines="Horizontal" 
    PageSize="20" Width="100%" BackColor="White" BorderColor="#C5A25D" BorderStyle="Double" BorderWidth="3px">
    <RowStyle BackColor="White" ForeColor="#333333" />
    <Columns>               
 <asp:BoundField DataField="MaHD" HeaderText="Mã hóa đơn" ReadOnly="True" SortExpression="MaHD" >
 <HeaderStyle Width="120px" HorizontalAlign="Left" />
     <ItemStyle BorderColor="#C5A25D" BorderStyle="Solid" BorderWidth="1px" />
 </asp:BoundField>
 <asp:BoundField DataField="MaKH" HeaderText="Mã khách hàng" SortExpression="MaKH">
     <HeaderStyle Width="150px" HorizontalAlign="Left" />
     <ItemStyle BorderColor="#C5A25D" BorderStyle="Solid" BorderWidth="1px" />
</asp:BoundField>

<asp:BoundField DataField="Ngayban" HeaderText="Ngày bán" SortExpression="Ngayban">
     <HeaderStyle Width="250px" HorizontalAlign="Left"/>
    <ItemStyle BorderColor="#C5A25D" BorderStyle="Solid" BorderWidth="1px" />
</asp:BoundField>
<asp:BoundField DataField="Doanhthu" HeaderText="Doanh thu" SortExpression="Doanhthu" DataFormatString="{0:0,000}">
     <HeaderStyle Width="120px" HorizontalAlign="Left"/>
    <ItemStyle BorderColor="#C5A25D" BorderStyle="Solid" BorderWidth="1px" />
</asp:BoundField>
    </Columns>
       <FooterStyle ForeColor="#C5A25D" Font-size="20px"/>
    <PagerStyle BackColor="#C5A25D" ForeColor="White" HorizontalAlign="Center" />
    <SelectedRowStyle BackColor="#C5A25D" Font-Bold="True" ForeColor="White" />
    <HeaderStyle BackColor="#C5A25D" Font-Bold="True" ForeColor="White" Height="70px" Font-Size="20px"/>
</asp:GridView>
    <asp:SqlDataSource ID="srchd" runat="server" 
ConnectionString="<%$ ConnectionStrings:QLMPConnectionString %>" 
SelectCommand="SELECT Top 10 HoaDon.MaHD, MAKH, Ngayban, SUM(SoLuongHD*GiaBan) AS Doanhthu 
            FROM HoaDon  JOIN CTHoaDon  ON HoaDon.MaHD = CTHoaDon.MaHD 
            GROUP BY HoaDon.MaHD, MAKH, Ngayban, SoLuongHD, GiaBan
            ORDER BY Doanhthu DESC;">
           
    </asp:SqlDataSource>
        </td>
    </tr>
</table>
</asp:Content>
