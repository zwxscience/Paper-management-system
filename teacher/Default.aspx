<%@ Page Language="C#" MasterPageFile="Teacher.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="teacher_Default" Title="计软院论文管理系统-教师个人信息" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Panel ID="Panel1" runat="server" GroupingText="教师基本信息 " Height="113px" Width="700px" BackImageUrl="~/images/背景.jpg">
        
        <table  style=" height: 180px;" width="650" >
            <caption>
                <strong><span style="font-size: 16pt; font-family: 华文行楷;">教师基本信息</span></strong></caption>
            <tr>
                <td style="width: 100px; height: 46px; text-align: left">
                    <asp:Label ID="Label1" runat="server" Width="120px">教师号：</asp:Label></td>
                <td style="width: 100px; height: 46px; text-align: left">
                    <asp:Label ID="Label2" runat="server" Width="120px">姓名：</asp:Label></td>
                <td style="width: 100px; height: 46px; text-align: left">
                    <asp:Label ID="Label3" runat="server" Width="110px">权限：</asp:Label></td>
                <td rowspan="2" style="width: 100px">
                    <asp:Image ID="Image1" runat="server" Height="96px" Width="128px" /></td>
            </tr>
            <tr>
                <td style="width: 100px; text-align: left">
                    <asp:Label ID="Label4" runat="server" Width="120px">性别：</asp:Label></td>
                <td style="width: 100px; text-align: left">
                    <asp:Label ID="Label5" runat="server" Width="120px">出生年月：</asp:Label></td>
                <td style="width: 100px; text-align: left;">
                    <asp:Label ID="Label6" runat="server" Width="110px">年龄：</asp:Label></td>
            </tr>
            <tr>
                <td style="width: 100px; height: 14px; text-align: left">
                    <asp:Label ID="Label9" runat="server" Width="120px">职位：</asp:Label></td>
                <td style="width: 100px; height: 14px; text-align: left">
                    <asp:Label ID="Label7" runat="server" Width="120px">部门： </asp:Label></td>
                <td style="width: 100px; height: 14px; text-align: left">
                    <asp:Label ID="Label8" runat="server" Width="110px">职称：</asp:Label></td>
                <td style="width: 100px; height: 14px">
                    <asp:FileUpload ID="FileUpload1" runat="server" BackColor="#80FFFF" BorderColor="Blue" ForeColor="Blue" Width="30px" />
                </td>
            </tr>
            <tr>
                <td style="width: 100px; text-align: left; height: 30px;">
                    <asp:Label ID="Label10" runat="server" Width="120px">Email： </asp:Label></td>
                <td style="width: 100px; text-align: left; height: 30px;">
                    </td>
                <td style="width: 100px; height: 30px;">
                </td>
                <td style="width: 100px; height: 30px;">
                    <asp:Button ID="Button2" runat="server" Text="加载" 
BackColor="#80FFFF" BorderColor="Blue" ForeColor="Blue" OnClick="Button2_Click"  /></td>
            </tr>
        </table>
    </asp:Panel>
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;<asp:Panel
        ID="Panel2" runat="server" GroupingText="信息公告" Height="111px"
        Width="700px">
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True"
            AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="None"
            BorderWidth="1px" Caption="信息公告" CellPadding="3" DataKeyNames="id" DataSourceID="SqlDataSource1"
            EmptyDataText="暂无公告" GridLines="Vertical" OnSelectedIndexChanged="GridView1_SelectedIndexChanged"
            PageSize="5" Width="650px">
            <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
            <Columns>
                <asp:BoundField DataField="admin_Name" HeaderText="发布者" SortExpression="admin_Name" />
                <asp:TemplateField HeaderText="主题" SortExpression="topic">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("topic") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("topic") %>' Width="180px"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="时间" SortExpression="time">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("time") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("time", "{0:d}") %>' Width="60px"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:HyperLinkField DataNavigateUrlFields="id" DataNavigateUrlFormatString="~/Bulletin.aspx?id={0}"
                    HeaderText="查看" Target="_blank" Text="详细" />
               
            </Columns>
            <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
            <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
            <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
            <AlternatingRowStyle BackColor="Gainsboro" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:paperDataBase %>"
            SelectCommand="SELECT * FROM [Bulletin] ORDER BY [time] DESC"></asp:SqlDataSource>
    </asp:Panel>
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
</asp:Content>

