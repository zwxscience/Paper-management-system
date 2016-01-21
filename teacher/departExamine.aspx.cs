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
public partial class teacher_departExamine : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["username"] == null)
        {
            Response.Write("<script>alert('用户登录超时，请重新登录。');location='../Default.aspx'</script>"); 
            return;

        }
        Session["year"] = DateTime.Now.Year;
        if (!Page.IsPostBack)
        {
            this.GridView1.Visible = false;
            this.GridView2.Visible = true;
        }  
        DB db = new DB();
        String time = "select * from time where period='系审核'";
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


        //权限设定
         string role = Session["role"].ToString();
         if (role == "系领导")//权限判定
        {
        }
        else
        {
            Response.Write("<script language='javascript'>alert('你的角色为" + role + ",不可以进入系领导审核页面！');location='Default.aspx'</script>");
        }

        ds = db.Select("select * from teacher where teacher_ID='" + Session["username"] + "'", db.DBconn());
       try
       {

           //读取信息     
           Session["department"] = ds.Tables[0].Rows[0][7].ToString();

         
       }
       catch
       {
           Response.Write("<script>alert('获取论文信息错误。');location='Default.aspx'</script>");
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
