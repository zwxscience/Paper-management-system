<%@ Page Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeFile="role_Set.aspx.cs" Inherits="admin_role_Set" Title="计软院论文管理系统-教师权限设定" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Panel ID="student" runat="server" GroupingText="教师权限设定" Height="122px" Width="800px">
        <asp:Label ID="Label1" runat="server" Text="请输入要更改权限的教师姓名:"></asp:Label>
        <asp:TextBox ID="teacherName" runat="server"></asp:TextBox>
        <asp:Button ID="Button1" runat="server" Text="查询"  BackColor="#80FFFF" BorderColor="Blue" ForeColor="Blue" OnClick="Button1_Click"/><br />
        <br />
        
        
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="id"
           DataSourceID = "teacher" AllowPaging="True" AllowSorting="True" BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" CellPadding="3" EmptyDataText="请输入您要查询的教师姓名。" CellSpacing="1" GridLines="None" Width="900px" >
            <Columns>
                <asp:TemplateField HeaderText="教师号" SortExpression="teacher_ID">
                    <EditItemTemplate>
                        &nbsp;<asp:Label ID="Label3" runat="server" Text='<%# Bind("teacher_ID") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("teacher_ID") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="教师姓名" SortExpression="name">
                    <EditItemTemplate>
                        &nbsp;<asp:Label ID="Label4" runat="server" Text='<%# Bind("name") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("name") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="角色" SortExpression="role"　 　>
                    <EditItemTemplate>
                        <asp:DropDownList ID="DropDownList1" runat="server" SelectedValue='<%# Bind("role") %>' >
                            <asp:ListItem>教师</asp:ListItem>
                            <asp:ListItem>系领导</asp:ListItem>
                            <asp:ListItem>院领导</asp:ListItem>
                        </asp:DropDownList>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("role") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="部门" SortExpression="department">
                    <EditItemTemplate>
                        &nbsp;<asp:Label ID="Label1" runat="server" Text='<%# Bind("department") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("department") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="职称" SortExpression="zhicheng">
                    <EditItemTemplate>
                        <asp:Label ID="Label5" runat="server" Text='<%# Bind("zhicheng") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label5" runat="server" Text='<%# Bind("zhicheng") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="职位" SortExpression="position">
                    <EditItemTemplate>
                        <asp:Label ID="Label6" runat="server" Text='<%# Bind("position") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label6" runat="server" Text='<%# Bind("position") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField ShowHeader="False">
                    <EditItemTemplate>
                        <asp:Button ID="Button1" runat="server" CausesValidation="True" CommandName="Update"
                           Text="更新" />&nbsp;<asp:Button ID="Button2" runat="server"
                                CausesValidation="False" CommandName="Cancel" Text="取消" />
                    </EditItemTemplate>
                    <ControlStyle BackColor="#80FFFF" BorderColor="Blue" ForeColor="Blue" />
                    <ItemTemplate>
                        <asp:Button ID="Button1" runat="server" CausesValidation="False" CommandName="Edit"
                            Text="编辑" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
            <RowStyle BackColor="#DEDFDE" ForeColor="Black" />
            <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
            <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" />
        </asp:GridView><asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="id"
           DataSourceID = "SqlDataSource1" AllowPaging="True" AllowSorting="True" BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" CellPadding="3" PageSize="20" EmptyDataText="请输入您要查询的教师姓名。" CellSpacing="1" GridLines="None" Width="900px" >
            <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
            <Columns>
                <asp:TemplateField HeaderText="教师号" SortExpression="teacher_ID">
                    <EditItemTemplate>
                        &nbsp;<asp:Label ID="Label3" runat="server" Text='<%# Bind("teacher_ID") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("teacher_ID") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="教师姓名" SortExpression="name">
                    <EditItemTemplate>
                        &nbsp;<asp:Label ID="Label4" runat="server" Text='<%# Bind("name") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("name") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="角色" SortExpression="role"　 　>
                    <EditItemTemplate>
                        <asp:DropDownList ID="DropDownList1" runat="server" SelectedValue='<%# Bind("role") %>' >
                            <asp:ListItem>教师</asp:ListItem>
                            <asp:ListItem>系领导</asp:ListItem>
                            <asp:ListItem>院领导</asp:ListItem>
                        </asp:DropDownList>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("role") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="部门" SortExpression="department">
                    <EditItemTemplate>
                        &nbsp;<asp:Label ID="Label1" runat="server" Text='<%# Bind("department") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("department") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="职称" SortExpression="zhicheng">
                    <EditItemTemplate>
                        <asp:Label ID="Label5" runat="server" Text='<%# Bind("zhicheng") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label5" runat="server" Text='<%# Bind("zhicheng") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="职位" SortExpression="position">
                    <EditItemTemplate>
                        <asp:Label ID="Label6" runat="server" Text='<%# Bind("position") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label6" runat="server" Text='<%# Bind("position") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:CommandField ShowEditButton="True" ButtonType="Button" >
                    <ControlStyle BackColor="#C0FFFF" BorderColor="Blue" ForeColor="Blue" />
                </asp:CommandField>
            </Columns>
            <RowStyle BackColor="#DEDFDE" ForeColor="Black" />
            <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
            <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" />
        </asp:GridView>
        <asp:SqlDataSource ID="teacher" runat="server" ConnectionString="<%$ ConnectionStrings:paperDataBase %>"
            SelectCommand="SELECT * FROM [teacher] WHERE ([name] LIKE '%' + @name + '%')" DeleteCommand="DELETE FROM [teacher] WHERE [id] = @id" InsertCommand="INSERT INTO [teacher] ([teacher_ID], [name], [role], [password], [sex], [age], [department], [zhicheng], [birthday], [position]) VALUES (@teacher_ID, @name, @role, @password, @sex, @age, @department, @zhicheng, @birthday, @position)" UpdateCommand="UPDATE [teacher] SET  [role] = @role WHERE [id] = @id">
            <SelectParameters>
                <asp:ControlParameter ControlID="teacherName" Name="name" PropertyName="Text" Type="String" />
            </SelectParameters>
            <DeleteParameters>
                <asp:Parameter Name="id" Type="Int32" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="role" Type="String" />
                <asp:Parameter Name="id" Type="Int32" />
            </UpdateParameters>
            <InsertParameters>
                <asp:Parameter Name="teacher_ID" Type="String" />
                <asp:Parameter Name="name" Type="String" />
                <asp:Parameter Name="role" Type="String" />
                <asp:Parameter Name="password" Type="String" />
                <asp:Parameter Name="sex" Type="String" />
                <asp:Parameter Name="age" Type="String" />
                <asp:Parameter Name="department" Type="String" />
                <asp:Parameter Name="zhicheng" Type="String" />
                <asp:Parameter Name="birthday" Type="String" />
                <asp:Parameter Name="position" Type="String" />
            </InsertParameters>
        </asp:SqlDataSource>
        &nbsp;
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:paperDataBase %>"
            DeleteCommand="DELETE FROM [teacher] WHERE [id] = @id" InsertCommand="INSERT INTO [teacher] ([teacher_ID], [name], [role], [password], [sex], [age], [department], [zhicheng], [birthday], [position]) VALUES (@teacher_ID, @name, @role, @password, @sex, @age, @department, @zhicheng, @birthday, @position)"
            SelectCommand="SELECT * FROM [teacher]" UpdateCommand="UPDATE [teacher] SET [role] = @role WHERE [id] = @id">
            <DeleteParameters>
                <asp:Parameter Name="id" Type="Int32" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="role" Type="String" />
                <asp:Parameter Name="id" Type="Int32" />
            </UpdateParameters>
            <InsertParameters>
                <asp:Parameter Name="teacher_ID" Type="String" />
                <asp:Parameter Name="name" Type="String" />
                <asp:Parameter Name="role" Type="String" />
                <asp:Parameter Name="password" Type="String" />
                <asp:Parameter Name="sex" Type="String" />
                <asp:Parameter Name="age" Type="String" />
                <asp:Parameter Name="department" Type="String" />
                <asp:Parameter Name="zhicheng" Type="String" />
                <asp:Parameter Name="birthday" Type="String" />
                <asp:Parameter Name="position" Type="String" />
            </InsertParameters>
        </asp:SqlDataSource>
    </asp:Panel>
</asp:Content>

