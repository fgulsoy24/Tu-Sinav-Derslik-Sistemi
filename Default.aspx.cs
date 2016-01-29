using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    Fonksiyonlar vt = new Fonksiyonlar();
    protected void Page_Load(object sender, EventArgs e)
    {



    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        /* DataTable dt = vt.GetDataTable("select * from Ogrenci where ogr_no = '" + TextBox1.Text + "' ");
         for (int i = 0; i < dt.Rows.Count; i++)
         {
             DataRow dr = dt.Rows[i];
             Response.Write(dr["ogr_adi"].ToString() + "<br />");

         }

     }*/
    }
}
