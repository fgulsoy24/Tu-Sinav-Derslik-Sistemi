using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.XtraReports.UI;    
using DevExpress.XtraReports.Parameters;
using DevExpress.XtraPrinting;

public partial class OgrenciListele : System.Web.UI.Page
{

    public int ders_id;
    public int List_id;
    protected void Page_Load(object sender, EventArgs e)
    {

        ders_id = Convert.ToInt32(Request.QueryString["ders_id"]);
     { ASPxDocumentViewer1.Report = CreateReport(); }
      


    }
    
    XtraReport1 CreateReport()
    {
        
        XtraReport1 report = new XtraReport1();
        
        report.dersid.Value = GetSelectedValue(1);
        PrintingSystemBase printingSystem1 = report.PrintingSystem;

        // Obtain the current export options.
        ExportOptions options = printingSystem1.ExportOptions;
        options.PrintPreview.DefaultFileName = "OgrencisinifListesi";
        options.PrintPreview.SaveMode = SaveMode.UsingDefaultPath;
       

       
        report.CreateDocument();
   
        return report;
    }

    int GetSelectedValue(int defaultValue)
    {

        return Convert.ToInt32(ders_id);
    }
   
}

    


