using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using DevExpress.XtraReports.UI;
using DevExpress.XtraReports.Parameters;
using DevExpress.XtraPrinting;
using System.Web.UI.WebControls;
using System.Drawing.Imaging;
using System.Diagnostics;
using System.Drawing;
using System.Windows.Forms;
using System.Threading;
using System.IO;



public partial class EkranListesi_Tvlistreport : System.Web.UI.Page
{

    
    int sinav_id;
    string ders_adi;
    DateTime sinav_tarihi;
    

    protected void Page_Load(object sender, EventArgs e)
    {
            
        if(!IsPostBack)
        {

            /*SınıfListeleri.aspx sayfasından gelen sınav_id ve derslikid 'nin alınması*/
            sinav_id = Convert.ToInt32(Request.QueryString["Sinav_id"]);
            sinav_tarihi = Convert.ToDateTime(Request.QueryString["sinav_tarihi"]);
            ders_adi = Convert.ToString(Request.QueryString["ders_adi"]);





            /*SınıfListeleri.aspx sayfasından gelen sınav_id ve derslikid 'nin alınması*/
            /*Raporu oluşturacak fonksiyonun çağırılması*/


            { ASPxDocumentViewer1.Report = CreateReport1(); }
            /*Raporu oluşturacak fonksiyonun çağırılması*/
            var report = CreateReport1();
            ExportToPNG(report);
        }
      
       
        
        
        /*Rapor*/


        
    }
  



    private void ExportToPNG(TvListReportcs report)
    {
        // A path to export a report.
        string tarih = string.Format("{0:yyyy-MM-dd_hh-mm-ss-tt}",
	    DateTime.Now);
        Directory.CreateDirectory(HttpContext.Current.Server.MapPath("~/images/" + ders_adi +"oluşturmatarih" + tarih ));
        string dersResim = ders_adi + "tvlist.png";
       
        string reportPath = Server.MapPath("~/images/"+ders_adi+"oluşturmatarih" + tarih+"/" + dersResim); 
        

        

        // Get its Image export options .

        ImageExportOptions imageOptions = report.ExportOptions.Image;
        // Export the report to Image.
        imageOptions.Format = ImageFormat.Png;
       report.ExportToImage(reportPath);
        StartProcess(reportPath);

        // Show the result.
        
    }
    public void StartProcess(string path)
    {
        Process process = new Process();
        try
        {
            var s = path.Split('.');
            var newPath = s[0] + "1." + s[1];
            process.StartInfo.FileName = newPath;
            process.Start();
            process.WaitForInputIdle();
        }
        catch(Exception ex) 
        {
        }
    }
   
    TvListReportcs CreateReport1()
    {
       


            TvListReportcs report = new TvListReportcs();

            report.Sinav_id.Value = SinavSelectedValue(1);

                // Set Image-specific export options.
            
            report.CreateDocument();

           

            return report;
        
    }

  
  
    /*Parametrelerin Elde edilmesi*/
    int SinavSelectedValue(int svalue)
    {
        
        return Convert.ToInt32(sinav_id);
    }
 
   
    /*Parametrelerin Elde edilmesi*/
    /*Rapor*/


    protected void ASPxButton1_Click(object sender, EventArgs e)
    {
                Response.Redirect("~/tvlistslider.aspx");
    }
}
