<%@ Page Language="C#" MasterPageFile="~/teacher/Teacher.master" AutoEventWireup="true" CodeFile="studentTaskPaperEA1.aspx.cs" Inherits="teacher_studentTaskPaperEA" Title="计软院论文管理系统－学生任务书审批及导出" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   
    <asp:Panel ID="Panel1" runat="server" GroupingText="学生任务书批改" Height="50px" Width="900px" BackImageUrl="~/images/背景.jpg">
        &nbsp;<table width="850">
            <caption>
                <span style="font-size: 16pt; font-family: 华文行楷; "><strong>
                    学生任务书批改</strong></span></caption>
            <tr>
                <td style="width: 153px; height: 18px">
                    <span style="font-size: 10.5pt; font-family: 宋体; mso-bidi-font-family: 'Times New Roman';
                        mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA;
                        mso-font-kerning: 1.0pt">所在院、系</span></td>
                <td colspan="2" style="height: 18px">
                    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label></td>
                <td style="width: 83px; height: 18px">
                    <span style="font-size: 10.5pt; font-family: 宋体; mso-bidi-font-family: 'Times New Roman';
                        mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA;
                        mso-font-kerning: 1.0pt">专业</span></td>
                <td colspan="2" style="height: 18px">
                    <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label></td>
            </tr>
            <tr>
                <td style="width: 153px">
                    <span style="font-size: 10.5pt; font-family: 宋体; mso-bidi-font-family: 'Times New Roman';
                        mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA;
                        mso-font-kerning: 1.0pt">学生姓名</span></td>
                <td style="width: 100px">
                    <asp:Label ID="Label3" runat="server" Text="Label"></asp:Label></td>
                <td style="width: 100px">
                    <span style="font-size: 10.5pt; font-family: 宋体; mso-bidi-font-family: 'Times New Roman';
                        mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA;
                        mso-font-kerning: 1.0pt; mso-bidi-font-weight: bold">学号</span></td>
                <td style="width: 83px">
                    <asp:Label ID="Label4" runat="server" Text="Label"></asp:Label></td>
                <td style="width: 100px">
                    <span style="font-size: 10.5pt; font-family: 宋体; mso-bidi-font-family: 'Times New Roman';
                        mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA;
                        mso-font-kerning: 1.0pt">班级</span></td>
                <td style="width: 147px">
                    <asp:Label ID="Label5" runat="server" Text="Label"></asp:Label></td>
            </tr>
            <tr>
                <td style="width: 153px">
                    <span style="font-size: 10.5pt; font-family: 宋体; mso-bidi-font-family: 'Times New Roman';
                        mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA;
                        mso-font-kerning: 1.0pt">论文时间（统一）</span></td>
                <td colspan="5">
                    <asp:Label ID="Label6" runat="server" Text="Label"></asp:Label></td>
            </tr>
            <tr>
                <td style="width: 153px; height: 20px">
                    <span style="font-size: 10.5pt; font-family: 宋体; mso-bidi-font-family: 'Times New Roman';
                        mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA;
                        mso-font-kerning: 1.0pt">提交论文时间（统一）</span></td>
                <td colspan="2" style="height: 20px">
                    <asp:Label ID="Label7" runat="server" Text="Label"></asp:Label></td>
                <td style="width: 83px; height: 20px">
                    <span style="font-size: 10pt">指导教师</span></td>
                <td colspan="2" style="height: 20px">
                    <asp:Label ID="Label8" runat="server" Text="Label"></asp:Label></td>
            </tr>
            <tr>
                <td style="width: 153px;">
                    <span style="font-size: 10.5pt; font-family: 宋体; mso-bidi-font-family: 'Times New Roman';
                        mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA;
                        mso-font-kerning: 1.0pt"><span style="font-size: 10.5pt; font-family: 宋体; mso-bidi-font-family: 'Times New Roman';
                            mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA;
                            mso-font-kerning: 1.0pt">论文题目</span></span></td>
                <td colspan="5">
                    <asp:Label ID="Label9" runat="server" Text="Label"></asp:Label></td>
            </tr>
            <tr>
                <td rowspan="3" style="width: 153px">
                    <span style="font-size: 10.5pt; font-family: 宋体; mso-bidi-font-family: 'Times New Roman';
                        mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA;
                        mso-font-kerning: 1.0pt"><span style="font-family: 宋体; mso-bidi-font-size: 10.5pt">题目性质<span
                            lang="EN-US"><?xml namespace="" ns="urn:schemas-microsoft-com:office:office" prefix="o" ?><?xml
                                namespace="" prefix="o" ?><?xml namespace="" prefix="o" ?><o:p></o:p></span></span><span
                                    style="font-size: 10.5pt; font-family: 宋体; mso-bidi-font-family: 'Times New Roman';
                                    mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA;
                                    mso-font-kerning: 1.0pt">及来源</span></span></td>
                <td style="width: 100px; height: 40px">
                    <span style="font-size: 10.5pt; font-family: 宋体; mso-bidi-font-family: 'Times New Roman';
                        mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA;
                        mso-font-kerning: 1.0pt"><span style="mso-spacerun: yes">&nbsp;</span>性质</span></td>
                <td colspan="4" style="height: 40px">
                    <asp:RadioButtonList ID="RadioButtonList1" runat="server" Enabled="False" RepeatDirection="Horizontal">
                        <asp:ListItem>理论研究</asp:ListItem>
                        <asp:ListItem>应用研究</asp:ListItem>
                        <asp:ListItem>技术开发</asp:ListItem>
                        <asp:ListItem>其他</asp:ListItem>
                    </asp:RadioButtonList></td>
            </tr>
            <tr>
                <td rowspan="2" style="width: 100px">
                    <span style="font-size: 10.5pt; font-family: 宋体; mso-bidi-font-family: 'Times New Roman';
                        mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA;
                        mso-font-kerning: 1.0pt">来源</span></td>
                <td style="width: 100px; height: 14px">
                    <span style="font-size: 10.5pt; font-family: 宋体; mso-bidi-font-family: 'Times New Roman';
                        mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA;
                        mso-font-kerning: 1.0pt">项目名称</span></td>
                <td colspan="3" style="height: 14px">
                    <asp:Label ID="Label10" runat="server" Text="Label"></asp:Label></td>
            </tr>
            <tr>
                <td style="width: 100px; height: 14px">
                    <span style="font-size: 10.5pt; font-family: 宋体; mso-bidi-font-family: 'Times New Roman';
                        mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA;
                        mso-font-kerning: 1.0pt">任务下达部门</span></td>
                <td style="width: 83px; height: 14px">
                    <asp:Label ID="Label11" runat="server" Text="Label"></asp:Label></td>
                <td style="width: 100px; height: 14px">
                    <span style="font-size: 10.5pt; font-family: 宋体; mso-bidi-font-family: 'Times New Roman';
                        mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA;
                        mso-font-kerning: 1.0pt">项目编号</span></td>
                <td style="width: 147px; height: 14px">
                    <asp:Label ID="Label12" runat="server" Text="Label"></asp:Label></td>
            </tr>
            <tr>
                <td style="width: 153px; height: 95px">
                    <span style="font-size: 10.5pt; font-family: 宋体; mso-bidi-font-family: 'Times New Roman';
                        mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA;
                        mso-font-kerning: 1.0pt">主要内容</span></td>
                <td colspan="5" style="height: 95px">
                    <asp:TextBox ID="TextBox1" runat="server" Height="75px" TextMode="MultiLine" Width="700px" ReadOnly="True"></asp:TextBox></td>
            </tr>
            <tr>
                <td style="width: 153px; height: 20px">
                    <span style="font-size: 10.5pt; font-family: 宋体; mso-bidi-font-family: 'Times New Roman';
                        mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA;
                        mso-font-kerning: 1.0pt">论文目标</span></td>
                <td colspan="5" style="height: 20px">
                    <asp:TextBox ID="TextBox2" runat="server" Height="75px" ReadOnly="True" Width="700px" TextMode="MultiLine"></asp:TextBox></td>
            </tr>
            <tr>
                <td style="width: 153px">
                    <span style="font-size: 10.5pt; font-family: 宋体; mso-bidi-font-family: 'Times New Roman';
                        mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA;
                        mso-font-kerning: 1.0pt">指定参考文献</span></td>
                <td colspan="5">
                    <asp:TextBox ID="TextBox3" runat="server" Height="75px" ReadOnly="True" Width="700px" TextMode="MultiLine"></asp:TextBox></td>
            </tr>
            <tr>
                <td style="width: 153px; height: 15px">
                    <span style="font-size: 10.5pt; font-family: 宋体; mso-bidi-font-family: 'Times New Roman';
                        mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA;
                        mso-font-kerning: 1.0pt">备注</span></td>
                <td colspan="5" style="height: 15px">
                    <asp:TextBox ID="TextBox4" runat="server" Height="75px" ReadOnly="True" Width="700px" TextMode="MultiLine"></asp:TextBox></td>
            </tr>
            <tr>
                <td style="width: 153px; height: 15px">
                    是否通过</td>
                <td colspan="5" style="height: 15px">
                    <asp:RadioButtonList ID="RadioButtonList2" runat="server" RepeatDirection="Horizontal">
                        <asp:ListItem Selected="True">是</asp:ListItem>
                        <asp:ListItem Selected="True">否</asp:ListItem>
                    </asp:RadioButtonList></td>
            </tr>
            <tr>
                <td style="width: 153px; height: 15px">
                    具体意见</td>
                <td colspan="5" style="height: 15px">
                    <asp:TextBox ID="TextBox5" runat="server" Height="75px" Width="700px" TextMode="MultiLine"></asp:TextBox></td>
            </tr>
            <tr>
                <td colspan="6" style="height: 15px; text-align: center">
                    <asp:Button ID="Button1" runat="server" BackColor="#C0FFFF" BorderColor="Blue" ForeColor="Blue"
                        OnClick="Button1_Click" Text="发送审批意见" />
                    <asp:Button ID="Button2" runat="server" BackColor="#C0FFFF" BorderColor="Blue" ForeColor="Blue"
                        OnClick="Button2_Click" Text="导出为文档"  /><br />
                    <asp:Label ID="Label13" runat="server"></asp:Label></td>
            </tr>
        </table>
    </asp:Panel>
</asp:Content>

