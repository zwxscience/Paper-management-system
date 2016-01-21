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
public partial class admin_issueBulletin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["username"] == null)
        {
            Response.Write("<script>alert('用户登录超时，请重新登录。');location='../Default.aspx'</script>");
            return;
        }
        this.Label1.Text = Session["username"].ToString();
 


    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        DB db = new DB();
        SqlConnection conn = db.DBconn();
        if (this.TextBox2.Text == "")
        {
            Response.Write("<script>alert('公告标题不可以为空，请重新发布。')</script>");
            return;

        }

        String insert = "insert into Bulletin(admin_ID,admin_Name,topic,content,time) values('" + Session["username"].ToString() + "','" + Session["name"].ToString() + "','" + this.TextBox2.Text + "','" + FreeTextBox1 .Text+ "','" + DateTime.Now + "') ";
        if (db.Insert(insert, conn))
        {
            Response.Write("<script>alert('公告发布成功。');location='issueBulletin.aspx'</script>");
        }
        else
        {
            Response.Write("<script>alert('公告发布失败。可能超出公告最大字数4000字。');location='issueBulletin.aspx'</script>");
        }



    }
}
