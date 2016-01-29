<%@ Page Language="C#" AutoEventWireup="true" CodeFile="OgrenciListele.aspx.cs" Inherits="OgrenciListele" %>

<%@ Register assembly="DevExpress.XtraReports.v14.2.Web, Version=14.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.XtraReports.Web" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v14.2, Version=14.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>
<%@ Register assembly="DevExpress.XtraReports.v14.2.Web, Version=14.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.XtraReports.Web.ClientControls" tagprefix="cc1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>

    
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        Sorgulama Motoru Ders Seç
       
        
        <dx:ASPxDocumentViewer ID="ASPxDocumentViewer1" runat="server" ReportTypeName="XtraReport1" Theme="Office2010Blue" ToolbarMode="Ribbon">
        </dx:ASPxDocumentViewer>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Tu_SinavConnectionString %>" SelectCommand="SELECT [ders_id], [ders_adi] FROM [Dersler]"></asp:SqlDataSource>
        <dx:ASPxButton ID="ASPxButton1" runat="server" Text="Slider Oluştur." OnClick="ASPxButton1_Click"></dx:ASPxButton>
    </div>
      
    </form>
</body>
</html>
