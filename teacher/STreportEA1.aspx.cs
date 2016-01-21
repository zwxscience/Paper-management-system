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
using System.Text;
public partial class teacher_STreportEA : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //获取session
        if (Session["username"] == null)
        {
            Response.Write("<script>alert('用户登录超时，请重新登录。');location='../Default.aspx'</script>");
            return;
        
        }
        DB db = new DB();

        //此部分应该加一个判断语句防止恶意篡改地址栏信息

        DataSet ds = null;
        try
        {
            Session["student_ID"] = Request.QueryString["student_ID"].ToString();
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
                Response.Write("<script>alert('对不起，参数传递错误。');location='STreportEA.aspx'</script>");
                return;
            }


        }
        catch//没有数据
        {
            Response.Write("<script>alert('对不起，数据库出错，暂时无法查询数据。');location='STreportEA.aspx'</script>");

            return;
        }


        //查找是否存在于表中如果存在则相当已修改，不存在为插入
        String sel = "select * from STReport where student_ID='" + Session["student_ID"] + "'";
         ds =db.Select(sel, db.DBconn());
        try
        {//如果读取到数据 并装载数据
            Label1.Text = ds.Tables[0].Rows[0][1].ToString();
            Label2.Text = ds.Tables[0].Rows[0][2].ToString(); 
            Label3.Text = ds.Tables[0].Rows[0][3].ToString(); 
            Label4.Text = ds.Tables[0].Rows[0][4].ToString(); 
            Label5.Text = ds.Tables[0].Rows[0][5].ToString();
            Label6.Text = ds.Tables[0].Rows[0][6].ToString(); 
            Label7.Text = ds.Tables[0].Rows[0][7].ToString(); 
            if (this.TextBox1.Text == "")
            {
                this.TextBox1.Text = ds.Tables[0].Rows[0][8].ToString(); 
            }
            if (this.TextBox2.Text == "")
            {
                this.TextBox2.Text = ds.Tables[0].Rows[0][9].ToString(); 
            }
            if (this.TextBox3.Text == "")
            {
                this.TextBox3.Text = ds.Tables[0].Rows[0][10].ToString(); 
            }
            if (this.TextBox4.Text == "")
            {
                this.TextBox4.Text = ds.Tables[0].Rows[0][11].ToString(); 
            }
            if (this.TextBox5.Text == "")
            {
                this.TextBox5.Text = ds.Tables[0].Rows[0][12].ToString(); 
            }
            //如果教师审批该jilu通过了，那么审批功能被禁用
            string adv = "select * from StoTContent where student_ID='" + Session["student_ID"] + "' and topic='开题报告' and state='是'";
            ds = db.Select(adv, db.DBconn());
            int adv1 = ds.Tables[0].Rows.Count;
            if (adv1 > 0)
            {
                this.Button1.Enabled = false;
                this.Label8.Text = "您通过了该同学的开题报告，无法再进行审批";
                this.TextBox6.ReadOnly = true;
                this.RadioButtonList1.Enabled = false;
            }
        }
        catch//没有数据
        {
            Response.Write("<script>alert('对不起，数据库出错，暂时无法查询数据。');</script>");
            return;
        }finally{
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
        string countNum = "select * from StoTContent where topic='开题报告' and student_ID='" + Session["student_ID"].ToString() + "'";
        DataSet ds = db.Select(countNum, conn);
        try
        {
            int count = ds.Tables[0].Rows.Count+1;
            DateTime time = DateTime.Now;
            String topic = "开题报告";
            if (this.TextBox6.Text == "")
            {
                Response.Write("<script>alert('审批内容不能为空！');</script>");
                return;
            }
            String insert = "insert into StoTContent(teacher_ID,teacher_Name,student_ID,student_Name,state,Content,time,topic,Year,count) values('" + Session["username"].ToString() + "','" + Session["name"].ToString() + "','" + Session["student_ID"].ToString() + "','" + Session["student_Name"].ToString() + "','" + this.RadioButtonList1.SelectedValue + "','" + this.TextBox6.Text + "','" + time + "','" + topic + "','" + Session["year"] + "','" + count + "') ";
            if (db.Insert(insert, conn))
            {
                Response.Write("<script>alert('开题报告审批成功。');location='STreportEA.aspx'</script>");
            }
            else
            {
                Response.Write("<script>alert('开题报告审批失败。');location='STreportEA.aspx'</script>");
            }
        }
        catch
        {
            Response.Write("<script>alert('数据库出错,该同学可能还未填写开题报告.')<script>");
        }
        finally
        {
            ds.Clear();
        }

      
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Button2.Enabled = false;
        SQLtoWord SW = new SQLtoWord();

        //string str = "select student_ID,name,Depart,specify,teacher_Name,title,AimandSense,state,content,schedule,ref　from STReport where student_ID='" +Session["student_ID"].ToString().Trim()+ "'";
        string str = " SELECT student_ID, name, Depart, specify, teacher_Name, title, AimandSense, state,  content, schedule, ref FROM STReport WHERE (student_ID ='" + Session["student_ID"].ToString().Trim() + "')";
        DB db = new DB();
        DataSet ds = db.Select(str, db.DBconn());
        try
        {
            string tex = ds.Tables[0].Rows[0][0].ToString();//ceshi 
            string path1 = Server.MapPath(@"..\\过程文档\\文档模版\\开题报告.doc");
            string path2 = Server.MapPath(@"..\\过程文档\\开题报告") + "\\" + Session["student_ID"] + Session["student_Name"] + "开题报告.doc";

            string[] obDD = new string[11];
            obDD[0] = "student_ID";
            obDD[1] = "name";
            obDD[2] = "Depart";
            obDD[3] = "specify";
            obDD[4] = "teacher_Name";
            obDD[5] = "title";
            obDD[6] = "AimandSense";
            obDD[7] = "state";
            obDD[8] = "content";
            obDD[9] = "schedule";
            obDD[10] = "ref";

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
                return;
            }

        }
        catch
        {
            Response.Write("<script>alert('数据库出错,该同学可能还未填写开题报告.')</script>");
            return;
        }
        finally
        {
            ds.Clear();
            Button2.Enabled = true;
        }
       
    }
}
