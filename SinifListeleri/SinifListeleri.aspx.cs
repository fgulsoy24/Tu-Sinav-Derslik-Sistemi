using System;
using System.Collections.Generic;
using System.Data.SqlClient;
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
    

public partial class SinifListeleri : System.Web.UI.Page
{
    Fonksiyonlar vt = new Fonksiyonlar();
    protected void Page_Load(object sender, EventArgs e)
    {

      
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        {
            SqlConnection baglan = vt.baglan();
            SqlCommand komut;
           
            /* ders_id ve tarihten sınavid elde edilmesi*/
            komut = new SqlCommand(" SELECT sinav_id FROM ogr_sinav_derslik WHERE Sinav_id IN (select sinav_id from Sinavlar where ders_id =@ders_id and tarih=@tarih)", baglan);
            komut.Parameters.AddWithValue("ders_id", DropDownList2.SelectedValue);
            komut.Parameters.AddWithValue("tarih", DropDownList6.SelectedValue);

            int sinavid = 0;
            object a = (int?)komut.ExecuteScalar();

            if (a == null) { Response.Write("<script lang='JavaScript'> alert ('Bu Derse Ait Kayıt Bulunamadı!');</script>"); }
            else
            {
                int derslik_id = Convert.ToInt32(DropDownList5.SelectedValue);
                komut = new SqlCommand("Select ogr_no from ogr_sinav_derslik WHERE derslik_id =@derslik_id and sinav_id = @sinav_id", baglan);
                komut.Parameters.AddWithValue("derslik_id", derslik_id);
                komut.Parameters.AddWithValue("sinav_id", a);
                int b = Convert.ToInt32(komut.ExecuteScalar());
                if (b == 0) { Response.Write("<script lang='JavaScript'> alert ('Bu Sınıfta Kayıt Bulunamadı!');</script>"); }
                else
                {
                    sinavid = (int)a;
                    /* ders_id ve tarihten sınavid elde edilmesi*/
                    /*SınıfListeleri.aspx'den SınıfListe.aspx raporuna sınavid ve derslik_id bilgisinin  aktarımı ve popup ile açılması*/
                    string queryString = "../SinifListeleri/SinifListe.aspx?Sinav_id=" + sinavid + "&derslik_id=" + derslik_id + "";
                    string newWin = "window.open('" + queryString + "', width=200, height=150);";
                    ClientScript.RegisterStartupScript(this.GetType(), "pop", newWin, true);
                    /*SınıfListeleri.aspx'den SınıfListe.aspx raporuna sınavid ve derslik_id bilgisinin aktarımı ve popup ile açılması*/
                }
            }
            
        }
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
    protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void MyListDataBound(object sender, EventArgs e)
    {
        DropDownList2.Items.Insert(0, new ListItem("- Select -", ""));
    }
    protected void Dropdown6onDataBound(object sender, EventArgs e)
    {
        DropDownList6.Items.Insert(0, new ListItem("- Select -", ""));
    }


    protected void DropDownList6_SelectedIndexChanged(object sender, EventArgs e)
    {
        
    }
    protected void SqlDataSource2_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
    {

    }
    protected void DersDataSource_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
    {

    }
}