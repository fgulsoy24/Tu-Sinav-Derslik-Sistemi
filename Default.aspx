<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="~/css/login.css" />
   


</head>

<body>
    <div id="login">
  
<div id="triangle"></div>
 <h1>Log in</h1>
     <form id="form1" runat="server">

  
 
         <asp:TextBox ID="txtUsername" runat="server" placeholder="username" CssClass="textbox"></asp:TextBox>
   <asp:TextBox ID="txtPassword" runat="server" placeholder="password" CssClass="textbox" ></asp:TextBox>
   
     <asp:Button ID="loginButton" runat="server" Text="Giriş" OnClick="loginButton_Click1" Width="341px" />
 
</div>
 

     <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>

 <script src="~/js/index.js"></script>

         </form>
</body>
</html>
