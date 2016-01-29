<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Tvlistreport.aspx.cs" Inherits="EkranListesi_Tvlistreport" %>

<%@ Register assembly="DevExpress.XtraReports.v14.2.Web, Version=14.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.XtraReports.Web" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.v14.2, Version=14.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        
    
        <asp:Button ID="Button1" runat="server" OnClick="Capture" Text="Button" />
    
        
    
        <asp:Image ID="imgScreenShot" runat="server" />
    
        
    
    </div>
        <dx:ASPxDocumentViewer ID="ASPxDocumentViewer1" runat="server" ReportTypeName="TvListReportcs" EnableTheming="True" Theme="Aqua" AccessibilityCompliant="True" ToolbarMode="Ribbon">
            
<StylesViewer>
<Paddings Padding="10px"></Paddings>
</StylesViewer>

<StylesReportViewer>
<Paddings Padding="10px"></Paddings>
</StylesReportViewer>
            <ToolbarItems>
              
                
                <dx:ReportToolbarComboBox ItemKind="PageNumber" Name="deneme">
                </dx:ReportToolbarComboBox>
              

                <dx:ReportToolbarButton ItemKind="NextPage" />
                <dx:ReportToolbarTextBox />
              

            </ToolbarItems>
        </dx:ASPxDocumentViewer>
    </form>
</body>
</html>
