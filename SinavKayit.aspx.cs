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
using System.Threading;
using DevExpress.Web.Internal;
using DevExpress.Web;

public partial class SinavKayit : System.Web.UI.Page
{
    Fonksiyonlar vt = new Fonksiyonlar();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["username"] != null)
            Thread.Sleep(1);
        else
            Response.Redirect("~/Default.aspx");

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        SqlConnection baglan = vt.baglan();
               {
                   SqlCommand cmd = new SqlCommand("insert into Sinavlar (ders_id, sinav_tur,tarih,sinav_saati) Values(@ders_id,@sinav_tur,@tarih,@sinav_saati)", baglan);
            cmd.Parameters.Add("ders_id", DropDownList2.SelectedValue);
            cmd.Parameters.Add("sinav_tur", DropDownList1.SelectedValue);
            cmd.Parameters.Add("tarih", ArrivalDateEdit.Value);
            cmd.Parameters.Add("sinav_saati", DropDownList8.SelectedValue);

            

            cmd.ExecuteNonQuery();



            cmd.Dispose();

            baglan.Close();
            baglan.Dispose();
            Response.Redirect("SinavKayit.aspx");
            return;


        }

    }      
    protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void SqlDataSource2_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
    {

    }

    protected void MyListDataBound(object sender, EventArgs e)
    {
        DropDownList2.Items.Insert(0, new ListItem("- Select -", ""));
    }
    protected void DersDataSource_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
    {

    }
    protected void ArrivalDateEdit_DateChanged(object sender, EventArgs e)
    {

    }
    protected void ArrivalDateEdit_Validation(object sender, ValidationEventArgs e)
    {
        if (!(e.Value is DateTime))
            return;
        DateTime selectedDate = (DateTime)e.Value;
        DateTime currentDate = DateTime.Now;
        if (selectedDate.Year != currentDate.Year || selectedDate.Month != currentDate.Month)
            e.IsValid = false;
    }
    protected void DropDownList8_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}