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
   
    protected void Button1_Click1(object sender, EventArgs e)
    {

    }
    protected void loginButton_Click1(object sender, EventArgs e)
    {
        Session["username"] = txtUsername.Text;
        Response.Redirect("DersliklereDagit.aspx");
    }
}
