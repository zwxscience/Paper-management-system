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
public partial class admin_finalresults_informationInput : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["username"] == null)
        {
            Response.Write("<script>alert('用户登录超时，请重新登录。');location='../Default.aspx'</script>"); 
            return;
        }
        if (!Page.IsPostBack)
        {
            Panel1.Visible = true;
            Panel2.Visible = false;

        }
        else
        {

        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string fullfilename = FileUpload1.PostedFile.FileName;
        string filename = fullfilename.Substring(fullfilename.LastIndexOf("\\") + 1);
        string type = fullfilename.Substring(fullfilename.LastIndexOf(".") + 1);
        if (type == "xls")
        {
            //上传

            this.FileUpload1.PostedFile.SaveAs(Server.MapPath("相关文件/") + filename);
            // Label1.Text = "上传成功!文件路径为" + fullfilename + "文件名称为：" + filename + "文件格式为" + type + "文件限定名称和大小为" + this.FileUpload1.PostedFile.FileName + this.FileUpload1.PostedFile.ContentLength;
            this.Label1.Text = "上传成功！";
            this.Label2.Text = Server.MapPath("相关文件/") + filename;
            Panel1.Visible = false;
            Panel2.Visible = true;
        }
        else
        {
            Response.Write("<script language='javascript'>alert('你选择的文件格式不正确！');</script>");
        }

    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        string _strExcelFileName = this.Label2.Text;
        DataTableToDB(_strExcelFileName);
    }

    protected void DataTableToDB(string _strExcelFileName)//插入操作
    {
       
        EXCELtoSQL ets = new EXCELtoSQL(); 
        DataTable dtExcel = ets.ExcelToDataTable(_strExcelFileName, "Sheet1");
            for (int i = 0; i < dtExcel.Rows.Count; i++)//按行读取
            {

                 //在导入数据库操作之前需要验证数据库与之是否匹配
                string info = "select * from paperApply where id='" + dtExcel.Rows[i][5].ToString() + "'";
                DB db=new DB();
                DataSet ds = db.Select(info, db.DBconn());
                try
                {
                    string title=ds.Tables[0].Rows[0][3].ToString();
                    string kind=ds.Tables[0].Rows[0][4].ToString();
                    string teacher_ID = ds.Tables[0].Rows[0][1].ToString();
                    string teacher_Name = ds.Tables[0].Rows[0][20].ToString();
                    if (title.Equals(dtExcel.Rows[i][6].ToString()) && kind.Equals(dtExcel.Rows[i][7].ToString()) && teacher_ID.Equals(dtExcel.Rows[i][3].ToString()) && teacher_Name.Equals(dtExcel.Rows[i][4].ToString()))
                    {
                    }else{//验证不通过
                        for (int j= 0; j<i; j++)//按行读取
                        {
                        string del="delete from select_Result where student_ID='"+dtExcel.Rows[i][1].ToString()+"'";
                        db.Delete(del,db.DBconn());
                        }//将已经插入的数据删除掉
                        Response.Write("<script language='javascript'>alert('读取的Excel数据中教师" + dtExcel.Rows[i][3].ToString() + dtExcel.Rows[i][4].ToString().Trim() + "所出的论文编号为" + dtExcel.Rows[i][5].ToString() + "的论文题目为" + dtExcel.Rows[i][6].ToString() + "，性质为" + dtExcel.Rows[i][7].ToString() + "的数据与数据库中的数据不一致，导入失败！（在数据库中教师" + teacher_ID + teacher_Name.Trim() + "出的该编号的题目：" + title + "，性质为" + kind + "）');location='finalresults_informationInput.aspx'</script>");
                        break;
                    }

                    // Response.Write("<script language='javascript'>alert('读取的数据为" + dtExcel.Rows[i][0].ToString() + "');</script>");
                    string insert = "insert into select_Result(class,student_ID,student_Name,teacher_ID,teacher_Name,title,grade,paperid,kind)  values('" + dtExcel.Rows[i][0].ToString() +
                        "','" + dtExcel.Rows[i][1].ToString() + "','" + dtExcel.Rows[i][2].ToString().Trim() + "','" + dtExcel.Rows[i][3].ToString() +
                        "','" + dtExcel.Rows[i][4].ToString() + "','" + dtExcel.Rows[i][6].ToString() + "','" + dtExcel.Rows[i][8].ToString() + "','" + dtExcel.Rows[i][5].ToString() + "','" + dtExcel.Rows[i][7].ToString() + "')";

                    bool result = ets.InsertDataToSQL(insert);
                    if (result)
                    {
                        this.Label2.Text = "导入数据库成功！";
                        this.GridView1.Visible = false;
                    }
                    else
                    {
                        this.Label2.Text = "导入数据库失败！可能学号字段重复。";
                    }
                    Panel2.Visible = false;
                    this.Label2.Visible = true;
                }
                catch
                {  
                    Response.Write("<script language='javascript'>alert('读取数据库失败。');</script>");
                }
                finally
                {
                    ds.Clear();
                }
            }

       
    }




}
