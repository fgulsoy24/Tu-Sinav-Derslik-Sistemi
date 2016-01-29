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
using System.Threading;

public partial class EkranListesi_tvlist : System.Web.UI.Page
{
    Fonksiyonlar vt = new Fonksiyonlar();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["username"] != null)
            Thread.Sleep(1);
        else
            Response.Redirect("~/Default.aspx");


    }
    protected void Calendar1_SelectionChanged(object sender, EventArgs e)
    {

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
            string queryString = "Tvlistreport.aspx?sinav_id=" + sinavid + "&ders_adi=" + DropDownList2.SelectedItem + "&sinav_tarihi=" + DropDownList6.SelectedValue + "";
          
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