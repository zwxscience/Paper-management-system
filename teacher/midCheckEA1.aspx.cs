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
using System.Text;
public partial class teacher_midCheckEA1 : System.Web.UI.Page
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
        String time = "select * from time where period='中期检查'";
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

        //如果选择性质时，选项为其他，那么textbox可见
        this.TextBox2.Visible = false;
        if (this.RadioButtonList6.SelectedValue.Equals("其他"))
        {
            this.TextBox2.Visible = true;
        }
        if (!Page.IsPostBack)
        {

            //一般信息装载*******************************************
            //教师信息
            String teacherInfo = "select * from teacher where teacher_ID='" + Session["username"] + "'";
            ds = db.Select(teacherInfo, db.DBconn());
            try
            {
                Label1.Text = "计算机与软件学院";
                Label2.Text = ds.Tables[0].Rows[0][7].ToString().Trim();
                Label3.Text = DateTime.Today.Year + " 年 " + DateTime.Today.Month + " 月 " + DateTime.Today.Day + " 日 ";
                Label4.Text = ds.Tables[0].Rows[0][2].ToString().Trim();

            }
            catch
            {
                Response.Write("<script>alert('数据库教师信息错误。');location='midCheckEA.aspx'</script>");
            }
            finally
            {
                ds.Clear();
            }
            //查找所带的学生个数
            String num = "select * from select_Result where teacher_ID='" + Session["username"] + "'";
            ds = db.Select(num, db.DBconn());
            Label5.Text = ds.Tables[0].Rows.Count.ToString();
            ds.Clear();
            //学生信息
            //地址栏验证
            try
            {
                Session["student_ID"] = Request.QueryString["student_ID"].ToString();
               // Session["paperid"] = Request.QueryString["paperid"].ToString();
                string pass="select * from select_Result where student_ID='" + Session["student_ID"] + "'";
                ds = db.Select(pass, db.DBconn());
                Session["paperid"] = ds.Tables[0].Rows[0][8].ToString();
                string teacher_ID = ds.Tables[0].Rows[0][4].ToString();
                if (teacher_ID.Equals(Session["username"].ToString()))
                {
                }
                else
                {
                    Response.Write("<script>alert('对不起，参数传递错误。');location='midCheckEA.aspx'</script>");
                    return;
                }
            }
            catch
            {
                Response.Write("<script>alert('参数传递遇到错误。');location='midCheckEA.aspx'</script>");
            }
            


            String studentInfo = "select * from select_Result where student_ID='" + Request.QueryString["student_ID"].ToString() + "'";
            ds = db.Select(studentInfo, db.DBconn());
            try
            {

                Label6.Text = ds.Tables[0].Rows[0][3].ToString().Trim();
                Label7.Text = ds.Tables[0].Rows[0][3].ToString().Trim();
                Label8.Text = ds.Tables[0].Rows[0][6].ToString().Trim();

            }
            catch
            {
                Response.Write("<script>alert('数据库学生信息错误。');location='midCheckEA.aspx'</script>");
            }
            finally
            {
                ds.Clear();
            }



            //查找是否存在于表中如果存在则插入****************************************************
            String sel = "select * from midCheckForTea where teacher_ID='" + Session["username"] + "'";
            ds = db.Select(sel, db.DBconn());
            if (ds.Tables[0].Rows.Count > 0)
            {//如果读取到数据变成了修改 并装载数据

                Label1.Text = ds.Tables[0].Rows[0][3].ToString().Trim();
                Label2.Text = ds.Tables[0].Rows[0][4].ToString().Trim();
                Label3.Text = ds.Tables[0].Rows[0][5].ToString().Trim();
                Label4.Text = ds.Tables[0].Rows[0][2].ToString().Trim();
                Label5.Text = ds.Tables[0].Rows[0][6].ToString().Trim();
                this.RadioButtonList1.SelectedValue = ds.Tables[0].Rows[0][7].ToString().Trim();
                this.RadioButtonList2.SelectedValue = ds.Tables[0].Rows[0][8].ToString().Trim();
                this.RadioButtonList3.SelectedValue = ds.Tables[0].Rows[0][9].ToString().Trim();
                this.RadioButtonList4.SelectedValue = ds.Tables[0].Rows[0][10].ToString().Trim();
                this.RadioButtonList5.SelectedValue = ds.Tables[0].Rows[0][11].ToString().Trim();
                this.TextBox1.Text = ds.Tables[0].Rows[0][12].ToString().Trim();

                if (this.TextBox1.Text == "")
                {
                    this.TextBox1.Text = ds.Tables[0].Rows[0][12].ToString().Trim();
                }

                ds.Clear();
                //查找是否存在于学生表中如果存在则相当已修改，不存在为插入****************************************************
                sel = "select * from midCheckForStu where student_ID='" + Request.QueryString["student_ID"].ToString() + "'";
                ds = db.Select(sel, db.DBconn());
                if (ds.Tables[0].Rows.Count > 0)
                {//如果读取到数据变成了修改 并装载数据   
                    this.Button1.Text = "更改";
                    this.Label6.Text = ds.Tables[0].Rows[0][3].ToString().Trim();
                    this.Label7.Text = ds.Tables[0].Rows[0][3].ToString().Trim();
                    this.Label8.Text = ds.Tables[0].Rows[0][5].ToString().Trim();
                    //性质
                    if (ds.Tables[0].Rows[0][6].ToString().Trim().Equals("理论研究") || ds.Tables[0].Rows[0][6].ToString().Trim().Equals("应用研究") || ds.Tables[0].Rows[0][6].ToString().Trim().Equals("技术开发"))
                    {
                        this.RadioButtonList6.SelectedValue = ds.Tables[0].Rows[0][6].ToString().Trim();
                        this.TextBox2.Visible = false;
                    }
                    else
                    {
                        this.TextBox2.Visible = true;
                        this.RadioButtonList6.SelectedValue = "其他";
                        this.TextBox2.Text = ds.Tables[0].Rows[0][6].ToString().Trim();
                    }

                    this.RadioButtonList6.SelectedValue = ds.Tables[0].Rows[0][6].ToString().Trim();
                    this.RadioButtonList7.SelectedValue = ds.Tables[0].Rows[0][7].ToString().Trim();
                    this.RadioButtonList8.SelectedValue = ds.Tables[0].Rows[0][8].ToString().Trim();
                    this.RadioButtonList9.SelectedValue = ds.Tables[0].Rows[0][9].ToString().Trim();
                    this.RadioButtonList10.SelectedValue = ds.Tables[0].Rows[0][10].ToString().Trim();
                    this.RadioButtonList11.SelectedValue = ds.Tables[0].Rows[0][11].ToString().Trim();
                    this.RadioButtonList12.SelectedValue = ds.Tables[0].Rows[0][12].ToString().Trim();
                    ds.Clear();
                  



                }
                else//不是则插入学生数据
                {
                    Button1.Text = "提交";
                    //this.Button2.Visible = false;
                    //获取学生信息中的性质
                    string paperid = Request.QueryString["paperid"].ToString();
                    string kind = "select * from paperApply where id='" + Request.QueryString["paperid"].ToString() + "'";
                    ds = db.Select(kind, db.DBconn());
                    try
                    {

                        if (ds.Tables[0].Rows[0][4].ToString().Trim().Equals("理论研究") || ds.Tables[0].Rows[0][4].ToString().Trim().Equals("应用研究") || ds.Tables[0].Rows[0][4].ToString().Trim().Equals("技术开发"))
                        {
                            this.RadioButtonList6.SelectedValue = ds.Tables[0].Rows[0][4].ToString().Trim();
                            this.TextBox2.Visible = false;
                        }
                        else
                        {
                            this.TextBox2.Visible = true;
                            this.RadioButtonList6.SelectedValue = "其他";
                            this.TextBox2.Text = ds.Tables[0].Rows[0][4].ToString().Trim();
                        }

                    }
                    catch
                    {
                        Response.Write("<script>alert('数据库论文信息错误。');location='midCheckEA.aspx'</script>");
                    }
                    finally
                    {
                        ds.Clear();
                    }
                }
            }
            else//教师表中没有数据
            {
                Button1.Text = "提交";
                //获取学生信息中的性质
                string kind = "select * from paperApply where id='" + Request.QueryString["paperid"].ToString() + "'";
                ds = db.Select(kind, db.DBconn());
                try
                {

                    if (ds.Tables[0].Rows[0][4].ToString().Trim().Equals("理论研究") || ds.Tables[0].Rows[0][4].ToString().Trim().Equals("应用研究") || ds.Tables[0].Rows[0][4].ToString().Trim().Equals("技术开发"))
                    {
                        this.RadioButtonList6.SelectedValue = ds.Tables[0].Rows[0][4].ToString().Trim();
                        this.TextBox2.Visible = false;
                    }
                    else
                    {
                        this.TextBox2.Visible = true;
                        this.RadioButtonList6.SelectedValue = "其他";
                        this.TextBox2.Text = ds.Tables[0].Rows[0][4].ToString().Trim();
                    }
                    ds.Clear();
                }
                catch
                {
                    Response.Write("<script>alert('数据库论文信息错误。');location='midCheckEA.aspx'</script>");
                }
            }
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
         DB db=new DB();
        //首先判断教师中期中数据
     
        string sel="select * from midCheckForTea where teacher_ID='"+Session["username"]+"'";
        DataSet ds=db.Select(sel,db.DBconn());
        if(ds.Tables[0].Rows.Count>0){//有数据则更新操作
            string update="update midCheckForTea set IsOne='"+this.RadioButtonList1.SelectedValue+"',IsTaskGive='"+this.RadioButtonList2.SelectedValue+"',IsrefRead='"+this.RadioButtonList3.SelectedValue+"',IsGuided='"+this.RadioButtonList4.SelectedValue+"',totalsituation='"+this.RadioButtonList5.SelectedValue+"',QA='"+this.TextBox1.Text+"' where teacher_ID='"+Session["username"]+"'";
            if (!db.Update(update, db.DBconn()))
            {   
            Response.Write("<script>alert('中期检查教师表修改失败。');location='midCheckEA.aspx'</script>");
            }

        }else{//无数据则进行插入

            String insert="insert into midCheckForTea(teacher_ID,teacher_Name,Depart,specify,time,guiNum,IsOne,IsTaskGive,IsrefRead,IsGuided,totalsituation,QA,year) values('"+Session["username"]+ "','" + Label4.Text + "','" + Label1.Text+ "','" + Label2.Text + "','" + Label3.Text+ "','" + Label5.Text + "','" +this.RadioButtonList1.SelectedValue  + "','" +this.RadioButtonList2.SelectedValue + "','" + this.RadioButtonList3.SelectedValue  + "','" +this.RadioButtonList4.SelectedValue + "','" +this.RadioButtonList5.SelectedValue + "','" +this.TextBox1.Text + "','" +Session["year"] +"')";
            if (!db.Insert(insert, db.DBconn()))
            {
                Response.Write("<script>alert('中期检查教师表填写失败。');location='midCheckEA.aspx'</script>");
            }

        }
        ds.Clear();
//按照学生情况进行操作***********************************************************************
        if (Button1.Text == "提交")//插入操作
        {
           
             //查找是否存在于表中如果存在则相当已修改，不存在为插入
            string kind=this.RadioButtonList6.SelectedValue;
            if(this.RadioButtonList6.SelectedValue.Equals("其他")&&this.TextBox2.Visible)
            {
                kind = this.TextBox2.Text;
            }
            String insert = "insert into midCheckForStu(teacher_ID,student_ID,student_Name,paperid,title,kind,Ischanged,IsReq,IsCom,Attitude,quality,result,state) values('" + Session["username"] + "','" + Session["student_ID"] + "','" + Label6.Text + "','" + Session["paperid"] + "','" + Label8.Text + "','" +kind + "','" +RadioButtonList7.SelectedValue  + "','" + RadioButtonList8.SelectedValue  + "','" + RadioButtonList9.SelectedValue + "','" + RadioButtonList10.SelectedValue  + "','" +RadioButtonList11.SelectedValue  + "','" + RadioButtonList12.SelectedValue +"','"+"已填写" + "') ";
           if(db.Insert(insert,db.DBconn())){
               Response.Write("<script>alert('中期检查填写成功。');location='midCheckEA.aspx'</script>");
           }
            else{
                Response.Write("<script>alert('中期检查填写失败。');location='midCheckEA.aspx'</script>");
            }
       
        }
        else//更新操作
        {
             string kind=this.RadioButtonList6.SelectedValue;
            if(this.RadioButtonList6.SelectedValue.Equals("其他")&&this.TextBox2.Visible)
            {
                kind=this.TextBox2.Text;

            }

            String update = "update midCheckForStu set kind='" + kind + "',Ischanged='" + this.RadioButtonList7.SelectedValue + "',IsReq='" + this.RadioButtonList8.SelectedValue + "',IsCom='" + this.RadioButtonList9.SelectedValue + "',Attitude='" + this.RadioButtonList10.SelectedValue + "',quality='" + this.RadioButtonList11.SelectedValue + "',result='" + this.RadioButtonList12.SelectedValue + "' where student_ID='" + Session["student_ID"].ToString().Trim() + "'";
            
            if (db.Update(update, db.DBconn()))
            {
                Response.Write("<script>alert('中期检查更新成功。');location='midCheckEA.aspx'</script>");
            }
            else
            {
                Response.Write("<script>alert('中期检查更新失败。');location='midCheckEA.aspx'</script>");
            }
       
       
    }
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        SQLtoWord SW = new SQLtoWord();
        Button2.Enabled = false;

 string str = "SELECT mt.[year], mt.Depart, mt.[time], mt.teacher_Name, mt.specify, mt.guiNum, mt.IsOne,mt.IsTaskGive, mt.IsrefRead, mt.IsGuided, mt.totalsituation, ms.student_Name, ms.title, ms.kind AS kind, ms.Ischanged, ms.IsReq, ms.IsCom, ms.Attitude, ms.quality, ms.result, mt.QA FROM midCheckForTea mt CROSS JOIN midCheckForStu ms where mt.teacher_ID='" + Session["username"] + "' and mt.year='" + Session["year"] + "'and ms.student_ID='" + Session["student_ID"] + "'";
        DB db = new DB();
        DataSet ds = db.Select(str, db.DBconn());
        try
        {
            string tex = ds.Tables[0].Rows[0][1].ToString();
            string path1 = Server.MapPath(@"..\\过程文档\\文档模版\\中期检查.doc");
            string path2 = Server.MapPath("..\\过程文档\\中期检查") + "\\" + Session["student_ID"] +this.Label6.Text + "中期检查表.doc";
            if (ds.Tables[0].Rows[0]["kind"].Equals("理论研究"))
            {
                ds.Tables[0].Rows[0]["kind"] = "√理论研究    □应用研究    □技术开发    □其他( )";
            }
            else if (ds.Tables[0].Rows[0]["kind"].Equals("应用研究"))
            {
                ds.Tables[0].Rows[0]["kind"] = "□理论研究    √应用研究    □技术开发    □其他( )";
            }
            else if (ds.Tables[0].Rows[0]["kind"].Equals("技术开发"))
            {
                ds.Tables[0].Rows[0]["kind"] = "□理论研究    □应用研究    √技术开发    □其他( )";
            }
            else
            {
                ds.Tables[0].Rows[0]["kind"] = "□理论研究    □应用研究    □技术开发    √其他(" + ds.Tables[0].Rows[0]["kind"] + ")";
            }



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
                object[] obDD = new object[36];
                obDD[0] = "year";
                obDD[1] = "Depart";
                obDD[2] = "time";
                obDD[3] = "teacher_Name";
                obDD[4] = "specify";
                obDD[5] = "guiNum";
                obDD[6] = "IsOne";
                obDD[7] = "IsTaskGive";
                obDD[8] = "IsrefRead";
                obDD[9] = "IsGuided";
                obDD[10] = "totalsituation";
                obDD[11] = "student_Name1";
                obDD[12] = "student_Name2";
                obDD[13] = "title";
                obDD[14] = "kind1";
                obDD[15] = "kind2";
                obDD[16] = "kind3";
                obDD[17] = "Ischanged";
                obDD[18] = "IsReq";
                obDD[19] = "IsCom1";
                obDD[20] = "IsCom2";
                obDD[21] = "IsCom3";
                obDD[22] = "IsCom4";
                obDD[23] = "Attitude1";
                obDD[24] = "Attitude2";
                obDD[25] = "Attitude3";
                obDD[26] = "Attitude4";
                obDD[27] = "quality1";
                obDD[28] = "quality2";
                obDD[29] = "quality3";
                obDD[30] = "quality4";
                obDD[31] = "result1";
                obDD[32] = "result2";
                obDD[33] = "result3";
                obDD[34] = "result4";
                obDD[35] = "QA";
                for (int i = 0; i < 12; i++)
                {

                    doc.Bookmarks.get_Item(ref obDD[i]).Range.Text = ds.Tables[0].Rows[0][i].ToString(); 

                }
                doc.Bookmarks.get_Item(ref obDD[12]).Range.Text = ds.Tables[0].Rows[0][11].ToString();
                doc.Bookmarks.get_Item(ref obDD[13]).Range.Text = ds.Tables[0].Rows[0][12].ToString();
                //前13个循环加入书签，第13个开始要进行字符处理
                //14个是kind
                string str1 = ds.Tables[0].Rows[0][13].ToString();
                string[] sArray = str1.Split('√');

                doc.Bookmarks.get_Item(ref obDD[14]).Range.Text = sArray[0]; //加入书签

                doc.Bookmarks.get_Item(ref obDD[15]).Range.Text = ""; //加入书签

                doc.Bookmarks.get_Item(ref obDD[16]).Range.Text = sArray[1]; //加入书签

                // 15,16，个是 ms.Ischanged,ms.IsReq
                doc.Bookmarks.get_Item(ref obDD[17]).Range.Text = ds.Tables[0].Rows[0][14].ToString();
                doc.Bookmarks.get_Item(ref obDD[18]).Range.Text = ds.Tables[0].Rows[0][15].ToString();
                //17个是 ms.IsCom
                if (ds.Tables[0].Rows[0][16].Equals("提前完成"))
                {
                    doc.Bookmarks.get_Item(ref obDD[19]).Range.Text = "√";
                    doc.Bookmarks.get_Item(ref obDD[20]).Range.Text = "  ";
                    doc.Bookmarks.get_Item(ref obDD[21]).Range.Text = "  ";
                    doc.Bookmarks.get_Item(ref obDD[22]).Range.Text = "  ";
                }
                else if (ds.Tables[0].Rows[0][16].Equals("按计划完成"))
                {
                    doc.Bookmarks.get_Item(ref obDD[20]).Range.Text = "√";
                    doc.Bookmarks.get_Item(ref obDD[19]).Range.Text = "  ";
                    doc.Bookmarks.get_Item(ref obDD[21]).Range.Text = "  ";
                    doc.Bookmarks.get_Item(ref obDD[22]).Range.Text = "  ";
                }
                else if (ds.Tables[0].Rows[0][16].Equals("延期完成"))
                {
                    doc.Bookmarks.get_Item(ref obDD[21]).Range.Text = "√";
                    doc.Bookmarks.get_Item(ref obDD[19]).Range.Text = "  ";
                    doc.Bookmarks.get_Item(ref obDD[20]).Range.Text = "  ";
                    doc.Bookmarks.get_Item(ref obDD[22]).Range.Text = "  ";
                }
                else if (ds.Tables[0].Rows[0][16].Equals("没有完成"))
                {
                    doc.Bookmarks.get_Item(ref obDD[22]).Range.Text = "√";
                    doc.Bookmarks.get_Item(ref obDD[19]).Range.Text = "  ";
                    doc.Bookmarks.get_Item(ref obDD[21]).Range.Text = "  ";
                    doc.Bookmarks.get_Item(ref obDD[20]).Range.Text = "  ";
                }

                //18个是ms.Attitude
                if (ds.Tables[0].Rows[0][17].Equals("认真"))
                {
                    doc.Bookmarks.get_Item(ref obDD[23]).Range.Text = "√";
                    doc.Bookmarks.get_Item(ref obDD[24]).Range.Text = "  ";
                    doc.Bookmarks.get_Item(ref obDD[25]).Range.Text = "  ";
                    doc.Bookmarks.get_Item(ref obDD[26]).Range.Text = "  ";
                }
                else if (ds.Tables[0].Rows[0][17].Equals("较认真"))
                {
                    doc.Bookmarks.get_Item(ref obDD[24]).Range.Text = "√";
                    doc.Bookmarks.get_Item(ref obDD[23]).Range.Text = "  ";
                    doc.Bookmarks.get_Item(ref obDD[25]).Range.Text = "  ";
                    doc.Bookmarks.get_Item(ref obDD[26]).Range.Text = "  ";
                }
                else if (ds.Tables[0].Rows[0][17].Equals("一般"))
                {
                    doc.Bookmarks.get_Item(ref obDD[25]).Range.Text = "√";
                    doc.Bookmarks.get_Item(ref obDD[24]).Range.Text = "  ";
                    doc.Bookmarks.get_Item(ref obDD[23]).Range.Text = "  ";
                    doc.Bookmarks.get_Item(ref obDD[26]).Range.Text = "  ";
                }
                else if (ds.Tables[0].Rows[0][17].Equals("不认真"))
                {
                    doc.Bookmarks.get_Item(ref obDD[26]).Range.Text = "√";
                    doc.Bookmarks.get_Item(ref obDD[24]).Range.Text = "  ";
                    doc.Bookmarks.get_Item(ref obDD[25]).Range.Text = "  ";
                    doc.Bookmarks.get_Item(ref obDD[23]).Range.Text = "  ";
                }

                //19个是ms.result
                if (ds.Tables[0].Rows[0][18].Equals("优"))
                {
                    doc.Bookmarks.get_Item(ref obDD[27]).Range.Text = "√";
                    doc.Bookmarks.get_Item(ref obDD[28]).Range.Text = "  ";
                    doc.Bookmarks.get_Item(ref obDD[29]).Range.Text = "  ";
                    doc.Bookmarks.get_Item(ref obDD[30]).Range.Text = "  ";
                }
                else if (ds.Tables[0].Rows[0][18].Equals("良"))
                {
                    doc.Bookmarks.get_Item(ref obDD[28]).Range.Text = "√";
                    doc.Bookmarks.get_Item(ref obDD[27]).Range.Text = "  ";
                    doc.Bookmarks.get_Item(ref obDD[29]).Range.Text = "  ";
                    doc.Bookmarks.get_Item(ref obDD[30]).Range.Text = "  ";
                }
                else if (ds.Tables[0].Rows[0][18].Equals("中"))
                {
                    doc.Bookmarks.get_Item(ref obDD[29]).Range.Text = "√";
                    doc.Bookmarks.get_Item(ref obDD[28]).Range.Text = "  ";
                    doc.Bookmarks.get_Item(ref obDD[27]).Range.Text = "  ";
                    doc.Bookmarks.get_Item(ref obDD[30]).Range.Text = "  ";
                }
                else if (ds.Tables[0].Rows[0][18].Equals("差"))
                {
                    doc.Bookmarks.get_Item(ref obDD[30]).Range.Text = "√";
                    doc.Bookmarks.get_Item(ref obDD[28]).Range.Text = "  ";
                    doc.Bookmarks.get_Item(ref obDD[29]).Range.Text = "  ";
                    doc.Bookmarks.get_Item(ref obDD[27]).Range.Text = "  ";
                }

                //20个是ms.result
                if (ds.Tables[0].Rows[0][19].Equals("表扬"))
                {
                    doc.Bookmarks.get_Item(ref obDD[31]).Range.Text = "√";
                    doc.Bookmarks.get_Item(ref obDD[32]).Range.Text = "  ";
                    doc.Bookmarks.get_Item(ref obDD[33]).Range.Text = "  ";
                    doc.Bookmarks.get_Item(ref obDD[34]).Range.Text = "  ";
                }
                else if (ds.Tables[0].Rows[0][19].Equals("通过"))
                {
                    doc.Bookmarks.get_Item(ref obDD[32]).Range.Text = "√";
                    doc.Bookmarks.get_Item(ref obDD[31]).Range.Text = "  ";
                    doc.Bookmarks.get_Item(ref obDD[33]).Range.Text = "  ";
                    doc.Bookmarks.get_Item(ref obDD[34]).Range.Text = "  ";
                }
                else if (ds.Tables[0].Rows[0][19].Equals("警告"))
                {
                    doc.Bookmarks.get_Item(ref obDD[33]).Range.Text = "√";
                    doc.Bookmarks.get_Item(ref obDD[32]).Range.Text = "  ";
                    doc.Bookmarks.get_Item(ref obDD[31]).Range.Text = "  ";
                    doc.Bookmarks.get_Item(ref obDD[34]).Range.Text = "  ";
                }
                else if (ds.Tables[0].Rows[0][19].Equals("严重警告"))
                {
                    doc.Bookmarks.get_Item(ref obDD[34]).Range.Text = "√";
                    doc.Bookmarks.get_Item(ref obDD[32]).Range.Text = "  ";
                    doc.Bookmarks.get_Item(ref obDD[33]).Range.Text = "  ";
                    doc.Bookmarks.get_Item(ref obDD[31]).Range.Text = "  ";
                }
                //21个是mt.QA

                doc.Bookmarks.get_Item(ref obDD[35]).Range.Text = ds.Tables[0].Rows[0][20].ToString();


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
                Response.Write("<script>alert('向word文件中写入数据出错。');location='midCheckEA.aspx'</script>");
               
                return;
            }
        }
        catch
        {
            Response.Write("<script>alert('数据库出错,您可能还未提交中期检查表.');location='midCheckEA.aspx'</script>");
            return;
        }
        finally
        {

            ds.Clear();
            Button2.Enabled = true;
        }

    }
}
