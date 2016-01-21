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
using System.Data.OleDb;
/// <summary>
/// EXCELtoSQL 的摘要说明
/// </summary>
public class EXCELtoSQL
{
	public EXCELtoSQL()
	{
		//
		// TODO: 在此处添加构造函数逻辑
		//
	}
    //将excell表格数据导入到sql数据库

//把Excel数据读入DataTable
    public DataTable ExcelToDataTable(string strExcelFileName, string strSheetName)
{
  
 　
 //String strConn = "Provider=Microsoft.Jet.OLEDB.4.0;" + "Data Source=" + strExcelFileName + ";" +"Extended Properties=Excel 5.0;";
    OleDbConnection strConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Extended Properties=Excel 8.0;Data Source=" + strExcelFileName);
    if (strConn.State != ConnectionState.Open)
                {
                    strConn.Open();
                }
                else
                {
                   //String sArgs = @"<script language=javascript>window.alert( 'EXCEL文件正在使用！' );</script>";
                  
                    //Page.Response.Write( sArgs );
                    return null;
                }

  string strExcel = string.Format("select * from [{0}$]", strSheetName);
    DataSet ds = new DataSet();
   
 //OleDbConnection conn = new OleDbConnection(strConn);
// String a=conn.ServerVersion;
// {
   //  conn.Open();
// }
        OleDbDataAdapter adapter = new OleDbDataAdapter(strExcel, strConn);

        adapter.Fill(ds, strSheetName);
        strConn.Close();
    return ds.Tables[strSheetName];
  
    
}

//向sql数据库表插入数据
    public bool InsertDataToSQL(string insert)
    { 
        DB db=new DB();
        SqlConnection conn = db.DBconn();//连接数据库
        //若数据库连接的当前状态是关闭的，则打开连接
      return db.Insert(insert,conn);
    }

}
