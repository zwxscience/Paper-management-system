<%@ Page Language="C#" MasterPageFile="~/teacher/Teacher.master" AutoEventWireup="true" CodeFile="departExamine1.aspx.cs" Inherits="teacher_departExamine" Title="计软院论文管理系统-系领导审核" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Panel ID="Panel1" runat="server" GroupingText="系领导审核" Height="50px" Width="900px" BackImageUrl="~/images/背景.jpg">
        &nbsp;<table border="1"  style=" border-collapse:separate" width="850">
            <caption >
                <span style="font-size: 16pt; font-family: 华文行楷;"><strong>系领导审核</strong></span></caption>
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
                    <span style="font-size: 10pt;">
                        <asp:Label ID="Label1" runat="server"></asp:Label></span></td>
            </tr>
            <tr style="font-size: 10pt">
                <td rowspan="3" style="width: 100px">
                    <span style="font-size: 12px; font-family: 宋体; mso-bidi-font-family: 宋体;
                        mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA">
                        题目性质及来源</span></td>
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
                <td style="width: 166px">
                    <span style="font-size: 12px; font-family: 宋体; mso-bidi-font-family: 宋体; mso-ansi-language: EN-US;
                        mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA">任务下达部门:<asp:Label ID="Label6"
                            runat="server"></asp:Label></span></td>
                <td style="width: 249px">
                    <span style="font-size: 12px; font-family: 宋体; mso-bidi-font-family: 宋体; mso-ansi-language: EN-US;
                        mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA">项目编号:<asp:Label ID="Label7"
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
            <tr>
                <td style="width: 100px; height: 8px">
                    是否通过</td>
                <td colspan="3" style="height: 8px; text-align: center;">
                    <asp:RadioButtonList ID="RadioButtonList1" runat="server" BackColor="#C0FFFF" BorderColor="Blue"
                        ForeColor="Blue" RepeatDirection="Horizontal">
                        <asp:ListItem Selected="True" Value="Y">是</asp:ListItem>
                        <asp:ListItem Value="N" Selected="True">否</asp:ListItem>
                    </asp:RadioButtonList></td>
            </tr>
            <tr>
                <td style="width: 100px; height: 58px">
                    具体意见</td>
                <td colspan="3" style="height: 58px">
                    <asp:TextBox ID="TextBox7" runat="server" Height="70px" TextMode="MultiLine" Width="700px"></asp:TextBox></td>
            </tr>
        </table>
        <div style="text-align:center">
        <asp:Button ID="Button3" runat="server" BackColor="#C0FFFF" BorderColor="Blue" ForeColor="Blue"
             Text="填写审核意见" OnClick="Button3_Click" />
                    <asp:Button ID="Button2" runat="server" BackColor="#C0FFFF" BorderColor="Blue" ForeColor="Blue"
                        Text="取消" OnClick="Button2_Click" />
            <br />
        </div></asp:Panel>
</asp:Content>

