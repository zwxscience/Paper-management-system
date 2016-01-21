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
using Excel;
using System.Data.OleDb;
using System.Drawing;


/// <summary>
/// SQLtoExcel 的摘要说明
/// </summary>
public class SQLtoExcel
{
	public SQLtoExcel()
	{
		//
		// TODO: 在此处添加构造函数逻辑
		//
	}
    public void OutputExcel(DataView dv, string str1, string str2, String path)
    {
        //在服务器上产生excel的方法，dv为要输出到Excel的数据，str1为文件名称 ,str2为标题名称 ，path是路径
        GC.Collect();
        Application excel = new Application();

        int rowIndex = 4;
        int colIndex = 1;

        _Workbook xBk;
        _Worksheet xSt;

        excel = new ApplicationClass();

        xBk = excel.Workbooks.Add(true);

        xSt = (_Worksheet)xBk.ActiveSheet;

        // 
        //取得标题 
        // 
        foreach (DataColumn col in dv.Table.Columns)//取得列
        {
            colIndex++;
            excel.Cells[4, colIndex] = col.ColumnName;
            xSt.get_Range(excel.Cells[4, colIndex], excel.Cells[4, colIndex]).HorizontalAlignment = XlVAlign.xlVAlignCenter;//设置标题格式为居中对齐 
        }

        // 
        //取得表格中的数据 
        // 
        foreach (DataRowView row in dv)
        {
            rowIndex++;
            colIndex = 1;
            foreach (DataColumn col in dv.Table.Columns)
            {
                colIndex++;
                if (col.DataType == System.Type.GetType("System.DateTime"))
                {
                    excel.Cells[rowIndex, colIndex] = (Convert.ToDateTime(row[col.ColumnName].ToString())).ToString("yyyy-MM-dd");
                    xSt.get_Range(excel.Cells[rowIndex, colIndex], excel.Cells[rowIndex, colIndex]).HorizontalAlignment = XlVAlign.xlVAlignCenter;//设置日期型的字段格式为居中对齐 
                }
                else
                    if (col.DataType == System.Type.GetType("System.String"))
                    {
                        excel.Cells[rowIndex, colIndex] = row[col.ColumnName].ToString();
                        xSt.get_Range(excel.Cells[rowIndex, colIndex], excel.Cells[rowIndex, colIndex]).HorizontalAlignment = XlVAlign.xlVAlignCenter;//设置字符型的字段格式为居中对齐 
                    }
                    else
                    {
                        excel.Cells[rowIndex, colIndex] = row[col.ColumnName].ToString();
                    }
            }
        }
        // 
        //加载一个合计行 
        // 
        int rowSum = rowIndex + 1;
        int colSum = 2;
        excel.Cells[rowSum, 2] = "合计";
        xSt.get_Range(excel.Cells[rowSum, 2], excel.Cells[rowSum, 2]).HorizontalAlignment = XlHAlign.xlHAlignCenter;
        // 
        //设置选中的部分的颜色 
        // 
        xSt.get_Range(excel.Cells[rowSum, colSum], excel.Cells[rowSum, colIndex]).Select();
        xSt.get_Range(excel.Cells[rowSum, colSum], excel.Cells[rowSum, colIndex]).Interior.ColorIndex = 19;//设置为浅黄色，共计有56种 
        // 
        //取得整个报表的标题 
        // 
        excel.Cells[2, 2] = str2;
        // 
        //设置整个报表的标题格式 
        // 
        xSt.get_Range(excel.Cells[2, 2], excel.Cells[2, 2]).Font.Bold = true;
        xSt.get_Range(excel.Cells[2, 2], excel.Cells[2, 2]).Font.Size = 22;
        // 
        //设置报表表格为最适应宽度 
        // 
        xSt.get_Range(excel.Cells[4, 2], excel.Cells[rowSum, colIndex]).Select();
        xSt.get_Range(excel.Cells[4, 2], excel.Cells[rowSum, colIndex]).Columns.AutoFit();
        // 
        //设置整个报表的标题为跨列居中 
        // 
        xSt.get_Range(excel.Cells[2, 2], excel.Cells[2, colIndex]).Select();
        xSt.get_Range(excel.Cells[2, 2], excel.Cells[2, colIndex]).HorizontalAlignment = XlHAlign.xlHAlignCenterAcrossSelection;
        // 
        //绘制边框 
        // 
        xSt.get_Range(excel.Cells[4, 2], excel.Cells[rowSum, colIndex]).Borders.LineStyle = 1;
        xSt.get_Range(excel.Cells[4, 2], excel.Cells[rowSum, 2]).Borders[XlBordersIndex.xlEdgeLeft].Weight = XlBorderWeight.xlThick;//设置左边线加粗 
        xSt.get_Range(excel.Cells[4, 2], excel.Cells[4, colIndex]).Borders[XlBordersIndex.xlEdgeTop].Weight = XlBorderWeight.xlThick;//设置上边线加粗 
        xSt.get_Range(excel.Cells[4, colIndex], excel.Cells[rowSum, colIndex]).Borders[XlBordersIndex.xlEdgeRight].Weight = XlBorderWeight.xlThick;//设置右边线加粗 
        xSt.get_Range(excel.Cells[rowSum, 2], excel.Cells[rowSum, colIndex]).Borders[XlBordersIndex.xlEdgeBottom].Weight = XlBorderWeight.xlThick;//设置下边线加粗 
        // 
        //在网页上显示效果 
        // 
       // excel.Visible = true;

        //xSt.Export(Server.MapPath(".")+""+this.xlfile.Text+".xls",SheetExportActionEnum.ssExportActionNone,Microsoft.Office.Interop.OWC.SheetExportFormat.ssExportHTML); 
        xBk.SaveCopyAs(path);//产生文件

        dv = null;
        xBk.Close(false, null, null);

        excel.Quit();
        System.Runtime.InteropServices.Marshal.ReleaseComObject(xBk);
        System.Runtime.InteropServices.Marshal.ReleaseComObject(excel);
        System.Runtime.InteropServices.Marshal.ReleaseComObject(xSt);
        xBk = null;
        excel = null;
        xSt = null;
        GC.Collect();

    }





}
