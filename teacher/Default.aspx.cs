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

public partial class teacher_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["username"] == null)
        {
            Response.Write("<script>alert('用户登录超时，请重新登录。');location='../Default.aspx'</script>");
            return;
        
        }
        string role = Session["role"].ToString();
        if (role == "教师" || role == "系领导" || role == "院领导")
        {

        }
        else
        {
            Response.Write("<script language='javascript'>alert('你的角色为" + role + ",不可以进入教师页面！');location='../Default.aspx'</script>");
            //  Response.Redirect("../Default.aspx");
        }

            DB db = new DB();
      
            DataSet ds =db.Select("select * from teacher where teacher_ID='" + Session["username"] + "'", db.DBconn());
            try
            {

                //读取信息
                string teacher_ID = ds.Tables[0].Rows[0][1].ToString();
                string name = ds.Tables[0].Rows[0][2].ToString(); 
                 role = ds.Tables[0].Rows[0][3].ToString(); 
                string sex = ds.Tables[0].Rows[0][5].ToString(); 
                string age = ds.Tables[0].Rows[0][6].ToString();
                string department = ds.Tables[0].Rows[0][7].ToString();
                string zhicheng = ds.Tables[0].Rows[0][8].ToString(); 
                string birthday = ds.Tables[0].Rows[0][9].ToString(); 
                string position = ds.Tables[0].Rows[0][10].ToString(); ;
                string Email = ds.Tables[0].Rows[0][11].ToString(); ;
                //赋值
                this.Label1.Text = "教师号：" + teacher_ID;
                this.Label2.Text = "姓名：" + name;
                this.Label3.Text = "权限：" + role;
                this.Label4.Text = "性别：" + sex;
                this.Label5.Text = "出生日期：" + birthday;
                this.Label6.Text = "年龄：" + age;
                this.Label7.Text = "部门：" + department;
                this.Label8.Text = "职称：" + zhicheng;
                this.Label9.Text = "职位：" + position;
                this.Label10.Text = "Email：" + Email;
                string filename = teacher_ID + name + ".jpg";
                if (System.IO.File.Exists(Server.MapPath("../headphoto/teacher/" + teacher_ID + name + ".jpg")) == false)//如果不存在就用默认图片
                {
                    if (sex == "男")
                    {

                        this.Image1.ImageUrl = "~/headphoto/boyDefault.jpg";
                        Image1.Visible = true;
                    }
                    else
                    {
                        this.Image1.ImageUrl = "~/headphoto/girlDefault.jpg";
                        Image1.Visible = true;
                    }

                }
                else
                {
                    this.Image1.ImageUrl = "../headphoto/teacher/" + filename;
                }
            }
            catch
            {
                Response.Write("<script language='javascript'>alert('获取学生信息失败！');location='Default.aspx'</script>");
            }
            finally
            {
                ds.Clear();
            }

        }
protected void  Button2_Click(object sender, EventArgs e)
{
    
        //读取信息
        string teacher_ID = Session["username"].ToString();
        string name = Session["name"].ToString();
        string fullfilename = FileUpload1.PostedFile.FileName;
        if (fullfilename =="")
        {
            Response.Write("<script>alert('文件为空，请先选择头像文件。')</script>");

            return;
        }
        string filename = fullfilename.Substring(fullfilename.LastIndexOf("\\") + 1);
        string type = fullfilename.Substring(fullfilename.LastIndexOf(".") + 1);
        if (type == "jpg" || type == "bmp" || type == "gif" || type == "png")
        {
            //上传并重命名
            string filename1 = teacher_ID + name + ".jpg";//另存为

            this.FileUpload1.PostedFile.SaveAs(Server.MapPath("..\\headphoto\\teacher\\") +filename1);  
            String Text = "上传成功!文件路径为" + fullfilename + "文件名称为：" + filename + "文件格式为" + type + "文大小为" + this.FileUpload1.PostedFile.ContentLength;
          
            this.Image1.ImageUrl = "../headphoto/teacher/" + filename1;
            // Label1.Text = "上传成功!文件路径为" + fullfilename + "文件名称为：" + filename + "文件格式为" + type + "文大小为" + this.FileUpload1.PostedFile.ContentLength;
        }
        else
        {
            Response.Write("<script language='javascript'>alert('你选择的文件格式不正确！');</script>");
        }
   
}

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}
