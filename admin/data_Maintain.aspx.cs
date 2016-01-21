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

public partial class admin_data_Maintain : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["username"] == null)
        {
            Response.Write("<script>alert('用户登录超时，请重新登录。');location='../Default.aspx'</script>");
            return;
        }

    }
    protected void Button6_Click(object sender, EventArgs e)
    {
        DB db = new DB();
        //删除学生信息表
        string del="delete from student where grade='"+this.DropDownList6.Text+"'";
        bool student= db.Delete(del, db.DBconn());
        if (student)
        {
            this.deleteMessage.Text = "删除学生信息表中的年级为"+this.DropDownList6.Text+"的数据成功！";
        }
        else
        {
            this.deleteMessage.Text = "删除学生信息表中的年级为" + this.DropDownList6.Text + "的数据失败！";
        }
        //删除选课结果表
        del = "delete from select_Result where grade='" + this.DropDownList6.Text + "'";
        student = db.Delete(del, db.DBconn());
        if (student)
        {
            this.deleteMessage.Text =  this.deleteMessage.Text +"删除选课结果表中的年级为" + this.DropDownList6.Text + "的数据成功！";
        }
        else
        {
            this.deleteMessage.Text = this.deleteMessage.Text + "删除选课结果表中的年级为" + this.DropDownList6.Text + "的数据失败！";
        }
        //删除学生选课表 
        del = "delete from themeSelectedResult where Grade='" + this.DropDownList6.Text + "'";
        student = db.Delete(del, db.DBconn());
        if (student)
        {
            this.deleteMessage.Text = this.deleteMessage.Text + "删除学生选课表中的年级为" + this.DropDownList6.Text + "的数据成功！";
        }
        else
        {
            this.deleteMessage.Text = this.deleteMessage.Text + "删除学生选课表中的年级为" + this.DropDownList6.Text + "的数据失败！";
        }
        int year = DateTime.Now.Year;
        try
        {
             year = Convert.ToInt32(this.DropDownList6.Text) + 4;//毕业年分
        }
        catch
        {
            Response.Write("<script>alert('学生年级选择出错。')</script>");
            return;
        }
        //删除学生任务书
        del = "delete from studentTask where Year='" + year + "'";
        student = db.Delete(del, db.DBconn());
        if (student)
        {
            this.deleteMessage.Text = this.deleteMessage.Text + "删除学生任务书中的毕业年份为为" + year + "的数据成功！";
        }
        else
        {
            this.deleteMessage.Text = this.deleteMessage.Text + "删除学生任务书中的毕业年份为" + year + "的数据失败！";
        }
        //删除开题报告
        del = "delete from STReport where Year='" + year + "'";
        student = db.Delete(del, db.DBconn());
        if (student)
        {
            this.deleteMessage.Text = this.deleteMessage.Text + "删除开题报告中的毕业年份为为" + year + "的数据成功！";
        }
        else
        {
            this.deleteMessage.Text = this.deleteMessage.Text + "删除开题报告中的毕业年份为" + year + "的数据失败！";
        }
        //删除教师课题申请
        del = "delete from paperApply where Year='" + year + "'";
        student = db.Delete(del, db.DBconn());
        if (student)
        {
            this.deleteMessage.Text = this.deleteMessage.Text + "删除教师课题申请中的年份为为" + year + "的数据成功！";
        }
        else
        {
            this.deleteMessage.Text = this.deleteMessage.Text + "删除教师课题申请中的年份为" + year + "的数据失败！";
        }

        //删除中期检查
        del = "delete from midCheck where Year='" + year + "'";
        student = db.Delete(del, db.DBconn());
        if (student)
        {
            this.deleteMessage.Text = this.deleteMessage.Text + "删除中期检查中的年份为为" + year + "的数据成功！";
        }
        else
        {
            this.deleteMessage.Text = this.deleteMessage.Text + "删除中期检查中的年份为" + year + "的数据失败！";
        }

        //删除指导记录
        del = "delete from guiMark where Year='" + year + "'";
        student = db.Delete(del, db.DBconn());
        if (student)
        {
            this.deleteMessage.Text = this.deleteMessage.Text + "删除指导记录中的年份为为" + year + "的数据成功！";
        }
        else
        {
            this.deleteMessage.Text = this.deleteMessage.Text + "删除指导记录中的年份为" + year + "的数据失败！";
        }
        //删除小结表
        del = "delete from aimCom where Year='" + year + "'";
        student = db.Delete(del, db.DBconn());
        if (student)
        {
            this.deleteMessage.Text = this.deleteMessage.Text + "删除小结表中的年份为为" + year + "的数据成功！";
        }
        else
        {
            this.deleteMessage.Text = this.deleteMessage.Text + "删除小结表中的年份为" + year + "的数据失败！";
        }
        //删除教师反馈
        del = "delete from StoTContent where Year='" + year + "'";
        student = db.Delete(del, db.DBconn());
        if (student)
        {
            this.deleteMessage.Text = this.deleteMessage.Text + "删除教师反馈表中的年份为为" + year + "的数据成功！";
        }
        else
        {
            this.deleteMessage.Text = this.deleteMessage.Text + "删除教师反馈表中的年份为" + year + "的数据失败！";
        }

        //删除领导反馈反馈
        del = "delete from TtoLContent where time like '%" + year + "%'";
        student = db.Delete(del, db.DBconn());
        if (student)
        {
            this.deleteMessage.Text = this.deleteMessage.Text + "删除领导反馈表中的年份为为" + year + "的数据成功！";
        }
        else
        {
            this.deleteMessage.Text = this.deleteMessage.Text + "删除领导反馈表中的年份为" + year + "的数据失败！";
        }

    }
  
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void TextBox3_TextChanged(object sender, EventArgs e)
    {

    }
    protected void Button5_Click(object sender, EventArgs e)
    {

    }
}
