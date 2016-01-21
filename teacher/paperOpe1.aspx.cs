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
using System.Data.Sql;
public partial class teacher_paperOpe1 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["username"] == null)
        {
            Response.Write("<script>alert('用户登录超时，请重新登录。');location='../Default.aspx'</script>");

            return;
        }
        
        //初始化组件
        this.Panel1.Visible = false;
        this.Panel2.Visible = false;
        this.Panel4.Visible = false;
        //出题作为单独一项，在最后边
        //获取页面参数
       
        string tag = Request.QueryString["tag"].ToString();
        try
        {
            Session["year2"] = Request.QueryString["year"].ToString();
            string title = Request.QueryString["title"].ToString();
            Session["id"] = Request.QueryString["id"].ToString().Trim();//论文id
            //判断是否为查题，该题和删题
            if (tag.Equals("1"))//查题
            {
                this.Panel4.Visible = true;
                this.message.Text = "";
                this.Page.Title = "计软院论文管理系统-教师课题查看";
                //查题
                String sel = "select * from paperApply where teacher_ID='" + Session["username"] + "' and id='" + Session["id"] + "'";

                DB db = new DB();
                DataSet ds = db.Select(sel, db.DBconn());
                try
                {
                    //sdr.Read();
                    // Label3.Text = sdr.GetString(2);
                    this.Label1.Text = title;
                    Label3.Text = ds.Tables[0].Rows[0][2].ToString();
                    //Label4.Text = sdr.GetString(4);
                    Label4.Text = ds.Tables[0].Rows[0][4].ToString();
                    //Label5.Text = sdr.GetString(5);
                    Label5.Text = ds.Tables[0].Rows[0][5].ToString();
                    Label6.Text = ds.Tables[0].Rows[0][6].ToString();
                    Label7.Text = ds.Tables[0].Rows[0][7].ToString();
                    this.TextBox1.Text = ds.Tables[0].Rows[0][8].ToString();
                    this.TextBox2.Text = ds.Tables[0].Rows[0][9].ToString();
                    this.TextBox3.Text = ds.Tables[0].Rows[0][10].ToString();
                    this.TextBox4.Text = ds.Tables[0].Rows[0][11].ToString();
                    this.TextBox5.Text = ds.Tables[0].Rows[0][12].ToString();
                    this.TextBox6.Text = ds.Tables[0].Rows[0][13].ToString();
                    this.TextBox9.Text = ds.Tables[0].Rows[0][21].ToString();
                    ds.Clear();
                }
                catch
                {
                    this.Panel4.Visible = false;
                    this.message.Text = "对不起，数据库出错，请联系管理员";
                }
            }
            //改题,加在资源
            if (tag.Equals("2"))//改题
            {
                this.Panel2.Visible = true;
                this.message.Text = "";
                this.Page.Title = "计软院论文管理系统-教师课题修改";
                String sel = "select * from paperApply where teacher_ID='" + Session["username"] + "' and id='" + Session["id"] + "'";

                DB db = new DB();
                DataSet ds = db.Select(sel, db.DBconn());
                try
                {
                    this.Label2.Text = title;
                   
                    string state1 = ds.Tables[0].Rows[0][14].ToString().Trim();
                    string state2 = ds.Tables[0].Rows[0][15].ToString().Trim();
                    string year2 = ds.Tables[0].Rows[0]["Year"].ToString().Trim();

                    //教师课题修改，当课题审批通过或者不在出题阶段时，无法进行修改
                    if (state1.Equals("Y") && state2.Equals("Y"))
                    {
                        this.message.Text = "该课题已被审批通过，无法修改！";
                        this.Button9.Enabled = false;
                    }
                   
                    //教师课题修改，当课题为往年年份无法修改
                    if (!year2.Equals(Session["year"].ToString()))
                    {
                        this.message.Text = "该课题为往年年份(" + year2 + "年)所出，无法修改！";
                        this.Button9.Enabled = false;
                    }

                    ds.Clear();
                }
                catch
                {
                    this.Panel2.Visible = false;
                    this.message.Text = "对不起，数据库出错，请联系管理员";
                }
                //教师课题修改，当课题审批通过或者不在出题阶段时，无法进行修改
                String time = "select * from time where period='课题申请'";
                ds = db.Select(time, db.DBconn());
                try
                {

                    DateTime period_star1 = Convert.ToDateTime(ds.Tables[0].Rows[0][2].ToString()); ;//开始时间
                    DateTime period_end1 = Convert.ToDateTime(ds.Tables[0].Rows[0][3].ToString()); ;//结束时间
                    String flg = ds.Tables[0].Rows[0][5].ToString(); ;//开关标志
                    ds.Clear();
                    DateTime now = DateTime.Today;
                    if (flg == "开" && (now >= period_star1) && (now <= period_end1))
                    {
                    }
                    else
                    {
                        Response.Write("<script>alert('对不起，课题修改功能暂未开放。请关注系统公告。');location='Default.aspx'</script>");
                    }
                }
                catch
                {
                    this.Panel2.Visible = false;
                    this.message.Text = "对不起，数据库出错，请联系管理员";
                }

            }

            if (tag.Equals("3"))//删题
            {
                this.Page.Title = "计软院论文管理系统-教师课题删除";
                DB db = new DB();
                //一是不在期间不可删，二是已经通过审批的数据不可删
               string time = "select * from time where period='课题申请'";
                DataSet ds = db.Select(time, db.DBconn());
                try
                {

                    DateTime period_star1 = Convert.ToDateTime(ds.Tables[0].Rows[0][2].ToString()); ;//开始时间
                    DateTime period_end1 = Convert.ToDateTime(ds.Tables[0].Rows[0][3].ToString()); ;//结束时间
                    String flg = ds.Tables[0].Rows[0][5].ToString(); ;//开关标志
                    ds.Clear();
                    DateTime now = DateTime.Today;
                    if (flg == "开" && (now >= period_star1) && (now <= period_end1))
                    {
                    }
                    else
                    {
                        Response.Write("<script>alert('对不起，课题修改功能暂未开放。请关注系统公告。');location='Default.aspx'</script>");
                    }
                }
                catch
                {
                    this.Panel2.Visible = false;
                    this.message.Text = "对不起，数据库出错，请联系管理员";
                }
                //二是已经通过审批的数据不可删
               time = "select * from paperApply where id='" + Session["id"] + "'";
                 ds = db.Select(time, db.DBconn());
                try
                {
                    string state1 = ds.Tables[0].Rows[0][14].ToString().Trim();
                    string state2 = ds.Tables[0].Rows[0][15].ToString().Trim();
                    string year2 = ds.Tables[0].Rows[0]["Year"].ToString().Trim();
                    ds.Clear();
                    if (state1.Equals("Y") && state2.Equals("Y"))
                    {
                        this.message.Text = "该课题已被审批通过，无法删除！";
                    }
                
                    //教师课题修改，当课题为往年年份无法修改
                    if (!year2.Equals( Session["year"].ToString()))
                    {
                        this.message.Text = "该课题为往年年份(" + year2 + "年)所出，无法修改！";
                      
                    }
                    else
                    {
                        String del = "delete from paperApply where id='" + Session["id"] + "'";
                        if (db.Delete(del, db.DBconn()))
                        {
                            Response.Write("<script>alert('删除题目为" + title + "的数据成功');location='paperOpe.aspx'</script>");
                        }
                        else
                        {
                            Response.Write("<script>alert('删除题目为" + title + "的数据失败');location='paperOpe.aspx'</script>");

                        }
                    }
                }
                catch
                {
                    this.message.Text = "对不起，数据库出错，请联系管理员";
                }
            }
        }
        catch
        {
            this.message.Text = "出错，参数传递过程可能出错";//出题能无参数传递
        }

        //******************教师出题*******************************************************************
        if (tag.Equals("4"))//出题操作,两个主义要素，一是判断是否在期间，另一个是时间的设定
        {
            this.Panel1.Visible = true;
            this.message.Text = "";
            this.Page.Title = "计软院论文管理系统-教师出题";
            //时间开关判断
            //取值操作和判定开关
            DB db = new DB();
            String time = "select * from time where period='课题申请'";
            DataSet ds = db.Select(time, db.DBconn());
            try
            {

                DateTime period_star1 = Convert.ToDateTime(ds.Tables[0].Rows[0][2].ToString()); ;//开始时间
                DateTime period_end1 = Convert.ToDateTime(ds.Tables[0].Rows[0][3].ToString()); ;//结束时间
                String flg =ds.Tables[0].Rows[0][5].ToString(); ;//开关标志
                ds.Clear();
             DateTime now = DateTime.Today;
            if (flg == "开" && (now >= period_star1) && (now <= period_end1))
            {  
            }else
            {
                Response.Write("<script>alert('对不起，该功能暂未开放。请关注系统公告。');location='Default.aspx'</script>");
            }
        }
        catch
        {
            this.Panel1.Visible = false;
            this.message.Text = "对不起，数据库出错，请联系管理员";
        }



            time = "select * from time where period='论文时间'";
            ds = db.Select(time, db.DBconn());
            try
            {
                DateTime period_star = Convert.ToDateTime(ds.Tables[0].Rows[0][2].ToString());
                DateTime period_end = Convert.ToDateTime(ds.Tables[0].Rows[0][3].ToString());
                ds.Clear();
            this.papertime.Text = period_star.Year.ToString() + "年" + period_star.Month.ToString() + "月" + period_end.Day.ToString() + "日" + "至" + period_star.Year.ToString() + "年" + period_end.Month.ToString() + "月" + period_end.Day.ToString() + "日";
 
            }
            catch
            {
                this.Panel1.Visible = false;
                this.message.Text = "对不起，数据库出错，请联系管理员";
            }
           

        }

   
       
    }
    protected void Button9_Click(object sender, EventArgs e)
    {
        //教师课题修改，当课题审批通过或者不在出题阶段时，无法进行修改

        DB db = new DB();

        String del = "update paperApply set  kind='" + this.kind_Mod.SelectedValue + "',project_Name='" + this.projectName_Mod.Text + "',project_Depart='" + this.projectDpart_Mod.Text + "',project_Num='" + this.projectNum_Mod.Text + "',target='" + this.aim_Mod.Text + "', aim_Meaning='" + this.mean_Mod.Text + "',current_situation='" + this.state_Mod.Text + "', content='" + this.cont_Mod.Text + "',reference='" + this.ref_Mod.Text + "',remark='" + this.remark_Mod.Text + "',schedule='" + this.TextBox8.Text + "' where id='" + Session["id"] + "'";

        if (db.Update(del, db.DBconn()))
        {
            //this.message.Text = "更新题目为" + this.DropDownList1.SelectedValue + "的数据成功";
            Response.Write("<script>alert('更新题目为" + this.Label2.Text + "的数据成功');location='paperOpe.aspx'</script>");
        }
        else
        {
            //  this.message.Text = "更新题目为" + this.DropDownList1.SelectedValue + "的数据失败";
            Response.Write("<script>alert('更新题目为" + this.Label2.Text + "的数据失败');location='paperOpe.aspx'</script>");
        }
    }
    protected void Button3_Click1(object sender, EventArgs e)//出题
    {
        //取数
        DB db = new DB();
        //如果title为空，不可以操作
        if (this.papertitle.Text == "")
        {
            Response.Write("<script>alert('论文题目不能为空。');</script>");
            return;

        }

        String insert = "insert into paperApply(teacher_ID,preriod,title,kind,project_Name,project_Depart,project_Num,target,aim_Meaning,current_situation,content,reference,remark,Year,teacher_Name,schedule) values('" + Session["username"]
            + "','" + this.papertime.Text + "','" + this.papertitle.Text + "','" + this.kind.SelectedValue + "','" + this.projectName.Text + "','" + this.project_department.Text + "','" + this.projectNumber.Text + "','" + this.aim.Text
            + "','" + this.mean.Text + "','" + this.state.Text + "','" + this.content.Text + "','" + this.refer.Text + "','" + this.remark.Text + "','" + Session["year"] + "','" + Session["name"] + "','" + TextBox7.Text + "')";
        //验证是否曾经出过此题
        string sel = "select * from paperApply where title='" + this.papertitle.Text + "'";
        DataSet ds = db.Select(sel, db.DBconn());
        string his = "";
        foreach (DataRow theRow in ds.Tables[0].Rows)
        {

          // Console.WriteLine(theRow["CustomerID"] + "\t" + theRow["ContactName"]);
            his = his + "教师" + theRow["teacher_ID"].ToString() + theRow["teacher_Name"].ToString().Trim() + "于" + theRow["Year"].ToString() + "年曾经出过相同的题目。";
        }
        bool state = db.Insert(insert, db.DBconn());
        if (state)
        {
           
            this.Panel1.Visible = false;
            Response.Write("<script>alert('"+his +"课题发布成功。');location='paperOpe.aspx'</script>");
        }
        else
        {
          
            Response.Write("<script>alert('" + his + "数据插入失败！课题发布失败。');location='paperOpe.aspx'</script>");
        }
    }
    protected void Button1_Click(object sender, EventArgs e)//增加此按钮的u目的是防止在load页面时重刷修改的内容
    {
        this.message.Text = "";
        String sel = "select * from paperApply where id='" + Session["id"] +"'";
        DB db = new DB();
        DataSet ds = db.Select(sel, db.DBconn());
        try
        {
           
            this.period_Mod.Text = ds.Tables[0].Rows[0][2].ToString();
            this.kind_Mod.SelectedValue = ds.Tables[0].Rows[0][4].ToString();
             this.projectName_Mod.Text = ds.Tables[0].Rows[0][5].ToString();
            this.projectDpart_Mod.Text = ds.Tables[0].Rows[0][6].ToString();
             this.projectNum_Mod.Text = ds.Tables[0].Rows[0][7].ToString();
             this.aim_Mod.Text = ds.Tables[0].Rows[0][8].ToString();
             this.mean_Mod.Text = ds.Tables[0].Rows[0][9].ToString();
            this.state_Mod.Text = ds.Tables[0].Rows[0][10].ToString();
            this.cont_Mod.Text = ds.Tables[0].Rows[0][11].ToString();
             this.ref_Mod.Text = ds.Tables[0].Rows[0][12].ToString();
              this.remark_Mod.Text = ds.Tables[0].Rows[0][13].ToString();
            string state1 = ds.Tables[0].Rows[0][14].ToString().Trim();
            string state2 = ds.Tables[0].Rows[0][15].ToString().Trim();
              this.TextBox8.Text = ds.Tables[0].Rows[0][21].ToString();
            //教师课题修改，当课题审批通过或者不在出题阶段时，无法进行修改
            if (state1.Equals("Y") && state2.Equals("Y"))
            {
                this.message.Text = "该课题已被审批通过，无法修改！";
                this.Button9.Enabled = false;
            }
            ds.Clear();
        }
        catch
        {
            this.Panel2.Visible = false;
            this.message.Text = "对不起，数据库出错，请联系管理员";
        }   
    }
}