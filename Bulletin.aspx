<%@ Page Language="C#" MasterPageFile="~/public.master" AutoEventWireup="true" CodeFile="Bulletin.aspx.cs" Inherits="Bulletin" Title="计软院论文管理系统-公告查看" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Panel ID="Panel1" runat="server" GroupingText="信息公告发布" Height="157px" Width="900px">

        <table width="850">
            <caption>
                <span style="font-size: 16pt; font-family: 华文行楷">公告查看</span></caption>
            <tr>
                <td style="height: 16px; background-image: url(images/list_bg.gif); background-repeat: repeat-x;" colspan="4">
                    <asp:Label ID="Label1" runat="server" Text="Label" Font-Size="20pt"></asp:Label>
                    
                    </td>
            </tr>
            <tr>
                <td style="width: 244px">
                    发布者：</td>
                <td style="width: 100px">
                    <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
                    </td>
                        
                <td style="width: 100px">
                    发布时间</td>
                <td style="width: 211px">
                    <asp:Label ID="Label3" runat="server" Text="Label"></asp:Label>
                        </td>
            </tr>
            <tr>
                <td colspan="4">
                <%=content %>
                </td>
            </tr>
            <tr>
            </tr>
        </table>
   
    </asp:Panel>
</asp:Content>

