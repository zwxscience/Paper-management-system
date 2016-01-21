<%@ Page Language="C#" AutoEventWireup="true" CodeFile="left.aspx.cs" Inherits="admin_left" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
        <style type="text/css">
   BODY {
	BACKGROUND: #8D89EA; MARGIN: 0px; FONT: 9pt 宋体
}
table {
	BORDER-RIGHT: 0px; BORDER-TOP: 0px; BORDER-LEFT: 0px; BORDER-BOTTOM: 0px
}
td {
	FONT: 12px 宋体
}
img {
	BORDER-RIGHT: 0px; BORDER-TOP: 0px; VERTICAL-ALIGN: bottom; BORDER-LEFT: 0px; BORDER-BOTTOM: 0px
}
A {
	FONT: 12px 宋体; COLOR: #215dc6; TEXT-DECORATION: none
}
A:hover {
	COLOR: #428eff
}
.sec_menu {
	BORDER-RIGHT: white 1px solid; BACKGROUND:#E0DEFD; OVERFLOW: hidden; BORDER-LEFT: white 1px solid; BORDER-BOTTOM: white 1px solid
}
.list_title {
	
}
.list_title span {
	FONT-WEIGHT: bold;
	LEFT: 8px;
	COLOR: #3E38A4;
	POSITION: relative;
	TOP: 2px;
	visibility: visible;
}
.list_title2 {
	
}
.list_title2 span {
	FONT-WEIGHT: bold; LEFT: 8px; COLOR: #3E38A4; POSITION: relative; TOP: 2px
}

table{font-size:12px}
	 .titl{font-size:12px ;color:#ffffff }
	 .titl :link{font-size:12px ;color:#ffffff; text-decoration:none}
	  .titl :visited{font-size:12px ;color:#ffffff; text-decoration:none}
	   .titl :active{font-size:12px ;color:#ffffff; text-decoration:none}
	    .titl :hover{font-size:12px ;color:#ffff00; text-decoration:none}
 
    
    
    </style>
    
<script type="text/javascript" language="javascript">
function show(obj,maxg,obj2)
{
  if(obj.style.pixelHeight<maxg)
  {
    obj.style.pixelHeight+=maxg/10;
	obj.filters.alpha.opacity+=20;
	obj2.background="images/title_hide.gif";
    if(obj.style.pixelHeight==maxg/10)
	  obj.style.display='block';
	myObj=obj;
	mymaxg=maxg;
	myObj2=obj2;
	setTimeout('show(myObj,mymaxg,myObj2)','5');
  }
}
function hide(obj,maxg,obj2)
{
  if(obj.style.pixelHeight>0)
  {
    if(obj.style.pixelHeight==maxg/5)
	  obj.style.display='none';
    obj.style.pixelHeight-=maxg/5;
	obj.filters.alpha.opacity-=10;
	obj2.background="images/title_show.gif";
	myObj=obj;
	mymaxg=maxg
	myObj2=obj2;
	setTimeout('hide(myObj,mymaxg,myObj2)','5');
  }
  else    if(whichContinue)
	  whichContinue.click();
}
function chang(obj,maxg,obj2)
{
  if(obj.style.pixelHeight)
  {
    hide(obj,maxg,obj2);
	nopen='';
	whichcontinue='';
  }
  else    if(nopen)
	{
	  whichContinue=obj2;
      nopen.click();
	}
	else
	{
	  show(obj,maxg,obj2);
	  nopen=obj2;
	  whichContinue='';
	}
}
  var nopen="";
  var whichContinue='';
function TABLE1_onclick() {

}

function IMG1_onclick() {

}

function TABLE2_onclick() {

}

function menu1_onclick() {

}

  </script>
<script language='Javascript' type="text/javascript">

function go(){
if(confirm("确定要退出系统么？")) {
parent.location.href = "../Default.aspx"; 

}
else {
}
}
</script>
      
</head>
<body>
    <form id="form1" runat="server">
    <div>
                    
        <table cellspacing="0 "cellpadding="0 "width="158"   style="text-align:center" id="TABLE2" >
        <tbody>
        <tr style="CURSOR: hand">
          <td valign="bottom" style=" height:38px; width: 159px;" ><img 
            src="../images/title.gif" width="158" height="38" alt="" id="IMG1" onclick="return IMG1_onclick()"/> 
</td>
        </tr></tbody></table>
     
      <table cellspacing="0" cellpadding="0"width="158" style="text-align:center">
        <tbody>
        <tr style="CURSOR: hand">
            <td class="list_title" id="list1" 
          onmouseover="this.typename='list_title2';" 
          onclick="chang(menu1,60,list1);" 
          onmouseout="this.typename='list_title';" 
           style="height: 25px ; background:url(../images/title_show.gif); width: 161px;"><span>个人信息</span> </td>
          </tr>
        <tr>
            <td style="text-align:center; width: 161px;" valign="middle"> 
              <div class="sec_menu" id="menu1" 
            style="DISPLAY: none; width: 158px; height: 0px; filter: alpha(Opacity=0);" onclick="return menu1_onclick()">
        <table  cellspacing="2" 
            cellpadding="0" width="135" style="text-align:center">
<tbody>                 <tr > 
                      <td align="left" style="height: 25px; width: 135px;"><a href="Default.aspx"  target="_parent">个人信息查看</a></td>
                    </tr>           
                    <tr> 
                      <td style="width: 135px; height: 25px;"><a href="passwordModify.aspx" target="_parent">密码修改</a></td>
                    </tr>
                  </tbody>
                </table>
              </div></td></tr></tbody></table> &nbsp; &nbsp;
<table cellspacing="0" cellpadding="0" width="158" style="text-align:center">
        <tbody>
        <tr style="CURSOR: hand">
            <td class="list_title" id="list2" 
          onmouseover="this.typename='list_title2';" 
          onclick="chang(menu2,80,list2)"; 
          onmouseout="this.typename='list_title';" 
           style="height: 25px; background-image: url(../images/title_show.gif); width: 161px;"><span>信息导入功能</span> </td>
          </tr>
        <tr>
            <td style="text-align:center; width: 161px;"> 
              <div class="sec_menu" id="menu2" 
            style="DISPLAY: none; filter: alpha(Opacity=0); width: 158px; height: 0px">
                <table  cellspacing="2" 
            cellpadding="0" width="135" style="text-align:center">
                  <tr> 
                    <td style=" height:25px"><a href="student_informationInput.aspx" target="_parent">学生信息导入</a></td>
                  </tr>
                  <tbody>
                   <tr> 
                    <td style=" height:25px"><a href="teacher_informationInput.aspx" target="_parent">教师信息导入</a></td>
                  </tr>
                    <tr> 
                      <td style=" height:25px"><a href="finalresults_informationInput.aspx" target="_parent">选题结果导入</a></td>
                    </tr>                   						
                  </tbody>
                </table>
              </div></td></tr></tbody></table>&nbsp;
              
        <table cellspacing="0" cellpadding="0" width="158" style="text-align:center">
        <tbody>
        <tr style="CURSOR: hand">
            <td class="list_title" id="list3" 
          onmouseover="this.typename='list_title2';" 
          onclick="chang(menu3,30,list3)"; 
          onmouseout="this.typename='list_title';" 
           style="height: 25px; background-image: url(../images/title_show.gif); width: 161px;"><span>信息导出功能</span> </td>
          </tr>
        <tr>
            <td style="text-align:center; width: 161px;"> 
              <div class="sec_menu" id="menu3" 
            style="DISPLAY: none; filter: alpha(Opacity=0); width: 158px; height: 0px">
                <table  cellspacing="2" 
            cellpadding="0" width="135" style="text-align:center">
                  <tbody>
                    <tr> 
                      <td style=" height:25px"><a href="select_Result.aspx" target="_parent">学生选题结果导出</a></td>
                    </tr>                   						
                  </tbody>
                </table>
              </div></td></tr></tbody></table>&nbsp;
              
              
              

    <table cellspacing="0" cellpadding="0" width="158" style="text-align:center">
        <tbody>
        <tr style="CURSOR: hand">
            <td class="list_title" 
             style="color: #3e38a4 ; height:25px; background-image: url(../images/title_hide.gif);"><span><a href="role_Set.aspx" target="_parent" style="color: #3e38a4"><b>教师权限设定</b></a></span> 
            </td>
          </tr></tbody></table>&nbsp; 
 

    <table cellspacing="0" cellpadding="0" width="158" style="text-align:center">
        <tbody>
        <tr style="CURSOR: hand">
            <td class="list_title" 
             style="color: #3e38a4 ; height:25px; background-image: url(../images/title_hide.gif);"><span><a href="time_Set.aspx" target="_parent" style="color: #3e38a4"><b>时间设定</b></a></span> 
            </td>
          </tr></tbody></table>&nbsp; 
 &nbsp;

 <table cellspacing="0" cellpadding="0" width="158" style="text-align:center">
        <tbody>
        <tr style="CURSOR: hand">
            <td class="list_title" id="list4" 
          onmouseover="this.typename='list_title2';" 
          onclick="chang(menu4,60,list4)"; 
          onmouseout="this.typename='list_title';" 
           style="height: 25px; background-image: url(../images/title_show.gif); width: 161px;"><span>数据维护及公告</span> </td>
          </tr>
        <tr>
            <td style="text-align:center; width: 161px;"> 
              <div class="sec_menu" id="menu4" 
            style="DISPLAY: none; filter: alpha(Opacity=0); width: 158px; height: 0px">
                <table  cellspacing="2" 
            cellpadding="0" width="135" style="text-align:center">
                  <tbody>
                    <tr> 
                      <td style=" height:25px"><a href="data_Maintain.aspx" target="_parent">数据维护</a></td>
                        <tr> 
                      <td style=" height:25px"><a href="issueBulletin.aspx" target="_parent">公告发布</a></td>
                    </tr>  
                    </tr>                   						
                  </tbody>
                </table>
              </div></td></tr></tbody></table>&nbsp;















      &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; 
       <table cellspacing="0" cellpadding="0" width="158" style="text-align:center">
        <tbody>
        <tr style="CURSOR: hand">
            <td class="list_title" onmouseover="this.typename='list_title2';" 
          onmouseout="this.typename='list_title';" 
          onclick="go()";
             style="color: #3e38a4 ; height:25px; background-image: url(../images/title_quit.gif);"><span><b>退出系统</b></span> 
            </td>
          </tr></tbody></table>&nbsp; 
       
    </div>
    </form>
</body>
</html>
