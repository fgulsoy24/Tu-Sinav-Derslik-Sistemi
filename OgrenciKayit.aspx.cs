using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls;
using System.IO;    
using System.Data;
using System.Data.OleDb;
using System.Data.SqlClient;
using System.Configuration;
using System.Collections;
public partial class OgrenciKayit : System.Web.UI.Page
{
     Fonksiyonlar vt = new Fonksiyonlar();
     protected void Page_Load(object sender, EventArgs e)
     { 
     }

    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
       
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        {
            SqlConnection baglan = vt.baglan();
            SqlCommand komut;
            string sorgu = ("SELECT COUNT(*) FROM ogrenci  where ogr_no = '" + TextBox1.Text + "' and ders_id ='" + CheckBoxList1.SelectedItem.Text + "' ");
            komut = new SqlCommand(sorgu, baglan);
            int kayitsayisi = (int)komut.ExecuteScalar();
            while (kayitsayisi <= 1)
            {
                for (int i = 0; i < CheckBoxList1.Items.Count; i++)
                {
                    if (CheckBoxList1.Items[i].Selected)
                    {
                        SqlCommand cmd = new SqlCommand("insert into ogrenci (ogr_no, ogr_adi,ogr_soyadi,bolum_id,ders_id,ders_adi,bolum_adi) Values(@ogr_no,@ogr_adi,@ogr_soyadi,@bolum_id,@ders_id,@ders_adi,@bolum_adi)", baglan);
                        cmd.Parameters.Add("ogr_no", TextBox1.Text);
                        cmd.Parameters.Add("ogr_adi", TextBox2.Text);
                        cmd.Parameters.Add("ogr_soyadi", TextBox3.Text);
                        cmd.Parameters.Add("bolum_id", DropDownList1.SelectedValue);
                        cmd.Parameters.Add("bolum_adi", DropDownList1.SelectedItem.Text);


                        cmd.Parameters.AddWithValue("ders_id", CheckBoxList1.Items[i].Value);
                        cmd.Parameters.AddWithValue("ders_adi", CheckBoxList1.Items[i].Text);



                        cmd.ExecuteNonQuery();

                    }

                }

                baglan.Close();
                Response.Redirect("Ogrencikayit.aspx");
            }

        }
    }
    
    protected void CheckBoxList1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

  
}