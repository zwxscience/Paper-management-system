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

        //获取数据
        //参数传递
        Session["teacher_ID"] = Request.QueryString["teacher_ID"].ToString();
        string paperid = Request.QueryString["paperid"];
        Session["paperid"] = paperid;
        Session["teacher_Name"] = Request.QueryString["teacher_Name"];
        //获取数据
        //查题
        String sel = "select * from paperApply where id='" + paperid + "'";
        ds = db.Select(sel, db.DBconn());
        try
        {

            this.Label1.Text = ds.Tables[0].Rows[0][3].ToString();
            Label3.Text = ds.Tables[0].Rows[0][2].ToString();
            Label4.Text = ds.Tables[0].Rows[0][4].ToString();
            Label5.Text = ds.Tables[0].Rows[0][5].ToString();
            Label6.Text = ds.Tables[0].Rows[0][6].ToString();
            Label7.Text = ds.Tables[0].Rows[0][7].ToString();
            this.TextBox1.Text = ds.Tables[0].Rows[0][8].ToString();
            this.TextBox2.Text = ds.Tables[0].Rows[0][9].ToString();
            this.TextBox3.Text = ds.Tables[0].Rows[0][10].ToString();
            this.TextBox4.Text = ds.Tables[0].Rows[0][11].ToString();
            this.TextBox5.Text = ds.Tables[0].Rows[0][12].ToString();
            this.TextBox6.Text = ds.Tables[0].Rows[0][13].ToString();
            if (this.Label1.Text != null)
            {
                Button3.Enabled = true;
            }
            else
            {
                Button3.Enabled = false;
            }
        }
        catch
        {
            Button3.Enabled = false;

        }
        finally
        {
            ds.Clear();
        }
       





    }

    protected void TextBox6_TextChanged(object sender, EventArgs e)
    {

    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        this.TextBox7.Text = "";
    }
    protected void Button3_Click(object sender, EventArgs e)
    {

        DB db = new DB();
        SqlConnection conn = db.DBconn();
        DateTime now = DateTime.Today ;
        //获取教师信息
        string teacher_ID = Session["teacher_ID"].ToString();
        string teacher_Name = Session["teacher_Name"].ToString();
        string title = this.Label1.Text;
        //获取领导信息
        string lead_ID = Session["username"].ToString();
        string lead_Name = Session["name"].ToString();
        string role = Session["role"].ToString();
        //获取文本信息
        String state = this.RadioButtonList1.SelectedValue;
        String content = this.TextBox7.Text;
        if (content == "")
        {
            Response.Write("<script>alert('审批内容不能为空！');</script>");
            return;
        }
        string insert = "insert into TtoLContent(teacher_ID,lead_ID,title,time,state,content,teacher_Name,lead_Name,role,paperid) values('" + teacher_ID + "','" + lead_ID + "','" + title + "','" + now + "','" + state + "','" + content + "','" + teacher_Name + "','" + lead_Name + "','" + role + "','" + Session["paperid"] + "')";

        String update = "update paperApply set state2='" + state + "' where teacher_ID='" + teacher_ID + "'and title='" + title + "'";
        // db.Update(update, conn);
        if (db.Insert(insert, conn) && db.Update(update, conn))
        {
            Response.Write("<script>alert('审核成功！');location='collegeExamine.aspx'</script>");
        }
        else
        {
            Response.Write("<script>alert('审核失败！');location='collegeExamine.aspx'</script>");

        }
    }

}
