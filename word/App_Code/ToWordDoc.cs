using System;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Data;
using Microsoft.Office.Interop.Word;
    /// <summary>
    /// ToWordDoc 的摘要说明。
    /// </summary>
    public class ToWordDoc
    {
        private ApplicationClass oWordApplic; // a reference to Word application
        private Document oDoc; // a reference to the document
        public ToWordDoc()
        {
            //
            // TODO: 在此处添加构造函数逻辑
            //
            // activate the interface with the COM object of Microsoft Word
            oWordApplic = new ApplicationClass();
        }

        // Open a file (the file must exists) and activate it
        public void Open(string strFileName)
        {
            object fileName = strFileName;
            object readOnly = false;
            object isVisible = true;
            object missing = System.Reflection.Missing.Value;

            oDoc = oWordApplic.Documents.Open(ref fileName, ref missing, ref readOnly,
             ref missing, ref missing, ref missing, ref missing, ref missing, ref missing,
             ref missing, ref missing, ref isVisible, ref missing, ref missing, ref missing, ref missing);

            oDoc.Activate();
        }


        // Open a new document
        public void Open()
        {
            object missing = System.Reflection.Missing.Value;
            oDoc = oWordApplic.Application.Documents.Add(ref missing, ref missing, ref missing, ref missing);

            oDoc.Activate();
        }




        public void Quit()
        {
            //   object missing = System.Reflection.Missing.Value;
            //   oWordApplic.Application.Quit(ref missing, ref missing, ref missing); 

            object missing = System.Reflection.Missing.Value;
            oDoc.Close(ref missing, ref missing, ref missing);
            oWordApplic.Quit(ref missing, ref missing, ref missing);

            System.Runtime.InteropServices.Marshal.ReleaseComObject(oDoc);
            System.Runtime.InteropServices.Marshal.ReleaseComObject(oWordApplic);

            oDoc = null;
            oWordApplic = null;
            GC.Collect();
        }

        public void Save()
        {
            oDoc.Save();
        }

        public void SaveAs(string strFileName)
        {
            object missing = System.Reflection.Missing.Value;
            object fileName = strFileName;
            //object Format = (int)WdSaveFormat.wdFormatFilteredHTML;
            oDoc.SaveAs(ref fileName, ref missing, ref missing, ref missing, ref missing, ref missing, ref missing,
             ref missing, ref missing, ref missing, ref missing, ref missing, ref missing, ref missing, ref missing, ref missing);

        }

        // Save the document in HTML format
        public void SaveAsHtml(string strFileName)
        {
            object missing = System.Reflection.Missing.Value;
            object fileName = strFileName;
            object Format = (int)WdSaveFormat.wdFormatHTML;
            oDoc.SaveAs(ref fileName, ref Format, ref missing, ref missing, ref missing, ref missing, ref missing,
             ref missing, ref missing, ref missing, ref missing, ref missing, ref missing, ref missing, ref missing, ref missing);
        }



        public void InsertText(string strText)
        {
            oWordApplic.Selection.TypeText(strText);
        }

        public string InsertHtml(string strText)
        {
            string noHtml = "";//System.Web.HttpUtility.HtmlDecode(strText);//
            noHtml = strText.Replace("<p>", "").Replace("<P>", "").Replace("</P>", "").Replace("</p>", "");
            noHtml = noHtml.Replace("&nbsp;", " ").Replace("<br>", "\n").Replace("<BR>", "\n");

            return noHtml;
        }

        public void InsertLineBreak()
        {
            oWordApplic.Selection.TypeParagraph();
        }
        public void InsertLineBreak(int nline)
        {
            for (int i = 0; i < nline; i++)
                oWordApplic.Selection.TypeParagraph();
        }

        // Change the paragraph alignement
        public void SetAlignment(string strType)
        {
            switch (strType)
            {
                case "Center":
                    oWordApplic.Selection.ParagraphFormat.Alignment = WdParagraphAlignment.wdAlignParagraphCenter;
                    break;
                case "Left":
                    oWordApplic.Selection.ParagraphFormat.Alignment = WdParagraphAlignment.wdAlignParagraphLeft;
                    break;
                case "Right":
                    oWordApplic.Selection.ParagraphFormat.Alignment = WdParagraphAlignment.wdAlignParagraphRight;
                    break;
                case "Justify":
                    oWordApplic.Selection.ParagraphFormat.Alignment = WdParagraphAlignment.wdAlignParagraphJustify;
                    break;
            }

        }


        // if you use thif function to change the font you should call it again with 
        // no parameter in order to set the font without a particular format
        public void SetFont(string strType)
        {
            switch (strType)
            {
                case "Bold":
                    oWordApplic.Selection.Font.Bold = 1;
                    break;
                case "Italic":
                    oWordApplic.Selection.Font.Italic = 1;
                    break;
                case "Underlined":
                    oWordApplic.Selection.Font.Subscript = 0;
                    break;
            }

        }


        //续上
        // disable all the style 
        public void SetFont()
        {
            oWordApplic.Selection.Font.Bold = 0;
            oWordApplic.Selection.Font.Italic = 0;
            oWordApplic.Selection.Font.Subscript = 0;

        }

        public void SetFontName(string strType)
        {
            oWordApplic.Selection.Font.Name = strType;

        }

        public void SetFontSize(int nSize)
        {
            oWordApplic.Selection.Font.Size = nSize;

        }

        public void InsertPagebreak()
        {
            // VB : Selection.InsertBreak Type:=wdPageBreak
            object pBreak = (int)WdBreakType.wdPageBreak;
            oWordApplic.Selection.InsertBreak(ref pBreak);
        }

        // Go to a predefined bookmark, if the bookmark doesn't exists the application will raise an error

        public void GotoBookMark(string strBookMarkName)
        {
            // VB :  Selection.GoTo What:=wdGoToBookmark, Name:="nome"
            object missing = System.Reflection.Missing.Value;

            object Bookmark = (int)WdGoToItem.wdGoToBookmark;
            object NameBookMark = strBookMarkName;
            oWordApplic.Selection.GoTo(ref Bookmark, ref missing, ref missing, ref NameBookMark);
        }

        public void GoToTheEnd()
        {
            // VB :  Selection.EndKey Unit:=wdStory
            object missing = System.Reflection.Missing.Value;
            object unit;
            unit = WdUnits.wdStory;
            oWordApplic.Selection.EndKey(ref unit, ref missing);

        }
        public void GoToTheBeginning()
        {
            // VB : Selection.HomeKey Unit:=wdStory
            object missing = System.Reflection.Missing.Value;
            object unit;
            unit = WdUnits.wdStory;
            oWordApplic.Selection.HomeKey(ref unit, ref missing);

        }

        public void GoToTheTable(int ntable)
        {
            // Selection.GoTo What:=wdGoToTable, Which:=wdGoToFirst, Count:=1, Name:=""
            //    Selection.Find.ClearFormatting
            //    With Selection.Find
            //        .Text = ""
            //        .Replacement.Text = ""
            //        .Forward = True
            //        .Wrap = wdFindContinue
            //        .Format = False
            //        .MatchCase = False
            //        .MatchWholeWord = False
            //        .MatchWildcards = False
            //        .MatchSoundsLike = False
            //        .MatchAllWordForms = False
            //    End With

            object missing = System.Reflection.Missing.Value;
            object what;
            what = WdUnits.wdTable;
            object which;
            which = WdGoToDirection.wdGoToFirst;
            object count;
            count = 1;
            oWordApplic.Selection.GoTo(ref what, ref which, ref count, ref missing);
            oWordApplic.Selection.Find.ClearFormatting();

            oWordApplic.Selection.Text = "";


        }

        public void GoToRightCell()
        {
            // Selection.MoveRight Unit:=wdCell

            object missing = System.Reflection.Missing.Value;
            object direction;
            direction = WdUnits.wdCell;
            oWordApplic.Selection.MoveRight(ref direction, ref missing, ref missing);
        }

        public void GoToLeftCell()
        {
            // Selection.MoveRight Unit:=wdCell

            object missing = System.Reflection.Missing.Value;
            object direction;
            direction = WdUnits.wdCell;
            oWordApplic.Selection.MoveLeft(ref direction, ref missing, ref missing);
        }

        public void GoToDownCell()
        {
            // Selection.MoveRight Unit:=wdCell

            object missing = System.Reflection.Missing.Value;
            object direction;
            direction = WdUnits.wdLine;
            oWordApplic.Selection.MoveDown(ref direction, ref missing, ref missing);
        }

        public void GoToUpCell()
        {
            // Selection.MoveRight Unit:=wdCell

            object missing = System.Reflection.Missing.Value;
            object direction;
            direction = WdUnits.wdLine;
            oWordApplic.Selection.MoveUp(ref direction, ref missing, ref missing);
        }


        // this function doesn't work
        public void InsertPageNumber(string strType, bool bHeader)
        {
            object missing = System.Reflection.Missing.Value;
            object alignment;
            object bFirstPage = false;
            object bF = true;
            //if (bHeader == true)
            //WordApplic.Selection.HeaderFooter.PageNumbers.ShowFirstPageNumber = bF;
            switch (strType)
            {
                case "Center":
                    alignment = WdPageNumberAlignment.wdAlignPageNumberCenter;
                    //WordApplic.Selection.HeaderFooter.PageNumbers.Add(ref alignment,ref bFirstPage);
                    //Selection objSelection = WordApplic.pSelection;

                    oWordApplic.Selection.HeaderFooter.PageNumbers[1].Alignment = WdPageNumberAlignment.wdAlignPageNumberCenter;
                    break;
                case "Right":
                    alignment = WdPageNumberAlignment.wdAlignPageNumberRight;
                    oWordApplic.Selection.HeaderFooter.PageNumbers[1].Alignment = WdPageNumberAlignment.wdAlignPageNumberRight;
                    break;
                case "Left":
                    alignment = WdPageNumberAlignment.wdAlignPageNumberLeft;
                    oWordApplic.Selection.HeaderFooter.PageNumbers.Add(ref alignment, ref bFirstPage);
                    break;
            }

        }


    }
    //object units = WdUnits.wdCharacter;
    //object last=doc.Characters.Count;
    //doc.Range(ref first, ref last).Delete(ref units, ref last)





