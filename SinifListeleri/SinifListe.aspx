<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SinifListe.aspx.cs" Inherits="SinifListe" %>

<%@ Register Assembly="DevExpress.XtraReports.v14.2.Web, Version=14.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.XtraReports.Web" TagPrefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <dx:ASPxDocumentViewer ID="ASPxDocumentViewer1" runat="server" ReportTypeName="SinifListesi" Theme="Default" ToolbarMode="Ribbon"></dx:ASPxDocumentViewer>
    </div>
    </form>
</body>
</html>
