using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.OleDb;
using System.Data.SqlClient;
using System.Configuration;
using System.Collections;
using DevExpress.XtraReports.UI;
using DevExpress.XtraReports.Parameters;
public partial class DersliklereDagit : System.Web.UI.Page
{
    Fonksiyonlar vt = new Fonksiyonlar();
    protected void Page_Load(object sender, EventArgs e)
    {


       
    }
    protected void Calendar1_SelectionChanged(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        SqlConnection baglan = vt.baglan();
            SqlCommand cmd;
            SqlCommand komut;
            
            
     komut = new SqlCommand(" select COUNT(*) from Sinavlar where ders_id =@ders_id and tarih=@tarih", baglan);
     komut.Parameters.AddWithValue("ders_id", DropDownList2.SelectedValue);
     komut.Parameters.AddWithValue("tarih", DropDownList6.SelectedValue);

     int derssayisi = (int)komut.ExecuteScalar();
     if (derssayisi < 1)
     {  
             Response.Write("<script lang='JavaScript'> alert ('Bu Derse Ait Sınav Kaydı Bulunamadı.');</script>");
             
     }
     else
     {
         cmd = new SqlCommand("Ogrenci_Sinav", baglan);
         cmd.CommandType = CommandType.StoredProcedure;
         cmd.Parameters.AddWithValue("@ders_id", DropDownList2.SelectedValue);
         cmd.Parameters.AddWithValue("@ogr_no", "");
         cmd.Parameters.AddWithValue("@tarih", DropDownList6.SelectedValue);
         cmd.ExecuteNonQuery();


         SqlCommand db_komut;

         string sorgu = "  SELECT COUNT(*) FROM ogr_sinav_derslik WHERE Sinav_id IN (  select Sinav_id from tempdb..ogrenci_sinav) ";
         db_komut = new SqlCommand(sorgu, baglan);
         int kayitsayisi = (int)db_komut.ExecuteScalar();
         /* kayda girecek öğrenci sayısını kontrol */
         string ogrencisayi = "SELECT COUNT(*) FROM tempdb..ogrenci_sinav WHERE Sinav_id IN (SELECT sinav_id from [dbo].[Sinavlar] Where ders_id=@ders_id AND tarih=@tarih) ";
         db_komut = new SqlCommand(ogrencisayi, baglan);
         db_komut.Parameters.AddWithValue("ders_id", DropDownList2.SelectedValue);
         db_komut.Parameters.AddWithValue("tarih", DropDownList6.SelectedValue);
         int ogrencisayisi = (int)db_komut.ExecuteScalar();
         /* kayda girecek öğrenci sayısını kontrol */
         int derslikkapasitesi = 0;
         int m = 0;
         for (int k = 0; k < CheckBoxList1.Items.Count; k++)
         {
             if (CheckBoxList1.Items[k].Selected)
             {

                 string derslikkapasite = "select derslik_kapasite from Derslik where derslik_id =@derslik_id ";
                 db_komut = new SqlCommand(derslikkapasite, baglan);
                 db_komut.Parameters.AddWithValue("derslik_id", CheckBoxList1.Items[k].Value);
                 derslikkapasitesi = (int)db_komut.ExecuteScalar();

                 m = m + derslikkapasitesi;
             }
         }
         if (m < ogrencisayisi)
         {  Response.Write("<script lang='JavaScript'> alert ('Derslik Kapasitesi Yetersiz Lütfen Derslik Ekleyiniz.');</script>"); 
         }
         else
         {

             if (kayitsayisi > 1)
             {
                 Response.Write("<script lang='JavaScript'> alert ('Bu sınava ait kayıt bulunmaktadır. Lütfen tekrar deneyiniz.');</script>");

                 baglan.Close();
             }
             else
             {
                 for (int i = 0; i < CheckBoxList1.Items.Count; i++)
                 {
                     if (CheckBoxList1.Items[i].Selected)
                     {
                         cmd = new SqlCommand("ogrenci_derslik", baglan);
                         cmd.CommandType = CommandType.StoredProcedure;
                         cmd.Parameters.AddWithValue("@derslik_id", CheckBoxList1.Items[i].Value);
                         cmd.ExecuteNonQuery();

                     }
                 }
                 Response.Write("<script lang='JavaScript'> alert ('Ders Kaydı Başarılı!');</script>");
             }

         }

     }
  
}
    protected void MyListDataBound(object sender, EventArgs e)
    {
        DropDownList2.Items.Insert(0, new ListItem("- Select -", ""));
    }
    protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
{
    if (DropDownList2.SelectedValue != "")
    {
        DropDownList6.DataBind();
        if (DropDownList6.Items.Count == 0)
        {
            Response.Write("<script lang='JavaScript'> alert ('Bu Derse Ait Sınav Kaydı Bulunamadı.');</script>");
        }
    }
        

}
    

protected void Button2_Click(object sender, EventArgs e)
{
    SqlConnection baglan = vt.baglan();
    SqlCommand komut;
    /* ders_id ve tarih bilgisi ile sınav_id bilgisinin elde edilmesi*/
    
    
    komut = new SqlCommand(" SELECT sinav_id FROM ogr_sinav_derslik WHERE Sinav_id IN (select sinav_id from Sinavlar where ders_id =@ders_id and tarih=@tarih)", baglan);
    komut.Parameters.AddWithValue("ders_id", DropDownList2.SelectedValue);
    komut.Parameters.AddWithValue("tarih", DropDownList6.SelectedValue);
    
    int sinavid = 0;
    object a = (int?)komut.ExecuteScalar();
    /* ders_id ve tarih bilgisi ile sınav_id bilgisinin elde edilmesi*/
    if (a == null) { Response.Write("<script lang='JavaScript'> alert ('Bu Derse Ait Kayıt Bulunamadı!');</script>"); }
    else
    {
        sinavid = (int)a;
        

        /*DersliklereDagit.aspx'den OgrenclListele.aspx raporuna sınavid bilgisinin  aktarımı ve popup ile açılması*/
    string queryString = "OgrenciListele.aspx?ders_id=" + sinavid + "";
    string newWin = "window.open('" + queryString + "', width=200, height=150);";
    ClientScript.RegisterStartupScript(this.GetType(), "pop", newWin, true);
        /*DersliklereDagit.aspx'den OgrenclListele.aspx raporuna sınavid bilgisinin  aktarımı ve popup ile açılması*/
    }
}
protected void DersDataSource_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
{

}
protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
{
}
protected void SqlDataSource1_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
{

}
}