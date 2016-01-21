using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class _Default : System.Web.UI.Page 
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        ToWordDoc td = new ToWordDoc();
        td.Open("1.doc");
       
        td.GotoBookMark("t1");
        td.InsertText("nihao sqdasdasd");
        td.GoToTheEnd();
        td.Save();
        td.Quit();
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        string str = "select * from student where student_ID='20051308025'";
       DB db = new DB();
       DataSet ds = db.Select(str, db.DBconn());
       SQLToWord sw = new SQLToWord();
      sw.ExportToWord(ds);
    }
}
