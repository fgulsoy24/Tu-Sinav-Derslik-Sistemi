<%@ Page MasterPageFile="~/MasterPage.master"  Language="C#" AutoEventWireup="true" CodeFile="DerslikKayit.aspx.cs" Inherits="DerslikKayit" %>

<%@ Register assembly="DevExpress.Web.v14.2, Version=14.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <title></title>
</head>
<body>
    
    
     <div id='content'> 
     <div style="position: absolute; left: 250px; width: 800px; ">
    <h2 style="font-family: 'Habibi', serif;">Derslik Kayıt </h2>
        <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="DerslikDataSource" EnableTheming="True" KeyFieldName="derslik_id" Theme="Office2010Silver" Width="801px">
            <Columns>
                <dx:GridViewCommandColumn ShowDeleteButton="True" ShowEditButton="True" ShowNewButtonInHeader="True" VisibleIndex="0" Caption=" " ShowClearFilterButton="True">
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn FieldName="derslik_id" VisibleIndex="1" Caption="Derslik Kodu">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="derslik_adi" VisibleIndex="2" Caption="Derslik Adı">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="derslik_kapasite" VisibleIndex="3" Caption="Derslik Kapasitesi">
                </dx:GridViewDataTextColumn>
            </Columns>
            <Settings ShowFilterRow="True" />
            <SettingsCommandButton>
                <NewButton Text="Yeni">
                </NewButton>
                <UpdateButton Text="Ekle">
                </UpdateButton>
                <CancelButton Text="İptal">
                </CancelButton>
                <EditButton Text="Düzenle">
                </EditButton>
                <DeleteButton Text="Sil">
                </DeleteButton>
            </SettingsCommandButton>
        </dx:ASPxGridView>
        <asp:SqlDataSource ID="DerslikDataSource" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:Tu_SinavConnectionString %>" DeleteCommand="DELETE FROM [Derslik] WHERE [derslik_id] = @original_derslik_id AND (([derslik_adi] = @original_derslik_adi) OR ([derslik_adi] IS NULL AND @original_derslik_adi IS NULL)) AND (([derslik_kapasite] = @original_derslik_kapasite) OR ([derslik_kapasite] IS NULL AND @original_derslik_kapasite IS NULL))" InsertCommand="INSERT INTO [Derslik] ([derslik_id], [derslik_adi], [derslik_kapasite]) VALUES (@derslik_id, @derslik_adi, @derslik_kapasite)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Derslik]" UpdateCommand="UPDATE [Derslik] SET [derslik_adi] = @derslik_adi, [derslik_kapasite] = @derslik_kapasite WHERE [derslik_id] = @original_derslik_id AND (([derslik_adi] = @original_derslik_adi) OR ([derslik_adi] IS NULL AND @original_derslik_adi IS NULL)) AND (([derslik_kapasite] = @original_derslik_kapasite) OR ([derslik_kapasite] IS NULL AND @original_derslik_kapasite IS NULL))">
            <DeleteParameters>
                <asp:Parameter Name="original_derslik_id" Type="String" />
                <asp:Parameter Name="original_derslik_adi" Type="String" />
                <asp:Parameter Name="original_derslik_kapasite" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="derslik_id" Type="String" />
                <asp:Parameter Name="derslik_adi" Type="String" />
                <asp:Parameter Name="derslik_kapasite" Type="Int32" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="derslik_adi" Type="String" />
                <asp:Parameter Name="derslik_kapasite" Type="Int32" />
                <asp:Parameter Name="original_derslik_id" Type="String" />
                <asp:Parameter Name="original_derslik_adi" Type="String" />
                <asp:Parameter Name="original_derslik_kapasite" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </div>
    </div>
    
</body>
  </asp:Content>  