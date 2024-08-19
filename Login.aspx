<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Doan_thuchanhnghenghiep.WebForm1" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>
     <style type="text/css">
header {
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 50px;
    padding: 10px 40px;
    background-color: rgba(197, 162, 93, 0.2);
    backdrop-filter: blur(15px);
    display: flex;
    justify-content: space-between;
    align-items: center;
    z-index: 80;
    font-family: "Plus Jakarta Sans", sans-serif;
}
body {
    display: flex;
    justify-content: center;
    align-items: center;
    min-height: 100vh;
    background: url('Hinh/poslogin.png') no-repeat;
    background-position: center;
    background-size: cover;
    font-family: "Plus Jakarta Sans", sans-serif;
}

.logo .logoimg {
    display: flex;
    width: 90px;
    height: 90px;
}
.navigation a {
    position: relative;
    font-size: 1.1em;
    color: #C5A25D;
    text-decoration: none;
    font-weight: 500;
    margin-left: 40px;
}
.navigation a::after {
    content: '';
    position: absolute;
    left: 0;
    bottom: -5px;
    width: 100%;
    height: 3px;
    background: #C5A25D;
    border-radius: 5px;
    transform-origin: center;
    transform: scaleX(0);
    transition: transform .5s;
}
.navigation a:hover::after {
    transform: scaleX(1);
}
.navigation .btnLogin {
    width: 80px;
    height: 40px;
    background: transparent;
    border: 2px solid #C5A25D;
    outline: none;
    border-radius: 5px;
    cursor: pointer;
    font-size: 1.1em;
    color: #C5A25D;
    font-weight: 500;
    margin-left: 40px;
    margin-right: 90px;
    transition: .5s;
}
.navigation .btnLogin:hover {
    background: #C5A25D;
    color: #fff;
}
.wapper {
    position: relative;
    width: 400px;
    height: 400px;
    background: transparent;
    border: 2px solid rgba(255, 255, 255, .5);
    border-radius: 20px;
    backdrop-filter: blur(15px);
    box-shadow: 0 0 30px rgba(0, 0, 0, .5);
    display: flex;
    justify-content: center;
    align-items: center;
}
.wapper .loginbox {
    width: 100%;
    padding: 20px;
}
.loginbox h2 {
    font-size: 2em;
    color: #C5A25D;
    text-align: center;
}
.inputbox {
    position: relative;
    width: 100%;
    height: 50px;
    border-bottom: 2px solid #C5A25D;
    margin: 30px 0;
}
.inputbox label {
    position: absolute;
    top: 50%;
    left: 5px;
    transform: translateY(-50%);
    font-size: 1em;
    color: #C5A25D;
    font-weight: 500;
    pointer-events: none;
    transition: .5s;
}
.inputbox input:focus~label,
.inputbox input:valid~label {
    top: -5px;
}
.inputbox input {
    width: 100%;
    height: 100%;
    background: transparent;
    border: none;
    outline: none;
    font-size: 1em;
    color: #C5A25D;
    font-weight: 600;
    padding: 0 35px 0 5px;
}
.inputbox .icon {
    position: absolute;
    right: 8px;
    font-size: 1.2em;
    color: #C5A25D;
    line-height: 57px;
}
.remember {
    font-size: .9em;
    color: #C5A25D;
    font-weight: 500;
    margin: -15px 0 15px;
    display: flex;
    justify-content: space-between;
}
.remember label input {
    accent-color: #C5A25D;
    margin-right: 3px;
}
.remember a {
    color: #C5A25D;
    text-decoration: none;
}
.remember a:hover {
    text-decoration: underline;
}
.btn {
    width: 100%;
    height: 45px;
    background: #C5A25D;
    border: none;
    outline: none;
    border-radius: 6px;
    cursor: pointer;
    font-size: 1em;
    text-decoration: solid;
    color: #fff;
    font-weight: 500;
    transition: .5s ease-in-out;
}
.btn:hover {
    background: #fff;
    color: #C5A25D;
}
.btn a {
    font-weight: bold;
    font-size: 20px;
} 
</style>
</head>
<body>
    <form id="form1" runat="server">
        <header>
            <div class="logo">
                <img class="logoimg" src="Hinh/image-removebg-preview.png" />
            </div>
            <nav class="navigation">
                <a href="Home.aspx">Home</a>
                <a href="#">About</a>
                <a href="#">Contact</a>
                <asp:Button ID="btnLogin" CssClass="btnLogin" runat="server" 
                    Text="Login" OnClick="btnLoginheader_Click" />
            </nav>
        </header>
        <div class="wapper">
            <div class="loginbox">
                <h2>LOGIN</h2>
                <div class="inputbox">
                    <span class="icon"><ion-icon name="mail"></ion-icon></span>
                    <asp:TextBox ID="txtTendangnhap" runat="server"  
                        CssClass="input" Required="true" />
                    <label>Email</label>
                </div>
                <div class="inputbox">
                    <span class="icon"><ion-icon name="lock-closed"></ion-icon></span>
                    <asp:TextBox ID="txtMatkhau" runat="server" 
                        TextMode="Password" CssClass="input" Required="true" />
                    <label>Password</label>
                </div>
                <div class="remember">
                    <asp:CheckBox ID="chkRememberMe" runat="server" 
                        Text="Remember me" CssClass="remember" />
                    <a href="#">Forgot password?</a>
                </div>
                <asp:Button ID="btnSubmit" runat="server" Text="Login" 
                    CssClass="btn" OnClick="btnLogin_Click" />
            </div>
        </div>
    </form>
    <script src="Scripts/script.js"></script>
    <script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
</body>
</html>
