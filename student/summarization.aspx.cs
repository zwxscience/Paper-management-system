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
public partial class student_summa : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["username"] == null)
        {
            Response.Write("<script>alert('用户登录超时，请重新登录。');location='../Default.aspx'</script>"); 

            return;
        
        }
        //取值操作和判定开关

        DB db = new DB();
        String time = "select * from time where period='毕业论文小结'";
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
            Response.Write("<script>alert('数据库时间设定取出过程错误，可能还未设定时间。');location='Default.aspx'</script>");
        }
        finally
        {
            ds.Clear();
        }

        //查找是否存在于表中如果存在则相当已修改，不存在为插入
        String sel = "select * from aimCom where student_ID='" + Session["username"] + "'";
       ds = db.Select(sel,db.DBconn());
        if(ds.Tables[0].Rows.Count>0)   
        {//如果读取到数据变成了修改 并装载数据
            this.Button1.Text = "修改";
            Label1.Text = ds.Tables[0].Rows[0][1].ToString().Trim();
            Label2.Text = ds.Tables[0].Rows[0][2].ToString().Trim();
            Label3.Text = ds.Tables[0].Rows[0][3].ToString().Trim();
            Label4.Text = ds.Tables[0].Rows[0][4].ToString().Trim();
            Label5.Text = ds.Tables[0].Rows[0][6].ToString().Trim();
            Label6.Text = ds.Tables[0].Rows[0][7].ToString().Trim();
            Label7.Text =ds.Tables[0].Rows[0][8].ToString().Trim();
            if (this.TextBox1.Text =="") 
            {
                this.TextBox1.Text =ds.Tables[0].Rows[0][9].ToString().Trim();
            }
            ds.Clear();
            string adv = "select * from StoTContent where student_ID='" + Session["username"] + "' and topic='毕业论文小结' and state='是'";
            ds = db.Select(adv, db.DBconn());
            int adv1 = ds.Tables[0].Rows.Count;
            if (adv1 > 0)
            {
                this.Button1.Enabled = false;
                this.Label8.Text = "您的毕业论文小结已经被您的导师通过，无法修改";
                this.TextBox1.ReadOnly = true;
            }
 

        }
        else//不是则插入数据
        {
            this.Button1.Text = "提交";
            if (this.TextBox1.Text == "")
            {

                this.TextBox1.Text = "（目标完成情况，业务能力，工作态度，遵守纪律，存在不足等）";
            }
            //获取学生信息    
            String stu = "select * from student where student_ID='" + Session["username"] + "'";
            ds = db.Select(stu, db.DBconn());
            String Depart = "";
            String specify = "";
            String class1 = "";
            try
            {
                Depart = ds.Tables[0].Rows[0][12].ToString().Trim();
                specify = ds.Tables[0].Rows[0][10].ToString().Trim();
                class1 = ds.Tables[0].Rows[0][13].ToString().Trim();
            }
            catch
            {
                Response.Write("<script>alert('数据库学生信息错误。');location='Default.aspx'</script>");
            }
            finally
            {
                ds.Clear();
            }
            //由学生查找导师和论文信息
            String stu_paper = "select * from select_Result where student_ID='" + Session["username"] + "'";
            ds = db.Select(stu_paper, db.DBconn());
            String teacher_ID = "";
            String teacher_Name = "";
            String title = "";
            string paperid = "";
            try
            {
                teacher_ID = ds.Tables[0].Rows[0][4].ToString().Trim();
                teacher_Name = ds.Tables[0].Rows[0][5].ToString().Trim();
                paperid = ds.Tables[0].Rows[0][8].ToString().Trim();
                title = ds.Tables[0].Rows[0][6].ToString().Trim();
                Session["teacher_ID"] = teacher_ID;
            }
            catch
            {
                Response.Write("<script>alert('数据库选题结果表错误。');location='Default.aspx'</script>");
            }
            finally
            {
                ds.Clear();
            }

            //时间获取
            String time1 = "select * from time where period='毕业论文小结'";
           
            ds = db.Select(time1, db.DBconn());
            DateTime period_star = DateTime.Today; //开始时间
            DateTime period_end = DateTime.Today;
            DateTime now = DateTime.Today;
            try
            {
                period_star = Convert.ToDateTime(ds.Tables[0].Rows[0][2].ToString().Trim()); //开始时间
                period_end = Convert.ToDateTime(ds.Tables[0].Rows[0][3].ToString().Trim());//结束时间
            }
            catch
            {

                Response.Write("<script>alert('数据库时间设定错误。');location='Default.aspx'</script>");

            }
            finally
            {
                ds.Clear();
            }
            String time3 = period_star.Year + "年" + period_star.Month + "月" + period_star.Day + "日";
         
            //赋值
            Label1.Text = Session["username"].ToString();
            Label2.Text = Session["name"].ToString();
            Label3.Text = Depart;
            Label4.Text = class1;
            Label5.Text = teacher_Name;
            Label6.Text = time3;
            Label7.Text = title;

        }

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        DB db = new DB();
        //String time = period_star.Year + "年" + period_star.Month + "月" + period_star.Day + "日";
        //赋值
        if (Button1.Text == "提交")//插入操作
        {
            if (this.TextBox1.Text == "")
            {
                Response.Write("<script>alert('论文小结不能为空！');</script>");
                return;
            }
            //查找是否存在于表中如果存在则相当已修改，不存在为插入
            String insert = "insert into aimCom(student_ID,student_Name,Depart,class,teacher_Name,time,title,AimComplete,Year,teacher_ID) values('" +

Label1.Text + "','" + Label2.Text + "','" + Label3.Text + "','" + Label4.Text + "','" + Label5.Text + "','" +

Label6.Text + "','" + Label7.Text + "','" + this.TextBox1.Text + "','" + Session["year"] + "','" + Session["teacher_ID"] + "') ";
           
            if (db.Insert(insert, db.DBconn()))
            {
                Response.Write("<script>alert('毕业论文小结填写成功。');location='summarization.aspx'</script>");
            }
            else
            {
                Response.Write("<script>alert('毕业论文小结填写失败。');location='summarization.aspx'</script>");
            }

        }
        else//更新操作
        {
            String update = "update aimCom set AimComplete='" + this.TextBox1.Text + "' where student_ID='" + Session["username"] + "'";

            if (db.Update(update, db.DBconn()))
            {
                Response.Write("<script>alert('毕业论文小结修改成功。');location='summarization.aspx'</script>");
            }
            else
            {
                Response.Write("<script>alert('毕业论文小结修改失败。');location='summarization.aspx'</script>");
            }

        }

    }
    
}
