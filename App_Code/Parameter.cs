using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;
/// <summary>
/// Parameter 的摘要说明
/// </summary>
public class Parameter
{
    public Parameter()
    {
        //
        // TODO: 在此处添加构造函数逻辑
        //
    }
    public int year(string student_ID)
    {
        //
        //获取学生毕业学年
        //
        DB db = new DB();
        string selec = "select * from student where student_ID='" + student_ID + "'";
        DataSet ds = db.Select(selec, db.DBconn());
        int year;
        try
        {
            //如果读取到数据并装载数据
            string grade = ds.Tables[0].Rows[0][15].ToString();
            year = Convert.ToInt32(grade) + 4;


        }
        catch
        {
            year = DateTime.Now.Year;
        }
        finally
        {
            ds.Clear();
        }
       
        return year;

    }
}
