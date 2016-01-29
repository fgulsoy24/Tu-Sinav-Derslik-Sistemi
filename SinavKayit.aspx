<%@ Page MasterPageFile="~/MasterPage.master" Language="C#" AutoEventWireup="true" CodeFile="SinavKayit.aspx.cs" Inherits="SinavKayit" %>

<%@ Register Assembly="DevExpress.Web.ASPxScheduler.v14.2, Version=14.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxScheduler" TagPrefix="dxwschs" %>

<%@ Register assembly="DevExpress.Web.v14.2, Version=14.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.ASPxPivotGrid.v14.2, Version=14.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxPivotGrid" tagprefix="dx" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <script>       function OnArrivalDateValidation(s, e) {
            var selectedDate = s.date;
            if(selectedDate == null || selectedDate == false)
                return;
            var currentDate = new Date();
            if(currentDate.getFullYear() != selectedDate.getFullYear() || currentDate.getMonth() != selectedDate.getMonth())
                e.isValid = true;
        }
    </script>
 <link href='http://fonts.googleapis.com/css?family=Asap' rel='stylesheet' type='text/css'>
     <div id='content' style="font-family:Asap;"> 
     <div style="position: absolute; left: 100px; width: 300px; ">
         <h2>Sınav Kayıt</h2> 
         
          <h5> Bölüm Seçimi </h5> 
     
         <asp:DropDownList ID="DropDownList7" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="bolum_adi" DataValueField="bolum_id" Font-Name="Asap" CssClass="dropdown" >
         </asp:DropDownList>
        
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:Tu_SinavConnectionString %>" SelectCommand="SELECT [bolum_id], [bolum_adi] FROM [Bolumler]" OnSelecting="SqlDataSource2_Selecting"></asp:SqlDataSource>
     <br />
     <br />
     <h5> Ders Seçimi </h5> 
    <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="DersDataSource" DataTextField="ders_adi" DataValueField="ders_id" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged" Font-Name="Asap" CssClass="dropdown" AutoPostBack="True" OnDataBound="MyListDataBound" Font-Names="Asap">
        
  </asp:DropDownList>
         
        <asp:SqlDataSource ID="DersDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:Tu_SinavConnectionString %>" SelectCommand="SELECT * FROM [Dersler] WHERE ([bolum_id] = @bolum_id)" OnSelecting="DersDataSource_Selecting">
            <SelectParameters>
                
                <asp:ControlParameter ControlID="DropDownList7" Name="bolum_id" PropertyName="SelectedValue" Type="Int32" DefaultValue="" />
            </SelectParameters>
        </asp:SqlDataSource>

            <h5>Sınav Türü :</h5> 
         <asp:DropDownList ID="DropDownList1" runat="server">
             <asp:ListItem>Vize</asp:ListItem>
             <asp:ListItem>Final</asp:ListItem>
         </asp:DropDownList>
           
         

        
         <h5>Sınav Tarih ve Saat Seçimi :</h5>
              <dx:ASPxDateEdit runat="server" Width="160px" ID="ArrivalDateEdit"
                        ClientInstanceName="ArrivalDate" OnValidation="ArrivalDateEdit_Validation" OnDateChanged="ArrivalDateEdit_DateChanged">
                        
                       
                        <InvalidStyle BackColor="LightPink" />
                    </dx:ASPxDateEdit>

          <asp:DropDownList ID="DropDownList8" runat="server" OnSelectedIndexChanged="DropDownList8_SelectedIndexChanged">
              <asp:ListItem>08:00</asp:ListItem>
              <asp:ListItem>09:00</asp:ListItem>
              <asp:ListItem>10:00</asp:ListItem>
              <asp:ListItem>11:00</asp:ListItem>
              <asp:ListItem>12:00</asp:ListItem>
              <asp:ListItem>13:00</asp:ListItem>
              <asp:ListItem>14:00</asp:ListItem>
              <asp:ListItem>15:00</asp:ListItem>
              <asp:ListItem>16:00</asp:ListItem>
              <asp:ListItem>17:00</asp:ListItem>
              <asp:ListItem>18:00</asp:ListItem>
              <asp:ListItem>19:00</asp:ListItem>
         </asp:DropDownList>

      
         <br />
          <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Ekle"  Font-Size="11"  CssClass="btn btn-primary btn-lg"  />
            <asp:Label ID="lblbasari" runat="server"></asp:Label>
          </div> 

    </div>
        </div>
    <div style="position: absolute; left: 500px; width: 1000px; height : 400px; " >
    <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" EnableTheming="True" KeyFieldName="Sinav_id" Theme="Office2010Silver" Width="729px">
        <Columns>
            <dx:GridViewCommandColumn Caption=" " ShowDeleteButton="True" ShowEditButton="True" ShowNewButtonInHeader="True" VisibleIndex="0">
            </dx:GridViewCommandColumn>
            <dx:GridViewDataTextColumn FieldName="Sinav_id" ReadOnly="True" Visible="False" VisibleIndex="1">
                <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Ders Kodu" FieldName="ders_id" ReadOnly="True" VisibleIndex="3">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataDateColumn Caption="Sınav Tarihi" FieldName="tarih" VisibleIndex="4">
            </dx:GridViewDataDateColumn>
            <dx:GridViewDataTextColumn Caption="Sınav Türü" FieldName="sinav_tur" VisibleIndex="5">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="yapilis_tur" SortIndex="0" SortOrder="Descending" Visible="False" VisibleIndex="6">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Ders Adı" FieldName="ders_adi" ReadOnly="True" VisibleIndex="2">
            </dx:GridViewDataTextColumn>
        </Columns>
        <SettingsCommandButton>
            <NewButton Text="Yeni">
            </NewButton>
            <UpdateButton Text="Güncelle">
            </UpdateButton>
            <EditButton Text="Düzenle">
            </EditButton>
            <DeleteButton Text="Sil">
            </DeleteButton>
            <SearchPanelClearButton Text="Temizle">
            </SearchPanelClearButton>
        </SettingsCommandButton>
        <SettingsDataSecurity AllowInsert="False" />
    </dx:ASPxGridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Tu_SinavConnectionString %>" DeleteCommand="DELETE FROM ogr_sinav_derslik WHERE sinav_id= @sinav_id DELETE FROM Sinavlar WHERE sinav_id= @sinav_id" InsertCommand="INSERT INTO Sinavlar() VALUES ()" SelectCommand="SELECT Sinavlar.Sinav_id, Sinavlar.ders_id, Sinavlar.tarih, Sinavlar.sinav_tur, Sinavlar.yapilis_tur, Sinavlar.sinav_saati, Dersler.ders_adi FROM Sinavlar INNER JOIN Dersler ON Sinavlar.ders_id = Dersler.ders_id" UpdateCommand="UPDATE Sinavlar SET tarih = @tarih, sinav_tur = @sinav_tur WHERE sinav_id= @sinav_id">
        <DeleteParameters>
            <asp:Parameter Name="Sinav_id" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="tarih" />
            <asp:Parameter Name="sinav_tur" />
            <asp:Parameter Name="sinav_id" />
        </UpdateParameters>
    </asp:SqlDataSource>
        </div>
    <title></title>
    
 </asp:Content>  
