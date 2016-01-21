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
public partial class teacher_collegeExamine : System.Web.UI.Page
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
            this.GridView1.Visible = false;
            this.GridView2.Visible = true;
        }
      
        DB db = new DB();

          string role = Session["role"].ToString();

        if (role == "院领导")//权限判定
        {
        }
        else
        {
            Response.Write("<script language='javascript'>alert('你的角色为" + role + ",不可以进入院领导审核页面！');location='Default.aspx'</script>");
        }

        String time = "select * from time where period='院审核'";
        DataSet ds = db.Select(time, db.DBconn());
        try
        {
            DateTime period_star1 = Convert.ToDateTime(ds.Tables[0].Rows[0][2].ToString().Trim()); //开始时间
            DateTime period_end1 = Convert.ToDateTime(ds.Tables[0].Rows[0][3].ToString().Trim());//结束时间
            String flg = ds.Tables[0].Rows[0][5].ToString().Trim(); ;//结束时间
            DateTime now = DateTime.Today;
            if (flg == "开" && (now >= period_star1) && (now <= period_end1))
            {

            }
            else
            {
                Response.Write("<script>alert('对不起，该功能暂未开放。请关注系统公告。');location='Default.aspx'</script>");
            }
        }
        catch
        {
            Response.Write("<script>alert('数据库时间设定取出过程错误。');location='Default.aspx'</script>");
        }
        finally
        {
            ds.Clear();
        }


    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        this.GridView1.Visible = true;
        this.GridView2.Visible = false;


    }

     
}
