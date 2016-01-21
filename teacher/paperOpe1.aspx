<%@ Page Language="C#" MasterPageFile="~/teacher/Teacher.master" AutoEventWireup="true" CodeFile="paperOpe1.aspx.cs" Inherits="teacher_paperOpe1" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    &nbsp;<asp:Panel ID="Panel1" runat="server" GroupingText="教师出题" Height="111px" Width="900px" BackImageUrl="~/images/背景.jpg">
        <div style="text-align: center" width="500px">
            <table border="1" cellpadding="0" cellspacing="1" style="border-right: #ddd 1px solid;
                border-top: #ddd 1px solid; border-left: #ddd 1px solid; border-bottom: #ddd 1px solid"
                width="850">
                <caption >
                    <span style="font-size: 16pt; font-family: 华文行楷"><strong>教师出题</strong></span></caption>
                <tr>
                    <td style="width: 100px; height: 19px">
                        <span style="font-size: 12px; font-family: 宋体; mso-bidi-font-family: 宋体; mso-ansi-language: EN-US;
                            mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA">论文时间</span></td>
                    <td colspan="3" style="height: 19px">
                        <asp:Label ID="papertime" runat="server" Text="Label"></asp:Label></td>
                </tr>
                <tr>
                    <td style="width: 100px; height: 28px">
                        <span style="font-size: 12px; font-family: 宋体; mso-bidi-font-family: 宋体; mso-ansi-language: EN-US;
                            mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA">论文题目</span></td>
                    <td colspan="3" style="height: 28px">
                        <asp:TextBox ID="papertitle" runat="server" MaxLength="50" ToolTip="不要超过最大字数50"></asp:TextBox></td>
                </tr>
                <tr>
                    <td rowspan="3" style="width: 100px">
                        <span style="font-size: 12px; font-family: 宋体; mso-bidi-font-family: 宋体; mso-ansi-language: EN-US;
                            mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA">题目性质及来源</span></td>
                    <td colspan="3" style="height: 33px">
                        <span style="font-size: 12px; font-family: 宋体; mso-bidi-font-family: 宋体; mso-ansi-language: EN-US;
                            mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA">性质：<asp:RadioButtonList ID="kind"
                                runat="server" Font-Size="Larger" RepeatDirection="Horizontal">
                                <asp:ListItem Selected="True">理论研究</asp:ListItem>
                                <asp:ListItem>应用研究</asp:ListItem>
                                <asp:ListItem>技术开发</asp:ListItem>
                                <asp:ListItem>其他</asp:ListItem>
                            </asp:RadioButtonList></span></td>
                </tr>
                <tr>
                    <td rowspan="2" style="width: 45px">
                        <span style="font-size: 12px; font-family: 宋体; mso-bidi-font-family: 宋体; mso-ansi-language: EN-US;
                            mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA">来源</span></td>
                    <td colspan="2">
                        <span style="font-size: 12px; font-family: 宋体; mso-bidi-font-family: 宋体; mso-ansi-language: EN-US;
                            mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA">项目名称
                            <asp:TextBox ID="projectName" runat="server" MaxLength="25" ToolTip="不要超过最大字数25"></asp:TextBox></span></td>
                </tr>
                <tr>
                    <td style="width: 100px; height: 34px">
                        <span style="font-size: 12px; font-family: 宋体; mso-bidi-font-family: 宋体; mso-ansi-language: EN-US;
                            mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA">任务下达部门<asp:TextBox ID="project_department"
                                runat="server" MaxLength="25" ToolTip="不要超过最大字数25" Width="78px"></asp:TextBox></span></td>
                    <td style="width: 60px; height: 34px">
                        <span style="font-size: 12px; font-family: 宋体; mso-bidi-font-family: 宋体; mso-ansi-language: EN-US;
                            mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA">项目编号<asp:TextBox ID="projectNumber"
                                runat="server" MaxLength="25" ToolTip="不要超过最大字数25" Width="102px"></asp:TextBox></span></td>
                </tr>
                <tr>
                    <td style="width: 100px; height: 80px">
                        <span style="font-size: 12px; font-family: 宋体; mso-bidi-font-family: 宋体; mso-ansi-language: EN-US;
                            mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA">论文目标</span></td>
                    <td colspan="3" style="height: 80px">
                        <asp:TextBox ID="aim" runat="server" Height="70px" TextMode="MultiLine" Width="700px"></asp:TextBox></td>
                </tr>
                <tr>
                    <td style="width: 100px; height: 45px">
                        <span style="font-size: 12px; font-family: 宋体; mso-bidi-font-family: 宋体; mso-ansi-language: EN-US;
                            mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA">本课题的目的及研究意义</span></td>
                    <td colspan="3" style="height: 45px">
                        <asp:TextBox ID="mean" runat="server" Height="70px" TextMode="MultiLine" Width="700px"></asp:TextBox></td>
                </tr>
                <tr>
                    <td style="width: 100px; height: 13px">
                        <span style="font-size: 12px; font-family: 宋体; mso-bidi-font-family: 宋体; mso-ansi-language: EN-US;
                            mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA">本课题的国内外研究现状</span></td>
                    <td colspan="3" style="height: 13px">
                        <asp:TextBox ID="state" runat="server" Height="70px" TextMode="MultiLine" Width="700px"></asp:TextBox></td>
                </tr>
                <tr>
                    <td style="width: 100px; height: 29px">
                        <span style="font-size: 12px; font-family: 宋体; mso-bidi-font-family: 宋体; mso-ansi-language: EN-US;
                            mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA">本课题研究内容</span></td>
                    <td colspan="3" style="height: 29px">
                        <asp:TextBox ID="content" runat="server" Height="70px" TextMode="MultiLine" Width="700px"></asp:TextBox></td>
                </tr>
                <tr>
                    <td style="width: 100px; height: 29px">
                        进度安排</td>
                    <td colspan="3" style="height: 29px">
                        <asp:TextBox ID="TextBox7" runat="server" Height="70px" TextMode="MultiLine" Width="700px"></asp:TextBox></td>
                </tr>
                <tr>
                    <td style="width: 100px">
                        <span style="font-size: 12px; font-family: 宋体; mso-bidi-font-family: 宋体; mso-ansi-language: EN-US;
                            mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA">指定参考文献</span></td>
                    <td colspan="3">
                        <asp:TextBox ID="refer" runat="server" Height="70px" TextMode="MultiLine" Width="700px"></asp:TextBox></td>
                </tr>
                <tr>
                    <td style="width: 100px">
                        <span style="font-size: 12px; font-family: 宋体; mso-bidi-font-family: 宋体; mso-ansi-language: EN-US;
                            mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA">备注</span></td>
                    <td colspan="3">
                        <asp:TextBox ID="remark" runat="server" Height="50px" TextMode="MultiLine" Width="700px"></asp:TextBox></td>
                </tr>
            </table>
            <asp:Button ID="Button3" runat="server" BackColor="#C0FFFF" BorderColor="Blue" ForeColor="Blue"
                OnClick="Button3_Click1" Text="发布" /><br />
            <br />
        </div>
    </asp:Panel>
    
    <asp:Panel ID="Panel2" runat="server" GroupingText="教师改题" Height="93px" Width="900px" BackImageUrl="~/images/背景.jpg">
        <table border="1" style="border-right: #ddd 1px solid; border-top: #ddd 1px solid;
            border-left: #ddd 1px solid; border-bottom: #ddd 1px solid" width="850">
            <caption >
                <span style="font-size: 16pt; font-family: 华文行楷"><strong>教师改题</strong></span></caption>
            <tr>
                <td style="width: 100px; height: 19px">
                    <span style="font-size: 12px; font-family: 宋体; mso-bidi-font-family: 宋体; mso-ansi-language: EN-US;
                        mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA">论文时间</span></td>
                <td colspan="3" style="height: 19px">
                    <asp:Label ID="period_Mod" runat="server" Text="Label"></asp:Label></td>
            </tr>
            <tr>
                <td style="width: 100px; height: 28px">
                    <span style="font-size: 12px; font-family: 宋体; mso-bidi-font-family: 宋体; mso-ansi-language: EN-US;
                        mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA">论文题目</span></td>
                <td colspan="3" style="height: 28px; text-align: center">
                    <asp:Label ID="Label2" runat="server"></asp:Label>
                    <asp:Button ID="Button1" runat="server" BackColor="#C0C0FF" BorderColor="Blue" ForeColor="Blue"
                        OnClick="Button1_Click" Text="点击获取内容" /></td>
            </tr>
            <tr>
                <td rowspan="3" style="width: 100px">
                    <span style="font-size: 12px; font-family: 宋体; mso-bidi-font-family: 宋体; mso-ansi-language: EN-US;
                        mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA">题目性质及来源</span></td>
                <td colspan="3" style="height: 35px">
                    <span style="font-size: 12px; font-family: 宋体; mso-bidi-font-family: 宋体; mso-ansi-language: EN-US;
                        mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA">性质：<asp:RadioButtonList ID="kind_Mod"
                            runat="server" Font-Size="Larger" RepeatDirection="Horizontal">
                            <asp:ListItem>理论研究</asp:ListItem>
                            <asp:ListItem>应用研究</asp:ListItem>
                            <asp:ListItem>技术开发</asp:ListItem>
                            <asp:ListItem>其他</asp:ListItem>
                        </asp:RadioButtonList></span></td>
            </tr>
            <tr>
                <td rowspan="2" style="width: 45px">
                    <span style="font-size: 12px; font-family: 宋体; mso-bidi-font-family: 宋体; mso-ansi-language: EN-US;
                        mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA">来源</span></td>
                <td colspan="2">
                    <span style="font-size: 12px; font-family: 宋体; mso-bidi-font-family: 宋体; mso-ansi-language: EN-US;
                        mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA">项目名称
                        <asp:TextBox ID="projectName_Mod" runat="server"></asp:TextBox></span></td>
            </tr>
            <tr>
                <td style="width: 100px">
                    <span style="font-size: 12px; font-family: 宋体; mso-bidi-font-family: 宋体; mso-ansi-language: EN-US;
                        mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA">任务下达部门<asp:TextBox ID="projectDpart_Mod"
                            runat="server" Width="78px"></asp:TextBox></span></td>
                <td style="width: 55px">
                    <span style="font-size: 12px; font-family: 宋体; mso-bidi-font-family: 宋体; mso-ansi-language: EN-US;
                        mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA">项目编号<asp:TextBox ID="projectNum_Mod"
                            runat="server" Width="102px"></asp:TextBox></span></td>
            </tr>
            <tr>
                <td style="width: 100px">
                    <span style="font-size: 12px; font-family: 宋体; mso-bidi-font-family: 宋体; mso-ansi-language: EN-US;
                        mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA">论文目标</span></td>
                <td colspan="3">
                    <asp:TextBox ID="aim_Mod" runat="server" Height="70px" TextMode="MultiLine" Width="700px"></asp:TextBox></td>
            </tr>
            <tr>
                <td style="width: 100px; height: 42px">
                    <span style="font-size: 12px; font-family: 宋体; mso-bidi-font-family: 宋体; mso-ansi-language: EN-US;
                        mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA">本课题的目的及研究意义</span></td>
                <td colspan="3" style="height: 42px">
                    <asp:TextBox ID="mean_Mod" runat="server" Height="70px" TextMode="MultiLine" Width="700px"></asp:TextBox></td>
            </tr>
            <tr>
                <td style="width: 100px; height: 13px">
                    <span style="font-size: 12px; font-family: 宋体; mso-bidi-font-family: 宋体; mso-ansi-language: EN-US;
                        mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA">本课题的国内外研究现状</span></td>
                <td colspan="3" style="height: 13px">
                    <asp:TextBox ID="state_Mod" runat="server" Height="70px" TextMode="MultiLine" Width="700px"></asp:TextBox></td>
            </tr>
            <tr>
                <td style="width: 100px; height: 29px">
                    <span style="font-size: 12px; font-family: 宋体; mso-bidi-font-family: 宋体; mso-ansi-language: EN-US;
                        mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA">本课题研究内容</span></td>
                <td colspan="3" style="height: 29px">
                    <asp:TextBox ID="cont_Mod" runat="server" Height="70px" TextMode="MultiLine" Width="700px"></asp:TextBox></td>
            </tr>
            <tr>
                <td style="width: 100px; height: 29px">
                    进度安排</td>
                <td colspan="3" style="height: 29px">
                    <asp:TextBox ID="TextBox8" runat="server" Height="70px" TextMode="MultiLine" Width="700px"></asp:TextBox></td>
            </tr>
            <tr>
                <td style="width: 100px">
                    <span style="font-size: 12px; font-family: 宋体; mso-bidi-font-family: 宋体; mso-ansi-language: EN-US;
                        mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA">指定参考文献</span></td>
                <td colspan="3">
                    <asp:TextBox ID="ref_Mod" runat="server" Height="70px" TextMode="MultiLine" Width="700px"></asp:TextBox></td>
            </tr>
            <tr>
                <td style="width: 100px">
                    <span style="font-size: 12px; font-family: 宋体; mso-bidi-font-family: 宋体; mso-ansi-language: EN-US;
                        mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA">备注</span></td>
                <td colspan="3">
                    <asp:TextBox ID="remark_Mod" runat="server" Height="50px" TextMode="MultiLine" Width="700px"></asp:TextBox></td>
            </tr>
        </table>
        <br />
        <asp:Button ID="Button9" runat="server" BackColor="#C0FFFF" BorderColor="Blue" ForeColor="Blue"
            OnClick="Button9_Click" Text="修改" />
</asp:Panel>
 <asp:Panel ID="Panel5" runat="server" BackImageUrl="~/images/背景.jpg" Width="900px" Height="28px" >
    <asp:Label id="message"  runat="server"></asp:Label></asp:Panel>
    
    <asp:Panel ID="Panel4" runat="server" GroupingText="教师查题" Height="50px" Width="900px" BackImageUrl="~/images/背景.jpg">
        <table border="1" style="border-right: #ddd 1px solid; border-top: #ddd 1px solid;
            border-left: #ddd 1px solid; border-bottom: #ddd 1px solid" width="850">
            <caption >
                <span style="font-size: 16pt; font-family: 华文行楷"><strong>教师查题</strong></span></caption>
            <tr>
                <td style="width: 100px; height: 19px">
                    <span style="font-size: 12px; font-family: 宋体; mso-bidi-font-family: 宋体; mso-ansi-language: EN-US;
                        mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA">论文时间</span></td>
                <td colspan="3" style="height: 19px">
                    <asp:Label ID="Label3" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td style="width: 100px; height: 28px">
                    <span style="font-size: 12px; font-family: 宋体; mso-bidi-font-family: 宋体; mso-ansi-language: EN-US;
                        mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA">论文题目</span></td>
                <td colspan="3" style="height: 28px">
                    <asp:Label ID="Label1" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td rowspan="3" style="width: 100px">
                    <span style="font-size: 12px; font-family: 宋体; mso-bidi-font-family: 宋体; mso-ansi-language: EN-US;
                        mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA">题目性质及来源</span></td>
                <td colspan="3" style="height: 36px">
                    <span style="font-size: 12px; font-family: 宋体; mso-bidi-font-family: 宋体; mso-ansi-language: EN-US;
                        mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA">性质：
                        <asp:Label ID="Label4" runat="server"></asp:Label></span></td>
            </tr>
            <tr>
                <td rowspan="2" style="width: 45px">
                    <span style="font-size: 12px; font-family: 宋体; mso-bidi-font-family: 宋体; mso-ansi-language: EN-US;
                        mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA">来源</span></td>
                <td colspan="2">
                    <span style="font-size: 12px; font-family: 宋体; mso-bidi-font-family: 宋体; mso-ansi-language: EN-US;
                        mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA">项目名称
                        <asp:Label ID="Label5" runat="server"></asp:Label></span></td>
            </tr>
            <tr>
                <td style="width: 100px; height: 44px">
                    <span style="font-size: 12px; font-family: 宋体; mso-bidi-font-family: 宋体; mso-ansi-language: EN-US;
                        mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA">任务下达部门<asp:Label ID="Label6"
                            runat="server"></asp:Label></span></td>
                <td style="width: 254px; height: 44px">
                    <span style="font-size: 12px; font-family: 宋体; mso-bidi-font-family: 宋体; mso-ansi-language: EN-US;
                        mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA">项目编号<asp:Label ID="Label7"
                            runat="server"></asp:Label></span></td>
            </tr>
            <tr>
                <td style="width: 100px; height: 80px">
                    <span style="font-size: 12px; font-family: 宋体; mso-bidi-font-family: 宋体; mso-ansi-language: EN-US;
                        mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA">论文目标</span></td>
                <td colspan="3" style="height: 80px">
                    <asp:TextBox ID="TextBox1" runat="server" Height="70px" ReadOnly="True" TextMode="MultiLine"
                        Width="700px"></asp:TextBox></td>
            </tr>
            <tr>
                <td style="width: 100px; height: 81px">
                    <span style="font-size: 12px; font-family: 宋体; mso-bidi-font-family: 宋体; mso-ansi-language: EN-US;
                        mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA">本课题的目的及研究意义</span></td>
                <td colspan="3" style="height: 81px">
                    <asp:TextBox ID="TextBox2" runat="server" Height="70px" ReadOnly="True" TextMode="MultiLine"
                        Width="700px"></asp:TextBox></td>
            </tr>
            <tr>
                <td style="width: 100px; height: 80px">
                    <span style="font-size: 12px; font-family: 宋体; mso-bidi-font-family: 宋体; mso-ansi-language: EN-US;
                        mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA">本课题的国内外研究现状</span></td>
                <td colspan="3" style="height: 80px">
                    <asp:TextBox ID="TextBox3" runat="server" Height="70px" ReadOnly="True" TextMode="MultiLine"
                        Width="700px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="width: 100px; height: 80px">
                    <span style="font-size: 12px; font-family: 宋体; mso-bidi-font-family: 宋体; mso-ansi-language: EN-US;
                        mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA">本课题研究内容</span></td>
                <td colspan="3" style="height: 80px">
                    <asp:TextBox ID="TextBox4" runat="server" Height="70px" ReadOnly="True" TextMode="MultiLine"
                        Width="700px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="width: 100px; height: 80px">
                    进度安排</td>
                <td colspan="3" style="height: 80px">
                    <asp:TextBox ID="TextBox9" runat="server" Height="70px" ReadOnly="True" TextMode="MultiLine"
                        Width="700px"></asp:TextBox></td>
            </tr>
            <tr>
                <td style="width: 100px; height: 80px">
                    <span style="font-size: 12px; font-family: 宋体; mso-bidi-font-family: 宋体; mso-ansi-language: EN-US;
                        mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA">指定参考文献</span></td>
                <td colspan="3" style="height: 80px">
                    <asp:TextBox ID="TextBox5" runat="server" Height="70px" ReadOnly="True" TextMode="MultiLine"
                        Width="700px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="width: 100px; height: 58px">
                    <span style="font-size: 12px; font-family: 宋体; mso-bidi-font-family: 宋体; mso-ansi-language: EN-US;
                        mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA">备注</span></td>
                <td colspan="3" style="height: 58px">
                    <asp:TextBox ID="TextBox6" runat="server" Height="50px" ReadOnly="True" TextMode="MultiLine"
                        Width="700px"></asp:TextBox>
                </td>
            </tr>
        </table>
    </asp:Panel>
</asp:Content>

