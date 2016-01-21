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
public partial class admin_passwordModify : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {


        if (Session["username"] == null)
        {
            Response.Write("<script>alert('用户登录超时，请重新登录。');location='../Default.aspx'</script>");
            return;
        }
          

    }

    protected void  cancel_Click(object sender, EventArgs e)
{
    this.oldpassword.Text = null;
    this.newpassword.Text = null;
    this.confirmNewPassword.Text = null;
    this.message.Text = "您取消了本次密码修改操作";
}


    protected void change_Click(object sender, EventArgs e)
    {
        DB db = new DB();
        DataSet ds = db.Select("select * from admin where admin_ID='" + Session["username"] + "'", db.DBconn());
        try
        {     string password = ds.Tables[0].Rows[0][2].ToString();
            md5Manger md5 = new md5Manger();
             password = md5.Md5Decrypt(password);
            //解密
       
            string oldpassword = this.oldpassword.Text.Trim();
            string newpassword = this.newpassword.Text.Trim();
            if (password.Equals(oldpassword))
            {
                newpassword = md5.Md5Encrypt(newpassword);//加密
                string updatepassword = "UPDATE admin SET password ='" + newpassword + "' WHERE admin_ID ='" + Session["username"].ToString() + "'";
                bool result = db.Update(updatepassword, db.DBconn());
                // Response.Write("<script language='javascript'>alert('您的jieguo为：" + result + "')</script>");
                if (result)
                {


                    this.message.Text = "密码更改成功！";

                }

                else
                {
                    this.message.Text = "数据库更新失败！";

                }

            }

            else
            {
                this.message.Text = "对不起，您的密码输入错误，请重新输入";

            }
        
        }
        catch
        {
            Response.Write("<script>alert('数据库获取用户密码错误。');location='Default.aspx'</script>");
        }
       finally
       {
           ds.Clear();
       }
    }
}
