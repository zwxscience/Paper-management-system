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
public partial class teacher_paperFileUp : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
       // Session["year"] = DateTime.Now.Year - 4;//获取年级信息
        if (Session["username"] == null)
        {
            Response.Write("<script>alert('用户登录超时，请重新登录。');location='../Default.aspx'</script>");

            return;
        }
     

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string student_Name = "";
        String student_ID ="";
        try
        {
            student_Name = this.DropDownList1.SelectedItem.Text;
             student_ID = this.DropDownList1.SelectedValue;
        }
        catch
        {
            Response.Write("<script language='javascript'>alert('请先选择您的学生！');location='paperFileUp.aspx'</script>");
        }


        string fullfilename = FileUpload1.PostedFile.FileName;
        string filename = fullfilename.Substring(fullfilename.LastIndexOf("\\") + 1);
        string type = fullfilename.Substring(fullfilename.LastIndexOf(".") + 1);
        if (type == "doc" || type == "docx")
        {
              
            String title ="";
        
            DB db= new DB();
      
            String sel = "select * from select_Result where student_ID='" + student_ID + "'";
       
            DataSet ds = db.Select(sel, db.DBconn());

            try
            {

                title = ds.Tables[0].Rows[0][6].ToString();

            }
            catch
            {
                Response.Write("<script language='javascript'>alert('读取论文数据错误！');location='paperFileUp.aspx'</script>");
            }
            finally
            {
                ds.Clear();
            }
            String fileName = student_ID + student_Name+title+"."+type;
            Response.Write("<script>if(confirm('您上传的文件名为" + filename + "，文件大小为"+this.FileUpload1.            PostedFile.ContentLength+"B,是否上传？')){ } else{location='paperFileUp.aspx'}</script>");
            //上传    
            this.FileUpload1.PostedFile.SaveAs(Server.MapPath("../论文上传/") + fileName);
            // Label1.Text = "上传成功!文件路径为" + fullfilename + "文件名称为：" + filename + "文件格式为" + type + "文件限定名称和大小为" + this.FileUpload1.PostedFile.FileName + this.FileUpload1.PostedFile.ContentLength;
            this.Label1.Text = "上传成功！";     
        }
        else
        {
            Response.Write("<script language='javascript'>alert('你选择的文件格式不正确！');location='paperFileUp.aspx'</script>");
        }

    }
}
