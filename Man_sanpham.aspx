<%@ Page Title=" Quản lý sản phẩm" Language="C#" MasterPageFile="~/SiteManager.Master" AutoEventWireup="true" CodeBehind="Man_sanpham.aspx.cs" Inherits="Doan_thuchanhnghenghiep.Man_sanpham" %>

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
    <p style="font-family: 'Plus Jakarta Sans'; color: rgba(197, 162, 93, 1); font-size: 32px; text-align: center;">SẢN PHẨM</p><br />
    <!-- Bảng cơ sở dữ liệu -->
    <asp:GridView ID="grdSanPham" runat="server" AllowPaging="True" AutoGenerateColumns="False" 
        CellPadding="4" DataKeyNames="MaSP" DataSourceID="srcSP" GridLines="Horizontal" PageSize="20" Width="100%" BackColor="White" 
        BorderColor="#C5A25D" BorderStyle="Solid" BorderWidth="1px" OnRowDataBound="grdSanPham_RowDataBound">
        <RowStyle BackColor="White" ForeColor="#333333" Height="50px"/>
        <Columns>
             <asp:TemplateField HeaderText="STT">
            <ItemTemplate>
                <asp:Label ID="lblSTT" runat="server" />
            </ItemTemplate>
            <HeaderStyle Width="40px" HorizontalAlign="Center" />
            <ItemStyle HorizontalAlign="Center" />
        </asp:TemplateField>
            <asp:BoundField DataField="MaSP" HeaderText="Mã sản phẩm" ReadOnly="True" SortExpression="MaSP">
                <HeaderStyle Width="80px" HorizontalAlign="Left" />
                <ItemStyle BorderColor="#C5A25D" BorderStyle="Solid" BorderWidth="1px" />
            </asp:BoundField>
            <asp:BoundField DataField="MaloaiSP" HeaderText="Mã loại sản phẩm"  SortExpression="MaloaiSP">
                <HeaderStyle Width="100px" HorizontalAlign="Left" />
                <ItemStyle BorderColor="#C5A25D" BorderStyle="Solid" BorderWidth="1px" />
            </asp:BoundField>
            <asp:BoundField DataField="MadongSP" HeaderText="Mã dòng sản phẩm"  SortExpression="MadongSP">
                <HeaderStyle Width="100px" HorizontalAlign="Left" />
                <ItemStyle BorderColor="#C5A25D" BorderStyle="Solid" BorderWidth="1px" />
            </asp:BoundField>
            <asp:BoundField DataField="TenSP" HeaderText="Tên sản phẩm">
                <HeaderStyle Width="150px" HorizontalAlign="Center" />
                <ItemStyle BorderColor="#C5A25D" BorderStyle="Solid" BorderWidth="1px" />
            </asp:BoundField>
            <asp:BoundField DataField="DonViTinh" HeaderText="Đơn vị tính" SortExpression="DonViTinh">
                <HeaderStyle Width="60px" HorizontalAlign="Left"/>
                <ItemStyle BorderColor="#C5A25D" BorderStyle="Solid" BorderWidth="1px" />
            </asp:BoundField>
            <asp:BoundField DataField="GiaBan" HeaderText="Giá bán" SortExpression="GiaBan" DataFormatString="{0:0,000}">
                <HeaderStyle Width="70px" HorizontalAlign="Left"/>
                <ItemStyle BorderColor="#C5A25D" BorderStyle="Solid" BorderWidth="1px" />
                <ItemStyle HorizontalAlign="Left" />
            </asp:BoundField>
            <asp:BoundField DataField="Soluongton" HeaderText="Số lượng tồn" SortExpression="Soluongton">
                <HeaderStyle Width="90px" HorizontalAlign="Left"/>
                <ItemStyle BorderColor="#C5A25D" BorderStyle="Solid" BorderWidth="1px" />
            </asp:BoundField>
            <asp:BoundField DataField="Dungtich" HeaderText="Dung tích (ml)" SortExpression="Dungtich">
                <HeaderStyle Width="80px" HorizontalAlign="Left"/>
                <ItemStyle BorderColor="#C5A25D" BorderStyle="Solid" BorderWidth="1px" />
            </asp:BoundField>
            <asp:CommandField DeleteText="Xóa" EditText="Sửa" ShowDeleteButton="True" ShowEditButton="True" CancelText="Hủy Bỏ" UpdateText="Cập Nhật">
                <HeaderStyle Width="100px" />
                <ItemStyle BorderColor="#C5A25D" BorderStyle="Solid" BorderWidth="1px" />
            </asp:CommandField>
        </Columns>
        <FooterStyle ForeColor="#C5A25D" Font-size="20px"/>
        <PagerStyle BackColor="#C5A25D" ForeColor="White" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#C5A25D" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#C5A25D" Font-Bold="True" ForeColor="White" Height="70px" Font-Size="20px"/>
    </asp:GridView>
    <asp:SqlDataSource ID="srcSP" runat="server" 
        ConnectionString="<%$ ConnectionStrings:QLMPConnectionString %>" 
        DeleteCommand="DELETE FROM SanPham WHERE MaSP = @MaSP" 
        SelectCommand="SELECT MaSP, MaloaiSP, MadongSP, TenSP, DonViTinh, GiaBan, Soluongton, Dungtich FROM SanPham" 
        UpdateCommand="UPDATE SanPham SET MaloaiSP=@MaloaiSP, MadongSP=@MadongSP, TenSP=@TenSP, DonViTinh=@DonViTinh, 
        GiaBan=@GiaBan, Soluongton=@Soluongton, Dungtich=@Dungtich WHERE MaSP=@MaSP">
        <DeleteParameters>
            <asp:Parameter Name="MaSP" Type="String" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="MaloaiSP" Type="String" />
            <asp:Parameter Name="MadongSP" Type="String" />
            <asp:Parameter Name="TenSP" Type="String" />
            <asp:Parameter Name="DonViTinh" Type="String"/>
            <asp:Parameter Name="GiaBan" Type="String" />
            <asp:Parameter Name="Soluongton" Type="String" />
            <asp:Parameter Name="Dungtich" Type="String" />
            <asp:Parameter Name="MaSP" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <!-- Hiển thị thêm dữ liệu -->
    <div class="btn_con">
        <asp:Button ID="btnShowModal" CssClass="btn btnshow" runat="server" Text="Thêm sản phẩm" OnClick="btnShowModal_Click"/>
    </div>
        <div id="modalBackground" class="modal-background" runat="server"></div>
    <asp:Panel ID="pnlModal" runat="server" CssClass="modal-content">
    <h2>THÊM SẢN PHẨM</h2>
    <table style="width: 100%; font-size:16px; color:rgba(31, 28, 23);">
        <tr>
            <td style="width: 30%">Mã sản phẩm</td>
            <td><asp:TextBox ID="txtMaSP" runat="server"  CssClass="textbox"></asp:TextBox></td>
            <td>&nbsp;</td> </tr>
        <tr>
            <td style="width: 20%">Tên sản phẩm</td>
            <td><asp:TextBox ID="txtTenSP" runat="server" CssClass="textbox"></asp:TextBox></td>
            <td>&nbsp;</td></tr>
        <tr>
            <td style="width: 20%">Đơn vị tính</td>
            <td><asp:TextBox ID="txtdvt" runat="server" CssClass="textbox"></asp:TextBox></td>
            <td>&nbsp;</td></tr>
        <tr>
            <td>Đơn giá:</td>
            <td><asp:TextBox ID="txtDonGia" runat="server" CssClass="textbox" ></asp:TextBox></td>
            <td>&nbsp;</td> </tr>
        <tr>
            <td>Số lượng tồn</td>
            <td><asp:TextBox ID="txtsl" runat="server" CssClass="textbox"></asp:TextBox></td>
            <td>&nbsp;</td> </tr>
        <tr>
            <td>Dung tích</td>
            <td><asp:TextBox ID="txtdt" runat="server" CssClass="textbox" ></asp:TextBox></td>
            <td>&nbsp;</td> </tr>
        <tr>
            <td>Loại sản phẩm</td>
            <td><asp:TextBox ID="txtlsp" runat="server" CssClass="textbox"></asp:TextBox></td>
            <td>&nbsp;</td></tr>
        <tr>
            <td>Dòng sản phẩm</td>
            <td><asp:TextBox ID="txtdsp" runat="server" CssClass="textbox"></asp:TextBox></td>
            <td>&nbsp;</td> </tr>
        <tr>
            <td>Link hình sản phẩm</td>
            <td><asp:TextBox ID="txth" runat="server" CssClass="textbox"></asp:TextBox></td>
            <td>&nbsp;</td></tr>
        <tr>
            <td>&nbsp;</td>
            <td><asp:Label ID="lblStatus" runat="server" style="font-size: 16px; color: rgba(31, 28, 23)" ></asp:Label></td>
        </tr>
    </table>
        <div class="btn_con">
        <asp:Button ID="btnSaveProduct" runat="server" Text="Lưu sản phẩm" OnClick="btnSaveProduct_Click" CssClass="btn btn-primary" />
        <asp:Button ID="btnCloseModal" runat="server" Text="Đóng" OnClick="btnCloseModal_Click" CssClass="btn btn-secondary" />
        </div>
            </asp:Panel>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
    ConnectionString="<%$ ConnectionStrings:QLMPConnectionString %>" 
    SelectCommand="SELECT MaSP, MaloaiSP, MadongSP, TenSP, DonViTinh, GiaBan, Soluongton, Dungtich FROM SanPham" 
    InsertCommand="INSERT INTO SanPham (MaSP, MaloaiSP, MadongSP, TenSP, DonViTinh, GiaBan, Soluongton, Dungtich, HinhSP) 
        VALUES (@MaSP, @MaloaiSP, @MadongSP, @TenSP, @DonViTinh, @GiaBan, @Soluongton, @Dungtich, @HinhSP)">
</asp:SqlDataSource>

</asp:Content>