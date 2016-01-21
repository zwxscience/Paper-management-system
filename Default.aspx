<%@ Page Language="C#" AutoEventWireup="true"  CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//Dtd XHTML 1.0 transitional//EN" "http://www.w3.org/tr/xhtml1/Dtd/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title title="用户登录">用户登录</title>
       <style type="text/css">
   BODY {
	BACKGROUND: ##808080; MARGIN: 0px; FONT: 9pt 宋体
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
	COLOR: #000000;
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
	 .titl{font-size:12px ;color:silver }
	 .titl :link{font-size:12px ;color:green; text-decoration:none}
	  .titl :visited{font-size:12px ;color:#ffffff; text-decoration:none}
	   .titl :active{font-size:12px ;color:#ffffff; text-decoration:none}
	    .titl :hover{font-size:12px ;color:#ffff00; text-decoration:none}
 
    
    
    </style>
    <link href="App_Browsers/style1.css" rel="stylesheet" type="text/css" />
   
</head>
<body   style="text-align:center; font-size: 12pt; font-family: Times New Roman;  background-position:center; background-repeat: no-repeat; " >
<br />
    <form id="form1" runat="server">
    <div >
        <br />
 
    <br />
        <table>
            <tr>
                <td colspan="3" style="height: 340px">
        <table style="border-right: blue thin solid; border-top: blue thin solid; border-left: blue thin solid; border-bottom: blue thin solid; margin-left:75px" class="list_title" >
            <tr>
                <td colspan="5" style="border-right: darkorchid thin solid; border-top: darkorchid thin solid;
                    border-left: darkorchid thin solid; border-bottom: darkorchid thin solid; height: 134px;
                    text-align: left; background-image: url(images/login.jpg); background-position-x: center;">
                    <span style="font-size: 32pt; font-family: 华文楷体">
                        <asp:Image ID="Image1" runat="server" ImageUrl="~/images/login_1.jpg" BorderColor="#C0C0FF"  style="FILTER: Alpha(opacity=500,finishOpacity=0,style=3)"　/><br />
                        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="font-family: 华文行楷">
                            计软院论文管理系统</span></span></td>
            </tr>
            <tr class="list_title" >
                <td colspan="2" rowspan="2" style="border-right: darkorchid thin solid; border-top: darkorchid thin solid;
                    border-left: darkorchid thin solid; border-bottom: darkorchid thin solid">
                    <asp:Image ID="Image2" runat="server" ImageUrl="~/images/login_2.jpg" Width="73px" Height="70px" style="FILTER: Alpha(opacity=500,finishOpacity=0,style=2)" />&nbsp;
                </td>
                <td colspan="3" style="border-right: darkorchid thin solid; border-top: darkorchid thin solid;
                    border-left: darkorchid thin solid; width: 620px; border-bottom: darkorchid thin solid;
                    height: 50px" >
                    用户名：<asp:TextBox ID="username" runat="server"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="* 用户名不能为空" ControlToValidate="username"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td colspan="3" style="border-right: darkorchid thin solid; border-top: darkorchid thin solid;
                    border-left: darkorchid thin solid; width: 620px; border-bottom: darkorchid thin solid;
                    height: 51px">
                    &nbsp;密码：<asp:TextBox ID="password" runat="server" TextMode="Password"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" BorderColor="#0000C0"
                        Borderstyle="None" ErrorMessage="* 密码不能为空" ControlToValidate="password"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td colspan="5" style="border-right: darkorchid thin solid; border-top: darkorchid thin solid;
                    border-left: darkorchid thin solid; border-bottom: darkorchid thin solid; height: 21px;
                    text-align: center">
                    选择角色：&nbsp;<asp:RadioButtonList ID="Role" runat="server" Repeatdirection="Horizontal" Height="15px" RepeatLayout="Flow">
                        <asp:ListItem Selected="true">学生</asp:ListItem>
                        <asp:ListItem>教师</asp:ListItem>
                        <asp:ListItem>管理员</asp:ListItem>
                    </asp:RadioButtonList></td>
            </tr>
            <tr>
                <td colspan="5" style="height: 16px; text-align: center;">
                    <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/images/login_9.gif" OnClick="ImageButton1_Click" />
                    <asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="~/images/login_10.gif" OnClick="ImageButton2_Click" />
                    </td>
            </tr>
        </table>
                </td>
            </tr>
            <tr>
                <td style="width: 186px; height: 150px; text-align: left; text-shadow: green">       
                    <marquee direction="up" onmouseout="this.start();" onmouseover="this.stop();"
                        scrolldelay="400" style="margin-left: 50px; height: 125px; width: 203px;"><PRE style="FONT-SIZE: 12px">论文管理系统登录方法：

【教职工】 
用户名：工号 初始密码：生日

【计软院学生】 
用户名：学生学号 初始密码：生日
生日格式：19830102

</PRE></marquee>
                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
                </td>
                <td style="width: 222px; height: 150px; text-align: left;" >
                    <img src="images/front_4.jpg" style=" FILTER: Alpha(opacity=100,finishOpacity=0,style=3)"  width="400px" />
                    </td>
                <td style="height: 150px; text-align:left; text-shadow:green; text-align:left" colspan="2" >
                    &nbsp;</td>
            </tr>
        </table>
    <br />
    <br />
   
       
    
    
    
    </div>

   </form>
</body>
</html>
