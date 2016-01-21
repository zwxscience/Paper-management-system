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
/// SQLToWord 的摘要说明
/// </summary>
public class SQLToWord
{
    private const string DATAWORDPATH = @"C:\folder\doc\datadoc\";
    private const string IMAGEWORDPATH = @"C:\folder\doc\imagedoc\";
    private const string IMAGEPATH = @"C:\folder\image\";
    private const string EXCELPATH = @"C:\folder\excel\";
    private const string TXTPATH = @"C:\folder\txt\";
    private const string IMAGEPOSTFIX = ".bmp";
    private const string WORDPOSTFIX = ".doc";
    private const string EXCELPOSTFIX = ".xls";
    private const string TXTPOSTFIX = ".txt";
    private const int DATADISTANCE = 5;
    private const int TABDISTANCE = 8; 
	public SQLToWord()
	{
		//
		// TODO: 在此处添加构造函数逻辑
		//
	}
    public void ExportToWord(DataSet ds)
    {


        
        if (ds.Tables.Count>0)
        {
            string tempFileName = "临时的";
            object filename = null;

            object tableBehavior = Microsoft.Office.Interop.Word.WdDefaultTableBehavior.wdWord9TableBehavior;
            object autoFitBehavior = Microsoft.Office.Interop.Word.WdAutoFitBehavior.wdAutoFitFixed;

            object unit = Microsoft.Office.Interop.Word.WdUnits.wdStory;
            object extend = System.Reflection.Missing.Value;
            object breakType = (int)Microsoft.Office.Interop.Word.WdBreakType.wdSectionBreakNextPage;

            object count = 1;
            object character = Microsoft.Office.Interop.Word.WdUnits.wdCharacter;

            object Nothing = System.Reflection.Missing.Value;

            try
            {
                //tempFileName = GetTempFileName();

                //生成.doc文件完整路径名 
                filename ="112.doc";

                //创建一个word文件，文件名用系统时间生成精确到毫秒 
                Microsoft.Office.Interop.Word.Application myWord = new Microsoft.Office.Interop.Word.ApplicationClass();
                Microsoft.Office.Interop.Word.Document myDoc = new Microsoft.Office.Interop.Word.DocumentClass();
                myDoc = myWord.Documents.Add(ref Nothing, ref Nothing, ref Nothing, ref Nothing);
                myDoc.Activate();

                //向把dataset中的表插入到word的文件中 

                for (int totalTable = 0; totalTable < ds.Tables.Count; totalTable++)
                {
                    myWord.Application.Selection.TypeText(ds.Tables[totalTable].TableName + "表的数据如下");
                    myWord.Application.Selection.TypeParagraph();
                    myWord.Application.Selection.TypeParagraph();
                    Microsoft.Office.Interop.Word.Range para = myWord.Application.Selection.Range;
                    myDoc.Tables.Add(para, ds.Tables[totalTable].Rows.Count + 1, ds.Tables[totalTable].Columns.Count, ref tableBehavior, ref autoFitBehavior);
                    for (int column = 0; column < ds.Tables[totalTable].Columns.Count; column++)
                    {
                        myDoc.Tables[0].Cell(1, column + 1).Range.InsertBefore(ds.Tables[0].Columns[column].ColumnName.Trim());

                    }
                    for (int row = 0; row < ds.Tables[totalTable].Rows.Count; row++)
                    {
                        for (int column = 0; column < ds.Tables[totalTable].Columns.Count; column++)
                        {
                            myDoc.Tables[1].Cell(row + 2, column + 1).Range.InsertBefore(ds.Tables[totalTable].Rows[row][column].ToString().Trim());
                        }
                    }
                    myWord.Application.Selection.EndKey(ref unit, ref extend);
                    myWord.Application.Selection.TypeParagraph();
                    myWord.Application.Selection.TypeParagraph();
                    myWord.Application.Selection.InsertBreak(ref breakType);
                }
                myWord.Application.Selection.TypeBackspace();
                myWord.Application.Selection.Delete(ref character, ref count);
                myWord.Application.Selection.HomeKey(ref unit, ref extend);
                //保存word文件到指定的目录下 
                try
                {
                    myDoc.SaveAs(ref filename, ref Nothing, ref Nothing, ref Nothing, ref Nothing, ref Nothing, ref Nothing, ref Nothing, ref Nothing, ref Nothing, ref Nothing, ref Nothing, ref Nothing, ref Nothing, ref Nothing, ref Nothing);
                    myWord.Visible = true;
                    object missingValue = Type.Missing;
                    object doNotSaveChanges = Microsoft.Office.Interop.Word.WdSaveOptions.wdDoNotSaveChanges;
                    myDoc.Close(ref doNotSaveChanges, ref missingValue, ref missingValue);
                    object miss = System.Reflection.Missing.Value;
                    myDoc.Application.Quit(ref miss, ref miss, ref miss);
                    // doc = null;
                    myWord = null;

                }
                catch
                {
                    // System.Windows.Forms.MessageBox.Show("系统找不到指定目录下的文件： " + DATAWORDPATH + tempFileName + WORDPOSTFIX);
                    HttpContext.Current.Response.Write("<script>alert('系统找不到指定目录下的文件：" + DATAWORDPATH + tempFileName + WORDPOSTFIX + "')<script>");
                    return;
                }
               

                //让生成的word文件可见 
              //  myWord.Visible = true;
            }
            catch (Exception ex)
            {
                //   System.Windows.Forms.MessageBox.Show("向word文件中写入数据出错： " + ex.Message);
                HttpContext.Current.Response.Write("<script>alert('向word文件中写入数据出错：" + ex.Message + "')<script>");
            }
        }
        else
        {
            //   System.Windows.Forms.MessageBox.Show("No Data");
            HttpContext.Current.Response.Write("<script>alert('没有数据。')<script>");

        }
    }
}
