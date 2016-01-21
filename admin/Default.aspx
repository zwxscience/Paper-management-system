<%@ Page Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="admin_Default" Title="计软院论文管理系统-管理员信息" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<script language="javascript" type="text/javascript">
// <!CDATA[

function TABLE1_onclick() {

}

// ]]>
</script>

    <div style="text-align: center">
        <table >
            <caption>
                <strong><span style="font-size: 16pt; font-family: 华文行楷">
                管理员基本信息</span></strong></caption>
            <tr>
                <td style="width: 100px">
                    管理员账号：<asp:Label ID="admin_ID" runat="server" Text="Label"></asp:Label></td>
                <td style="width: 100px">
                    <asp:Image ID="Image1" runat="server" ImageUrl="~/headphoto/boyDefault.jpg" /></td>
            </tr>
        </table>
        &nbsp;
        <asp:Panel ID="Panel2" runat="server" GroupingText="信息公告" Height="111px"
            Width="543px">
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True"
                AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="None"
                BorderWidth="1px" Caption="信息公告" CellPadding="3" DataKeyNames="id" DataSourceID="SqlDataSource1"
                EmptyDataText="暂无公告" GridLines="Vertical"
                PageSize="5" Width="500px">
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
                    <asp:CommandField ButtonType="Button" ShowDeleteButton="True">
                        <ControlStyle BackColor="#C0FFFF" BorderColor="Blue" />
                    </asp:CommandField>
                </Columns>
                <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
                <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
                <AlternatingRowStyle BackColor="Gainsboro" />
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:paperDataBase %>"
                SelectCommand="SELECT * FROM [Bulletin] ORDER BY [time] DESC" DeleteCommand="DELETE FROM [Bulletin] WHERE [id] = @id" InsertCommand="INSERT INTO [Bulletin] ([admin_ID], [admin_Name], [topic], [content], [time]) VALUES (@admin_ID, @admin_Name, @topic, @content, @time)" UpdateCommand="UPDATE [Bulletin] SET [admin_ID] = @admin_ID, [admin_Name] = @admin_Name, [topic] = @topic, [content] = @content, [time] = @time WHERE [id] = @id">
                <DeleteParameters>
                    <asp:Parameter Name="id" Type="Int32" />
                </DeleteParameters>
                <UpdateParameters>
                    <asp:Parameter Name="admin_ID" Type="String" />
                    <asp:Parameter Name="admin_Name" Type="String" />
                    <asp:Parameter Name="topic" Type="String" />
                    <asp:Parameter Name="content" Type="String" />
                    <asp:Parameter Name="time" Type="DateTime" />
                    <asp:Parameter Name="id" Type="Int32" />
                </UpdateParameters>
                <InsertParameters>
                    <asp:Parameter Name="admin_ID" Type="String" />
                    <asp:Parameter Name="admin_Name" Type="String" />
                    <asp:Parameter Name="topic" Type="String" />
                    <asp:Parameter Name="content" Type="String" />
                    <asp:Parameter Name="time" Type="DateTime" />
                </InsertParameters>
            </asp:SqlDataSource>
        </asp:Panel>
        <br />
    </div>
</asp:Content>

