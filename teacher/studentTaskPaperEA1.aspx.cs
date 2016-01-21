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
using Microsoft.Office.Interop.Word;
using System.Text;
public partial class teacher_studentTaskPaperEA : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {
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
           string student_name=ds.Tables[0].Rows[0][3].ToString();
           Session["student_Name"] = student_name;
           string teacher_ID = ds.Tables[0].Rows[0][4].ToString();
           if (teacher_ID.Equals(Session["username"].ToString()))
           {
           }
           else
           {
               Response.Write("<script>alert('对不起，参数传递错误。');location='studentTaskPaperEA.aspx'</script>");   
               return;
           }


        }
        catch//没有数据
        {
            Response.Write("<script>alert('对不起，数据库出错，暂时无法查询数据。');location='studentTaskPaperEA.aspx'</script>");
           
            return;
        }



        //将值附于表中
        String sel = "select * from studentTask where student_ID='" + Session["student_ID"] + "'";
         ds =db.Select(sel, db.DBconn());
        try
        {//如果读取到数据 装载数据

            Label1.Text =ds.Tables[0].Rows[0][1].ToString() ;
            Label2.Text = ds.Tables[0].Rows[0][2].ToString(); 
            Label3.Text = ds.Tables[0].Rows[0][3].ToString(); 
            Label4.Text = ds.Tables[0].Rows[0][4].ToString(); 
            Label5.Text = ds.Tables[0].Rows[0][5].ToString(); 
            Label6.Text = ds.Tables[0].Rows[0][6].ToString(); 
            Label7.Text = ds.Tables[0].Rows[0][7].ToString(); 
            Label8.Text = ds.Tables[0].Rows[0][8].ToString();
            Label9.Text = ds.Tables[0].Rows[0][9].ToString(); 
            RadioButtonList1.SelectedValue = ds.Tables[0].Rows[0][10].ToString();
            Label10.Text = ds.Tables[0].Rows[0][11].ToString();
            Label11.Text = ds.Tables[0].Rows[0][12].ToString(); 
            Label12.Text = ds.Tables[0].Rows[0][13].ToString(); 

            if (this.TextBox1.Text == "")
            {
                this.TextBox1.Text = ds.Tables[0].Rows[0][14].ToString();
            }
            if (this.TextBox2.Text == "")
            {
                this.TextBox2.Text = ds.Tables[0].Rows[0][15].ToString();
            }
            if (this.TextBox3.Text == "")
            {
                this.TextBox3.Text = ds.Tables[0].Rows[0][16].ToString();
            }
            if (this.TextBox4.Text == "")
            {
                this.TextBox4.Text = ds.Tables[0].Rows[0][17].ToString();
            }

        }
        catch//没有数据
        {
            Response.Write("<script>alert('对不起，数据库出错，暂时无法查询数据。');</script>");
        }
        finally
        {
            ds.Clear();
        }
        //如果教师审批该jilu通过了，那么审批功能被禁用
        string adv = "select * from StoTContent where student_ID='" + Session["student_ID"] + "' and topic='学生任务书' and state='是'";
        ds = db.Select(adv, db.DBconn());
        int adv1 = ds.Tables[0].Rows.Count;
        if (adv1 > 0)
        {
            this.Button1.Enabled = false;
            this.Label13.Text = "您通过了该同学的学生任务书，无法再进行审批";
            this.TextBox5.ReadOnly = true;
            this.RadioButtonList2.Enabled = false;
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
        string countNum = "select * from StoTContent where topic='学生任务书' and student_ID='" + Session["student_ID"].ToString() + "'";
        DataSet ds = db.Select(countNum, conn);
        int count = ds.Tables[0].Rows.Count;
        count++;
        DateTime time = DateTime.Now;
        String topic = "学生任务书";
        if (this.TextBox5.Text == "")
        {
            Response.Write("<script>alert('审批内容不能为空！');</script>");
            return;
        }
        String insert = "insert into StoTContent(teacher_ID,teacher_Name,student_ID,student_Name,state,Content,time,topic,Year,count) values('" + Session["username"].ToString() + "','" + Session["name"].ToString() + "','" + Session["student_ID"].ToString() + "','" + Session["student_Name"].ToString() + "','" + this.RadioButtonList2.SelectedValue + "','" + this.TextBox5.Text + "','" + time + "','" + topic + "','" + Session["year"] + "','" + count + "') ";
         if (db.Insert(insert, conn))
            {
                Response.Write("<script>alert('学生任务书审批成功。');location='studentTaskPaperEA.aspx'</script>");
            }
            else
            {
                Response.Write("<script>alert('学生任务书审批失败。');location='studentTaskPaperEA.aspx'</script>");
            }

        
    }



    protected void Button2_Click(object sender, EventArgs e)
    {
        SQLtoWord SW = new SQLtoWord();
        Button2.Enabled = false;
        string str = "select Depart,specify,name,student_ID,class,period,periodUp,teacher_Name,title,kind,project_Name,project_Depart,project_Num,content,aim,ref,remark from studentTask where student_ID='" + Session["student_ID"] + "'";
        DB db = new DB();
        DataSet ds = db.Select(str, db.DBconn());
        try
        {
            string tex = ds.Tables[0].Rows[0][1].ToString();
            string path1 = Server.MapPath(@"..\\过程文档\\文档模版\\学生任务书.doc");
            string path2 = Server.MapPath("..\\过程文档\\学生任务书") + "\\" + Session["student_ID"] + this.Label3.Text + "学生任务书.doc";
            if (ds.Tables[0].Rows[0]["kind"].Equals("理论研究"))
            {
                ds.Tables[0].Rows[0]["kind"] = "√理论研究    □应用研究    □技术开发    □其他";
            }
            if (ds.Tables[0].Rows[0]["kind"].Equals("应用研究"))
            {
                ds.Tables[0].Rows[0]["kind"] = "□理论研究    √应用研究    □技术开发    □其他";
            }
            if (ds.Tables[0].Rows[0]["kind"].Equals("技术开发"))
            {
                ds.Tables[0].Rows[0]["kind"] = "□理论研究    □应用研究    √技术开发    □其他";
            }
            if (ds.Tables[0].Rows[0]["kind"].Equals("其他"))
            {
                ds.Tables[0].Rows[0]["kind"] = "□理论研究    □应用研究    □技术开发    √其他";
            }

            string[] obDD = new string[19];
            obDD[0] = "Depart";
            obDD[1] = "specify";
            obDD[2] = "name";
            obDD[3] = "student_ID";
            obDD[4] = "class";
            obDD[5] = "period";
            obDD[6] = "periodUp";
            obDD[7] = "teacher_Name";
            obDD[8] = "title";
            obDD[9] = "kind1";
            obDD[10] = "kind2";
            obDD[11] = "kind3";
            obDD[12] = "project_Name";
            obDD[13] = "project_Depart";
            obDD[14] = "project_Num";
            obDD[15] = "content";
            obDD[16] = "aim";
            obDD[17] = "ref";
            obDD[18] = "remark";

            Microsoft.Office.Interop.Word.Application appWord = null;
            Microsoft.Office.Interop.Word.Document doc = null;
            try
            {
                appWord = new Microsoft.Office.Interop.Word.ApplicationClass();
                appWord.Visible = false;
                object objTrue = true;
                object objFalse = false;
                object objTemplate = path1;//模板路径
                object objDocType = Microsoft.Office.Interop.Word.WdDocumentType.wdTypeDocument;
                doc = appWord.Documents.Add(ref objTemplate, ref objFalse, ref objDocType, ref objTrue);
                //第一步生成word文档
                //定义书签变量
                int length = obDD.Length;
                object[] obDD_Name = new object[length];
                    int j = 0;//初始化数据库daset列
                for (int i = 0; i < obDD.Length; i++)
                {
                   
                    
                    obDD_Name[i] = obDD[i];
                    if (ds.Tables[0].Rows[0]["kind"] == ds.Tables[0].Rows[0][j])//到达kind出
                    {
                        string str1 = ds.Tables[0].Rows[0]["kind"].ToString();
                        string[] sArray = str1.Split('√');
                  
                        doc.Bookmarks.get_Item(ref obDD_Name[i]).Range.Text = sArray[0]; //加入书签
                        i++;
                        obDD_Name[i] = obDD[i];
                        doc.Bookmarks.get_Item(ref obDD_Name[i]).Range.Text = ""; //加入书签
                        i++;
                        obDD_Name[i] = obDD[i];
                        doc.Bookmarks.get_Item(ref obDD_Name[i]).Range.Text = sArray[1]; //加入书签
                        j++;

                    }
                    else
                    {

                        doc.Bookmarks.get_Item(ref obDD_Name[i]).Range.Text = ds.Tables[0].Rows[0][j].ToString(); //循环加入书签
                        j++;
                    }

                }

                // ....
                //第四步 生成word
                object filename = path2;
                object miss = System.Reflection.Missing.Value;
                try
                {
                    doc.SaveAs(ref filename, ref miss, ref miss, ref miss, ref miss, ref miss, ref miss, ref miss, ref miss, ref miss, ref miss, ref miss, ref miss, ref miss, ref miss, ref miss);
                    //doc.Visible = true;//测试

                }
                catch
                {
                    // System.Windows.Forms.MessageBox.Show("系统找不到指定目录下的文件： " + DATAWORDPATH + tempFileName + WORDPOSTFIX);
                   Response.Write("<script>alert('系统找不到指定目录文件输出路径')<script>");
                }
                object missingValue = Type.Missing;
                object doNotSaveChanges = Microsoft.Office.Interop.Word.WdSaveOptions.wdDoNotSaveChanges;
                doc.Close(ref doNotSaveChanges, ref missingValue, ref missingValue);//关闭WordDoc文档对象 
                //关闭WordApp组件对象 

                appWord.Application.Quit(ref miss, ref miss, ref miss);
                doc = null;
                appWord = null;
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
            catch (System.Exception a)
            {
                //捕捉异常，如果出现异常则清空实例，退出word,同时释放资源
                string aa = a.ToString();
                object miss = System.Reflection.Missing.Value;
                object missingValue = Type.Missing;
                object doNotSaveChanges = Microsoft.Office.Interop.Word.WdSaveOptions.wdDoNotSaveChanges;
                doc.Close(ref doNotSaveChanges, ref missingValue, ref missingValue);
                appWord.Application.Quit(ref miss, ref miss, ref miss);
                doc = null;
                appWord = null;
                Response.Write("<script>alert('向word文件中写入数据出错.')</script>");
                return;
            } 
        }
        catch
        {
            Response.Write("<script>alert('数据库出错,该同学可能还未填写学生任务书.')</script>");
            return;
        }
        finally
        {

            ds.Clear();
            Button2.Enabled = true;

        }
    }
}
