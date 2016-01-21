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
public partial class Student : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
      
        DB db = new DB();
    


         Parameter Pa=new Parameter();

         try
         {
             int year = Pa.year(Session["username"].ToString());
             Session["year"] = year;
         }
         catch
         {
             Response.Write("<script>alert('对不起，会话超时，请重新登录。');location='../Default.aspx'</script>");
             return;
         }


    }
}
