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
public partial class admin_information_Input : System.Web.UI.Page
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
        if (type == "xls" )
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
      
        string _strExcelFileName =this.Label2.Text;
        DataTableToDB(_strExcelFileName);
    }

    protected void DataTableToDB(string _strExcelFileName)//插入操作
    {
        EXCELtoSQL ets = new EXCELtoSQL();

        try
        {
            DataTable dtExcel = ets.ExcelToDataTable(_strExcelFileName, "Sheet1");
            for (int i = 0; i < dtExcel.Rows.Count; i++)//按行读取
            {
                //密码加密
                md5Manger md5 =new md5Manger();
                string pwd = md5.Md5Encrypt(dtExcel.Rows[i][4].ToString());
                // Response.Write("<script language='javascript'>alert('读取的数据为" + dtExcel.Rows[i][0].ToString() + "');</script>");
                string insert = "insert into student(class,student_ID,name,sex,birthday,birthplace,entranceDate,nation,specialty,zyfx,college,IDcard,grade,phonenumber,Email,password,role)  values('" + dtExcel.Rows[i][0].ToString() + 
                    "','" + dtExcel.Rows[i][1].ToString() + "','" + dtExcel.Rows[i][2].ToString() + "','" + dtExcel.Rows[i][3].ToString() +
                    "','" + dtExcel.Rows[i][4].ToString() + "','" + dtExcel.Rows[i][5].ToString() + "','" + dtExcel.Rows[i][6].ToString() + 
                    "','" + dtExcel.Rows[i][7].ToString() + "','" + dtExcel.Rows[i][8].ToString() + "','" + dtExcel.Rows[i][9].ToString() +
                    "','" + dtExcel.Rows[i][10].ToString() + "','" +dtExcel.Rows[i][11].ToString() + "','" + dtExcel.Rows[i][12].ToString() +
                    "','" + dtExcel.Rows[i][13].ToString() + "','" + dtExcel.Rows[i][14].ToString() + "','" + pwd + "','" + "学生" + "')";
            
                bool result=ets.InsertDataToSQL(insert);
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

        }
        catch 
        {

        }

    }



    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}
