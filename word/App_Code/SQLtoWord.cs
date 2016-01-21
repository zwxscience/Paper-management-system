using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

/// <summary>
/// SQLtoWord 的摘要说明
/// </summary>
public class SQLtoWord
{
	public SQLtoWord()
	{
		//
		// TODO: 在此处添加构造函数逻辑
		//
	}
    public bool ExportToWord(DataSet ds, string path1, string path2, string[] obDD)//说明ds为数据集，path1为模版路径，path2为生成文档的路径，obDD为末班里面的书签
    {
        Microsoft.Office.Interop.Word.Application appWord = null;
        Microsoft.Office.Interop.Word.Document doc = null;
        try
        {
            appWord = new Microsoft.Office.Interop.Word.ApplicationClass();
            appWord.Visible = false;
            object objTrue = true;
            object objFalse = false;
            object objTemplate = path1;//模板路径
            object objDocType = Microsoft.Office.Interop.Word.WdDocumentType.wdTypeDocument;
            doc = appWord.Documents.Add(ref objTemplate, ref objFalse, ref objDocType, ref objTrue);
            //第一步生成word文档
            //定义书签变量
            int length=obDD.Length;
            object[] obDD_Name = new object[length];

            for (int i = 0; i < obDD.Length; i++)
            {
                obDD_Name[i]=obDD[i];
               
                doc.Bookmarks.get_Item(ref obDD_Name[i]).Range.Text = ds.Tables[0].Rows[0][i].ToString(); //姓 名
               // object obDD_Name = "t1";//姓 名
                //object obDD_Sex = "t2";//性 别
                //object obDD_Age = "t3";//年龄
                // object obDD_Birthday = "DD_Birthday"; //出生年月
                // object obDD_Nation = "DD_Nation"; //民 族
                // object obDD_Native = "DD_Native"; //籍 贯
                // ...
                //第二步 读取数据，填充数据集
                // SqlDataReader dr = XXXXX;//读取出来的数据集
                //第三步 给书签赋值
                //给书签赋值
             //   doc.Bookmarks.get_Item(ref obDD_Name).Range.Text = "nihao"; //姓 名
               // doc.Bookmarks.get_Item(ref obDD_Sex).Range.Text = "性 别";//性 别
               // doc.Bookmarks.get_Item(ref obDD_Age).Range.Text = Convert.ToString(DateTime.Now.Year);//年龄
            }
           // ds.Clear();
            // ....
            //第四步 生成word
            //object filename = Server.MapPath("file") + "\\" + "接收毕业生情况表" + ".doc";
            object filename = path2;
            object miss = System.Reflection.Missing.Value;
            try
            {
                doc.SaveAs(ref filename, ref miss, ref miss, ref miss, ref miss, ref miss, ref miss, ref miss, ref miss, ref miss, ref miss, ref miss, ref miss, ref miss, ref miss, ref miss);
                //doc.Visible = true;//测试

            }
            catch
            {
                // System.Windows.Forms.MessageBox.Show("系统找不到指定目录下的文件： " + DATAWORDPATH + tempFileName + WORDPOSTFIX);
                HttpContext.Current.Response.Write("<script>alert('系统找不到指定目录文件输出路径')<script>");
                return false;
            }
            object missingValue = Type.Missing;
            object doNotSaveChanges = Microsoft.Office.Interop.Word.WdSaveOptions.wdDoNotSaveChanges;
            doc.Close(ref doNotSaveChanges, ref missingValue, ref missingValue);
            appWord.Application.Quit(ref miss, ref miss, ref miss);
            doc = null;
            appWord = null;
            return true;
           // HttpContext.Current.Response.Write("<script>alert('文档写入成功！')<script>");

        }
        catch (System.Exception a)
        {
            //捕捉异常，如果出现异常则清空实例，退出word,同时释放资源
            string aa = a.ToString();
            object miss = System.Reflection.Missing.Value;
            object missingValue = Type.Missing;
            object doNotSaveChanges = Microsoft.Office.Interop.Word.WdSaveOptions.wdDoNotSaveChanges;
            doc.Close(ref doNotSaveChanges, ref missingValue, ref missingValue);
            appWord.Application.Quit(ref miss, ref miss, ref miss);
            doc = null;
            appWord = null;
            return false;
           // HttpContext.Current.Response.Write("<script>alert('向word文件中写入数据出错：" + a.Message + "')<script>");
        } 

    }
}
