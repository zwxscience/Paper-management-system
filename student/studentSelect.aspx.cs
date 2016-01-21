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

public partial class student_studentSelect : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["username"] == null)
        {
            Response.Write("<script>alert('用户登录超时，请重新登录。');location='../Default.aspx'</script>");
            return;
        }
      
        if (!Page.IsPostBack)
        {
            this.GridView2.Visible = false;
            this.GridView3.Visible = true;
        }
        DB db = new DB();
        String time = "select * from time where period='学生选课'";
        DataSet ds = db.Select(time, db.DBconn());
        try
        {

            DateTime period_star1 = Convert.ToDateTime(ds.Tables[0].Rows[0][2].ToString()); //开始时间
            DateTime period_end1 = Convert.ToDateTime(ds.Tables[0].Rows[0][3].ToString());//结束时间
            String flg = ds.Tables[0].Rows[0][5].ToString(); ;//结束时间
            ds.Clear();
            DateTime now = DateTime.Today;

            if (flg == "开" && (now>= period_star1) && (now <= period_end1))
            {
                this.Panel1.Visible = true;
                this.Panel2.Visible = true;
                this.Panel3.Visible = false;
            }
            else
            {
                this.Panel1.Visible = false;
                this.Panel2.Visible = false;
                this.Panel3.Visible = true;
            }
        }
        catch
        {
            Response.Write("<script>alert('数据库时间设定取出过程错误，您可能还未设定时间。');location='Default.aspx'</script>");
        }



    }
    protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        this.GridView2.Visible = true;
        this.GridView3.Visible = false;


    }
}
