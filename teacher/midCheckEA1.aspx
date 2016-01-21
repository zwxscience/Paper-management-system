<%@ Page Language="C#" MasterPageFile="~/teacher/Teacher.master" AutoEventWireup="true" CodeFile="midCheckEA1.aspx.cs" Inherits="teacher_midCheckEA1" Title="计软院论文管理系统-中期检查填写及导出" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <asp:Panel ID="Panel1" runat="server" BackImageUrl="~/images/背景.jpg" GroupingText="中期检查"
        Height="153px" Width="900px">
        <table id="TABLE1" onclick="return TABLE1_onclick()" width="850" border="1" style=" border-collapse:separate">
            <caption style="font-size: 16pt; font-family: 华文行楷">
                中期检查<br />
            </caption>
            <tr>
                <td colspan="6" style="height: 17px; text-align: center">
                    <span style="font-size: 10.5pt; font-family: 黑体"><strong>以下是教师的总体</strong></span><span
                        style="font-size: 10.5pt; font-family: 黑体"><strong>评价，对所有同学适用</strong></span></td>
            </tr>
            <tr>
                <td style="width: 100px; height: 17px; text-align: left">
                    院系：</td>
                <td style="width: 100px; height: 17px">
                    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label></td>
                <td style="width: 100px; height: 17px; text-align: left">
                    <span style="font-size: 10pt">所在院系：</span></td>
                <td style="width: 100px; height: 17px">
                    <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label></td>
                <td style="width: 100px; height: 17px; text-align: left">
                    <span style="font-size: 9pt; font-family: 宋体; mso-bidi-font-family: 'Times New Roman';
                        mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA;
                        mso-ascii-font-family: 'Times New Roman'; mso-hansi-font-family: 'Times New Roman';
                        mso-font-kerning: 1.0pt">填写时间：</span></td>
                <td style="font-size: 12px; width: 100px; height: 17px">
                    <asp:Label ID="Label3" runat="server" Text="Label" Width="134px"></asp:Label></td>
            </tr>
            <tr style="font-size: 12px">
                <td style="width: 100px; text-align: left">
                    <span style="font-family: 宋体; mso-bidi-font-family: 'Times New Roman'; mso-ansi-language: EN-US;
                        mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA; mso-ascii-font-family: 'Times New Roman';
                        mso-hansi-font-family: 'Times New Roman'; mso-font-kerning: 1.0pt">教师姓名：</span></td>
                <td style="width: 100px">
                    <asp:Label ID="Label4" runat="server" Text="Label"></asp:Label></td>
                <td style="width: 100px; text-align: left">
                    <span style="font-family: 宋体; mso-bidi-font-family: 'Times New Roman'; mso-ansi-language: EN-US;
                        mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA; mso-ascii-font-family: 'Times New Roman';
                        mso-hansi-font-family: 'Times New Roman'; mso-font-kerning: 1.0pt">指导人数：</span></td>
                <td style="width: 100px">
                    <asp:Label ID="Label5" runat="server" Text="Label"></asp:Label></td>
                <td style="width: 100px; text-align: left">
                    <span style="font-family: 宋体; mso-bidi-font-family: 'Times New Roman'; mso-ansi-language: EN-US;
                        mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA; mso-ascii-font-family: 'Times New Roman';
                        mso-hansi-font-family: 'Times New Roman'; mso-font-kerning: 1.0pt">是否一人一题：</span></td>
                <td style="font-size: 12px; width: 100px">
                    <asp:RadioButtonList ID="RadioButtonList1" runat="server" RepeatDirection="Horizontal">
                        <asp:ListItem Selected="True">是</asp:ListItem>
                        <asp:ListItem>否</asp:ListItem>
                    </asp:RadioButtonList></td>
            </tr>
            <tr style="font-size: 12px">
                <td style="width: 100px; text-align: left">
                    <span style="font-family: 宋体; mso-bidi-font-family: 'Times New Roman'; mso-ansi-language: EN-US;
                        mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA; mso-ascii-font-family: 'Times New Roman';
                        mso-hansi-font-family: 'Times New Roman'; mso-font-kerning: 1.0pt">是否下达了任务：</span></td>
                <td style="width: 100px">
                    <asp:RadioButtonList ID="RadioButtonList2" runat="server" RepeatDirection="Horizontal">
                        <asp:ListItem Selected="True">是</asp:ListItem>
                        <asp:ListItem>否</asp:ListItem>
                    </asp:RadioButtonList></td>
                <td style="width: 100px; text-align: left">
                    <span style="font-family: 宋体; mso-bidi-font-family: 'Times New Roman'; mso-ansi-language: EN-US;
                        mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA; mso-ascii-font-family: 'Times New Roman';
                        mso-hansi-font-family: 'Times New Roman'; mso-font-kerning: 1.0pt">是否要求查阅了外文文献：</span></td>
                <td style="width: 100px">
                    <asp:RadioButtonList ID="RadioButtonList3" runat="server" RepeatDirection="Horizontal">
                        <asp:ListItem Selected="True">是</asp:ListItem>
                        <asp:ListItem>否</asp:ListItem>
                    </asp:RadioButtonList></td>
                <td style="width: 100px; text-align: left">
                    <p class="MsoNormal" style="margin: 0cm 0cm 0pt; text-align: left">
                        <span style="font-family: 宋体; mso-ascii-font-family: 'Times New Roman'; mso-hansi-font-family: 'Times New Roman';
                            mso-bidi-font-size: 10.5pt">是否对每个学生</span><span lang="EN-US" style="mso-bidi-font-size: 10.5pt"><?xml
                                namespace="" ns="urn:schemas-microsoft-com:office:office" prefix="o" ?><?xml namespace=""
                                    prefix="o" ?><?xml namespace="" prefix="o" ?><?xml namespace="" prefix="o" ?><o:p></o:p></span></p>
                    <span style="font-family: 宋体; mso-bidi-font-family: 'Times New Roman'; mso-ansi-language: EN-US;
                        mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA; mso-ascii-font-family: 'Times New Roman';
                        mso-hansi-font-family: 'Times New Roman'; mso-font-kerning: 1.0pt">每周进行了指导：</span></td>
                <td style="font-size: 12px; width: 100px">
                    <asp:RadioButtonList ID="RadioButtonList4" runat="server" RepeatDirection="Horizontal">
                        <asp:ListItem Selected="True">是</asp:ListItem>
                        <asp:ListItem>否</asp:ListItem>
                    </asp:RadioButtonList></td>
            </tr>
            <tr style="font-size: 12px">
                <td style="width: 100px; height: 18px; text-align: left">
                    <span style="font-family: 宋体; mso-bidi-font-family: 'Times New Roman'; mso-ansi-language: EN-US;
                        mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA; mso-ascii-font-family: 'Times New Roman';
                        mso-hansi-font-family: 'Times New Roman'; mso-font-kerning: 1.0pt">总体指导情况：</span></td>
                <td style="font-size: 12px; height: 18px" colspan="5">
                    &nbsp;<asp:RadioButtonList ID="RadioButtonList5" runat="server" RepeatDirection="Horizontal">
                        <asp:ListItem>优秀</asp:ListItem>
                        <asp:ListItem Selected="True">良好</asp:ListItem>
                        <asp:ListItem>中等</asp:ListItem>
                        <asp:ListItem>差</asp:ListItem>
                    </asp:RadioButtonList></td>
            </tr>
            <tr style="font-size: 12px">
                <td style="width: 100px; height: 18px;">
                    <p class="MsoNormal" style="margin: 0cm 0cm 0pt; text-align: left">
                        <span style="font-family: 宋体; mso-ascii-font-family: 'Times New Roman'; mso-hansi-font-family: 'Times New Roman';
                            mso-bidi-font-size: 10.5pt">存在的问题与建议：</span><span lang="EN-US" style="mso-bidi-font-size: 10.5pt"><?xml
                                namespace="" ns="urn:schemas-microsoft-com:office:office" prefix="o" ?><o:p></o:p></span></p>
                </td>
                <td colspan="5" style="height: 18px">
                    <asp:TextBox ID="TextBox1" runat="server" Height="80px" TextMode="MultiLine" Width="750px"></asp:TextBox>
                    <br />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1"
                        ErrorMessage="*问题与建议必须填写"></asp:RequiredFieldValidator></td>
            </tr>
            <tr style="font-size: 12px">
                <td colspan="6">
                    <span style="font-size: 10.5pt; font-family: 黑体; mso-bidi-font-family: 'Times New Roman';
                        mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA;
                        mso-hansi-font-family: 'Times New Roman'; mso-font-kerning: 1.0pt"><strong>以下是对<asp:Label
                            ID="Label6" runat="server" Text="Label"></asp:Label>同学的论文（设计）工作进行评价</strong></span></td>
            </tr>
            <tr style="font-size: 12px">
                <td style="width: 100px; text-align: left">
                    <span style="font-family: 宋体; mso-bidi-font-family: 'Times New Roman'; mso-ansi-language: EN-US;
                        mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA; mso-ascii-font-family: 'Times New Roman';
                        mso-hansi-font-family: 'Times New Roman'; mso-font-kerning: 1.0pt">学生姓名：</span></td>
                <td style="width: 100px">
                    <asp:Label ID="Label7" runat="server" Text="Label"></asp:Label></td>
                <td style="width: 100px">
                    <span style="font-family: 宋体; mso-bidi-font-family: 'Times New Roman'; mso-ansi-language: EN-US;
                        mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA; mso-ascii-font-family: 'Times New Roman';
                        mso-hansi-font-family: 'Times New Roman'; mso-font-kerning: 1.0pt">论文题目：</span></td>
                <td colspan="3" style="font-size: 12px">
                    <asp:Label ID="Label8" runat="server" Text="Label"></asp:Label></td>
            </tr>
            <tr style="font-size: 12px">
                <td colspan="2" style="height: 18px; text-align: left">
                    <span style="font-family: 宋体; mso-bidi-font-family: 'Times New Roman'; mso-ansi-language: EN-US;
                        mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA; mso-ascii-font-family: 'Times New Roman';
                        mso-hansi-font-family: 'Times New Roman'; mso-font-kerning: 1.0pt">题目性质:</span></td>
                <td colspan="4" style="height: 18px; text-align: center;">
                    <span style="font-size: 10.5pt; font-family: 宋体; mso-bidi-font-family: 'Times New Roman';
                        mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA;
                        mso-ascii-font-family: 'Times New Roman'; mso-hansi-font-family: 'Times New Roman';
                        mso-font-kerning: 1.0pt"></span><span style="font-size: 10.5pt; font-family: 宋体;
                            mso-bidi-font-family: 'Times New Roman'; mso-ansi-language: EN-US; mso-fareast-language: ZH-CN;
                            mso-bidi-language: AR-SA; mso-ascii-font-family: 'Times New Roman'; mso-hansi-font-family: 'Times New Roman';
                            mso-font-kerning: 1.0pt">
                            <asp:RadioButtonList ID="RadioButtonList6" runat="server" AutoPostBack="True" RepeatDirection="Horizontal">
                                <asp:ListItem Selected="True">理论研究</asp:ListItem>
                                <asp:ListItem>应用研究</asp:ListItem>
                                <asp:ListItem>技术开发</asp:ListItem>
                                <asp:ListItem>其他</asp:ListItem>
                            </asp:RadioButtonList>
                            <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>&nbsp; </span>
                </td>
            </tr>
            <tr style="font-size: 12px">
                <td colspan="2" style="text-align: left; height: 26px;">
                    <span>选题是否有变化:</span></td>
                <td colspan="4" style="height: 26px">
                    <span style="font-size: 10.5pt; font-family: 宋体; mso-bidi-font-family: 'Times New Roman';
                        mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA;
                        mso-ascii-font-family: 'Times New Roman'; mso-hansi-font-family: 'Times New Roman';
                        mso-font-kerning: 1.0pt">
                        <asp:RadioButtonList ID="RadioButtonList7" runat="server" RepeatDirection="Horizontal">
                            <asp:ListItem>是</asp:ListItem>
                            <asp:ListItem Selected="True">否</asp:ListItem>
                        </asp:RadioButtonList></span></td>
            </tr>
            <tr style="font-size: 12px">
                <td colspan="2" style="text-align: left; height: 30px;">
                    选题是否符合选题原则和要求:</td>
                <td colspan="4" style="font-size: 12px; height: 30px;">
                    <asp:RadioButtonList ID="RadioButtonList8" runat="server" RepeatDirection="Horizontal">
                        <asp:ListItem Selected="True">是</asp:ListItem>
                        <asp:ListItem>否</asp:ListItem>
                    </asp:RadioButtonList></td>
            </tr>
            <tr style="font-size: 12px">
                <td colspan="2" style="height: 1px; text-align: left">
                    对计划的进度完成情况：</td>
                <td colspan="4" style="font-size: 12px; height: 1px">
                    <asp:RadioButtonList ID="RadioButtonList9" runat="server" RepeatDirection="Horizontal">
                        <asp:ListItem>提前完成</asp:ListItem>
                        <asp:ListItem Selected="True">按计划完成</asp:ListItem>
                        <asp:ListItem>延期完成</asp:ListItem>
                        <asp:ListItem>没有完成</asp:ListItem>
                    </asp:RadioButtonList></td>
            </tr>
            <tr style="font-size: 12px">
                <td colspan="2" style="height: 13px; text-align: left">
                    <span style="font-family: 宋体; mso-bidi-font-family: 'Times New Roman'; mso-ansi-language: EN-US;
                        mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA; mso-ascii-font-family: 'Times New Roman';
                        mso-hansi-font-family: 'Times New Roman'; mso-font-kerning: 1.0pt">工作态度情况（学生对毕业论文的认真程度、纪律及出勤情况）：</span></td>
                <td colspan="4" style="font-size: 12px; height: 13px">
                    <asp:RadioButtonList ID="RadioButtonList10" runat="server" RepeatDirection="Horizontal">
                        <asp:ListItem>认真</asp:ListItem>
                        <asp:ListItem Selected="True">较认真</asp:ListItem>
                        <asp:ListItem>一般</asp:ListItem>
                        <asp:ListItem>不认真</asp:ListItem>
                    </asp:RadioButtonList></td>
            </tr>
            <tr style="font-size: 12px">
                <td colspan="2" style="height: 23px; text-align: left">
                    质量评价（学生前期已完成的工作的质量情况）：</td>
                <td colspan="4" style="font-size: 12px; height: 23px">
                    <asp:RadioButtonList ID="RadioButtonList11" runat="server" RepeatDirection="Horizontal">
                        <asp:ListItem>优</asp:ListItem>
                        <asp:ListItem Selected="True">良</asp:ListItem>
                        <asp:ListItem>中</asp:ListItem>
                        <asp:ListItem>差</asp:ListItem>
                    </asp:RadioButtonList></td>
            </tr>
            <tr style="font-size: 12px">
                <td colspan="2" style="height: 17px; text-align: left">
                    建议检查结果：</td>
                <td colspan="4" style="height: 17px">
                    <asp:RadioButtonList ID="RadioButtonList12" runat="server" RepeatDirection="Horizontal">
                        <asp:ListItem>表扬</asp:ListItem>
                        <asp:ListItem Selected="True">通过</asp:ListItem>
                        <asp:ListItem>警告</asp:ListItem>
                        <asp:ListItem>严重警告</asp:ListItem>
                    </asp:RadioButtonList></td>
            </tr>
            <tr style="font-size: 12px">
                <td colspan="2" style="height: 17px; text-align: left">
                </td>
                <td colspan="4" style="height: 17px">
                </td>
            </tr>
        </table>
        <br />
        <asp:Button ID="Button1" runat="server" BackColor="#C0FFFF" BorderColor="Blue" ForeColor="Blue"
            OnClick="Button1_Click" Text="提交" />
        <asp:Button ID="Button2" runat="server" BackColor="#C0FFFF" BorderColor="Blue" ForeColor="Blue"
            OnClick="Button2_Click" Text="导出为文档" /></asp:Panel>
</asp:Content>

