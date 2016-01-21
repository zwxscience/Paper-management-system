<%@ Page Language="C#" MasterPageFile="Student.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="student_Default" Title="计软院论文管理系统-学生基本信息" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Panel ID="Panel1" runat="server" GroupingText="学生基本信息 " Height="113px" Width="700px" BackImageUrl="~/images/背景.jpg" >
        <table style="height: 180px;" width="650">
            <caption>
                <strong><span style="font-size: 16pt; font-family: 华文行楷;">学生基本信息</span></strong></caption>
            <tr>
                <td style="width: 100px; height: 46px; text-align: left">
                    <asp:Label ID="Label2" runat="server" Width="120px">学号：</asp:Label></td>
                <td style="width: 100px; height: 46px; text-align: left">
                    <asp:Label ID="Label3" runat="server" Width="120px">姓名：</asp:Label></td>
                <td style="width: 100px; height: 46px; text-align: left">
                    <asp:Label ID="Label4" runat="server" Width="110px">出生日期：</asp:Label></td>
                <td rowspan="3" style="width: 100px">
                    <asp:Image ID="Image2" runat="server" Height="96px" Width="128px" />&nbsp;</td>
            </tr>
            <tr>
                <td style="width: 100px; text-align: left">
                    <asp:Label ID="Label5" runat="server" Width="120px">性别：</asp:Label></td>
                <td style="width: 100px; text-align: left">
                    <asp:Label ID="Label6" runat="server" Width="120px">籍贯：</asp:Label></td>
                <td style="width: 100px; text-align: left">
                    <asp:Label ID="Label7" runat="server" Width="110px">入学年月：</asp:Label></td>
            </tr>
            <tr>
                <td style="width: 100px; height: 14px; text-align: left">
                    <asp:Label ID="Label9" runat="server" Width="120px">民族：</asp:Label></td>
                <td style="width: 100px; height: 14px; text-align: left">
                    <asp:Label ID="Label8" runat="server" Width="120px">专业： </asp:Label></td>
                <td style="width: 100px; height: 14px; text-align: left">
                    <asp:Label ID="Label11" runat="server" Text="专业方向：" Width="110px"></asp:Label></td>
            </tr>
            <tr>
                <td style="width: 100px; height: 30px; text-align: left">
                    <asp:Label ID="Label12" runat="server" Text="学院：" Width="122px"></asp:Label></td>
                <td style="width: 100px; height: 30px; text-align: left">
                    <asp:Label ID="Label13" runat="server" Text="班级：" Width="120px"></asp:Label></td>
                <td style="width: 100px; height: 30px; text-align: left">
                    <asp:Label ID="Label14" runat="server" Text="身份证号：" Width="126px"></asp:Label></td>
                <td style="width: 100px; height: 30px">
                    <asp:FileUpload ID="FileUpload1" runat="server" BackColor="#80FFFF" BorderColor="Blue"
                        ForeColor="Blue" Width="30px" /></td>
            </tr>
            <tr>
                <td style="width: 100px; height: 19px; text-align: left">
                    <asp:Label ID="Label15" runat="server" Text="年级：" Width="122px"></asp:Label></td>
                <td style="width: 100px; height: 19px; text-align: left">
                    <asp:Label ID="Label16" runat="server" Text="电话：" Width="120px"></asp:Label></td>
                <td style="width: 100px; height: 19px; text-align: left">
                    <asp:Label ID="Label10" runat="server" Width="120px">Email:</asp:Label></td>
                <td style="width: 100px; height: 19px">
                    <asp:Button ID="Button2" runat="server" BackColor="#C0FFFF" BorderColor="Blue" ForeColor="Blue"
                        OnClick="Button2_Click" Text="加载" /></td>
            </tr>
        </table>
    </asp:Panel>
    <br />
    <asp:Panel ID="Panel2" runat="server" GroupingText="信息公告" Height="111px"
        Width="700px">
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True"
            AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="None"
            BorderWidth="1px" Caption="信息公告" CellPadding="3" DataSourceID="SqlDataSource1"
            EmptyDataText="暂无公告" PageSize="5" Width="650px" GridLines="Vertical" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
            <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
            <Columns>
                <asp:BoundField DataField="admin_Name" HeaderText="发布者" SortExpression="admin_Name" />
                <asp:BoundField DataField="topic" HeaderText="主题" SortExpression="topic" />
                <asp:BoundField DataField="time" HeaderText="发布时间" SortExpression="time" />
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

</asp:Content>

