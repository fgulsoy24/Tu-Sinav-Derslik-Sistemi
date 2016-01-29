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

public partial class DersKayit : System.Web.UI.Page
{
    Fonksiyonlar vt = new Fonksiyonlar();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["username"] != null)
            Thread.Sleep(1);
        else
            Response.Redirect("Default.aspx");
    }
    protected void CheckBoxList1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        SqlConnection baglan = vt.baglan();
        SqlCommand db_komut;
        string sorgu = "SELECT COUNT(*) FROM Dersler WHERE ders_id=@ders_id";
        db_komut = new SqlCommand(sorgu, baglan);
        db_komut.Parameters.Add("@ders_id", OleDbType.VarChar).Value = TextBox1.Text;
        int kayitsayisi = (int)db_komut.ExecuteScalar();
        if (kayitsayisi >= 1)
        {

            this.lbldurum.Text = "Bu ders koduna ait Ders Bulunmaktadır. Lütfen Ders Kodunu değiştiriniz.";
            Response.Redirect("DersKayit.aspx");
            return;

        }
        else
        {
            SqlCommand cmd = new SqlCommand("insert into dersler (ders_id, ders_adi,bolum_id) Values(@ders_id,@ders_adi,@bolum_id)", baglan);
            cmd.Parameters.Add("ders_id", TextBox1.Text);
            cmd.Parameters.Add("ders_adi", TextBox2.Text);
            cmd.Parameters.Add("bolum_id", DropDownList1.Text);

            cmd.ExecuteNonQuery();




            Response.Write("<script lang='JavaScript'> alert ('Bu Derse Ait Sınav Kaydı Bulunamadı.');</script>");

            Response.Redirect("DersKayit.aspx");

            cmd.Dispose();

            baglan.Close();
            baglan.Dispose();
            return;


        }

    }

}