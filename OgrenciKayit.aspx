<%@ Page Language="C#" AutoEventWireup="true" CodeFile="OgrenciKayit.aspx.cs" Inherits="OgrenciKayit" MasterPageFile="~/MasterPage.master" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        Ögrenci No :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="TextBox1" runat="server" Height="16px" Width="124px" ></asp:TextBox>
    
        <asp:Label ID="lbldurum" runat="server"></asp:Label>
    
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Alanlar Boş Bırakılamaz" ControlToValidate="TextBox1"></asp:RequiredFieldValidator>
    
    </div>
        <p>
            Ögrenci Adı :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>

        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Alanlar Boş Bırakılamaz" ControlToValidate="TextBox2"></asp:RequiredFieldValidator>
    
        </p>
        <p>
            Ögrenci Soyadı :&nbsp;
            <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
    
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Alanlar Boş Bırakılamaz" ControlToValidate="TextBox2"></asp:RequiredFieldValidator>
    
        </p>
        
      
        <p>
            Ögrenci Bölümü :<asp:DropDownList ID="DropDownList1" runat="server" Height="19px" Width="174px" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" DataSourceID="SqlDataSource2" DataTextField="bolum_adi" DataValueField="bolum_id">
                <asp:ListItem Value="1">Bilgisayar Mühendisliği</asp:ListItem>
                <asp:ListItem Value="2">Makine Mühendisliği</asp:ListItem>
                <asp:ListItem Value="3">Gıda Mühendisliği</asp:ListItem>
                <asp:ListItem Value="4">Elektrik Ve Elektronik Mühendisiği</asp:ListItem>
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:Tu_SinavConnectionString %>" SelectCommand="SELECT [bolum_id], [bolum_adi] FROM [Bolumler]"></asp:SqlDataSource>
        </p>
        <p>
            Ogrenci Ders :<asp:CheckBoxList ID="CheckBoxList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="ders_adi" DataValueField="ders_id" OnSelectedIndexChanged="CheckBoxList1_SelectedIndexChanged">
            </asp:CheckBoxList>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Tu_SinavConnectionString %>" SelectCommand="SELECT [ders_adi], [ders_id] FROM [Dersler]"></asp:SqlDataSource>
            &nbsp;
        </p>
        <p>
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Listeye Ekle" />
            
        </p>
    </form>
</body>
</html>
