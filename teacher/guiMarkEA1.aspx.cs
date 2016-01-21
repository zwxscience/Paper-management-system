using System;
using System.Text;
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
public partial class teacher_guiMarkEA : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["username"] == null)
        {
            Response.Write("<script>alert('用户登录超时，请重新登录。');location='../Default.aspx'</script>");
            return;
        
        }
       
        //查找是否存在于表中如果存在则相当已修改，不存在为插入
        DB db = new DB();
        //此部分应该加一个判断语句防止恶意篡改地址栏信息
        DataSet ds = null;
        try
        {
            //获取session
           Session["student_ID"] = Request.QueryString["student_ID"].ToString();
        //  Session["student_Name"] = Request.QueryString["student_Name"].ToString();
          Session["count"] = Request.QueryString["count"].ToString();
            String pass = "select * from select_Result where student_ID='" + Session["student_ID"] + "'";
            ds = db.Select(pass, db.DBconn());
            string student_name = ds.Tables[0].Rows[0][3].ToString();
            Session["student_Name"] = student_name;
            string teacher_ID = ds.Tables[0].Rows[0][4].ToString();
            if (teacher_ID.Equals(Session["username"].ToString()))
            {
            }
            else
            {
                Response.Write("<script>alert('对不起，参数传递错误。');location='guiMarkEA.aspx'</script>");
              
                return;
            }


        }
        catch//没有数据
        {
            Response.Write("<script>alert('对不起，数据库出错，暂时无法查询数据。');location='guiMarkEA.aspx'</script>");

            return;
        }





        String sel = "select * from guiMark where student_ID='" + Session["student_ID"] + "' and count='" + Session["count"] + "'";
        ds = db.Select(sel, db.DBconn());
        try
        {//读取到数据并装载数据

           // Button1.Text = "修改";
            Label1.Text = ds.Tables[0].Rows[0][1].ToString();
            Label2.Text = ds.Tables[0].Rows[0][2].ToString(); 
            Label3.Text = ds.Tables[0].Rows[0][4].ToString(); 
            Label4.Text = ds.Tables[0].Rows[0][5].ToString(); 
            Label5.Text = ds.Tables[0].Rows[0][6].ToString();
            Label6.Text = ds.Tables[0].Rows[0][7].ToString(); 
            if (this.TextBox1.Text == "")
            {
                this.TextBox1.Text = ds.Tables[0].Rows[0][8].ToString();
            }
            //如果教师审批该jilu通过了，那么审批功能被禁用
            string adv = "select * from StoTContent where student_ID='" + Session["student_ID"] + "' and topic='指导记录' and state='是' and count='" + Session["count"] + "'";
            ds = db.Select(adv, db.DBconn());
            int adv1 = ds.Tables[0].Rows.Count;
            if (adv1 > 0)
            {
                this.Button1.Enabled = false;
                this.Label7.Text = "您通过了该同学该次的指导记录，无法再进行审批";
                this.TextBox2.ReadOnly = true;
                this.RadioButtonList1.Enabled = false;
            }

         

        }
        catch//不是则提示出错
        {

            Response.Write("<script>alert('对不起，数据库出错，暂时无法查询数据。');</script>");

        }
        finally
        {
            ds.Clear();
        }

        //sb保存的是JavaScript脚本代码,点击提交按钮时执行该脚本
        StringBuilder sb = new StringBuilder();
        //保证验证函数的执行 
        sb.Append("if (typeof(Page_ClientValidate) == 'function') { if (Page_ClientValidate() == false) { return false; }};");
        //点击提交按钮后设置Button的disable属性防止用户再次点击,注意这里的this是JavaScript代码
        sb.Append("this.disabled  = true;");
        //用__doPostBack来提交，保证按钮的服务器端click事件执行 
        sb.Append(this.ClientScript.GetPostBackEventReference(this.Button2, ""));
        sb.Append(";");
        //SetUIStyle()是JavaScript函数,点击提交按钮后执行,如可以显示动画效果提示后台处理进度
        //注意SetUIStyle()定义在aspx页面中
        sb.Append("SetUIStyle();");
        //给提交按钮增加OnClick属性
        this.Button2.Attributes.Add("onclick", sb.ToString());



    }
    protected void Button1_Click(object sender, EventArgs e)
    {

        DB db = new DB();
        SqlConnection conn = db.DBconn();
        DateTime time = DateTime.Now;
        String topic = "指导记录";
        if (this.TextBox2.Text == "")
        {
            Response.Write("<script>alert('审批内容不能为空！');</script>");
            return;
        }
        String insert = "insert into StoTContent(teacher_ID,teacher_Name,student_ID,student_Name,state,Content,time,topic,Year,count) values('" + Session["username"].ToString() + "','" + Session["name"].ToString() + "','" + Session["student_ID"].ToString() + "','" + Session["student_Name"].ToString() + "','" + this.RadioButtonList1.SelectedValue + "','" + this.TextBox2.Text + "','" + time + "','" + topic + "','" + Session["year"] + "','" + Session["count"] + "') ";
        if (db.Insert(insert, conn))
        {
            Response.Write("<script>alert('指导记录审批成功。');location='guiMarkEA.aspx'</script>");
        }
        else
        {
            Response.Write("<script>alert('指导记录批失败。');location='guiMarkEA.aspx'</script>");
        }


   
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Button2.Enabled = false;
        SQLtoWord SW = new SQLtoWord();

        //string str = "select student_ID,name,Depart,specify,teacher_Name,title,AimandSense,state,content,schedule,ref　from STReport where student_ID='" +Session["student_ID"].ToString().Trim()+ "'";
        string str = " SELECT guimark, time  FROM guiMark WHERE (student_ID ='" + Session["student_ID"].ToString().Trim() + "')";
        DB db = new DB();
        DataSet ds = db.Select(str, db.DBconn());
        try
        {
            string tex = ds.Tables[0].Rows[0][0].ToString();//ceshi 
            string path1 = Server.MapPath(@"..\\过程文档\\文档模版\\指导记录.doc");
            string path2 = Server.MapPath(@"..\\过程文档\\指导记录") + "\\" + Session["student_ID"] + this.Label2.Text + "指导记录.doc";

            string[] obDD = new string[16];
            obDD[0] = "guide1";
            obDD[1] = "date1";
            obDD[2] = "guide2";
            obDD[3] = "date2";
            obDD[4] = "guide3";
            obDD[5] = "date3";
            obDD[6] = "guide4";
            obDD[7] = "date4";
            obDD[8] = "guide5";
            obDD[9] = "date5";
            obDD[10] = "guide6";
            obDD[11] = "date6";
            obDD[12] = "guide7";
            obDD[13] = "date7";
            obDD[14] = "guide8";
            obDD[15] = "date8";
            if (SW.ExportToWord(ds, path1, path2, obDD))
            {

                // Response.Write("<script>alert('文档写入成功！')<script>");
                //yi流的方式传送给客户端
                String filepath = path2;
                System.IO.FileInfo file = new System.IO.FileInfo(filepath);
                Response.Clear();
                Response.Charset = "GB2312";
                Response.ContentEncoding = System.Text.Encoding.UTF8;
                // 添加头信息，为"文件下载/另存为"对话框指定默认文件名 
                Response.AddHeader("Content-Disposition", "attachment; filename=" + Server.UrlEncode(file.Name));
                // 添加头信息，指定文件大小，让浏览器能够显示下载进度 
                Response.AddHeader("Content-Length", file.Length.ToString());

                // 指定返回的是一个不能被客户端读取的流，必须被下载 
                Response.ContentType = "application/ms-excel";

                // 把文件流发送到客户端 
                Response.WriteFile(file.FullName);
                // 停止页面的执行 
                Response.End();


            }
            else
            {
                Response.Write("<script>alert('向word文件中写入数据出错.')</script>");
            }
      

        }
        catch
        {
            Response.Write("<script>alert('数据库出错,该同学可能还未填写指导记录.')</script>");
        }
        finally
        {
            ds.Clear();
            Button2.Enabled = true;
        }

    }
}
