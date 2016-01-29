using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.OleDb;
using System.Data.SqlClient;
using System.Drawing;
using System.Windows.Forms;
using System.Threading;
using System.IO;




/// <summary>
/// Summary description for Baglanti
/// </summary>
public class Fonksiyonlar
{

    
    public Fonksiyonlar()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    public SqlConnection baglan()
    {

        SqlConnection baglanti = new SqlConnection("Data source=FURKAN-PC ; Initial Catalog = Tu_Sinav; Integrated Security = True;");

        baglanti.Open();
        return (baglanti);

    }
    public int a = 1;
   /* public int cmd(string sqlcumle)
    {
        SqlConnection baglan = this.baglan();
        SqlCommand sorgu = new SqlCommand(sqlcumle, baglan);
        int sonuc = 0;
        try
        {
            sonuc = sorgu.ExecuteNonQuery();
        }
        catch (Exception ex)
        {

            throw new Exception(ex.Message);
        }
      
        sorgu.Dispose();
        baglan.Close();
        baglan.Dispose();
        return (sonuc);

    }
    public DataTable GetDataTable(String sql)
    {
        SqlConnection baglan = this.baglan();
        SqlDataAdapter adapter = new SqlDataAdapter(sql, baglan);
        DataTable dt = new DataTable();
        adapter.Fill(dt);
        adapter.Dispose();
        baglan.Close();
        baglan.Dispose();
        return dt;



    }
    public DataSet GetDataSet(string sql)
    {
        SqlConnection baglan = this.baglan();
        SqlDataAdapter adapter = new SqlDataAdapter(sql, baglan);
        DataSet ds = new DataSet();

        adapter.Fill(ds);
        adapter.Dispose();
        baglan.Close();
        baglan.Dispose();
        return ds;
    }
    public DataRow GetDataRow(string sql)
    {
        DataTable table = new DataTable(sql);
        if (table.Rows.Count == 0) 
         return null;
        return table.Rows[0];

    }*/
    public string TarihAl(string gun, string ay, string yil)
    {
        string tarihata;
        return  tarihata = yil + "-" + ay + "-" + gun;
    }
   
}



