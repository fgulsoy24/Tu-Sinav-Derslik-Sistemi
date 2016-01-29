<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Tvlistslider.aspx.cs" Inherits="EkranListesi_Tvlistslider" %>

<%@ Register Assembly="DevExpress.Web.v14.2, Version=14.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <style> 
        html, body, form {
    height: 100%;
    margin: 0;
}

.header {
    top: 0;
    position: absolute;
    z-index: 3;
    width: 100%;
    background-color: #4d4d4d;
    background-color: rgba(0, 0, 0, 0.5);
}

.logo {
    color: #ffd215;
    float: left;
    margin-left: 10px;
}

.text {
    font-size: 25px;
    font-family: Helvetica, Arial;
    margin: 15px 8px;
}

.navigation {
    float: right;
    margin-right: 10px;
}

    .navigation > .text {
        color: #fff;
        float: right;
        cursor: pointer;
    }

/* ASPxImageSlider styles */

.dxWeb_isDot,
.dxWeb_isDotSelected {
    background-image: url();
}

.dxisControl .dxis-nbDotItem {
    width: 50px;
    height: 5px;
    background-color: #fff;
    filter: progid:DXImageTransform.Microsoft.Alpha(Style=0, Opacity=45);
    opacity: 0.45;
}

.dxisControl .dxis-nbDotItemSelected {
    filter: progid:DXImageTransform.Microsoft.Alpha(Style=0, Opacity=100) !important;
    opacity: 1 !important;
}

.dxisControl .dxis-nbDotsBottom {
    margin-top: -75px;
}

    </style>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
       
   
            
    <div>
          <dx:ASPxImageSlider ID="ASPxImageSlider1" runat="server" ClientInstanceName="ImageSlider"
        EnableViewState="False" EnableTheming="False" NavigateUrlFormatString="javascript:void({0});" Width="1846" Height="1039">
        <SettingsImageArea ImageSizeMode="ActualSizeOrFit" NavigationButtonVisibility="None"
            ItemTextVisibility="Always" EnableLoopNavigation="true" />
        <SettingsNavigationBar Mode="Dots" />

 <SettingsSlideShow AutoPlay="true" StopPlayingWhenPaging="false" PausePlayingWhenMouseOver="false" PlayPauseButtonVisibility="Faded" Interval="10000"></SettingsSlideShow>
        <Items>
           
        </Items>
        <Styles>
            <ImageArea />
        </Styles>
            
        </dx:ASPxImageSlider>
      
      
    </div> 
             <dx:ASPxLabel ID="lbSelectFolder" runat="server" Text="Gösterilecek Sınavı Seçin" AssociatedControlID="cbSelectFolder">
    </dx:ASPxLabel>
        <dx:ASPxComboBox ID="cbSelectFolder" runat="server" AutoPostBack="True" OnSelectedIndexChanged="cbSelectFolder_SelectedIndexChanged"
        SelectedIndex="0" style="margin-top: 4px; margin-bottom: 11px;" Width="400">
 
    </dx:ASPxComboBox>
    </form>
</body>
</html>
