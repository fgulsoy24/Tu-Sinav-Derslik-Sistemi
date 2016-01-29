<%@ Page Language="C#" AutoEventWireup="true" CodeFile="OgrenciKayit.aspx.cs" Inherits="OgrenciKayit"  %>

<%@ Register Assembly="DevExpress.Web.v14.2, Version=14.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<%@ Register assembly="DevExpress.Web.ASPxPivotGrid.v14.2, Version=14.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxPivotGrid" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.ASPxScheduler.v14.2, Version=14.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxScheduler" tagprefix="dxwschs" %>
<%@ Register assembly="DevExpress.XtraScheduler.v14.2.Core, Version=14.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.XtraScheduler" tagprefix="cc1" %>
<%@ Register assembly="DevExpress.Web.ASPxScheduler.v14.2, Version=14.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxScheduler.Reporting" tagprefix="dxwschsc" %>
<%@ Register assembly="DevExpress.Dashboard.v14.2.Web, Version=14.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.DashboardWeb" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.ASPxScheduler.v14.2, Version=14.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxScheduler.Controls" tagprefix="dxwschsc" %>

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
        <p>
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:Tu_SinavConnectionString %>" SelectCommand="SELECT [sinav_saati], [Sinav_id] FROM [Sinavlar]">
            </asp:SqlDataSource>
            
            <dxwschsc:ASPxSchedulerStoragePrintAdapter ID="ASPxSchedulerStoragePrintAdapter1" runat="server">
            </dxwschsc:ASPxSchedulerStoragePrintAdapter>
            <dxwschsc:ASPxSchedulerControlPrintAdapter ID="ASPxSchedulerControlPrintAdapter1" runat="server">
            </dxwschsc:ASPxSchedulerControlPrintAdapter>
            <dxwschs:ASPxScheduler ID="ASPxScheduler1" runat="server" AppointmentDataSourceID="SqlDataSource3" ClientIDMode="AutoID" ResourceDataSourceID="SqlDataSource3" Start="2015-05-04"  OnPopupMenuShowing="ASPxScheduler1_PopupMenuShowing" OnBeforeExecuteCallbackCommand="ASPxScheduler1_BeforeExecuteCallbackCommand">
                <Storage>
                    <Appointments>
                        <CustomFieldMappings>
                            <dxwschs:ASPxAppointmentCustomFieldMapping Member="Sinav_id" Name="Sinavİd" />
                            <dxwschs:ASPxAppointmentCustomFieldMapping Member="sinav_saati" Name="SinavSaati" />
                        </CustomFieldMappings>
                    </Appointments>
                    <Resources>
                        <Mappings ResourceId="sinav_saati" />
                    </Resources>
                </Storage>
                <Views>
<DayView><TimeRulers>
<cc1:TimeRuler></cc1:TimeRuler>
</TimeRulers>
</DayView>

<WorkWeekView><TimeRulers>
<cc1:TimeRuler></cc1:TimeRuler>
</TimeRulers>
</WorkWeekView>

                    <WeekView Enabled="false">
                    </WeekView>
                    <FullWeekView Enabled="true">
                        <TimeRulers>
<cc1:TimeRuler></cc1:TimeRuler>
</TimeRulers>
                    </FullWeekView>
                </Views>
            </dxwschs:ASPxScheduler>
            
        </p>
        <p>
            <asp:CheckBoxList ID="CheckBoxList2" runat="server" OnSelectedIndexChanged="CheckBoxList2_SelectedIndexChanged">
                <asp:ListItem>09:00</asp:ListItem>
                <asp:ListItem>10:00</asp:ListItem>
                <asp:ListItem>11:00</asp:ListItem>
                <asp:ListItem>12:00</asp:ListItem>
                <asp:ListItem>13:00</asp:ListItem>
            </asp:CheckBoxList>
            
        </p>
    </form>
</body>
</html>

