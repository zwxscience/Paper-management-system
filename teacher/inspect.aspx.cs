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
using System.IO;
public partial class teacher_inspect : System.Web.UI.Page
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
            this.GridView1.Visible = true;
            this.GridView2.Visible = false;
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
        //chushi进入页面需要更新或加载数据
        string sel = "select * from student where  grade='"+Session["year1"].ToString()+"'";//依次查询本届学生信息
        DataSet ds = db.Select(sel,db.DBconn());
        try
        {
            foreach (DataRow studentInfo in ds.Tables[0].Rows)//获取学生数据后，在监督表中查找，有更新，无插入
            {
               //在此之前，需要分别查找select_Result，studentTask，STReport，guiMark，aimCom，并查找论文目录
                int select_Result=0;
                int studentTask=0;
                int STReport=0;
                int guiMark=0;
                int aimCom=0;   
                int fileUpload=0;
               /*****************************************************************************************************************/
                //查询选课结果表
                string sel1="select * from select_Result where student_ID='" + studentInfo["student_ID"].ToString()+ "'";
                 DataSet ds2=db.Select(sel1,db.DBconn());
                 select_Result=ds2.Tables[0].Rows.Count;
                 string paperid = "";
                 string title = "";
                 try
                 {
                     paperid = ds2.Tables[0].Rows[0][8].ToString();
                     title = ds2.Tables[0].Rows[0][6].ToString();

                 }
                 catch
                 {
                     //Response.Write("<script>alert('数据库查询选课结果表时出错。');location='Default.aspx'</script>");
                 }
                 finally
                 {
                     ds2.Clear();
                 }
                 
                   
                 //查询学生任务书表
                 sel1="select * from studentTask where student_ID='" + studentInfo["student_ID"].ToString()+ "'";
                  ds2=db.Select(sel1,db.DBconn());
                 studentTask=ds2.Tables[0].Rows.Count;
                   ds2.Clear();
                 //查询开题报告表
                 sel1="select * from STReport where student_ID='" + studentInfo["student_ID"].ToString()+ "'";
                 ds2=db.Select(sel1,db.DBconn());
                  STReport=ds2.Tables[0].Rows.Count;
                   ds2.Clear();
                 //查询指导记录表
                sel1="select * from guiMark where student_ID='" + studentInfo["student_ID"].ToString()+ "'";
                  ds2=db.Select(sel1,db.DBconn());
                  guiMark=ds2.Tables[0].Rows.Count;
                  ds2.Clear();
                 //查询论文小结表
                 sel1="select * from aimCom where student_ID='" + studentInfo["student_ID"].ToString()+ "'";
                  ds2=db.Select(sel1,db.DBconn());
                  aimCom=ds2.Tables[0].Rows.Count;
                  ds2.Clear();
                //查询论文是否上传
                 String fileName =  studentInfo["student_ID"].ToString() +  studentInfo["name"].ToString()+title;
                if (File.Exists(Server.MapPath("../论文上传/" + fileName+ ".doc"))||System.IO.File.Exists(Server.MapPath("../论文上传/" + fileName+ ".docx")))//如果不存在就为0
                {
                    fileUpload=1;
                }else{
                     fileUpload=0;
                }

                /*****************************************************************************************************************/
                string student = "select * from inspect where student_ID='" + studentInfo["student_ID"].ToString()+ "'";
                DataSet ds1 = db.Select(student, db.DBconn());
                try//有数据则更新数据
                {
                    string paperid1 = ds1.Tables[0].Rows[0][3].ToString();//用来跳转到catch
                    if (select_Result > 0)//存在则更新
                    {
                        string update = "update inspect set paperid='" + paperid + "',title='" + title + "' where student_ID='" + studentInfo["student_ID"].ToString() + "'";//然后更新学生数据
                        db.Update(update, db.DBconn());
                    }
                    if (studentTask > 0)//存在则更新
                    {
                        string update = "update inspect set studentTaskPaper='已填写' where student_ID='" + studentInfo["student_ID"].ToString() + "'";//然后更新学生数据//然后更新学生数据
                        db.Update(update, db.DBconn());
                    }
                    if (STReport > 0)//存在则更新
                    {
                        string update = "update inspect set STReport='已填写' where student_ID='" + studentInfo["student_ID"].ToString() + "'";//然后更新学生数据//然后更新学生数据
                        db.Update(update, db.DBconn());
                    }
                    if (guiMark > 0)//存在则更新
                    {
                        string update = "update inspect set GuiNum='" + guiMark + "' where student_ID='" + studentInfo["student_ID"].ToString() + "'";//然后更新学生数据//然后更新学生数据
                        db.Update(update, db.DBconn());
                    }
                    if (aimCom > 0)//存在则更新
                    {
                        string update = "update inspect set Summ='已填写' where student_ID='" + studentInfo["student_ID"].ToString() + "'";//然后更新学生数据//然后更新学生数据
                        db.Update(update, db.DBconn());
                    }

                    if (fileUpload > 0)//存在则更新
                    {
                        string update = "update inspect set IsUpLoad='已上传' where student_ID='" + studentInfo["student_ID"].ToString() + "'";//然后更新学生数据//然后更新学生数据
                        db.Update(update, db.DBconn());
                    }


                }
                catch//无数据则插入数据
                {
                    string insert = "insert into inspect(student_ID,student_Name,grade,specialty,class) values('" + studentInfo["student_ID"].ToString() + "','" + studentInfo["name"].ToString() + "','" + studentInfo["grade"].ToString() + "','" + studentInfo["specialty"].ToString() + "','" + studentInfo["class"].ToString() + "')";//首先插入学生数据
                    db.Insert(insert,db.DBconn());
                    //然后更新各个数据
                    if (select_Result>0)//存在则更新
                    {
                        string update = "update inspect set paperid='" + paperid + "',title='" + title + "' where student_ID='" + studentInfo["student_ID"].ToString() + "'";//然后更新学生数据
                        db.Update(update, db.DBconn());
                    }
                    if (studentTask > 0)//存在则更新
                    {
                        string update = "update inspect set studentTaskPaper='已填写' where student_ID='" + studentInfo["student_ID"].ToString() + "'";//然后更新学生数据//然后更新学生数据
                        db.Update(update, db.DBconn());
                    }
                    if (STReport> 0)//存在则更新
                    {
                        string update = "update inspect set STReport='已填写' where student_ID='" + studentInfo["student_ID"].ToString() + "'";//然后更新学生数据//然后更新学生数据
                        db.Update(update, db.DBconn());
                    }
                    if (guiMark > 0)//存在则更新
                    {
                        string update = "update inspect set GuiNum='" + guiMark + "' where student_ID='" + studentInfo["student_ID"].ToString() + "'";//然后更新学生数据//然后更新学生数据
                        db.Update(update, db.DBconn());
                    }
                    if (aimCom > 0)//存在则更新
                    {
                        string update = "update inspect set Summ='已填写' where student_ID='" + studentInfo["student_ID"].ToString() + "'";//然后更新学生数据//然后更新学生数据
                        db.Update(update, db.DBconn());
                    }

                    if (fileUpload > 0)//存在则更新
                    {
                        string update = "update inspect set IsUpLoad='已上传' where student_ID='" + studentInfo["student_ID"].ToString() + "'";//然后更新学生数据//然后更新学生数据
                        db.Update(update, db.DBconn());
                    }
                    ds1.Clear();
                    Response.Redirect("inspect.aspx");

                }
                finally
                {
                    ds1.Clear();
                }
               
            }

        }
        catch
        {
            Response.Write("<script language='javascript'>alert('获取学生数据错误，查看是否存在本届学生数据！');location='Default.aspx'</script>");
        }
        finally
        {
            ds.Clear();
        }


        


    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        this.GridView1.Visible = false;
        this.GridView2.Visible = true;


    }
}
