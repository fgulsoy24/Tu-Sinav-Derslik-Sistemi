<%@ Page MasterPageFile="~/MasterPage.master"  Language="C#" AutoEventWireup="true" CodeFile="DersKayit.aspx.cs" Inherits="DersKayit" %>

<%@ Register assembly="DevExpress.Web.v14.2, Version=14.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.ASPxScheduler.v14.2, Version=14.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxScheduler" tagprefix="dxwschs" %>
<%@ Register assembly="DevExpress.XtraScheduler.v14.2.Core, Version=14.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.XtraScheduler" tagprefix="cc1" %>
<%@ Register assembly="DevExpress.Web.ASPxScheduler.v14.2, Version=14.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxScheduler.Reporting" tagprefix="dxwschsc" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <title></title>
    <style type="text/css">
 
      
        
.dropdown {
  
}
        </style>  
    <script>
        jQuery(document).ready(function () {
            jQuery('#hideshow').live('click', function (event) {
                jQuery('#content').toggle('show');
            });
        });

    </script>
   
  
         
    <link href='http://fonts.googleapis.com/css?family=Asap' rel='stylesheet' type='text/css'>
     
 <div id='content'> 
     <div style="position: absolute; left: 100px; width: 300px; font-family:Asap; ">
         <h2>Ders Ekle</h2> 
            <h5>Ders Kodu :</h5> <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
         <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Alanlar Boş Bırakılamaz" ControlToValidate="TextBox1"></asp:RequiredFieldValidator>
        <asp:Label ID="lbldurum" runat="server"></asp:Label>
    
      
            <h5>Ders Adı :</h5>
            <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
             <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Alanlar Boş Bırakılamaz" ControlToValidate="TextBox1"></asp:RequiredFieldValidator>
      
            <h5>Bölüm </h5> 
            <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="bolumsource" DataTextField="bolum_adi" DataValueField="bolum_id">
            </asp:DropDownList>
            <asp:SqlDataSource ID="bolumsource" runat="server" ConnectionString="<%$ ConnectionStrings:Tu_SinavConnectionString %>" SelectCommand="SELECT [bolum_id], [bolum_adi] FROM [Bolumler]"></asp:SqlDataSource>
      <br />
          <br />
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Ekle"  Font-Size="11"  CssClass="btn btn-primary btn-lg"  />
            <asp:Label ID="lblbasari" runat="server"></asp:Label>
          </div> 

    </div>
        </div>
           
        <div style="position: absolute; left: 500px; width: 1000px; height : 400px; " >
            
            <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="UpdateDataSource" EnableTheming="True" KeyFieldName="ders_id" Theme="Office2010Silver" Width="731px" PreviewFieldName="bolum_id" >
                <Columns>
                    <dx:GridViewCommandColumn Caption=" " ShowDeleteButton="True" ShowEditButton="True" VisibleIndex="0">
                    </dx:GridViewCommandColumn>
                    <dx:GridViewDataTextColumn FieldName="ders_id" VisibleIndex="1" ReadOnly="True" Caption="Ders Kodu">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="ders_adi" VisibleIndex="2" Caption="Ders Adı">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataDateColumn FieldName="sınav_tarihi" Visible="False" VisibleIndex="3">
                    </dx:GridViewDataDateColumn>
                    <dx:GridViewDataTextColumn FieldName="bolum_id" VisibleIndex="4" Visible="False">
                    </dx:GridViewDataTextColumn>
                </Columns>
                <SettingsPager>
                    <Summary Text="Sayfa {0} / {1} ({2} Kayıt )" />
                </SettingsPager>
                <Settings ShowFilterRow="True" />
                <SettingsText CommandCancel="İptal" CommandDelete="Sil" CommandEdit="Düzenle" CommandUpdate="Güncelle" />
                <SettingsLoadingPanel Text="Yükleniyor&amp;hellip;" />
                <SettingsDataSecurity AllowInsert="False" />
                <Paddings />
            </dx:ASPxGridView>
        </div>
            
                </div>
          <br />
     <br />
     <br />
     <br />


   
      
            <asp:SqlDataSource ID="UpdateDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:Tu_SinavConnectionString %>" DeleteCommand="DELETE FROM ogrenci_ders WHERE (ders_id = @original_ders_id) 
DELETE FROM Sinavlar WHERE (ders_id = @original_ders_id) 
DELETE FROM Dersler  WHERE (ders_id = @original_ders_id) " InsertCommand="INSERT INTO [Dersler] ([ders_id], [ders_adi], [sınav_tarihi], [bolum_id], [sinav_saati]) VALUES (@ders_id, @ders_adi, @sınav_tarihi, @bolum_id, @sinav_saati)" SelectCommand="SELECT ders_id, ders_adi, sınav_tarihi, bolum_id, sinav_saati FROM Dersler" UpdateCommand="UPDATE Dersler SET ders_adi = @ders_adi, sınav_tarihi = @sınav_tarihi, bolum_id = @bolum_id, sinav_saati = @sinav_saati FROM Dersler INNER JOIN Sinavlar ON Dersler.ders_id = Sinavlar.ders_id WHERE (Dersler.ders_id = @original_ders_id)" OldValuesParameterFormatString="original_{0}">
                <DeleteParameters>
                    <asp:Parameter Name="original_ders_id" Type="String" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="ders_id" Type="String" />
                    <asp:Parameter Name="ders_adi" Type="String" />
                    <asp:Parameter DbType="Date" Name="sınav_tarihi" />
                    <asp:Parameter Name="bolum_id" Type="Int32" />
                    <asp:Parameter DbType="Time" Name="sinav_saati" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="ders_adi" Type="String" />
                    <asp:Parameter Name="sınav_tarihi" DbType="Date" />
                    <asp:Parameter Name="bolum_id" Type="Int32" />
                    <asp:Parameter DbType="Time" Name="sinav_saati" />
                    <asp:Parameter Name="original_ders_id" Type="String" />
                </UpdateParameters>
            </asp:SqlDataSource>
        <br />
       </div>
    </asp:Content>  