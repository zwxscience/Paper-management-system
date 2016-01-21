// JScript 文件

/** 
 * <p> Title: 用word书签替换的方式将内容导出到word</p>
 * <p> Description: **</p>
 * <p> Copyright: Copyright (c) 2007-2010 </p>
 * <p> Company: ** </p>
 * @author zhu
 * @version 1.0
 */
var baseVoListObj = function(){
 this.volist = new Array();
 this.cols = new Array();
 this.widths = new Array(); 
}

var WordApp = function(wordTplPath){
 var wordObj = new ActiveXObject("Word.Application");
 if(wordObj==null){
  alert( "不能创建Word对象！");
 }   
 wordObj.visible=false;
 this.wordObj = wordObj;
 this.docObj = this.wordObj.Documents.Open(getRootPath() + wordTplPath);
}

WordApp.prototype.closeApp = function(){
 if (this.wordObj !=null){
   this.wordObj.Quit(); 
 }
}

WordApp.prototype.replaceBookmark = function(strName,content,type){
 if (this.wordObj.ActiveDocument.BookMarks.Exists(strName)) {
  if (type != null && type == "pic") {//图片
            var objDoc = this.wordObj.ActiveDocument.BookMarks(strName).Range.Select();
            var objSelection = this.wordObj.Selection;
            objSelection.TypeParagraph();
   //alert(getRootPath()+content);
            var objShape = objSelection.InlineShapes.AddPicture(getRootPath()+content);
  }
  else {
   this.wordObj.ActiveDocument.BookMarks(strName).Range.Select();
   this.wordObj.Application.selection.Text = content;
  }
 }else{
  //alert("标签不存在");
 }
}

WordApp.prototype.replaceBookmarkUsevo = function(voObj){
 if(typeof voObj != "object"){
  alert("请输入正确的vo对象");
 }else{
  for(var i in voObj){
   this.replaceBookmark(i,voObj[i]);
  }
 }
}

WordApp.prototype.replaceBookmarkUsepicvo = function(voObj){
 if(typeof voObj !="object"){
  alert("请输入正确的vo对象");
 }else{
  for(var i in voObj){
   this.replaceBookmark(i,voObj[i],"pic");
  }
 }
}

WordApp.prototype.replaceBookmarkUsevolist = function(strName,voListObj){
 if(typeof voListObj != "object"){
  alert("参数应为数组类型");
 }else{ 
  var row = voListObj.volist.length;
  var col = voListObj.cols.length;
  var objDoc = this.wordObj.ActiveDocument.BookMarks(strName).Range;
  var objTable = this.docObj.Tables.Add(objDoc,row,col) ;//插入表格
  for (var i = 0; i < row; i++) {
   for(var j=0; j<col; j++){
    //todo 列表里面如果有图片类型不支持，需要判断
    objTable.Cell(i+1,j+1).Range.InsertAfter(voListObj.volist[i][voListObj.cols[j]]);
    var width = voListObj.widths[j];
    if(width.indexOf("px")!=-1){
     objTable.Cell(i+1,j+1).Width = (width.substr(0,width.length-2)/100) * 28.35;//1厘米=28.35磅
    }   
   }
  }
  //objTable.AutoFormat(16);
  objTable.Borders.InsideLineStyle = 1
        objTable.Borders.OutsideLineStyle = 0;
 }
}

WordApp.prototype.getSingleVo = function(formName,arrayObj){//第二个参数可以为空，不填时默认为表单里的所有元素
 var formObj = document.forms[formName];
 if(formObj!=null){
  if(arrayObj!=null){
   if(arrayObj instanceof Array){
    var vo = {};
    for(var i=0;i<arrayObj.length;i++){
     if(formObj.elements[arrayObj[i]]!= undefined ){
      eval("vo." + arrayObj[i] + " = formObj.elements[arrayObj[i]].value;");
     }    
    }
    //alert(objToString(vo));
    return vo;
   }else{
    alert("弟二个参数应为数组类型");  
   }
  }else{
   var vo = {};
   for(var i=0;i<formObj.elements.length;i++){
    eval("vo." + formObj.elements[i].name + " = formObj.elements[i].value;");
   }
   return vo;
  }
 }else{
  alert("第一个参数表示的表单不存在");
  return null;
 }
}

WordApp.prototype.getVoList = function (formName,arrayObj){//表单名，属性数组(可以为空)
 //var formArray = document.forms[formName];
 var formArray = document.getElementsByName(formName);
 if (formArray != null) {
  if (arrayObj instanceof Array) {
   var voListObj = new baseVoListObj();
   for(var i=0;i<formArray.length;i++){   
    var vo = {};
    for(var j=0;j<arrayObj.length;j++){
     if(formArray[i].elements[arrayObj[j]]!= undefined ){
      eval("vo."+arrayObj[j]+" = formArray[i].elements[arrayObj[j]].value;");      
      if(i==0){//第一次的时候定义有效属性和宽度
       voListObj.cols.push(arrayObj[j]);
       voListObj.widths.push(formArray[i].elements[arrayObj[j]].style.width);
      }    
     }    
    }
    voListObj.volist.push(vo);
   }
   return voListObj;
  }else{
   var voListObj = new baseVoListObj();
   for(var i=0;i<formArray.length;i++){   
    var vo = {};
    for(var j=0;j<formArray[i].elements.length;j++){
     eval("vo."+formArray[i].elements[j].name+" = formArray[i].elements[j].value;"); 
     if(i==0){//第一次的时候定义宽度
      voListObj.cols.push(formArray[i].elements[j].name);
      voListObj.widths.push(formArray[i].elements[j].style.width);
     }   
    }
    voListObj.volist.push(vo);
   }
   return voListObj;
  }  
 }else{
  return null;
 }
}

function objToString(obj){
 if(obj instanceof Array){
  var str="";
  for(var i=0;i<obj.length;i++){
   str+="[";
   for(var j in obj[i]){
    str+=j+"="+obj[i][j]+" ";
   }
   str+="]\n";  
  }
  return str;
 }else if(obj instanceof Object){
  var str="";
  for(var i in obj){
   str+=i+"="+obj[i]+" ";
  }
  return str;  
 }
}

function getRootPath()
{
 var location=document.location; 
 if ("file:" == location.protocol) {
  var str = location.toString();
  return str.replace(str.split("/").reverse()[0], "");
 }
 var pathName=location.pathname.split("/");
 return location.protocol+"//"+location.host+"/"+pathName[1]+"/";
}

