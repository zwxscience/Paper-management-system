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
public partial class select_Result : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["username"] == null)
        {
            Response.Write("<script>alert('用户登录超时，请重新登录。');location='../Default.aspx'</script>");
            return;
        }
    }
    protected void outPut_Click(object sender, EventArgs e)
    {
        DB db = new DB();
      
        SqlConnection conn = db.DBconn();
        String str = "student_ID";
        if (DropDownList1.SelectedItem.Text == "学生")
        {
            str = "student_ID";
        }
        else if (DropDownList1.SelectedItem.Text == "教师")
        {
            str = "teacher_ID";
        }
        else if (DropDownList1.SelectedItem.Text == "应用方向")
        {
            str = "direction";
        }
        SqlDataAdapter da = new SqlDataAdapter("SELECT student_ID as '学生学号',name as '学生姓名',	class	as '学生班级', teacher_ID	as '教工号',teacher_name as '教师姓名',paperid as '论文编号',title as '论文题目',	direction	as '题目性质',	introduce	as '简介',	priority as '志愿次序',grade as '年级' FROM themeSelectedResult ORDER BY " + str + ", priority", conn);
        DataSet ds = new DataSet();
        da.Fill(ds, "table1");
        System.Data.DataTable dt = ds.Tables["table1"]; //获取数据集
        DataView dv = ds.Tables["table1"].DefaultView;
        string str1 = this.TextBox1.Text;
        string str2 = this.TextBox2.Text;
        if (str1 == "")
        {
            Response.Write("<script>alert('导出的Excel表文件的名称不能为空。')</script>");
            return;
        }
        if (str2 == "")
        {
            Response.Write("<script>alert('该表的标题不能为空。')</script>");
            return;
        }
        SQLtoExcel se=new SQLtoExcel();
  
        String filepath = Server.MapPath("相关文件/" + "" + str1 + ".xls");
        se.OutputExcel(dv, str1, str2, filepath);
        //在服务器上产生excel的方法，dv为要输出到Excel的数据，str1为文件名称 ,str2为标题名称 ，path是路径
        string path = Server.MapPath("相关文件/" + str1 + ".xls");

        System.IO.FileInfo file = new System.IO.FileInfo(path);
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
}
