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
{   int sinav_id;
    int derslik_id;
    
    

    public int a { get; set; }
    public int PageNumber { get; set; }
   
   

    protected void Page_Load(object sender, EventArgs e)
    {
        PageNumber = 5;

      
        /*SınıfListeleri.aspx sayfasından gelen sınav_id ve derslikid 'nin alınması*/
        sinav_id = Convert.ToInt32(Request.QueryString["Sinav_id"]);
        derslik_id = Convert.ToInt32(Request.QueryString["derslik_id"]);
        /*SınıfListeleri.aspx sayfasından gelen sınav_id ve derslikid 'nin alınması*/
        /*Raporu oluşturacak fonksiyonun çağırılması*/
        
    
        { ASPxDocumentViewer1.Report = CreateReport1(); }
        /*Raporu oluşturacak fonksiyonun çağırılması*/
        CreateReport1();
     
        ExportToPNG();
      
        sinav_id = 1;
        /*Rapor*/

      

    }
  



    private void ExportToPNG()
    {
        // A path to export a report.
        string reportPath = "C:\\Windows\\Temp\\test.png";

        // Create a report instance.
        TvListReportcs report = new TvListReportcs();

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
            process.StartInfo.FileName = path;
            process.Start();
            process.WaitForInputIdle();
        }
        catch { }
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
    int DerslikSelectedValue(int dvalue )
    {
       

        return Convert.ToInt32(derslik_id);
    }
   
    /*Parametrelerin Elde edilmesi*/
    /*Rapor*/

    
   
    
  
      protected void Capture(object sender, EventArgs e)
    {

        Thread thread = new Thread(delegate()
        {
            using (WebBrowser browser = new WebBrowser())
            {
                string url = "http://localhost:11127/EkranListesi/Tvlistreport.aspx";
                browser.ScrollBarsEnabled = false;
                browser.Navigate(url);

                browser.Width = 1024;
                browser.Height = 768;
                browser.DocumentCompleted += new WebBrowserDocumentCompletedEventHandler(DocumentCompleted);
                while (browser.ReadyState != WebBrowserReadyState.Complete)
                {
                    System.Windows.Forms.Application.DoEvents();
                }
            }
        });
        thread.SetApartmentState(ApartmentState.STA);
        thread.Start();
        thread.Join();
    }

      private void DocumentCompleted(object sender, WebBrowserDocumentCompletedEventArgs e)
      {
          WebBrowser browser = sender as WebBrowser;
          using (Bitmap bitmap = new Bitmap(browser.Width, browser.Height))
          {
              browser.DrawToBitmap(bitmap, new Rectangle(0, 0, browser.Width, browser.Height));
              using (MemoryStream stream = new MemoryStream())
              {
                  bitmap.Save(stream, System.Drawing.Imaging.ImageFormat.Png);
                  byte[] bytes = stream.ToArray();
                  imgScreenShot.Visible = true;
                  imgScreenShot.ImageUrl = "data:images/png;base64," + Convert.ToBase64String(bytes);
              }
          }
      }
}
