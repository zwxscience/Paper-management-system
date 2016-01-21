<%@ Page Language="C#" MasterPageFile="~/teacher/teacher.master" AutoEventWireup="true" CodeFile="passwordModify.aspx.cs" Inherits="admin_passwordModify" Title="计软院论文管理系统-教师密码修改" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    &nbsp;<table border="0" style="background-image: url(../images/背景.jpg)">
        <caption style="background-image: url(../images/背景.jpg)">
            <strong><span style="font-size: 16pt; font-family: 华文行楷;">密码更改</span></strong></caption>
        <tr>
            <td style="width: 100px; height: 16px;">
                密码：</td>
            <td style="width: 100px; height: 16px;">
                <asp:TextBox ID="oldpassword" runat="server" TextMode="Password" MaxLength="25" ToolTip="不要超过最大字数25"></asp:TextBox></td>
            <td style="width: 125px; height: 16px;">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="oldpassword"
                    ErrorMessage="*请输入密码"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td style="width: 100px; height: 16px;">
                新密码：</td>
            <td style="width: 100px; height: 16px;">
                <asp:TextBox ID="newpassword" runat="server" TextMode="Password" MaxLength="25" ToolTip="不要超过最大字数25"></asp:TextBox></td>
            <td style="width: 125px; height: 16px;">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="newpassword"
                    ErrorMessage="*请输入新密码"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td style="width: 100px; height: 28px;">
                确认新密码:</td>
            <td style="width: 100px; height: 28px;">
                <asp:TextBox ID="confirmNewPassword" runat="server" TextMode="Password" MaxLength="25" ToolTip="不要超过最大字数25"></asp:TextBox></td>
            <td style="width: 125px; height: 28px;">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="confirmNewPassword"
                    ErrorMessage="*请再次输入新密码"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td colspan="3">
                <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage='*"确认新密码"与"新密码"项必须匹配' ControlToCompare="newpassword" ControlToValidate="confirmNewPassword"></asp:CompareValidator></td>
        </tr>
        <tr>
            <td style="width: 100px">
            </td>
            <td style="width: 100px">
                <asp:Button ID="change" runat="server" OnClick="change_Click" Text="更改" BackColor="#80FFFF" BorderColor="Blue" ForeColor="Blue" />&nbsp;<asp:Button
                    ID="cancel" runat="server" OnClick="cancel_Click" Text="取消"  BackColor="#80FFFF" BorderColor="Blue" ForeColor="Blue"/></td>
            <td style="width: 125px">
            </td>
        </tr>
    </table>
    <br />
    <asp:Label ID="message" runat="server"></asp:Label>
</asp:Content>

