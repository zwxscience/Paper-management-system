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
public partial class student_studentSelect : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["username"] == null)
        {
            Response.Write("<script>alert('用户登录超时，请重新登录。');location='../Default.aspx'</script>");
            return;
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

                if (flg == "开" && (now >= period_star1) && (now <= period_end1))
                {
                }
                else
                {
                    this.Button3.Visible = false;
                }
            }
            catch
            {
                Response.Write("<script>alert('数据库时间设定取出过程错误，您可能还未设定时间。');location='Default.aspx'</script>");
            }



        //获取数据
  
            Session["paperid"] = Request.QueryString["paperid"].ToString();
            string paperid = Request.QueryString["paperid"].ToString();
            string tag = "";
            string priority = "";
            try
            {
                tag = Request.QueryString["tag"].ToString();
                priority = Request.QueryString["priority"].ToString();
            }
            catch
            {
            }
      
 //查题*************************************** 
        String sel = "select * from paperApply where id='" + Request.QueryString["paperid"].ToString() + "'";
         ds = db.Select(sel, db.DBconn());
            try
            {  
               
            
                this.Label1.Text = ds.Tables[0].Rows[0][3].ToString();
                Label3.Text = ds.Tables[0].Rows[0][2].ToString();
                Label4.Text = ds.Tables[0].Rows[0][4].ToString();
                Label5.Text = ds.Tables[0].Rows[0][5].ToString();
                Label6.Text = ds.Tables[0].Rows[0][6].ToString();
                Label7.Text = ds.Tables[0].Rows[0][7].ToString();
                String teacher_Name = Convert.ToString(ds.Tables[0].Rows[0][20].ToString());
                Label8.Text = " 教工号：" + Request.QueryString["teacher_ID"] + " 教师姓名：" + teacher_Name;
                this.TextBox1.Text = ds.Tables[0].Rows[0][8].ToString(); ;
                this.TextBox2.Text = ds.Tables[0].Rows[0][9].ToString(); ;
                this.TextBox3.Text = ds.Tables[0].Rows[0][10].ToString();
                this.TextBox4.Text = ds.Tables[0].Rows[0][11].ToString();
                this.TextBox5.Text = ds.Tables[0].Rows[0][12].ToString();
                this.TextBox6.Text = ds.Tables[0].Rows[0][13].ToString();
                int first_select = Convert.ToInt32(ds.Tables[0].Rows[0][17].ToString());
                int second_select = Convert.ToInt32(ds.Tables[0].Rows[0][18].ToString());
                int third_select = Convert.ToInt32(ds.Tables[0].Rows[0][19].ToString());
                this.Label2.Text = "该课题选择情况：第一志愿" + first_select + "人，第二志愿" + second_select + "人，第三志愿" + third_select + "人。";    
                if (tag.Equals("1"))//删除操作
                {
                    string update = "";//初始化更新语句
                    if (priority.Equals("1"))//第一志愿
                    {
                        first_select = Convert.ToInt32(ds.Tables[0].Rows[0][17].ToString());
                        first_select--;
                        update = "update paperApply set first_select='" + first_select + "' where id='" + paperid + "'";//更新选题情况信息
                       
                    }
                    if (priority.Equals("2"))//第二志愿
                    {
                         second_select = Convert.ToInt32(ds.Tables[0].Rows[0][18].ToString());
                        second_select--;
                         update = "update paperApply set second_select='" + second_select + "' where id='" + paperid + "'";//更新选题情况信息
                    }
                    if (priority.Equals("3"))//第三志愿
                    {
                        third_select = Convert.ToInt32(ds.Tables[0].Rows[0][19].ToString());
                        third_select--;
                        update = "update paperApply set first_select='" + third_select + "' where id='" + paperid + "'";//更新选题情况信息
                    }
                     string del="delete from themeSelectedResult where student_ID='"+Session["username"]+"'and priority='"+priority+"'";

                     if (db.Update(update, db.DBconn()) && db.Delete(del, db.DBconn()))
                        
                    {
                            Response.Write("<script>alert('您的课题第" + priority + "志愿删除成功');location='studentSelect.aspx'</script>");
                       
                    }
  
                    else  
                    {
                        Response.Write("<script>alert('您的课题第" + priority + "志愿删除失败');location='studentSelect.aspx'</script>");   
                    }     

                }
               
              
            }
            catch
            {
                Response.Write("<script>alert('数据库出错。');location='studentSelect.aspx'</script>");
            }
            finally
            {
                ds.Clear();
            }

         //判断选题次数\
        String  sel1="select * from themeSelectedResult where student_ID='"+Session["username"]+"'";
        ds = db.Select(sel1, db.DBconn());

        if (ds.Tables[0] != null && ds.Tables[0].Rows.Count > 3)
        {
                Button3.Enabled = false;
                Response.Write("<script>alert('你已经选择三个志愿了，不可以再提交。');location='studentSelect.aspx'</script>");
        }  
    }

    protected void TextBox6_TextChanged(object sender, EventArgs e)
    {

    }


    protected void Button3_Click(object sender, EventArgs e)
    {
      
        DB db = new DB(); 
      
        //获取学生信息
       string student_ID = Session["username"].ToString();
       string name =  Session["name"].ToString();  
          //获取lunwen信息
       string sel = "select * from paperApply where id='" + Session["paperid"] + "'";
       DataSet ds = db.Select(sel,db.DBconn());
        try
        {
            int first_select =Convert.ToInt32( ds.Tables[0].Rows[0][17].ToString());
            int second_select = Convert.ToInt32( ds.Tables[0].Rows[0][18].ToString());
            int third_select = Convert.ToInt32( ds.Tables[0].Rows[0][19].ToString());
        //以上为获取的基本信息，下面查找数据库
        String selPRI1 = "select * from themeSelectedResult where student_ID='" + student_ID + "'and priority='1'";
       ds =db.Select(selPRI1,db.DBconn());
       if (ds.Tables[0] != null && ds.Tables[0].Rows.Count == 1)//存在第一志愿则掠过选取第二志愿
       {
           //以上为获取的基本信息，下面查找数据库
           String selPRI2= "select * from themeSelectedResult where student_ID='" + student_ID + "'and   priority='2'";
           ds = db.Select(selPRI2, db.DBconn());
           if (ds.Tables[0] != null && ds.Tables[0].Rows.Count ==1)//存在第二志愿则掠过选取第三志愿
           {
               String selPRI3= "select * from themeSelectedResult where student_ID='" + student_ID + "'and   priority='3'";
                ds = db.Select(selPRI3, db.DBconn());
                if (ds.Tables[0] != null && ds.Tables[0].Rows.Count ==1)//存在第三志愿则无法选题
                {
                    Response.Write("<script>alert('你已经选择三个志愿了，不可以再提交。');location='studentSelect.aspx'</script>");

                }
                else//不存在第3志愿则插入表格 和更新数据
                {
                    select(3, third_select);
                }
           }
           else//不存在第2志愿则插入表格 和更新数据
           {
               select(2, second_select);
           }
          
          
       }
       else//不存在第一志愿则插入表格 和更新数据
       {  
           select(1, first_select);
       }
   }
   catch
   {
       Response.Write("<script>alert('数据库出错,获取论文信息错误。');location='studentSelect.aspx'</script>");
   }
   finally
   {
       ds.Clear();
   }
   

    }

    public void select(int PRI, int Select){
         DB db = new DB(); 
   
        //获取学生信息
        string student_ID = Session["username"].ToString();
        string name =  Session["name"].ToString();
        String sel = "select * from student where student_ID='" +student_ID+"'";
        DataSet ds = db.Select(sel,db.DBconn());
         String class1="";
         String grade = "";
        try
        {
         class1 = ds.Tables[0].Rows[0][13].ToString();
         grade = ds.Tables[0].Rows[0][15].ToString();
         ds.Clear();
        }
        catch
        {
            Response.Write("<script>alert('数据库出错，获取学生信息错误。');location='studentSelect.aspx'</script>");
        }

        //获取论文信息
      
        string teacher_ID=Request.QueryString["teacher_ID"];
          sel = "select * from paperApply where id='" +Session["paperid"]+ "'";
           ds = db.Select(sel, db.DBconn());
          String title = "";
          String teacher_Name = "";
          String direction = "";
          String introduce = "";
          String paperid = "";
          try
          {

               title =ds.Tables[0].Rows[0][3].ToString();
               teacher_Name = Convert.ToString(ds.Tables[0].Rows[0][20].ToString());
               direction = ds.Tables[0].Rows[0][4].ToString();
               introduce =ds.Tables[0].Rows[0][13].ToString();
               paperid=ds.Tables[0].Rows[0][0].ToString();
              ds.Clear();

          }
          catch
          {
              Response.Write("<script>alert('数据库出错，获取教师信息错误。');location='studentSelect.aspx'</script>");
          }

        int priority = PRI;
        Response.Write("<script>if(confirm('这将是您的第" + priority + "志愿，是否选定?选定后如需修改只能通过删除重选。')){ } else{location='Default.aspx'}</script>");
        string insert1 = "insert into themeSelectedResult(student_ID,name,class,teacher_ID,teacher_name,title,direction,introduce,priority,grade,paperid)  values('" + student_ID + "','" + name + "','" + class1 + "','" + teacher_ID + "','" + teacher_Name + "','" + title + "','" + direction + "','" + introduce + "','" + priority + "','" + grade + "','" + paperid + "')";//导入数据
        Select++;
        string update = "";
        if (priority == 1)
        {
             update = "update paperApply set first_select='" + Select + "' where id='" + paperid + "'";//更新选题情况信息
        }
        if (priority == 2)
        {
             update = "update paperApply set second_select='" + Select + "' where id='" + paperid + "'";//更新选题情况信息
        }
        if (priority == 3)
        {
            update = "update paperApply set third_select='" + Select + "' where id='" + paperid + "'";//更新选题情况信息
        }

        if (db.Insert(insert1, db.DBconn()) && db.Update(update, db.DBconn()))
        {
            Response.Write("<script>alert('您的课题第" + priority + "志愿选择成功');location='studentSelect.aspx'</script>");
        }

        else
        {
            Response.Write("<script>alert('您的课题第" + priority + "志愿选择失败');location='studentSelect.aspx'</script>");
        }
    }

}
