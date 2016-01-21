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
public partial class Student : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
     
        if (null== Session["username"])
        {
            Response.Write("<script>alert('用户登录超时，请重新登录。');location='~/Default.aspx'</script>"); 

            return;
        }
            DB db = new DB();


            string role =  Session["role"].ToString(); 
           if (role == "教师" || role == "系领导" || role == "院领导")
            {
           }   
            else
            { 
            Response.Write("<script language='javascript'>alert('你的角色为" + role + ",不可以进入教师页面！');location='../Default.aspx'</script>");
            Response.Redirect("../Default.aspx");
            }
           // conn.Close();

       //获取毕业年
            String time1 = "select * from time where period='提交论文时间'";
        DataSet ds=db.Select(time1,db.DBconn());
        try{
            DateTime period_star = Convert.ToDateTime(ds.Tables[0].Rows[0][2].ToString());
            DateTime period_end = Convert.ToDateTime(ds.Tables[0].Rows[0][3].ToString());
            int year = period_end.Year;//获取时间
            Session["year"] = year;
            Session["year1"] = year-4;
        }catch{
             Response.Write("<script language='javascript'>alert('获取学生的毕业学年错误。');location='../Default.aspx'</script>");
        }finally{
        }
        ds.Clear();
        }







    
}
