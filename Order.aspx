<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Order.aspx.cs" Inherits="Doan_thuchanhnghenghiep.Order" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style  type="text/css">
 body{
     background-color: #FEFBF4;
 }
.con{
    display: flex;
    flex-direction: row;
}
.col1{
    flex: 2; 
}
.col1 h2, h3{
    text-align:center;
    color: #C5A25D;
}
.col2{
    flex: 1; 
    color: rgba(31, 28, 23);
    font-size: 14px;
    background-color: #FEFBF4;
}
.col2 h3{
    text-align:center;
    color: #C5A25D;
}
.txb{
    border-color: rgba(31, 28, 23);
    border-radius: 6px;
    border-style: solid;
    border-width: 1px;
    background-color: #FEFBF4
}
.tx{
    color: rgba(31, 28, 23);
    text-align:right;
    margin-top: 20px;
}
.btn{
    height: 40px;
    background-color: #C5A25D;
    color: white;
    border: none;
    width: 150px;
    font-family: 'Segoe UI';
    font-weight: bold;
    padding: 10px 20px;
    cursor: pointer;
    display: inline-block;
    transition: background-color 0.3s ease;
    justify-content:center;
    display:flex;
    margin: 0 20px;
    font-size: 16px;
}   
.tb {
    border-collapse: separate; 
    border-spacing: 0 20px;
}
.btn:hover{
    background-color: #FEFBF4;
    color: #C5A25D;
    border-color: #C5A25D;
}
.gridview{
    width: 800px;
}
.gridview table {
    border-collapse: collapse;
    width: 100%;
}
.gridview th, .grid-view td {
    padding: 8px;
    text-align: left;
    height: 40px;
}
.gridview th {
    background-color: #C5A25D;
    color: white;
    height: 50px;
    font-size: 20px;
}
.gridview tr:nth-child(even) {
    background-color: #f2f2f2;
}
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cph_homecontent" runat="server">
           <section class="con">
    <div class="col1" style="color: #0033CC">
        <!-- Bảng dữ liệu -->
    <h2>ĐƠN HÀNG</h2>
    <h3>THÔNG TIN ĐƠN HÀNG</h3>             
    <asp:GridView ID="grdDonHang" runat="server" CssClass="gridview" 
        AutoGenerateColumns="False" CellPadding="4" BackColor="White" BorderColor="#336666" BorderStyle="Double" 
        BorderWidth="3px" GridLines="Horizontal">
                <RowStyle BackColor="White" ForeColor="#333333" Height="50px"/>
        <Columns>
            <asp:BoundField DataField="MaSP" HeaderText="Mã Hàng" >
                <HeaderStyle Width="80px" HorizontalAlign="Left" />
                <ItemStyle BorderColor="#C5A25D" BorderStyle="Solid" BorderWidth="1px" />
            </asp:BoundField>
            <asp:BoundField DataField="TenSP" HeaderText="Tên Hàng">
                <HeaderStyle Width="150px" HorizontalAlign="Left" />
                <ItemStyle BorderColor="#C5A25D" BorderStyle="Solid" BorderWidth="1px" />
            </asp:BoundField>
            <asp:BoundField DataField="GiaBan" HeaderText="Đơn Giá" >
                <HeaderStyle Width="80px" HorizontalAlign="Left"/>
                <ItemStyle BorderColor="#C5A25D" BorderStyle="Solid" BorderWidth="1px" />
            </asp:BoundField>
            <asp:BoundField DataField="SoLuong" HeaderText="Số Lượng" >
                <HeaderStyle Width="80px" HorizontalAlign="Left"/>
                <ItemStyle BorderColor="#C5A25D" BorderStyle="Solid" BorderWidth="1px" />
            </asp:BoundField>
            <asp:BoundField DataField="TongTien" HeaderText="Thành Tiền" 
                DataFormatString="{0:0,000}">
                <HeaderStyle Width="100px" />
            </asp:BoundField>
        </Columns>
           <FooterStyle ForeColor="#C5A25D" Font-size="20px"/>
    <PagerStyle BackColor="#C5A25D" ForeColor="White" HorizontalAlign="Center" />
    <SelectedRowStyle BackColor="#C5A25D" Font-Bold="True" ForeColor="White" />
    <HeaderStyle BackColor="#C5A25D" Font-Bold="True" ForeColor="White" Height="70px" Font-Size="20px"/>
</asp:GridView><br />
    <asp:Label ID="lblTongTien" runat="server" CssClass="tx"></asp:Label><br /><br />
    </div>
     <!-- Nhập liệu đơn hàng -->
    <div class="col2">
    <h3>THÔNG TIN ĐẶT HÀNG</h3>
    <table class="tb">
        <tr>
            <td>Họ tên:</td>
            <td> <asp:TextBox ID="txtHoTen" runat="server" CssClass="txb"></asp:TextBox> </td>        
        </tr><tr>
            <td>Điện thoại:</td>
            <td> <asp:TextBox ID="txtDienThoai" runat="server" CssClass="txb"></asp:TextBox> </td>
        </tr><tr>
            <td>Ngày sinh</td>
            <td> 
                <asp:Calendar ID="Calendar1" runat="server"></asp:Calendar>
            </td>
        </tr><tr>
            <td>Giới tính:</td>
            <td> <asp:TextBox ID="txtGT" runat="server" CssClass="txb"></asp:TextBox> </td>
         </tr>
        </table>
        <table>
        <tr>
            <td>
                <asp:Button ID="butDongY" runat="server" CssClass="btn" Text="Xác nhận" OnClick="butDongY_Click" /> 
            </td>
            <td>
                <asp:Button ID="Buthome" runat="server" CssClass="btn" Text="Trang chủ" OnClick="buthome_Click" /> 
            </td>
            <tr>
            <td colspan="2" style="text-align:center;"> 
                <asp:Label ID="lblStatus1" runat="server" CssClass="tx"></asp:Label><br />
                <asp:Label ID="lblStatus2" runat="server" CssClass="tx"></asp:Label>
            </td>
        </tr>
    </table>            
</div>        
 </section>
</asp:Content>
