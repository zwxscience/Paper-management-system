<%@ Page Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeFile="issueBulletin.aspx.cs" Inherits="admin_issueBulletin" Title="计软院论文管理系统-公告发布" %>
<%@ Register TagPrefix="ftb" Namespace="FreeTextBoxControls" Assembly="FreeTextBox" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Panel ID="Panel1" runat="server" GroupingText="信息公告发布" Height="243px" Width="675px">
        <table>
            <caption>
                <span style="font-size: 16pt; font-family: 华文行楷 ; " >公告发布</span></caption>
            <tr>
                <td style="width: 4267px; height: 14px">
                    发布者</td>
                <td colspan="3" style="height: 14px; text-align: center; width: 471px;">
                    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label></td>
            </tr>
            <tr>
                <td style="width: 4267px">
                    标题</td>
                <td colspan="3" style="text-align: center; width: 471px;">
                    <asp:TextBox ID="TextBox2" runat="server" Width="317px"></asp:TextBox></td>
            </tr>
            <tr>
                <td style="width: 4267px">
                    内容</td>
                <td colspan="3" style="width: 471px">

                 <FTB:FreeTextBox   id="FreeTextBox1" runat="server"   Width="550px"  ToolbarType="Custom" ImageGalleryPath="FreeTextBox/images//"   ToolbarBackGroundImage="True" ButtonDownImage="True" ButtonPath="FreeTextBox/IMAGES/FTB/office2003/"  AllowHtmlMode="False" HelperFilesPath="FreeTextBox/HelperScripts///" AutoConfigure="Default"  ToolbarLayout="ParagraphMenu,FontFacesMenu,FontSizesMenu,FontForeColorsMenu|Bold,Italic,Underline,Strikethrough;Superscript,Subscript,RemoveFormat|JustifyLeft,JustifyRight,JustifyCenter,JustifyFull;BulletedList,NumberedList,Indent,Outdent;CreateLink,Unlink,InsertImage,InsertRule|Cut,Copy,Paste;Undo,Redo,Print"></FTB:FreeTextBox>

                </td>
            </tr>
            <tr>
                <td colspan="4" style="text-align: center">
                
        <asp:Button ID="Button1" runat="server" BackColor="#8080FF" BorderColor="Blue" ForeColor="Blue"
            OnClick="Button1_Click" Text="发布"   /></td>
            </tr>
        </table>
        </asp:Panel>
</asp:Content>

