using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class EkranListesi_Tvlistslider : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {
        string myImagesFolder = "~/images";
        DirectoryInfo info = new DirectoryInfo(Server.MapPath(myImagesFolder));
        DirectoryInfo[] _info = info.GetDirectories();
        List<LessonModel> files=new List<LessonModel>();
        for (int i = 0; i < _info.Length; i++)
        {
            var item = new LessonModel();
            item.Text = _info[i].Name;
            item.Value = myImagesFolder + "\\" + _info[i].Name+"\\";

            files.Add(item);

            
        }

        cbSelectFolder.DataSource = files;
        cbSelectFolder.DataBind();
        
            ASPxImageSlider1.ImageSourceFolder = cbSelectFolder.Value.ToString();
       
    }
    protected void cbSelectFolder_SelectedIndexChanged(object sender, EventArgs e)
    {
        ASPxImageSlider1.ImageSourceFolder = cbSelectFolder.Value.ToString();
    }
}