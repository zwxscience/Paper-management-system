using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;
using System.Text;
public partial class admin_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        try
        {
            this.admin_ID.Text = Session["username"].ToString();
            this.Image1.ImageUrl = "~/headphoto/boyDefault.jpg";
        }catch
        {
            
         Response.Write("<script> alert('用户登录超时，请重新登录。')</script>");
          
         Response.Write("<script>location.href='../Default.aspx'</script>");
         return;

          //  Response.Redirect("~/Default.aspx");
        }


      




    }
}
