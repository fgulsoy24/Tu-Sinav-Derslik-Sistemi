<%@ Page MasterPageFile="~/MasterPage.master" Language="C#" AutoEventWireup="true" CodeFile="SinifListeleri.aspx.cs" Inherits="SinifListeleri"  %>
<%@ Register Assembly="DevExpress.Web.v14.2, Version=14.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
    <asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <link href='http://fonts.googleapis.com/css?family=Asap' rel='stylesheet' type='text/css'>

 <div class="container" style="font-family:Asap;" >  
     <h1 style="font-family: 'Habibi', serif; color:#808080">Sınıf Listesi Sorgulama</h1>
     <h5> Bölüm </h5> 
     
         <asp:DropDownList ID="DropDownList7" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="bolum_adi" DataValueField="bolum_id" Font-Name="Asap" CssClass="dropdown" >
         </asp:DropDownList>
        
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:Tu_SinavConnectionString %>" SelectCommand="SELECT [bolum_id], [bolum_adi] FROM [Bolumler]" OnSelecting="SqlDataSource2_Selecting"></asp:SqlDataSource>
     <br />
     <br />
     <h5> Ders </h5> 
    <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="DersDataSource" DataTextField="ders_adi" DataValueField="ders_id" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged" Font-Name="Asap" CssClass="dropdown" AutoPostBack="True" OnDataBound="MyListDataBound" Font-Names="Asap">
        
  </asp:DropDownList>
         
        <asp:SqlDataSource ID="DersDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:Tu_SinavConnectionString %>" SelectCommand="SELECT * FROM [Dersler] WHERE ([bolum_id] = @bolum_id)" OnSelecting="DersDataSource_Selecting">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList7" Name="bolum_id" PropertyName="SelectedValue" Type="Int32" DefaultValue="" />
            </SelectParameters>
        </asp:SqlDataSource>
     <br />
     </div>
    <div class="container" style="font-family:Asap;" >  
    <style>    
        .dropdown {
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
            border: 1px solid #ccc;
            border: 1px solid rgba(0, 0, 0, 0.2);
            *border-right-width: 2px;
            *border-bottom-width: 2px;
            -webkit-border-radius: 6px;
            -moz-border-radius: 6px;
            border-radius: 6px;
            -webkit-box-shadow: 0 5px 10px rgba(0, 0, 0, 0.2);
            -moz-box-shadow: 0 5px 10px rgba(0, 0, 0, 0.2);
            box-shadow: 0 5px 10px rgba(0, 0, 0, 0.2);
            -webkit-background-clip: padding-box;
            -moz-background-clip: padding;
            background-clip: padding-box;
          
        }
    </style>   

      
     <h5> Sınav Tarihi   </h5>
        <asp:DropDownList ID="DropDownList6" runat="server" DataSourceID="SinavTarihiDataSource" DataTextField="SINAVTARİHİ" DataValueField="Column1" AutoPostBack="True" OnSelectedIndexChanged="DropDownList6_SelectedIndexChanged" OnDataBound="Dropdown6onDataBound" Font-Name="Asap" CssClass="dropdown" >
        </asp:DropDownList>
        
        <asp:SqlDataSource ID="SinavTarihiDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:Tu_SinavConnectionString %>" SelectCommand="SELECT Sinavlar.Sinav_id, convert(varchar(10) ,Sinavlar.tarih,120) , Sinavlar.ders_id,  Dersler.ders_adi +SPACE(2)+ convert(varchar,Sinavlar.tarih,104)  + SPACE(2)   + convert(varchar(5),Sinavlar.sinav_saati ) + SPACE(2)   +  UPPER(Sinavlar.sinav_tur)   AS SINAVTARİHİ FROM Sinavlar INNER JOIN Dersler  ON Sinavlar.ders_id = Dersler.ders_id WHERE (Sinavlar.ders_id = @ders_id) AND (Sinavlar.tarih &gt; GETDATE())">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList2" Name="ders_id" PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
     
     </div>

    <div class="container" style="font-family:Asap;" >  
   
        <h5> Derslik    </h5>
   
     
         <asp:DropDownList ID="DropDownList5" runat="server" DataSourceID="derslikdatasource" DataTextField="derslik_adi" DataValueField="derslik_id" Font-Name="Asap"  CssClass="dropdown" Font-Names="Asap">
    </asp:DropDownList> 
            
         <asp:SqlDataSource ID="derslikdatasource" runat="server" ConnectionString="<%$ ConnectionStrings:Tu_SinavConnectionString %>" SelectCommand="SELECT DISTINCT ogr_sinav_derslik.Sinav_id, ogr_sinav_derslik.derslik_id, Derslik.derslik_id AS Expr1, Derslik.derslik_adi, Derslik.derslik_kapasite FROM ogr_sinav_derslik INNER JOIN Derslik ON ogr_sinav_derslik.derslik_id = Derslik.derslik_id where sinav_id IN  (SELECT sinav_id FROM ogr_sinav_derslik WHERE Sinav_id IN (select sinav_id from Sinavlar where ders_id = @ders_id and tarih=@tarih))">
             <SelectParameters>
                 <asp:ControlParameter ControlID="DropDownList2" Name="ders_id" PropertyName="SelectedValue" />
                 <asp:ControlParameter ControlID="DropDownList6" Name="tarih" PropertyName="SelectedValue" />
             </SelectParameters>
        </asp:SqlDataSource>
            
         </div>
    <br /> 
     </div>

    
    <div>       <div class="container" style="font-family:Asap;" >  
    <asp:Button ID="Button1" runat="server" Text="Sınıf Listesi" OnClick="Button1_Click" CssClass="btn btn-primary btn-lg" />
        </div>
        </div>
        
   
    </asp:Content>
