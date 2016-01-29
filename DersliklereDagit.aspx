    <%@ Page MasterPageFile="~/MasterPage.master" Language="C#" AutoEventWireup="true" CodeFile="DersliklereDagit.aspx.cs" Inherits="DersliklereDagit"  %>
<%@ Register Assembly="DevExpress.Web.v14.2, Version=14.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <link rel="stylesheet" type="text/css" href="css/bootstrap1.css" />
    <script src="JS/bootstrap.js"></script>


   
    <title>Derslik Seçimi</title>
    
     
   <link href='http://fonts.googleapis.com/css?family=Asap' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Habibi' rel='stylesheet' type='text/css'>
    
   
    <style> 
      
        .dropdown {
            border-left: 1px solid #ccc;
            border-right: 2px solid #ccc;
            border-top: 1px solid #ccc;
            border-bottom: 2px solid #ccc;
            position: center;
            top: 100%;
            left: 0;
            z-index: 1000;
            
            float: left;
            min-width: 160px;
            padding: 5px 0;
            margin: 2px 0 0;
            list-style: none;
            background-color: #ffffff;
            **-webkit-border-radius: 6px;
            -moz-border-radius: 6px;
            border-radius: 6px;
            -webkit-box-shadow: 0 5px 10px rgba(0, 0, 0, 0.2);
            -moz-box-shadow: 0 5px 10px rgba(0, 0, 0, 0.2);
            box-shadow: 0 5px 10px rgba(0, 0, 0, 0.2);
            -webkit-background-clip: padding-box;
            -moz-background-clip: padding;
            background-clip: padding-box;
            height: 29px;
        }
    </style>   

    
    <div class="container" >
    <h1 style="font-family: 'Habibi', serif; color:#808080">Dersliklere Dağıt </h1>
        </div>
    <div class="container" style="font-family:Asap;" >
    

                

        <h5>* Bölüm Adı    </h5>
        <asp:DropDownList ID="DropDownList5" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="bolum_adi" DataValueField="bolum_id" Font-Names="Asap" CssClass="dropdown">
        </asp:DropDownList> 
        
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:Tu_SinavConnectionString %>" SelectCommand="SELECT [bolum_id], [bolum_adi] FROM [Bolumler]"></asp:SqlDataSource>
        <br />
        <br />
        <h5>* Ders Adı    </h5>
        
        <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="DersDataSource" DataTextField="ders_adi" DataValueField="ders_id" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged" Font-Names="Asap" CssClass="dropdown" AutoPostBack="True" ondatabound="MyListDataBound"> 
            <asp:ListItem Selected="True" Value="" Text="Lütfen Seçiniz." > </asp:ListItem>
        </asp:DropDownList>
         
        <asp:SqlDataSource ID="DersDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:Tu_SinavConnectionString %>" SelectCommand="SELECT * FROM [Dersler] WHERE ([bolum_id] = @bolum_id)" OnSelecting="DersDataSource_Selecting">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList5" Name="bolum_id" PropertyName="SelectedValue" Type="Int32" DefaultValue="" />
            </SelectParameters>
        </asp:SqlDataSource>
       &nbsp; <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="DropDownList2" ErrorMessage="Lütfen Seçiniz." Font-Names="Asap" CssClass="dropdown"></asp:RequiredFieldValidator>
        <br />
       </div>
    <div class="container" style="font-family:Asap;" >
    <h5> * Sınav Tarihi </h5> 
        <asp:DropDownList ID="DropDownList6" runat="server" DataSourceID="SinavTarihiDataSource" DataTextField="SINAVTARİHİ" DataValueField="Column1" Font-Names="Asap" CssClass="dropdown" >
        </asp:DropDownList>
&nbsp;<asp:SqlDataSource ID="SinavTarihiDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:Tu_SinavConnectionString %>" SelectCommand="SELECT Sinavlar.Sinav_id, convert(varchar(10) ,Sinavlar.tarih,120) , Sinavlar.ders_id,  Dersler.ders_adi +SPACE(2)+ convert(varchar,Sinavlar.tarih,104)  + SPACE(2)   + convert(varchar(5),Sinavlar.sinav_saati ) + SPACE(2)   +  UPPER(Sinavlar.sinav_tur)   AS SINAVTARİHİ FROM Sinavlar INNER JOIN Dersler  ON Sinavlar.ders_id = Dersler.ders_id WHERE (Sinavlar.ders_id = @ders_id) AND (Sinavlar.tarih &gt; GETDATE())">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList2" Name="ders_id" PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="DropDownList6" ErrorMessage="Lütfen Seçiniz."></asp:RequiredFieldValidator>
          
       
        <br />
        </div>
         
    <div class="container" style="font-family: Asap;">
        <h5>* Derslik / Kapasite </h5>
            <asp:SqlDataSource ID="derslikdatasource" runat="server" ConnectionString="<%$ ConnectionStrings:Tu_SinavConnectionString %>" OnSelecting="SqlDataSource1_Selecting" SelectCommand="SELECT derslik_id AS derslik_id, derslik_adi + SPACE(2)  +'(' + CONVERT(varchar(4), Derslik_kapasite)+ ')' AS derslikadi , derslik_kapasite AS Expr3 FROM Derslik"></asp:SqlDataSource>
        
        <div class="checkbox">
            <asp:CheckBoxList ID="CheckBoxList1" runat="server" DataSourceID="DerslikDatasource" DataTextField="derslikadi" DataValueField="derslik_id" Width="300px" RepeatColumns="3">
            </asp:CheckBoxList>
        </div>
         
     
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Dağıt"  Font-Size="11"  CssClass="btn btn-primary btn-lg"  /> 
        <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Listele" Font-Size="11"  CssClass="btn btn-primary btn-lg" />
        
    </div>

   

        
    </asp:Content>
