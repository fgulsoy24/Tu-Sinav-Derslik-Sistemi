<%@ Page Language="C#" AutoEventWireup="true" CodeFile="DersKayit.aspx.cs" Inherits="DersKayit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>

        Ders Ekle<br />
        <br />
        Ders ID :
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
         <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Alanlar Boş Bırakılamaz" ControlToValidate="TextBox1"></asp:RequiredFieldValidator>
        <asp:Label ID="lbldurum" runat="server"></asp:Label>
    
    </div>
        <p>
            Ders Adı:
            <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
             <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Alanlar Boş Bırakılamaz" ControlToValidate="TextBox1"></asp:RequiredFieldValidator>
        </p>
        <p>
            Dersin Bölümü :
            <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="bolumsource" DataTextField="bolum_adi" DataValueField="bolum_id">
            </asp:DropDownList>
            <asp:SqlDataSource ID="bolumsource" runat="server" ConnectionString="<%$ ConnectionStrings:Tu_SinavConnectionString %>" SelectCommand="SELECT [bolum_id], [bolum_adi] FROM [Bolumler]"></asp:SqlDataSource>
        </p>
        <p>
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Ekle" Height="25px" Width="47px" />
            
            <asp:Label ID="lblbasari" runat="server"></asp:Label>
        </p>
        <p>
            Ders Çıkart</p>
        <asp:CheckBoxList ID="CheckBoxList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="ders_adi" DataValueField="ders_id" OnSelectedIndexChanged="CheckBoxList1_SelectedIndexChanged">
            </asp:CheckBoxList>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Tu_SinavConnectionString %>" SelectCommand="SELECT [ders_adi], [ders_id] FROM [Dersler]"></asp:SqlDataSource>
            <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Çıkart" CausesValidation="false" />
        <br />
    </form>
</body>
</html>
