using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
//using System.Data;
using System.Data.SqlClient;
public partial class _Default : System.Web.UI.Page 
{
    protected void Page_Load(object sender, EventArgs e)
    {         
        Session.Clear();//清除所有session
        if (!Page.IsPostBack)
        {
            username.Text = null;
            password.Text = null;

        }
        else
        {
            //Session.Abandon();//取消当前会话   

        }

    }
    protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
    {
        username.Text = null;
        password.Text = null;
    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        string role = "学生";
        for (int i = 0; i < Role.Items.Count;i++)
        {
            if (Role.Items[i].Selected)
            {
                role = Role.Items[i].Text;
            }

        }
        //Response.Write("<script>alert('用户名。。'" + username.Text+password.Text+role+"');</script>");
        md5Manger md5 = new md5Manger();
        if (role == "学生")
        {
            judge("select * from student where student_ID='" + username.Text + "' and password='" + md5.Md5Encrypt(password.Text)+ " 'and role='" + role + "'", role);
        }
        else if (role == "管理员")
        {
            judge("select * from admin where admin_ID='" + username.Text + "'and password='" + md5.Md5Encrypt(password.Text) + "'and role='" + role + "'", role);
        }
        else 
        {
            judge("select * from teacher where teacher_ID='" + username.Text + "'and password='" +md5.Md5Encrypt(password.Text)+ "'", role);
        }

        }
    //判断用户是否存在，并转入相关的页面
    public void judge(String str, string role)
    {
        //创建session对象
        DB db = new DB();
      DataSet ds = db.Select(str, db.DBconn());
        try{
            Session["username"] = ds.Tables[0].Rows[0][1].ToString();
            Session["name"] = ds.Tables[0].Rows[0][2].ToString();
            Session["role"] = ds.Tables[0].Rows[0][3].ToString(); 
           // Session["flag"] = "Y";//用来标识用户登录成gong 和不超时
            switch (role)
            {
                case "学生": Response.Redirect("student/Default.aspx"); break;//跳转到主页
                case "教师": Response.Redirect("teacher/Default.aspx"); break;//跳转到主页
                case "管理员": Response.Redirect("admin/Default.aspx"); break;//跳转到主页 
            }
        }
        catch
        {
            Response.Write("<script>alert('登录失败！请返回查找错误，请在用户名和密码正确的前提下选择正确的登录角色。');location='Default.aspx'</script>");

        }  

    }
}
