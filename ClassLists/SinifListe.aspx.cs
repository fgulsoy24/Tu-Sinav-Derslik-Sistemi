using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.XtraReports.UI;
using DevExpress.XtraReports.Parameters;
using DevExpress.XtraPrinting;

public partial class SinifListe : System.Web.UI.Page
{
    public int sinav_id;
    public int derslik_id;
    protected void Page_Load(object sender, EventArgs e)
    {   /*SınıfListeleri.aspx sayfasından gelen sınav_id ve derslikid 'nin alınması*/
        sinav_id = Convert.ToInt32(Request.QueryString["Sinav_id"]);
        derslik_id = Convert.ToInt32(Request.QueryString["derslik_id"]);
        /*SınıfListeleri.aspx sayfasından gelen sınav_id ve derslikid 'nin alınması*/
        /*Raporu oluşturacak fonksiyonun çağırılması*/
        { ASPxDocumentViewer1.Report = CreateReport1(); }
        /*Raporu oluşturacak fonksiyonun çağırılması*/
    }
    /*Rapor*/
    SinifListesi CreateReport1()
    {

        SinifListesi report = new SinifListesi();
        /*Parametrelerin Çağırılması*/
       report.derslikid.Value = DerslikSelectedValue(1);
       report.sinav_id.Value = SinavSelectedValue(1);
        /*Parametrelerin Çağırılması*/
        report.CreateDocument();
        return report;
    }
    /*Parametrelerin Elde edilmesi*/
    int SinavSelectedValue(int svalue)
    {

        return Convert.ToInt32(sinav_id);
    }
    int DerslikSelectedValue(int dvalue)
    {

        return Convert.ToInt32(derslik_id);
    }
    /*Parametrelerin Elde edilmesi*/
    /*Rapor*/
}