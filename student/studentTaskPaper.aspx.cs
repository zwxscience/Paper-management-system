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
public partial class student_studentTaskPaper : System.Web.UI.Page
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
        String time = "select * from time where period='任务书'";
        DataSet ds = db.Select(time, db.DBconn());
        try
        {
            DateTime period_star1 =Convert.ToDateTime( ds.Tables[0].Rows[0][2].ToString().Trim()); //开始时间
            DateTime period_end1 = Convert.ToDateTime( ds.Tables[0].Rows[0][3].ToString().Trim());//结束时间
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
        String sel = "select * from studentTask where student_ID='" + Session["username"] + "'";
        ds = db.Select(sel,db.DBconn());
        if(ds.Tables[0].Rows.Count>0)   
        {//如果读取到数据变成了修改 并装载数据
            this.Panel1.GroupingText = "学生任务书修改";
            Button1.Text = "修改";
           
            Label1.Text = ds.Tables[0].Rows[0][1].ToString().Trim();
            Label2.Text = ds.Tables[0].Rows[0][2].ToString().Trim();
            Label3.Text = ds.Tables[0].Rows[0][3].ToString().Trim();
            Label4.Text = ds.Tables[0].Rows[0][4].ToString().Trim();
            Label5.Text = ds.Tables[0].Rows[0][5].ToString().Trim();
            Label6.Text = ds.Tables[0].Rows[0][6].ToString().Trim();
            Label7.Text = ds.Tables[0].Rows[0][7].ToString().Trim();
            Label8.Text = ds.Tables[0].Rows[0][8].ToString().Trim();
            Label9.Text = ds.Tables[0].Rows[0][9].ToString().Trim();
            RadioButtonList1.SelectedValue = ds.Tables[0].Rows[0][10].ToString().Trim();
            Label10.Text = ds.Tables[0].Rows[0][11].ToString().Trim();
            Label11.Text = ds.Tables[0].Rows[0][12].ToString().Trim();
            Label12.Text = ds.Tables[0].Rows[0][13].ToString().Trim();

            if (this.TextBox1.Text == "")
            {
                this.TextBox1.Text = ds.Tables[0].Rows[0][14].ToString().Trim();
            }
            if (this.TextBox2.Text == "")
            {
                this.TextBox2.Text = ds.Tables[0].Rows[0][15].ToString().Trim();
            }
            if (this.TextBox3.Text == "")
            {
                this.TextBox3.Text = ds.Tables[0].Rows[0][16].ToString().Trim();
            }
            if (this.TextBox4.Text == "")
            {
                this.TextBox4.Text = ds.Tables[0].Rows[0][17].ToString().Trim();
            }
            ds.Clear();
            string adv = "select * from StoTContent where student_ID='" + Session["username"] + "' and topic='学生任务书' and state='是'";
            ds = db.Select(adv, db.DBconn());
            int adv1 = ds.Tables[0].Rows.Count;
            if (adv1 > 0)
            {
                this.Button1.Enabled = false;
                this.Label13.Text = "您的学生任务书已经被您的导师通过，无法修改";
                this.TextBox1.ReadOnly = true;
                this.TextBox2.ReadOnly = true;
                this.TextBox3.ReadOnly = true;
                this.TextBox4.ReadOnly = true;
            }
 

        }
        else//不是则插入数据
        {
            this.Panel1.GroupingText = "学生任务书填写";
            Button1.Text = "提交";
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
                Response.Write("<script>alert('数据库学生信息错误，可能还未导入学生数据。');location='Default.aspx'</script>");
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
                paperid = ds.Tables[0].Rows[0][8].ToString().Trim();
                teacher_Name = ds.Tables[0].Rows[0][5].ToString().Trim();
                title = ds.Tables[0].Rows[0][6].ToString().Trim();
                Session["teacher_ID"] = teacher_ID;
            }
            catch
            {
                Response.Write("<script>alert('数据库选题结果表错误，您的课题选择结果可能还未入库。');location='Default.aspx'</script>");
            }
            finally
            {
                ds.Clear();
            }

            //论文信息获取
            String paper = "select * from paperApply where id='" + paperid +"'";
             ds = db.Select(paper, db.DBconn());
             String preriod = "";
             String kind = "";
             String project_Name = "";
             String project_Depart = "";
             String project_Num = "";
             String target = "";
             String aim_Meaning = "";
             String current_situation = "";
             String content = "";
             String reference = "";
             String remark = "";
            try
            {
               preriod = ds.Tables[0].Rows[0][2].ToString().Trim();
               kind = ds.Tables[0].Rows[0][4].ToString().Trim();
               project_Name = ds.Tables[0].Rows[0][5].ToString().Trim();
               project_Depart = ds.Tables[0].Rows[0][6].ToString().Trim(); 
               project_Num = ds.Tables[0].Rows[0][7].ToString().Trim(); 
               target = ds.Tables[0].Rows[0][8].ToString().Trim(); 
               aim_Meaning = ds.Tables[0].Rows[0][9].ToString().Trim(); 
               current_situation = ds.Tables[0].Rows[0][10].ToString().Trim();
               content = ds.Tables[0].Rows[0][11].ToString().Trim();
               reference = ds.Tables[0].Rows[0][12].ToString().Trim();
               remark = ds.Tables[0].Rows[0][13].ToString().Trim(); 
            }
            catch
            {

                Response.Write("<script>alert('数据库论文信息错误。');location='Default.aspx'</script>");

            }  
            finally
            {
                ds.Clear();
            }

            //时间获取
            String time1 = "select * from time where period='提交论文时间'";
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

                Response.Write("<script>alert('数据库时间设定错误，管理员可能还未设定时间。');location='Default.aspx'</script>");

            }  
            finally
            {
                ds.Clear();
            }
         
            //赋值
            Label1.Text = Depart;
            Label2.Text = specify;
            Label3.Text = Session["name"].ToString();
            Label4.Text = Session["username"].ToString();
            Label5.Text = class1;
            Label6.Text = preriod;
            Label7.Text = period_star.Year.ToString() + "年" + period_star.Month.ToString() + "月" + period_end.Day.ToString() + "日";
            Label8.Text = teacher_Name;
            Label9.Text = title;
            RadioButtonList1.SelectedValue = kind;
            Label10.Text = project_Name;
            Label11.Text = project_Depart;
            Label12.Text = project_Num;
            if (this.TextBox1.Text == "")
            {
                this.TextBox1.Text = content;
            }
            if (this.TextBox2.Text == "")
            {
                this.TextBox2.Text = target;
            }
            if (this.TextBox3.Text == "")
            {
                this.TextBox3.Text = reference;
            }
            if (this.TextBox4.Text == "")
            {

                this.TextBox4.Text = remark;
            }

        }
        //页面修改部分

    }
    protected void Button1_Click(object sender, EventArgs e)
    {   
        DB db=new DB();
    
  
        if (Button1.Text == "提交")//插入操作
        {
             //查找是否存在于表中如果存在则相当已修改，不存在为插入
          
            String insert = "insert into studentTask(Depart,specify,name,student_ID,class,period,periodUp,teacher_Name,title,kind,project_Name,project_Depart,project_Num,content,aim,ref,remark,Year,teacher_ID) values('" + Label1.Text + "','" + Label2.Text + "','" + Label3.Text + "','" + Label4.Text + "','" + Label5.Text + "','" + Label6.Text + "','" + Label7.Text + "','" + Label8.Text + "','" + Label9.Text + "','" + RadioButtonList1.SelectedValue + "','" + Label10.Text + "','" + Label11.Text + "','" + Label12.Text + "','" + this.TextBox1.Text + "','" + this.TextBox2.Text + "','" + this.TextBox3.Text + "','" + this.TextBox4.Text + "','" + Session["year"] + "','" + Session["teacher_ID"] + "') ";
         
           if(db.Insert(insert,db.DBconn())){
               Response.Write("<script>alert('学生任务书填写成功。');location='studentTaskPaper.aspx'</script>");
           }
            else{
                Response.Write("<script>alert('学生任务书填写失败。');location='studentTaskPaper.aspx'</script>");
            }
       
        }
        else//更新操作
        {
            

            String update = "update studentTask set content='"+this.TextBox1.Text+"',aim='"+this.TextBox2.Text+"',ref='"+this.TextBox3.Text+"',remark='"+this.TextBox4.Text+"' where student_ID='" + Session["username"] + "'";
            
            if (db.Insert(update, db.DBconn()))
            {
                Response.Write("<script>alert('学生任务书修改成功。');location='studentTaskPaper.aspx'</script>");
            }
            else
            {
                Response.Write("<script>alert('学生任务书修改失败。');location='studentTaskPaper.aspx'</script>");
            }
       
        }
    }
 
}
