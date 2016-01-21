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
public partial class Student : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["username"] == null)
        {
            Response.Write("<script>alert('用户登录超时，请重新登录。');top.location.href='../Default.aspx'</script>");
  return;

         // Response.Write("<script>alert('用户登录超时，请重新登录。');location='../Default.aspx'</script>");
         //   Response.Redirect("~/Default.aspx");
        }
   
       

    }
}
