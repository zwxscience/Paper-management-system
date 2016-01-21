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
public partial class student_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
       
        if (Session["username"] == null)
        {
            Response.Write("<script>alert('用户登录超时，请重新登录。');location='../Default.aspx'</script>"); 

            return;
        }
        DB db = new DB();
        
        DataSet ds=db.Select("select * from student where student_ID='" + Session["username"] + "'", db.DBconn());
        try
        {
            //读取信息
            string student_ID = ds.Tables[0].Rows[0][1].ToString();
            string name = ds.Tables[0].Rows[0][2].ToString(); 
            string role = ds.Tables[0].Rows[0][3].ToString(); 
            string birthday = ds.Tables[0].Rows[0][5].ToString();
            string sex = ds.Tables[0].Rows[0][6].ToString(); 
            string birthplace = ds.Tables[0].Rows[0][7].ToString(); 
            string entranceDate =  ds.Tables[0].Rows[0][8].ToString();
            string nation = ds.Tables[0].Rows[0][9].ToString(); 
            string specialty = ds.Tables[0].Rows[0][10].ToString(); 
            string zyfx =  ds.Tables[0].Rows[0][11].ToString();
            string college = ds.Tables[0].Rows[0][12].ToString(); 
            string class1 = ds.Tables[0].Rows[0][13].ToString(); 
            string IDcard =  ds.Tables[0].Rows[0][14].ToString();
            string grade = ds.Tables[0].Rows[0][15].ToString();
            string phonenumber =  ds.Tables[0].Rows[0][16].ToString();
            string Email =  ds.Tables[0].Rows[0][17].ToString();
            Session["username"] = student_ID;
            Session["name"] = name;
            //赋值
            this.Label2.Text = "学号：" + student_ID;
            this.Label3.Text = "姓名：" + name;
            this.Label4.Text = "出生日期：" + birthday;
            this.Label5.Text = "性别：" + sex;
            this.Label6.Text = "籍贯：" + birthplace;
            this.Label7.Text = "入学日期：" + entranceDate;

            this.Label8.Text = "专业：" + specialty;
            this.Label9.Text = "民族：" + nation;
            this.Label10.Text = "Email：" + Email;
            this.Label11.Text = "专业方向：" + zyfx;
            this.Label12.Text = "院系：" + college;
            this.Label13.Text = "班级：" + class1;
            this.Label14.Text = "身份证：" + IDcard;
            this.Label15.Text = "年级：" + grade;
            this.Label16.Text = "电话号码：" + phonenumber;

            string filename = student_ID + name + ".jpg";
            if (System.IO.File.Exists(Server.MapPath("../headphoto/student/" + student_ID + name + ".jpg")) == false)//如果不存在就用默认图片
            {
                if (sex == "男")
                {

                    this.Image2.ImageUrl = "~/headphoto/boyDefault.jpg";
                    Image2.Visible = true;
                }
                else
                {
                    this.Image2.ImageUrl = "~/headphoto/girlDefault.jpg";
                    Image2.Visible = true;
                }

            }
            else
            {
                this.Image2.ImageUrl = "../headphoto/student/" + filename;
            }
        }
        catch
        {
            Response.Write("<script language='javascript'>alert('读取学生信息错误！');location='../Default.aspx'</script>");
        }

    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        DB db = new DB();
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
            string filename1 = Session["username"].ToString() + Session["name"].ToString() + ".jpg";//另存为

            this.FileUpload1.PostedFile.SaveAs(Server.MapPath("..\\headphoto\\student\\") + filename1);
            String Text = "上传成功!文件路径为" + fullfilename + "文件名称为：" + filename + "文件格式为" + type + "文大小为" + this.FileUpload1.PostedFile.ContentLength;

            this.Image2.ImageUrl = "../headphoto/student/" + filename1;
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
