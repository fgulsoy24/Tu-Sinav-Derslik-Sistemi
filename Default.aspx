<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <a href="OgrenciKayit.aspx"> SANALKURS.NET </a>
    <form id="form1" runat="server">
    <div>
    
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Button" />
    
    </div>
          

      <asp:gridview id="CustomersGridView" 
        datasourceid="CustomersSource" 
        autogeneratecolumns="true"
        emptydatatext="No data available." 
        runat="server">

        <rowstyle backcolor="LightCyan"  
           forecolor="DarkBlue"
           font-italic="true"/>

        <alternatingrowstyle backcolor="PaleTurquoise"  
          forecolor="DarkBlue"
          font-italic="true"/>

      </asp:gridview>

       
        <p>
           

           
        </p>
    </form>
</body>
</html>
