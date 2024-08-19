<%@ Page Title="Quản lý dòng sản phẩm" Language="C#" MasterPageFile="~/SiteManager.Master" AutoEventWireup="true" CodeBehind="Man_dongsanpham.aspx.cs" Inherits="Doan_thuchanhnghenghiep.Man_dongsanpham" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
    .grid-view table {
        border-collapse: collapse;
        width: 100%;
    }
    .grid-view th, .grid-view td {
        border: 1px solid #333; /* Màu sắc và kích thước của đường viền */
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
    align-items: center; /* Căn giữa theo chiều ngang */
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
        text-align: center; /* Căn giữa tiêu đề */
    }

    .modal-content table {
        width: 100%;
    }

    .modal-content table td {
        padding: 10px;
        text-align: center; /* Căn giữa chữ trong ô */
        font-size: 20px;
    }

    .modal-content table input, .modal-content table button {
        width: 80%; /* Điều chỉnh kích thước các input và button */
    }
.btn{
    height: 40px;
    background-color: #C5A25D;
    color: white;
    border: none;
    width: 200px;
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
    margin: 10px; /* Khoảng cách giữa các nút */
    justify-content:center;
}

</style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="cph_homecontent2" runat="server">
    <p style="font-family: 'Plus Jakarta Sans'; color: rgba(197, 162, 93, 1); font-size: 32px; text-align: center;">DÒNG SẢN PHẨM</p><br />
    
    <!-- GridView for displaying products -->
    <asp:GridView ID="grdDongSanPham" runat="server" AllowPaging="True" AutoGenerateColumns="False" 
        CellPadding="4" DataKeyNames="MadongSP" DataSourceID="srcLSP" GridLines="Horizontal" 
        PageSize="20" Width="100%" BackColor="White" BorderColor="#C5A25D" BorderStyle="Solid" BorderWidth="1px"
        OnRowDataBound="grdDongSanPham_RowDataBound">
        <RowStyle BackColor="White" ForeColor="#333333" Height="50px"/>
        <Columns>
             <asp:TemplateField HeaderText="STT">
            <ItemTemplate>
                <asp:Label ID="lblSTT" runat="server" />
            </ItemTemplate>
            <HeaderStyle Width="40px" HorizontalAlign="Center" />
            <ItemStyle HorizontalAlign="Center" />
        </asp:TemplateField>

         

            <asp:BoundField DataField="MadongSP" HeaderText="Mã dòng sản phẩm"  SortExpression="MadongSP">
                <HeaderStyle Width="100px" HorizontalAlign="Left" />
                <ItemStyle BorderColor="#C5A25D" BorderStyle="Solid" BorderWidth="1px" />

            </asp:BoundField>
            <asp:BoundField DataField="TendongSP" HeaderText="Tên dòng sản phẩm">
                <HeaderStyle Width="150px" HorizontalAlign="Center" />
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

    <!-- SqlDataSource for the GridView -->
    <asp:SqlDataSource ID="srcLSP" runat="server" 
        ConnectionString="<%$ ConnectionStrings:QLMPConnectionString %>" 
        DeleteCommand="DELETE FROM DongSanPham WHERE MadongSP = @MadongSP" 
        SelectCommand="SELECT MadongSP, TendongSP FROM DongSanPham" 
        UpdateCommand="UPDATE DongSanPham SET TendongSP=@TendongSP  WHERE MadongSP=@MadongSP">
        <DeleteParameters>
            <asp:Parameter Name="MadongSP" Type="String" />
        </DeleteParameters>
        <UpdateParameters>
            
            <asp:Parameter Name="MadongSP" Type="String" />
            <asp:Parameter Name="TendongSP" Type="String" />
        
            
        </UpdateParameters>
    </asp:SqlDataSource>
    <div class="btn_con">
        <asp:Button ID="btnShowModal" CssClass="btn btnshow" runat="server" Text="Thêm dòng sản phẩm" OnClick="btnShowModal_Click"/>
    </div>
        <div id="modalBackground" class="modal-background" runat="server"></div>

    <asp:Panel ID="pnlModal" runat="server" CssClass="modal-content">
    <h2>THÊM  DÒNG SẢN PHẨM</h2>
    <table style="width: 100%; font-size:16px; color:rgba(31, 28, 23);">
        
        <tr>
            <td style="width: 30%">Mã dòng sản phẩm</td>
            <td><asp:TextBox ID="txtMadongSP" runat="server"  CssClass="textbox"></asp:TextBox></td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td style="width: 20%">Tên dòng sản phẩm</td>
            <td><asp:TextBox ID="txtTendongSP" runat="server" CssClass="textbox"></asp:TextBox></td>
            <td>&nbsp;</td>
        </tr>
        
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
    SelectCommand="SELECT MadongSP, TendongSP FROM DongSanPham" 
    InsertCommand="INSERT INTO DongSanPham ( MadongSP, TendongSP) VALUES ( @MadongSP, @TendongSP)">
</asp:SqlDataSource>

</asp:Content>