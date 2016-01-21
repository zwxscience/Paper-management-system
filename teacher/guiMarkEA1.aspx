<%@ Page Language="C#" MasterPageFile="~/teacher/Teacher.master" AutoEventWireup="true" CodeFile="guiMarkEA1.aspx.cs" Inherits="teacher_guiMarkEA" Title="计软院论文管理系统-指导记录审批及导出" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <asp:Panel ID="Panel2" runat="server" GroupingText="指导记录审批" Height="229px" Width="900px" BackImageUrl="~/images/背景.jpg">
        <table width="850">
            <caption>
                <span style="font-size: 16pt; font-family: 华文行楷;">指导记录</span></caption>
            <tr>
                <td style="width: 100px; height: 14px">
                    学号</td>
                <td style="width: 100px; height: 14px">
                    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label></td>
                <td style="width: 100px; height: 14px">
                    学生姓名</td>
                <td style="width: 229px; height: 14px">
                    <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label></td>
            </tr>
            <tr>
                <td style="width: 100px; height: 14px">
                    指导老师</td>
                <td style="width: 100px; height: 14px">
                    <asp:Label ID="Label3" runat="server" Text="Label"></asp:Label></td>
                <td style="width: 100px; height: 14px">
                    填写日期</td>
                <td style="width: 229px; height: 14px">
                    <asp:Label ID="Label4" runat="server" Text="Label"></asp:Label></td>
            </tr>
            <tr>
                <td style="width: 100px; height: 20px">
                    总次数</td>
                <td style="width: 100px; height: 20px">
                    <asp:Label ID="Label5" runat="server" Text="Label"></asp:Label></td>
                <td style="width: 100px; height: 20px">
                    本次次数为</td>
                <td style="width: 229px; height: 20px">
                    <asp:Label ID="Label6" runat="server" Text="Label"></asp:Label></td>
            </tr>
            <tr>
                <td style="width: 100px; height: 16px">
                    指导记录</td>
                <td colspan="3" style="height: 16px">
                    <asp:TextBox ID="TextBox1" runat="server" Height="150px" ReadOnly="True" TextMode="MultiLine"
                        Width="700px"></asp:TextBox></td>
            </tr>
            <tr>
                <td style="width: 100px; height: 16px">
                    是否通过</td>
                <td colspan="3" style="height: 16px; text-align: center;">
                    <asp:RadioButtonList ID="RadioButtonList1" runat="server" RepeatDirection="Horizontal">
                        <asp:ListItem Selected="True">是</asp:ListItem>
                        <asp:ListItem Selected="True">否</asp:ListItem>
                    </asp:RadioButtonList></td>
            </tr>
            <tr>
                <td style="width: 100px; height: 16px">
                    审批意见</td>
                <td colspan="3" style="height: 16px">
                    <asp:TextBox ID="TextBox2" runat="server" Height="75px" TextMode="MultiLine" Width="700px"></asp:TextBox></td>
            </tr>
            <tr>
                <td colspan="4" style="text-align: center">
                    <asp:Button ID="Button1" runat="server" BackColor="#C0FFFF" BorderColor="Blue" ForeColor="Blue"
                        OnClick="Button1_Click" Text="发送审批意见" />
                    <asp:Button ID="Button2" runat="server" BackColor="#C0FFFF" BorderColor="Blue" ForeColor="Blue"
                        OnClick="Button2_Click" Text="导出为文档"   /></td>
            </tr>
        </table>
        <asp:Label ID="Label7" runat="server"></asp:Label></asp:Panel>
</asp:Content>

