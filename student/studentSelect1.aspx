<%@ Page Language="C#" MasterPageFile="~/student/Student.master" AutoEventWireup="true" CodeFile="studentSelect1.aspx.cs" Inherits="student_studentSelect" Title="计软院论文管理系统-学生选课" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Panel ID="Panel1" runat="server" GroupingText="学生选课" Height="50px" Width="900px" BackImageUrl="~/images/背景.jpg">
        <table border="1" style="border-left-width: thin; font-size: 8pt; 
            border-bottom-width: thin; color: black;  border-right-width: thin; " width="850">
            <caption >
                <span style="font-size: 16pt; font-family: 华文行楷;"><strong>学生选课</strong></span></caption>
            <tr>
                <td style="width: 318px; height: 19px">
                    <span style="font-family: 宋体; mso-bidi-font-family: 宋体; mso-ansi-language: EN-US;
                        mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA">论文时间</span></td>
                <td colspan="3" style="height: 19px">
                    <asp:Label ID="Label3" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td style="width: 318px; height: 19px">
                    教师信息</td>
                <td colspan="3" style="height: 19px">
                    <asp:Label ID="Label8" runat="server" Text="Label"></asp:Label></td>
            </tr>
            <tr>
                <td style="width: 318px; height: 28px">
                    <span style="font-family: 宋体; mso-bidi-font-family: 宋体; mso-ansi-language: EN-US;
                        mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA">论文题目</span></td>
                <td colspan="3" style="height: 28px">
                    <span style="font-size: 10pt;">
                        <asp:Label ID="Label1" runat="server"></asp:Label></span></td>
            </tr>
            <tr style="font-size: 10pt">
                <td rowspan="3" style="width: 318px">
                    <span style="font-family: 宋体; mso-bidi-font-family: 宋体;
                        mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA">
                        题目性质及来源</span></td>
                <td colspan="3" style="height: 36px">
                    <span style="font-size: 10.5pt; font-family: 宋体; mso-bidi-font-family: 宋体; mso-ansi-language: EN-US;
                        mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA">性质：
                        <asp:Label ID="Label4" runat="server"></asp:Label></span></td>
            </tr>
            <tr>
                <td rowspan="2" style="width: 45px">
                    <span style="font-size: 10.5pt; font-family: 宋体; mso-bidi-font-family: 宋体; mso-ansi-language: EN-US;
                        mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA">来源</span></td>
                <td colspan="2">
                    <span style="font-size: 10.5pt; font-family: 宋体; mso-bidi-font-family: 宋体; mso-ansi-language: EN-US;
                        mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA">项目名称
                        <asp:Label ID="Label5" runat="server"></asp:Label></span></td>
            </tr>
            <tr>
                <td style="width: 273px; height: 7px;">
                    <span style="font-size: 10.5pt; font-family: 宋体; mso-bidi-font-family: 宋体; mso-ansi-language: EN-US;
                        mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA">任务下达部门:<asp:Label ID="Label6"
                            runat="server"></asp:Label></span></td>
                <td style="width: 400px; height: 7px;">
                  
                    <span style="font-size: 10.5pt; font-family: 宋体; mso-bidi-font-family: 宋体; mso-ansi-language: EN-US;
                        mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA">项目编号:<asp:Label ID="Label7"
                            runat="server"></asp:Label></span></td>
            </tr>
            <tr>
                <td style="width: 318px; height: 80px">
                    <span style="font-family: 宋体; mso-bidi-font-family: 宋体; mso-ansi-language: EN-US;
                        mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA">论文目标</span></td>
                <td colspan="3" style="height: 80px">
                    <asp:TextBox ID="TextBox1" runat="server" Height="70px" ReadOnly="True" TextMode="MultiLine"
                        Width="700px"></asp:TextBox></td>
            </tr>
            <tr>
                <td style="width: 318px; height: 81px">
                    <span style="font-family: 宋体; mso-bidi-font-family: 宋体; mso-ansi-language: EN-US;
                        mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA">本课题的目的及研究意义</span></td>
                <td colspan="3" style="height: 81px">
                    <asp:TextBox ID="TextBox2" runat="server" Height="70px" ReadOnly="True" TextMode="MultiLine"
                        Width="700px"></asp:TextBox></td>
            </tr>
            <tr>
                <td style="width: 318px; height: 80px">
                    <span style="font-family: 宋体; mso-bidi-font-family: 宋体; mso-ansi-language: EN-US;
                        mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA">本课题的国内外研究现状</span></td>
                <td colspan="3" style="height: 80px">
                    <asp:TextBox ID="TextBox3" runat="server" Height="70px" ReadOnly="True" TextMode="MultiLine"
                        Width="700px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="width: 318px; height: 80px">
                    <span style="font-family: 宋体; mso-bidi-font-family: 宋体; mso-ansi-language: EN-US;
                        mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA">本课题研究内容</span></td>
                <td colspan="3" style="height: 80px">
                    <asp:TextBox ID="TextBox4" runat="server" Height="70px" ReadOnly="True" TextMode="MultiLine"
                        Width="700px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="width: 318px; height: 80px">
                    <span style="font-family: 宋体; mso-bidi-font-family: 宋体; mso-ansi-language: EN-US;
                        mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA">指定参考文献</span></td>
                <td colspan="3" style="height: 80px">
                    <asp:TextBox ID="TextBox5" runat="server" Height="70px" ReadOnly="True" TextMode="MultiLine"
                        Width="700px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="width: 318px; height: 58px">
                    <span style="font-family: 宋体; mso-bidi-font-family: 宋体; mso-ansi-language: EN-US;
                        mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA">备注</span></td>
                <td colspan="3" style="height: 58px">
                    <asp:TextBox ID="TextBox6" runat="server" Height="50px" ReadOnly="True" TextMode="MultiLine"
                        Width="700px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="width: 318px; height: 8px">
                    选课情况</td>
                <td colspan="3" style="height: 8px">
                    <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label></td>
            </tr>
        </table>
        <asp:Button ID="Button3" runat="server" BackColor="#C0FFFF" BorderColor="Blue" ForeColor="Blue"
            OnClick="Button3_Click" Text="选择" />
        </asp:Panel>
</asp:Content>

