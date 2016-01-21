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
using Microsoft.Office.Interop.Word ;
public partial class Test3 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        SQLtoWord SW = new SQLtoWord();

        string str = "select student_ID,name,specialty from student where student_ID='20051308025'";
        DB db = new DB();
        DataSet ds = db.Select(str, db.DBconn());
        try
        {
            string tex = ds.Tables[0].Rows[0][1].ToString();
            string path1 = Server.MapPath(@"1.doc");
            string path2 = Server.MapPath("file") + "\\" + "接收毕业生情况表" + ".doc";
            string[] obDD = new string[3];
            obDD[0] = "t1";
            obDD[1] = "t2";
            obDD[2] = "t3";
            if (SW.ExportToWord(ds, path1, path2, obDD))
            {
               // Response.Write("<script>alert('文档写入成功！')<script>");
                //yi流的方式传送给客户端
                String filepath =path2;
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
            else
            {
                Response.Write("<script>alert('向word文件中写入数据出错.')<script>");
            }
        }
        catch
        {
            Response.Write("<script>alert('数据库出错.')<script>");
        }
        finally
        {
            ds.Clear();

        }
    }
}
