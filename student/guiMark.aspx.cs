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
public partial class student_guiMark : System.Web.UI.Page
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
        String time = "select * from time where period='指导记录'";
        DataSet ds = db.Select(time, db.DBconn());
        int count = 0;
        int totalNum=0;//总次数
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
            System.TimeSpan ND = period_end1 - period_star1;
            int total = ND.Days;   //天数差
            //int total = DateTime.Compare(period_end1 ,period_star1);

            
            if (total % 7 == 0)
            {
                totalNum = total / 7;
            }
            else
            {

                totalNum = (total / 7) + 1;
            }
            ND = DateTime.Now - period_star1;
             count = ND.Days / 7 + 1;   //天数差
            //int count = (DateTime.Compare(DateTime.Now , period_star1)/7)+1;//当前次数


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
        String sel = "select * from guiMark where student_ID='" + Session["username"] + "' and count='" + count + "'";
        ds = db.Select(sel, db.DBconn());
        try
        {//如果读取到数据变成了修改 并装载数据
          
            Button1.Text = "修改";
            Label1.Text =ds.Tables[0].Rows[0][1].ToString().Trim() ;
            Label2.Text = ds.Tables[0].Rows[0][2].ToString().Trim(); 
            Label3.Text = ds.Tables[0].Rows[0][4].ToString().Trim(); 
            Label4.Text = ds.Tables[0].Rows[0][5].ToString().Trim(); 
            Label5.Text = ds.Tables[0].Rows[0][6].ToString().Trim();
            Label6.Text = ds.Tables[0].Rows[0][7].ToString().Trim(); 
            if (this.TextBox1.Text == "")
            {
                this.TextBox1.Text = ds.Tables[0].Rows[0][8].ToString().Trim(); 
            }
            //在填写的基础上如果教师通过了，那么按钮失效并且消息提示
            string adv = "select * from StoTContent where student_ID='" + Session["username"] + "' and topic='指导记录' and state='是' and count='" + count + "'";
            ds = db.Select(adv,db.DBconn());
            int adv1 = ds.Tables[0].Rows.Count;
            if (adv1 > 0)
            {
                this.Button1.Enabled = false;
                this.Label7.Text = "您的本次指导记录已经被您的导师通过，无法修改";
                this.TextBox1.ReadOnly = true;
            }




        }
        catch//不是则插入数据
        {
           
            Button1.Text = "提交";
         
            //由学生查找导师和论文信息
            String stu_paper = "select * from select_Result where student_ID='" + Session["username"] + "'";
            ds = db.Select(stu_paper, db.DBconn());
            String teacher_ID = "";
            String teacher_Name ="";
            String title =""; 
            try
            {
                 teacher_ID = ds.Tables[0].Rows[0][4].ToString().Trim(); 
                teacher_Name = ds.Tables[0].Rows[0][5].ToString().Trim(); 
                title = ds.Tables[0].Rows[0][6].ToString().Trim(); 
            }
            catch
            {
                Response.Write("<script>alert('数据库选题结果错误，您的选题信息可能还未入库。');location='Default.aspx'</script>");
            }

            Label1.Text = Session["username"].ToString();
            Label2.Text = Session["name"].ToString();
            Label3.Text = teacher_Name;
            Label4.Text = DateTime.Now.ToShortDateString();
            Label5.Text = Convert.ToString( totalNum);
            Label6.Text =  Convert.ToString( count);

        }





    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        
        DB db = new DB();
        String time1 = "select * from time where period='指导记录'";
        DataSet ds = db.Select(time1, db.DBconn());
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
            Response.Write("<script>alert('数据库选题结果表错误，您的选题结果可能还未入库。');location='Default.aspx'</script>");
        }
        finally
        {
            ds.Clear();
        }
        //赋值
        if (Button1.Text == "提交")//插入操作
        {
            //查找是否存在于表中如果存在则相当已修改，不存在为插入
            if (this.TextBox1.Text == "")
            {
                Response.Write("<script>alert('指导记录不能为空！');</script>");
                return;
            }

            String insert = "insert into guiMark(student_ID,student_Name,teacher_ID,teacher_Name,time,totalNum,count,guimark,Year) values('" +

Label1.Text + "','" + Label2.Text + "','" + teacher_ID + "','" + Label3.Text + "','" + Label4.Text + "','" + Label5.Text + "','" +

Label6.Text + "','" + this.TextBox1.Text + "','" + Session["year"] + "') ";
            
            if (db.Insert(insert, db.DBconn()))
            {
                Response.Write("<script>alert('第" + Label6.Text + "次指导记录填写成功。');location='guiMark.aspx'</script>");
            }
            else
            {
                Response.Write("<script>alert('第" + Label6.Text + "次指导记录填写失败。');location='guiMark.aspx'</script>");
            }

        }
        else//更新操作
        {
            String update = "update guiMark set guimark='" + this.TextBox1.Text + "' where student_ID='" + Session["username"] + "' and count='" + Label6.Text + "'";

            if (db.Insert(update, db.DBconn()))
            {
                Response.Write("<script>alert('第" + Label6.Text + "次指导记录修改成功。');location='guiMark.aspx'</script>");
            }
            else
            {
                Response.Write("<script>alert('第" + Label6.Text + "次指导记录修改失败。');location='guiMark.aspx'</script>");
            }

        }

    }
    protected void TextBox1_TextChanged(object sender, EventArgs e)
    {

    }
}
