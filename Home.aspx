<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="Doan_thuchanhnghenghiep.Home" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style  type="text/css">
body{
    padding: 0;
    margin: 0;
    background-color: #FEFBF4;
    position:relative;
    align-items:center;
    width:100%;
}
.slider-frame{
    overflow: hidden;
    height: 800px;
    width: 100%;
    margin-left: 0px;
    margin-right: 0px;
}
@-webkit-keyframes slide_animation{
    0% { right: 0px; }
    18% { right: 0px; }   
    20% { right: 1520px; }
    38% { right: 1520px; }
    40% { right: 3040px; }
    58% { right: 3040px; }
    60% { right: 4560px; }
    78% { right: 4560px; }
    80% { right: 6080px; }
    98% { right: 6080px; }
    100% { right: 7600px; }
}
.slide-images{
    width: 7600px;
    height: 900px;
    position: relative;
    -webkit-animation: slide_animation 30s infinite alternate;
    animation: slide_animation 30s infinite alternate;
}
.img-container{
    height: 800px;
    width: 1520px;
    position: relative;
    float: left;
}
 .slider-nav{
    display: flex;
    column-gap: 1rem;
    top: 630px;
    position: absolute;
    left: 50%;
    transform: translateX(-50%);
    z-index: 1;
 }
 .slider-nav a{
    width: 0.5rem;
    height: 0.5rem;
    border-radius: 50%;
    background-color: #C5A25D;
    opacity: 0.75;
    transition: .5s;
 }
 .slider-nav a:hover{
    width: 0.7rem;
    height: 0.7rem;
 }
 .cn_container {
    display: flex;
    margin-left: 30px;
 }
 .cn_box {
     padding: 10px;
     margin: 10px;
     width:480px;
     font-family:'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
 }
 .cn_box p{
    color: rgba(151, 149, 143, 1);
    font-size: 20px;
    line-height: 1.75rem;
}
 .trietly {
     background-image: url('hinh/trietly.jpg');
     background-size: cover;
     background-position: center;
     width: 100%;
     height: 750px;
     position: relative;
 }
 .tl_box{
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    width: 600px;
    height: 450px;
    background-color: white; 
    border-radius: 10px; 
    place-items: center;
 }
 .tieudetl{
     text-align:center;
     font-family:'Times New Roman', Times, serif;
     font-size:50px;
 }
 .motatl{
     text-align:center;
     font-family:'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
     color: rgba(151, 149, 143, 1);
     font-size:26px;
 }
 .btntl{
     color:white;
     background-color:black;
     font-size:28px;
     display:flex;
     position: absolute;
     top: 85%;
     left: 50%;
     transform: translate(-50%, -50%);
     height:70px;
     width:250px;
     border-radius: 7px; 
     text-align:center;
     justify-content: center;
     align-items: center;
     transition: background-color 0.3s ease;
 }
 .btntl:hover{
     background-color:white;
     color:black;
 }
 .btnnl{
    color:white;
    background-color:black;
    font-size:28px;
    display:flex;
    top: 85%;
    left: 42%;
    position:relative;
    height:70px;
    width:250px;
    border-radius: 7px; 
    text-align:center;
    justify-content: center; 
    align-items: center;
    transition: background-color 0.3s ease;
}
 .btnnl:hover{
    background-color:#FEFBF4;
    color:black;
}
 .banner h1{
     align-items:center;
     font-family:'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
     font-size:50px;
     align-content:center;
     text-align-last:center;
 }
 .banner h2{
    align-items:center;
    font-family:'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    font-size:30px;
    align-content:center;
    text-align-last:center;
}
 .img-container_cc img{
     width:100%;
 }
 .sanpham{
     margin:5px 5px 5px 5px;
     margin-right: 40px;  
     margin-left: 40px;
     flex: 4; 
     margin-left: 5px;
 }
 .item-container {
        display: inline-block;
        margin-right: 20px; 
         margin-left: 35px;
        vertical-align: top;
        margin-top: 20px;
        height:450px;
} 
.item-container:nth-child(4n) {
        margin-right: 0;
}
.tensanpham{
    width:287px;
}
 .container {
    display: flex;
    justify-content: space-between;
    align-items: flex-start; 
    width: 100%;
}
.tenloai {
    flex: 3;
}
.tenloai p{
    margin-left: 20px;
}
.imgnl{
    height:400px;
    width: 348px;
    margin-right: 12px;
    margin-left:12px;
    border-radius: 10px;
}
    </style>
</asp:Content>
<asp:Content class="body" ID="Content2" ContentPlaceHolderID="cph_homecontent" runat="server">
    <!-- Slider Auto -->
    <section>
        <div class="slider-frame">
            <div class="slide-images">
                <div class="img-container">
                    <img id="pic1" src="https://cocoonoriginal.com/cdn/shop/files/sg-11134210-7qvdu-leqp6tsl0s6pdb_839c7642-1feb-4877-8db6-e5aff1075d22.jpg?v=1680529246&width=1500">
                </div>
                <div class="img-container">
                    <img id="pic2" src="https://cocoonoriginal.com/cdn/shop/files/nghe_shopify.png?v=1680683589&width=1500">
                </div>
                <div class="img-container">
                    <img id="pic3" src="https://cocoonoriginal.com/cdn/shop/files/wintermelon2.png?v=1680529656&width=1500">
                </div>
                <div class="img-container">
                    <img id="pic4" src="https://cocoonoriginal.com/cdn/shop/files/coffee_background_2.png?v=1680529411&width=1500">
                </div>
                <div class="img-container">
                    <img id="pic5" src="https://cocoonoriginal.com/cdn/shop/files/rose_2_61f68ba4-2413-4e8c-ba15-6693448e227c.png?v=1680529868&width=1500">
                </div>
            </div>  
        </div>
    <div class="slider-nav">
        <a href="#pic1"></a>
        <a href="#pic2"></a>
        <a href="#pic3"></a>
        <a href="#pic4"></a>
        <a href="#pic5"></a>
    </div>
        <!-- Sản phẩm tiêu biểu -->
        <section>
            <div class="cn_container">
                <div class="cn_box">
                    <asp:DataList ID="dlcombokm" runat="server"  DataKeyNames="MaSP"
                         DataSourceID="datacombokm" RepeatColumns="1" style="text-align: center" Width="100%">
                        <ItemTemplate>
                            <asp:HyperLink ID="lnkSanPham" runat="server" 
                                NavigateUrl='<%# "Chonsanpham.aspx?MaSP=" + Eval("MaSP") %>' 
                                Text='<%# Eval("TenSP") %>' ForeColor="Black" Font-Names="ui-sans-serif"  Font-Underline="False" Font-Size="40px">
                            </asp:HyperLink><br />
                            <asp:Label ID="lblDonGia" runat="server" 
                                Text='<%# Eval("GiaBan","{0:0,000 vnđ}") %>' Font-Names=" ui-sans-serif" Font-Size="30px">
                            </asp:Label><br />
                        </ItemTemplate>
                    </asp:DataList>
                </div>
            <div class="cn_box">
                <asp:ImageButton ID="cnbd" class="cnbd" runat="server" ImageUrl="~/Hinh/poscn.PNG" OnClick="btncn_Click" Height="500px"  Width="500px"/>
            </div>
            <div class="cn_box">
                <div class="motacn">
                <p>Với diện mạo đột phá có hình dáng dẹp như một lát bí đao, sữa chống nắng bí đao sẽ là món "trang sức" nhỏ gọn, 
                    tinh tế và không kém phần thời trang mà bạn sẽ luôn mang theo bên mình, bôi lại bất cứ khi nào cần thiết. 
                    Bảo vệ da khỏi tác hại của tia UVB, UVA và HEV với hiệu quả bảo vệ rất cao cùng finish ráo mịn rất tự nhiên, không bóng, 
                    không tạo vệt trắng mất thẩm mỹ.</p>
                    </div>
               <asp:HyperLink ID="lnkSanPham" runat="server" 
                    NavigateUrl='<%# "Chonsanpham.aspx?MaSP=" + Eval("MaSP") %>' 
                    Text="Xem thêm >" ForeColor="Black" Font-Names= "ui-sans-serif"  Font-Underline="False" Font-Size="Large">
                </asp:HyperLink>
            </div>
                </div>
        </section>
        <!-- Triết lý của Cocoon -->
        <section>
            <div class="trietly" >
                <div class="tl_box">
                    <p class="tieudetl">Triết lý thương hiệu</p>
                    <p class="motatl">Là những người yêu thiên nhiên và đam mê khám phá các nguồn nguyên liệu đặc hữu của Việt Nam, 
                        chúng tôi luôn kiên định với những triết lý trên hành trình tìm vẻ đẹp thật sự của làn da.</p>
                    <asp:Button ID="btntl" runat="server" CssClass="btntl" Text="Tìm hiểu thêm" OnClick="btntl_Click"/>
                </div>
            </div>
        </section>
        <!-- Banner Slogan -->
        <section>
         <div class="banner">
            <h1>MỸ PHẨM 100% THUẦN CHAY CHO NÉT ĐẸP THUẦN VIỆT</h1>
             <h2>CHỨNG NHẬN BỞI CÁC TỔ CHỨC QUỐC TẾ</h2>
             <div class="img-container_cc">
                <img id="piccc" src="hinh/poscc.png">
             </div>
    </div>
</section>
</section>
    <!-- Sản phẩm bán chạy -->
     <section class="container">
       <div class="tenloai">
          <p style="font-family: 'Times New Roman'; color: black; font-size: 38px; text-align: center; font-weight: 500">Sản phẩm bán chạy</p>
          <p style="font-family: 'Segoe UI'; color: rgba(31, 28, 23); font-size: 18px; text-align:center;" >
          Cocoon tự hào khi các sản phẩm mà chúng tôi tạo ra mang đến những thay đổi tuyệt vời trên làn da, mái tóc của bạn.</p>
         </div>
        <div class="sanpham">
         <asp:DataList ID="DataList1" runat="server"  DataKeyNames="MaSP"
        DataSourceID="srcl1" RepeatColumns="3" style="text-align: left" Width="100%">
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
         </section>
<asp:SqlDataSource ID="srcl1" runat="server" 
    ConnectionString="<%$ ConnectionStrings:QLMPConnectionString %>" 
    SelectCommand="SELECT TOP 3 sp.MaSP, TenSP, sp.GiaBan, HinhSP FROM 
    CTHoaDon cthd INNER JOIN SanPham sp ON cthd.MaSP = sp.MaSP
    GROUP BY sp.TenSP, sp.MaSP, sp.GiaBan, sp.HinhSP 
    ORDER BY SUM(cthd.SoLuongHD) DESC;">
    </asp:SqlDataSource>
    <!-- Câu chuyện nguyên liệu -->
    <section class="nl">
       <p style="font-family: 'Times New Roman'; color: black; font-size: 38px; text-align: center; font-weight: 500">Câu chuyện</p>
       <p style="font-family: 'Segoe UI'; color: black; font-size: 42px; text-align: center; font-weight: 500">NGUYÊN LIỆU</p>
        <p style="font-family: 'Segoe UI'; color: rgba(31, 28, 23); font-size: 18px; text-align:center;" >
            "Hồn Việt trong chai"
             Chúng tôi viết nên câu chuyện về hoa trái đặc hữu của Việt Nam, 
             rất gần gũi và quen thuộc từ tên gọi, mùi hương và cả vùng đất sản sinh ra chúng.</p>
        <table>
            <tr>
                <td>
                <asp:Image ID="image1" runat="server" CssClass="imgnl" ImageUrl="~/Hinh/posnl1.jpg"  />
                <p style="font-family: 'Segoe UI'; color: black; font-size: 32px; text-align: center; font-weight: 500">BÍ ĐAO</p>
                </td>
                <td>
                <asp:Image ID="image2" runat="server" CssClass="imgnl" ImageUrl="~/Hinh/posnl2.jpg"  />
                <p style="font-family: 'Segoe UI'; color: black; font-size: 32px; text-align: center; font-weight: 500">DẦU DỪA BẾN TRE</p>
                </td>
                <td>
                <asp:Image ID="image3" runat="server" CssClass="imgnl" ImageUrl="~/Hinh/posnl4.jpg"  />
                <p style="font-family: 'Segoe UI'; color: black; font-size: 32px; text-align: center; font-weight: 500">NGHỆ HƯNG YÊN</p>
                </td>
                <td>
                <asp:Image ID="image4" runat="server" CssClass="imgnl" ImageUrl="~/Hinh/posnl5.jpg"  />
                <p style="font-family: 'Segoe UI'; color: black; font-size: 32px; text-align: center; font-weight: 500">HOA HỒNG</p>
                </td>
            </tr>
        </table>
        <asp:Button ID="Button2" runat="server" CssClass="btnnl" Text="Tìm hiểu thêm" OnClick="btnnl_Click"/>
    </section>
    <!-- Danh sách sản phẩm -->
    <section>
      <p style="font-family: 'Segoe UI'; color: black; font-size: 32px; text-align: center; font-weight: 500">TẤT CẢ SẢN PHẨM</p>
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
        </asp:HyperLink> <br />
        </div>
        <asp:Label ID="lblDonGia" runat="server" 
            Text='<%# Eval("GiaBan","{0:0,000 vnđ}") %>' Font-Names=" Segoe UI" Font-Size="16px">
        </asp:Label><br />
        </div>
    </ItemTemplate>
</asp:DataList>
            </div>
<asp:SqlDataSource ID="srcLoai" runat="server" 
    ConnectionString="<%$ ConnectionStrings:QLMPConnectionString %>" 
    SelectCommand="SELECT Top 20 MaSP, TenSP, GiaBan, HinhSP FROM SanPham  ORDER BY Soluongton">
    </asp:SqlDataSource>
<asp:SqlDataSource ID="datacombokm" runat="server" 
    ConnectionString="<%$ ConnectionStrings:QLMPConnectionString %>" 
    SelectCommand="SELECT MaSP, TenSP, GiaBan FROM SanPham  where MaSP='SP003'">
    </asp:SqlDataSource>
    </section>
</asp:Content>
