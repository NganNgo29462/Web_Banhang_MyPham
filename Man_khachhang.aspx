<%@ Page Title=" Quản lý khách hàng" Language="C#" MasterPageFile="~/SiteManager.Master" AutoEventWireup="true" CodeBehind="Man_khachhang.aspx.cs" Inherits="Doan_thuchanhnghenghiep.Man_khachhang" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
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
    .modal-background {
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background-color: rgba(0, 0, 0, 0.5);
    display: none;
    z-index: 1000;
    align-items:center;
}
.modal-content {
    position: fixed;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    background-color: #FEFBF4;
    padding: 20px;
    border-radius: 10px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    z-index: 1001;
    display: none;
    color: #C5A25D;
    font-size: 16px;
    border-color: #C5A25D;
    flex-direction: column;
    align-items: center; 
    justify-content: center; 
}
.textbox{
    background-color: #FEFBF4;
    border-color: #C5A25D;
    border-radius:4px;
    border: 1px solid #C5A25D;
    box-sizing: border-box; 
    font-size: 20px;
    color: #C5A25D;
}
.textbox :focus{
    outline: none; 
    border-color: #A38757; 
    box-shadow: 0 0 5px #C5A25D;
}
.modal-content td{
    color: #C5A25D;
    margin-top: 5px;
    font-size:20px;
}
.modal-content h2 {
    margin-top: 0;
    text-align: center;
}
.modal-content table {
    width: 100%;
}
.modal-content table td {
    padding: 10px;
    text-align: center; 
    font-size: 20px;
}
.modal-content table input, .modal-content table button {
    width: 80%;
}
.btn{
    height: 40px;
    background-color: #C5A25D;
    color: white;
    border: none;
    width: 175px;
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
.btn:hover{
    background-color: #FEFBF4;
    color: #C5A25D;
    border-color: #C5A25D;
}
.btn_con {
    display: flex;
    margin: 10px; 
    justify-content:center;
}
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="cph_homecontent2" runat="server">
    <p style="font-family: 'Plus Jakarta Sans'; color: rgba(197, 162, 93, 1); font-size: 32px; text-align: center;">KHÁCH HÀNG</p><br />
  <!-- Bảng dữ liệu -->
    <asp:GridView ID="grdKhachHang" runat="server" AllowPaging="True" AutoGenerateColumns="False" 
        CellPadding="4" DataKeyNames="MaKH" DataSourceID="srcKH" GridLines="Horizontal" 
        PageSize="20" Width="100%" BackColor="White" BorderColor="#C5A25D" BorderStyle="Solid" BorderWidth="1px"
        OnRowDataBound="grdKhachHang_RowDataBound">
        <RowStyle BackColor="White" ForeColor="#333333" Height="50px"/>
        <Columns>
             <asp:TemplateField HeaderText="STT">
            <ItemTemplate>
                <asp:Label ID="lblSTT" runat="server" />
            </ItemTemplate>
            <HeaderStyle Width="40px" HorizontalAlign="Center" />
            <ItemStyle HorizontalAlign="Center" />
        </asp:TemplateField>
            <asp:BoundField DataField="MaKH" HeaderText="Mã khách hàng" ReadOnly="True" SortExpression="MaKH">
                <HeaderStyle Width="80px" HorizontalAlign="Left" />
                <ItemStyle BorderColor="#C5A25D" BorderStyle="Solid" BorderWidth="1px" />
            </asp:BoundField>
            <asp:BoundField DataField="TenKH" HeaderText="Tên khách hàng">
                <HeaderStyle Width="150px" HorizontalAlign="Center" />
                <ItemStyle BorderColor="#C5A25D" BorderStyle="Solid" BorderWidth="1px" />
            </asp:BoundField>
            <asp:BoundField DataField="GioitinhKH" HeaderText="Giới tính" SortExpression="GioitinhKH">
                <HeaderStyle Width="60px" HorizontalAlign="Left"/>
                <ItemStyle BorderColor="#C5A25D" BorderStyle="Solid" BorderWidth="1px" />
            </asp:BoundField>
            <asp:BoundField DataField="NgaysinhKH" HeaderText="Ngày sinh" SortExpression="NgaysinhKH">
                <HeaderStyle Width="70px" HorizontalAlign="Left"/>
                <ItemStyle BorderColor="#C5A25D" BorderStyle="Solid" BorderWidth="1px" />
                <ItemStyle HorizontalAlign="Left" />
            </asp:BoundField>
            <asp:BoundField DataField="SoDT" HeaderText="Số điện thoại" SortExpression="SoDT">
                <HeaderStyle Width="90px" HorizontalAlign="Left"/>
                <ItemStyle BorderColor="#C5A25D" BorderStyle="Solid" BorderWidth="1px" />
            </asp:BoundField>
            <asp:CommandField DeleteText="Xóa" EditText="Sửa" ShowDeleteButton="True" 
                ShowEditButton="True" CancelText="Hủy Bỏ" UpdateText="Cập Nhật">
                <HeaderStyle Width="100px" />
                <ItemStyle BorderColor="#C5A25D" BorderStyle="Solid" BorderWidth="1px" />
            </asp:CommandField>
        </Columns>
        <FooterStyle ForeColor="#C5A25D" Font-size="20px"/>
        <PagerStyle BackColor="#C5A25D" ForeColor="White" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#C5A25D" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#C5A25D" Font-Bold="True" ForeColor="White" Height="70px" Font-Size="20px"/>
    </asp:GridView>
    <asp:SqlDataSource ID="srcKH" runat="server" 
        ConnectionString="<%$ ConnectionStrings:QLMPConnectionString %>" 
        DeleteCommand="DELETE FROM KhachHang WHERE MaKH = @MaKH" 
        SelectCommand="SELECT MaKH,TenKH, GioitinhKH, NgaysinhKH, SoDT FROM KhachHang" 
        UpdateCommand="UPDATE KhachHang SET MaKH=@MaKH, TenKH=@TenKH, GioitinhKH=@GioitinhKH, NgaysinhKH=@NgaysinhKH, SoDT=@SoDT WHERE MaKH=@MaKH">
        <DeleteParameters>
            <asp:Parameter Name="MaKH" Type="String" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="TenKH" Type="String" />
            <asp:Parameter Name="MadongSP" Type="String" />
            <asp:Parameter Name="GioitinhKH" Type="String" />
            <asp:Parameter Name="NgaysinhKH" Type="String"/>
            <asp:Parameter Name="SoDT" Type="String" />
            <asp:Parameter Name="MaKH" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <!-- Hiển thị thêm dữ liệu -->
    <div class="btn_con">
        <asp:Button ID="btnShowModal" CssClass="btn btnshow" runat="server" Text="Thêm khách hàng" OnClick="btnShowModal_Click"/>
    </div>
        <div id="modalBackground" class="modal-background" runat="server"></div>
    <asp:Panel ID="pnlModal" runat="server" CssClass="modal-content">
    <h2>THÊM KHÁCH HÀNG</h2>
    <table style="width: 100%; font-size:16px; color:rgba(31, 28, 23);">
        <tr>
            <td style="width: 30%">Mã khách hàng</td>
            <td><asp:TextBox ID="txtMaKH" runat="server"  CssClass="textbox"></asp:TextBox></td>
            <td>&nbsp;</td> </tr>
        <tr>
            <td style="width: 20%">Tên khách hàng</td>
            <td><asp:TextBox ID="txtTenKH" runat="server" CssClass="textbox"></asp:TextBox></td>
            <td>&nbsp;</td> </tr>
        <tr>
            <td style="width: 20%">Giới tính</td>
            <td><asp:TextBox ID="txtGioitinhKH" runat="server" CssClass="textbox"></asp:TextBox></td>
            <td>&nbsp;</td> </tr>
        <tr>
            <td>Ngày sinh</td>
            <td><asp:TextBox ID="txtNgaysinhKH" runat="server" CssClass="textbox"></asp:TextBox></td>
            <td>&nbsp;</td></tr>
        <tr>
            <td>Số điện thoại</td>
            <td><asp:TextBox ID="txtSoDT" runat="server" CssClass="textbox"></asp:TextBox></td>
            <td>&nbsp;</td> </tr>
        <tr>
            <td>&nbsp;</td>
            <td><asp:Label ID="lblStatus" runat="server" style="font-size: 16px; color: rgba(31, 28, 23)" ></asp:Label></td></tr>
    </table>
        <div class="btn_con">
        <asp:Button ID="btnSaveProduct" runat="server" Text="Lưu" OnClick="btnSaveProduct_Click" CssClass="btn btn-primary" />
        <asp:Button ID="btnCloseModal" runat="server" Text="Đóng" OnClick="btnCloseModal_Click" CssClass="btn btn-secondary" />
        </div>
            </asp:Panel>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
    ConnectionString="<%$ ConnectionStrings:QLMPConnectionString %>" 
    SelectCommand="SELECT MaKH,TenKH, GioitinhKH, NgaysinhKH, SoDT FROM KhachHang" 
    InsertCommand="INSERT INTO KhachHang (MaKH,TenKH, GioitinhKH, NgaysinhKH, SoDT) VALUES (@MaKH,@TenKH, @GioitinhKH, @NgaysinhKH, @SoDT)">
</asp:SqlDataSource>
</asp:Content>