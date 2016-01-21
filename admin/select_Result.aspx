<%@ Page Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeFile="select_Result.aspx.cs" Inherits="select_Result" Title="学生课题选择结果" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
 <strong><span style="font-size: 16pt; font-family: 华文行楷;">学生课题选择结果导出</span></strong>
 <hr />
    <table  >

        <tr>
            <td style="width: 205px; height: 14px">
                请选择输出排列顺序：</td>
            <td style="width: 271px; height: 14px">
                按<asp:DropDownList ID="DropDownList1" runat="server">
                    <asp:ListItem Selected="True">学生</asp:ListItem>
                    <asp:ListItem>教师</asp:ListItem>
                    <asp:ListItem>题目性质</asp:ListItem>
                </asp:DropDownList>输出</td>
        </tr>
        <tr>
            <td style="width: 205px; height: 14px">
                请输入导出的Excel表文件的名称：</td>
            <td style="width: 271px; height: 14px">
                <asp:TextBox ID="TextBox1" runat="server">学生课题选择结果</asp:TextBox></td>
        </tr>
        <tr>
            <td style="width: 205px; height: 14px">
                请输入该表的标题：</td>
            <td style="width: 271px; height: 14px">
                <asp:TextBox ID="TextBox2" runat="server">学生课题选择结果一览</asp:TextBox></td>
        </tr>
        <tr>
            <td colspan="2" style="text-align: center; height: 26px;">
                <asp:Button ID="outPut" runat="server" Text="导出" BackColor="#80FFFF" BorderColor="Blue" ForeColor="Blue" OnClick="outPut_Click" /></td>
        </tr>
    </table>
</asp:Content>

