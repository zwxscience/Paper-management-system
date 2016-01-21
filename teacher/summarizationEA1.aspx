<%@ Page Language="C#" MasterPageFile="~/teacher/Teacher.master" AutoEventWireup="true" CodeFile="summarizationEA1.aspx.cs" Inherits="teacher_summarizationEA" Title="计软院论文管理系统-论文小结审批及导出" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <asp:Panel ID="Panel1" runat="server" GroupingText="毕业论文小结表" Height="165px" Width="900px" BackImageUrl="~/images/背景.jpg">
        <table border="0" width="850">
            <caption>
                <span style="font-size: 16pt; font-family: 华文行楷;">毕业论文小结</span></caption>
            <tr style="font-size: 12px">
                <td style="width: 60px; height: 16px">
                    学号</td>
                <td style="width: 100px; height: 16px">
                    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label></td>
                <td style="width: 110px; height: 16px">
                    学生姓名</td>
                <td style="width: 152px; height: 16px">
                    <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label></td>
            </tr>
            <tr style="font-size: 12px">
                <td style="width: 60px; height: 16px">
                    院系</td>
                <td style="width: 100px; height: 16px">
                    <asp:Label ID="Label3" runat="server" Text="Label"></asp:Label></td>
                <td style="width: 110px; height: 16px">
                    专业</td>
                <td style="width: 152px; height: 16px">
                    <asp:Label ID="Label4" runat="server" Text="Label"></asp:Label></td>
            </tr>
            <tr style="font-size: 12px">
                <td style="width: 60px; height: 16px">
                    指导老师</td>
                <td style="width: 100px; height: 16px">
                    <asp:Label ID="Label5" runat="server" Text="Label"></asp:Label></td>
                <td style="width: 110px; height: 16px">
                    填写日期(统一时间)</td>
                <td style="width: 152px; height: 16px">
                    <asp:Label ID="Label6" runat="server" Text="Label"></asp:Label></td>
            </tr>
            <tr style="font-size: 12px">
                <td style="width: 60px; height: 16px">
                    论文题目</td>
                <td colspan="3" style="height: 16px">
                    <asp:Label ID="Label7" runat="server" Text="Label"></asp:Label></td>
            </tr>
            <tr style="font-size: 12px">
                <td style="width: 60px;">
                    <span style="font-family: 宋体; mso-bidi-font-family: 宋体; mso-ansi-language: EN-US;
                        mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA"><span style="font-family: 宋体;
                            mso-bidi-font-family: 'Times New Roman'; mso-ansi-language: EN-US; mso-fareast-language: ZH-CN;
                            mso-bidi-language: AR-SA; mso-bidi-font-size: 12.0pt; mso-font-kerning: 1.0pt">目标完成情况</span></span></td>
                <td colspan="3">
                    <asp:TextBox ID="TextBox1" runat="server" Height="400px" ReadOnly="True" TextMode="MultiLine"
                        Width="700px"></asp:TextBox></td>
            </tr>
            <tr style="font-size: 12px">
                <td style="width: 60px; height: 27px">
                    是否通过</td>
                <td colspan="3" style="height: 27px; text-align: center;">
                    <asp:RadioButtonList ID="RadioButtonList1" runat="server" RepeatDirection="Horizontal">
                        <asp:ListItem Selected="True">是</asp:ListItem>
                        <asp:ListItem Selected="True">否</asp:ListItem>
                    </asp:RadioButtonList></td>
            </tr>
            <tr style="font-size: 12px">
                <td style="width: 60px; height: 27px">
                    &nbsp;详细批注</td>
                <td colspan="3" style="height: 27px">
                    <asp:TextBox ID="TextBox2" runat="server" Height="75px" TextMode="MultiLine" Width="700px"></asp:TextBox></td>
            </tr>
        </table>
        <div style=" text-align:center">
        
        <asp:Button ID="Button1" runat="server" BackColor="#C0FFFF" BorderColor="Blue" ForeColor="Blue"
            OnClick="Button1_Click" Text="提交" />
        <asp:Button ID="Button2" runat="server" BackColor="#C0FFFF" BorderColor="Blue" ForeColor="Blue"
            OnClick="Button2_Click"  Text="导出为文档" /><br />
        <asp:Label ID="Label8" runat="server"></asp:Label></div></asp:Panel>
</asp:Content>

