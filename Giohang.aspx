<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Giohang.aspx.cs" Inherits="Doan_thuchanhnghenghiep.Giohang" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
.auto-style8 {
    width: 100%;
    display: grid;
    justify-content: end; 
    gap: 10px; 
    grid-template-columns: auto auto; 
    height: 100px;
}
.auto-style9 {
    width: 197px;
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
.btn{
    height: 28px;
    background-color: #C5A25D;
    color: white;
    border: none;
    width: 150px;
    font-family: 'Segoe UI';
    font-weight: bold;
    padding: 10px 20px;
    cursor: pointer;
    display: inline-block;
    justify-content:center;
    display:flex;
    margin: 0 20px;
    font-size: 16px;
    text-decoration: none;
    text-align:center;
    margin-bottom: 30px;
}   
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cph_homecontent" runat="server">
    <p style="font-family: 'Plus Jakarta Sans'; color: rgba(197, 162, 93, 1); font-size: 32px; text-align: center;">GIỎ HÀNG</p><br />
       <asp:GridView ID="grdGioHang" runat="server" 
                    onrowdeleting="grdGioHang_RowDeleting" onrowediting="grdGioHang_RowEditing" 
                    onrowupdating="grdGioHang_RowUpdating" onrowcancelingedit="grdGioHang_RowCancelingEdit" 
                    OnRowDataBound="grdGioHang_RowDataBound" AutoGenerateColumns="False" 
                    CellPadding="5" BackColor="White" BorderColor="#C5A25D" BorderStyle="Solid" 
                    BorderWidth="1px" GridLines="Horizontal" Width="100%" Font-Names="Plus Jakarta Sans" Font-Size="18px"   >
            <Columns>
                <asp:TemplateField HeaderText="STT">
                    <ItemTemplate>
                        <asp:Label ID="lblSTT" runat="server" />
                    </ItemTemplate>
                    <HeaderStyle Width="40px" HorizontalAlign="Center" />
                        <ItemStyle HorizontalAlign="Center" BorderColor="#C5A25D" BorderStyle="Solid" BorderWidth="1px"/>
                </asp:TemplateField>
                        <asp:BoundField DataField="MaSP" HeaderText="Mã Hàng">
                            <HeaderStyle Width="80px" HorizontalAlign="Left" />
                            <ItemStyle BorderColor="#C5A25D" BorderStyle="Solid" BorderWidth="1px" Height="40px"  />
                        </asp:BoundField>
                        <asp:BoundField DataField="TenSP" HeaderText="Tên Hàng">
                            <HeaderStyle Width="400px" HorizontalAlign="Left" />
                            <ItemStyle BorderColor="#C5A25D" BorderStyle="Solid" BorderWidth="1px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="GiaBan" HeaderText="Đơn Giá">
                            <HeaderStyle Width="80px" HorizontalAlign="Left"/>
                            <ItemStyle BorderColor="#C5A25D" BorderStyle="Solid" BorderWidth="1px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="SoLuong" HeaderText="Số Lượng">
                            <HeaderStyle Width="100px" HorizontalAlign="Left"/>
                            <ItemStyle BorderColor="#C5A25D" BorderStyle="Solid" BorderWidth="1px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="TongTien" HeaderText="Thành Tiền" 
                            DataFormatString="{0:0,000}">
                            <HeaderStyle Width="100px" />
                            <ItemStyle BorderColor="#C5A25D" BorderStyle="Solid" BorderWidth="1px" />
                        </asp:BoundField>
                        <asp:CommandField ShowDeleteButton="True" CancelText="Hủy Bỏ" DeleteText="Xóa" EditText="Sửa" UpdateText="Cập nhật">
                            <HeaderStyle Width="30px" />
                             <ItemStyle  ForeColor="Black"/>
                        </asp:CommandField>
                        <asp:CommandField ShowEditButton="True" CancelText="Hủy Bỏ" DeleteText="Xóa" EditText="Sửa" UpdateText="Cập Nhật">
                            <HeaderStyle Width="120px" />
                            <ItemStyle  ForeColor="Black"/>
                        </asp:CommandField>
                    </Columns>
    <FooterStyle ForeColor="#C5A25D" Font-size="20px"/>
    <PagerStyle BackColor="#C5A25D" ForeColor="White" HorizontalAlign="Center" />
    <SelectedRowStyle BackColor="#C5A25D" Font-Bold="True" ForeColor="White" />
    <HeaderStyle BackColor="#C5A25D" Font-Bold="True" ForeColor="White" Height="70px" Font-Size="20px"/>
</asp:GridView> <br />
 <div  style="font-size: x-large; text-align: right;">
                <asp:Label ID="lblTongTien" runat="server" ForeColor="#6B4723" style="font-size: 18px" Font-Bold="True" Font-Size="XX-Large"></asp:Label>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br /><br />
            </div>
    <table class="auto-style8">
        <tr style="align-items: end">
            <td>
                <asp:LinkButton ID="butMuahang" Cssclass="btn" runat="server" PostBackUrl="~/Home.aspx" >Tiếp Tục Mua Hàng</asp:LinkButton>
            </td>
            <td>
                <asp:LinkButton ID="butDathang" Cssclass="btn" runat="server" onclick="butDathang_Click" PostBackUrl="~/Order.aspx" >Đặt Hàng</asp:LinkButton> 
            </td>
        </tr>
    </table>
</asp:Content>
