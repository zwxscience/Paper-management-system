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
public partial class Bulletin : System.Web.UI.Page
{
    public string content;   
    protected void Page_Load(object sender, EventArgs e)
    {
             
        DB db=new DB ();
         string id = Request.QueryString["id"].ToString();
         string sel="select * from Bulletin  where id='"+Request.QueryString["id"]+"'";
         DataSet ds = db.Select(sel, db.DBconn());
         try
         {

             string admin_Name = ds.Tables[0].Rows[0][2].ToString();
             string topic = ds.Tables[0].Rows[0][3].ToString(); 
             DateTime time = Convert.ToDateTime(ds.Tables[0].Rows[0][5].ToString()); 
             content = ds.Tables[0].Rows[0][4].ToString(); 
             Label1.Text = topic;
             Label2.Text = admin_Name;
             Label3.Text = time.ToLongDateString();
             Session["content"] = content;
         }
         catch
         {
             Response.Write("<script>alert('公告数据库错误。')</script>");
         }
         finally
         {
             ds.Clear();
         }
     
    }
}
