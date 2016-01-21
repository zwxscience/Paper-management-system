<%@ Page Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeFile="data_Maintain.aspx.cs" Inherits="admin_data_Maintain" Title="计算机论文管理系统-数据维护" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    &nbsp;&nbsp;&nbsp; &nbsp;
    <asp:Panel ID="Panel1" runat="server" GroupingText="学生数据更新" Height="70px" Width="900px">
        <asp:Label ID="Label1" runat="server" ForeColor="Black" Text="请输入学生学号："></asp:Label>&nbsp;
        <asp:TextBox ID="TextBox1" runat="server" Width="133px"></asp:TextBox>
        <asp:Button ID="Button4" runat="server" Text="查找" BackColor="#C0FFFF" BorderColor="Blue" ForeColor="Blue"/>
        <br />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White"
            BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="ID"
            DataSourceID="student1" Width="850px" >
            <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
            <Columns>
                <asp:CommandField ButtonType="Button" EditText="更新" ShowDeleteButton="True" ShowEditButton="True">
                    <ControlStyle BackColor="#80FFFF" BorderColor="Blue" />
                </asp:CommandField>
                <asp:TemplateField HeaderText="学号" SortExpression="student_ID">
                    <EditItemTemplate>
                        <asp:Label ID="Label6" runat="server" Text='<%# Bind("student_ID") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label6" runat="server" Text='<%# Bind("student_ID") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="姓名" SortExpression="name">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("name") %>' Width="97px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1"
                            ErrorMessage="学生姓名不能为空"></asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label7" runat="server" Text='<%# Bind("name") %>' Width="50px"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="权限" SortExpression="role">
                    <EditItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("role") %>' Width="40px"></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("role") %>' Width="50px"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="性别" SortExpression="sex">
                    <EditItemTemplate>
                        &nbsp;<asp:RadioButtonList ID="RadioButtonList1" runat="server" SelectedValue='<%# Bind("sex") %>' RepeatDirection="Horizontal">
                            <asp:ListItem>男</asp:ListItem>
                            <asp:ListItem>女</asp:ListItem>
                        </asp:RadioButtonList>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("sex") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="入学年月" SortExpression="entranceDate">
                    <EditItemTemplate>
                        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="student2" DataTextField="entranceDate"
                            DataValueField="entranceDate" SelectedValue='<%# Bind("entranceDate") %>'>
                        </asp:DropDownList><asp:SqlDataSource ID="student2" runat="server" ConnectionString="<%$ ConnectionStrings:paperDataBase %>"
                            SelectCommand="SELECT DISTINCT [entranceDate] FROM [student]"></asp:SqlDataSource>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("entranceDate") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="民族" SortExpression="nation">
                    <EditItemTemplate>
                        &nbsp;<asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("nation") %>' Width="20px"></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("nation") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="班级" SortExpression="class">
                    <EditItemTemplate>
                        <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="sutndet3" DataTextField="class"
                            DataValueField="class" SelectedValue='<%# Bind("class") %>'>
                        </asp:DropDownList><asp:SqlDataSource ID="sutndet3" runat="server" ConnectionString="<%$ ConnectionStrings:paperDataBase %>"
                            SelectCommand="SELECT DISTINCT [class] FROM [student]"></asp:SqlDataSource>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label5" runat="server" Text='<%# Bind("class") %>' Width="60px"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="电话号码" SortExpression="phonenumber">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("phonenumber") %>' Width="90px"></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label9" runat="server" Text='<%# Bind("phonenumber") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Email" SortExpression="Email">
                    <EditItemTemplate>
                        &nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox3"
                            ErrorMessage="*请输入正确的电子邮件格式" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Width="75px"></asp:RegularExpressionValidator>
                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Email") %>' Width="125px" ></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label8" runat="server" Text='<%# Bind("Email") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <RowStyle BackColor="White" ForeColor="#330099" />
            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
            <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
        </asp:GridView>
        <asp:SqlDataSource ID="student1" runat="server" ConnectionString="<%$ ConnectionStrings:paperDataBase %>"
            DeleteCommand="DELETE FROM [student] WHERE [student_ID] = @student_ID" InsertCommand="INSERT INTO [student] ([student_ID], [name], [password], [role], [birthday], [sex], [birthplace], [entranceDate], [nation], [specialty], [zyfx], [college], [class], [IDcard], [grade], [phonenumber], [Email]) VALUES (@student_ID, @name, @password, @role, @birthday, @sex, @birthplace, @entranceDate, @nation, @specialty, @zyfx, @college, @class, @IDcard, @grade, @phonenumber, @Email)"
            SelectCommand="SELECT * FROM [student] WHERE ([student_ID] LIKE '%' + @student_ID + '%')" UpdateCommand="UPDATE [student] SET  [name] = @name,  [role] = @role, [birthday] = @birthday, [sex] = @sex, [birthplace] = @birthplace, [entranceDate] = @entranceDate, [nation] = @nation, [specialty] = @specialty,  [college] = @college, [class] = @class,  [grade] = @grade, [phonenumber] = @phonenumber, [Email] = @Email WHERE [student_ID] = @student_ID">
            <DeleteParameters>
                <asp:Parameter Name="student_ID" Type="String" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="name" Type="String" />
                <asp:Parameter Name="password" Type="String" />
                <asp:Parameter Name="role" Type="String" />
                <asp:Parameter Name="birthday" Type="String" />
                <asp:Parameter Name="sex" Type="String" />
                <asp:Parameter Name="birthplace" Type="String" />
                <asp:Parameter Name="entranceDate" Type="String" />
                <asp:Parameter Name="nation" Type="String" />
                <asp:Parameter Name="specialty" Type="String" />
                <asp:Parameter Name="zyfx" Type="String" />
                <asp:Parameter Name="college" Type="String" />
                <asp:Parameter Name="class" Type="String" />
                <asp:Parameter Name="IDcard" Type="String" />
                <asp:Parameter Name="grade" Type="String" />
                <asp:Parameter Name="phonenumber" Type="String" />
                <asp:Parameter Name="Email" Type="String" />
                <asp:Parameter Name="student_ID" Type="String" />
            </UpdateParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="TextBox1" Name="student_ID" PropertyName="Text"
                    Type="String" />
            </SelectParameters>
            <InsertParameters>
                <asp:Parameter Name="student_ID" Type="String" />
                <asp:Parameter Name="name" Type="String" />
                <asp:Parameter Name="password" Type="String" />
                <asp:Parameter Name="role" Type="String" />
                <asp:Parameter Name="birthday" Type="String" />
                <asp:Parameter Name="sex" Type="String" />
                <asp:Parameter Name="birthplace" Type="String" />
                <asp:Parameter Name="entranceDate" Type="String" />
                <asp:Parameter Name="nation" Type="String" />
                <asp:Parameter Name="specialty" Type="String" />
                <asp:Parameter Name="zyfx" Type="String" />
                <asp:Parameter Name="college" Type="String" />
                <asp:Parameter Name="class" Type="String" />
                <asp:Parameter Name="IDcard" Type="String" />
                <asp:Parameter Name="grade" Type="String" />
                <asp:Parameter Name="phonenumber" Type="String" />
                <asp:Parameter Name="Email" Type="String" />
        
            </InsertParameters>
        </asp:SqlDataSource>
    </asp:Panel>
    <asp:Panel ID="Panel2" runat="server" GroupingText="教师数据更新" Height="50px" Width="900px">
        <asp:Label ID="Label7" runat="server" ForeColor="Black" Text="请输入教师姓名："></asp:Label>&nbsp;
        <asp:TextBox ID="TextBox3" runat="server" Width="137px"></asp:TextBox>
        <asp:Button ID="Button5" runat="server" Text="查找" BackColor="#80FFFF" BorderColor="Blue" ForeColor="Blue" OnClick="Button5_Click"/><br />
        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" BackColor="White"
            BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="id"
            DataSourceID="teacher" PageSize="4" AllowPaging="True" Width="850px">
            <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
            <Columns>
                <asp:CommandField ButtonType="Button" ShowDeleteButton="True" ShowEditButton="True">
                    <ControlStyle BackColor="#80FFFF" BorderColor="Blue" />
                </asp:CommandField>
                <asp:TemplateField HeaderText="教师号" SortExpression="teacher_ID">
                    <EditItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("teacher_ID") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("teacher_ID") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="姓名" SortExpression="name">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("name") %>' Width="80px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2"
                            ErrorMessage="教师姓名不能为空"></asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("name") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="权限" SortExpression="role">
                    <EditItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("role") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("role") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="性别" SortExpression="sex">
                    <EditItemTemplate>
                        <asp:RadioButtonList ID="RadioButtonList2" runat="server" DataSourceID="teacher1"
                            DataTextField="sex" DataValueField="sex" SelectedValue='<%# Bind("sex") %>' RepeatDirection="Horizontal">
                        </asp:RadioButtonList><asp:SqlDataSource ID="teacher1" runat="server" ConnectionString="<%$ ConnectionStrings:paperDataBase %>"
                            SelectCommand="SELECT DISTINCT [sex] FROM [teacher]"></asp:SqlDataSource>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("sex") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="年龄" SortExpression="age">
                    <EditItemTemplate>
                        <br />
                        &nbsp;
                        <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("age") %>' Width="59px"></asp:TextBox>&nbsp;
                        <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="TextBox5"
                            ErrorMessage="*请输入正确的年龄" MaximumValue="100" MinimumValue="0" Type="Integer"></asp:RangeValidator><br />
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label5" runat="server" Text='<%# Bind("age") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="部门" SortExpression="department">
                    <EditItemTemplate>
                        <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="teacher2" DataTextField="department"
                            DataValueField="department" SelectedValue='<%# Bind("department") %>'>
                        </asp:DropDownList><asp:SqlDataSource ID="teacher2" runat="server" ConnectionString="<%$ ConnectionStrings:paperDataBase %>"
                            SelectCommand="SELECT DISTINCT [department] FROM [teacher]"></asp:SqlDataSource>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label6" runat="server" Text='<%# Bind("department") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="职称" SortExpression="zhicheng">
                    <EditItemTemplate>
                        <asp:DropDownList ID="DropDownList4" runat="server" DataSourceID="teacher3" DataTextField="zhicheng"
                            DataValueField="zhicheng" SelectedValue='<%# Bind("zhicheng") %>'>
                        </asp:DropDownList><asp:SqlDataSource ID="teacher3" runat="server" ConnectionString="<%$ ConnectionStrings:paperDataBase %>"
                            SelectCommand="SELECT DISTINCT [zhicheng] FROM [teacher]"></asp:SqlDataSource>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label7" runat="server" Text='<%# Bind("zhicheng") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="职位" SortExpression="position">
                    <EditItemTemplate>
                        <asp:DropDownList ID="DropDownList5" runat="server" DataSourceID="teacher4" DataTextField="position"
                            DataValueField="position" SelectedValue='<%# Bind("position") %>'>
                        </asp:DropDownList><asp:SqlDataSource ID="teacher4" runat="server" ConnectionString="<%$ ConnectionStrings:paperDataBase %>"
                            SelectCommand="SELECT DISTINCT [position] FROM [teacher]"></asp:SqlDataSource>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label8" runat="server" Text='<%# Bind("position") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Email" SortExpression="Email">
                    <EditItemTemplate>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="TextBox1"
                            ErrorMessage="* 请输入正确的电子邮箱" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Email") %>' Width="122px"  ></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label9" runat="server" Text='<%# Bind("Email") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <RowStyle BackColor="White" ForeColor="#330099" />
            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
            <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
        </asp:GridView>
        <asp:SqlDataSource ID="teacher" runat="server" ConnectionString="<%$ ConnectionStrings:paperDataBase %>"
            DeleteCommand="DELETE FROM [teacher] WHERE [id] = @id" InsertCommand="INSERT INTO [teacher] ([teacher_ID], [name], [role], [password], [sex], [age], [department], [zhicheng], [birthday], [position]) VALUES (@teacher_ID, @name, @role, @password, @sex, @age, @department, @zhicheng, @birthday, @position)"
            SelectCommand="SELECT * FROM [teacher] WHERE ([name] LIKE '%' + @name + '%')"
            UpdateCommand="UPDATE [teacher] SET [teacher_ID] = @teacher_ID, [sex] = @sex, [age] = @age, [department] = @department, [zhicheng] = @zhicheng,  [position] = @position, [Email] = @Email WHERE [id] = @id">
            <DeleteParameters>
                <asp:Parameter Name="id" Type="Int32" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="teacher_ID" Type="String" />
                <asp:Parameter Name="sex" Type="String" />
                <asp:Parameter Name="age" Type="String" />
                <asp:Parameter Name="department" Type="String" />
                <asp:Parameter Name="zhicheng" Type="String" />
                <asp:Parameter Name="position" Type="String" />
                 <asp:Parameter Name="Email" Type="String" />
                <asp:Parameter Name="id" Type="Int32" />
            </UpdateParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="TextBox3" Name="name" PropertyName="Text" Type="String" />
            </SelectParameters>
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
    <asp:Panel ID="Panel33" runat="server" GroupingText="整体学生数据删除" Height="50px" Width="900px">
        <asp:Label ID="Label9" runat="server" ForeColor="Black" Text="按年级删除：请选择学生年级："></asp:Label>&nbsp;&nbsp;
        &nbsp;<asp:DropDownList ID="DropDownList6" runat="server" DataSourceID="student_delete"
            DataTextField="grade" DataValueField="grade" Width="80px">
        </asp:DropDownList>
        &nbsp;&nbsp;<asp:Button ID="Button6" runat="server" Text="删除" BackColor="#C0FFFF" BorderColor="Blue" ForeColor="Blue" OnClick="Button6_Click"/>
        <asp:SqlDataSource ID="student_delete" runat="server" ConnectionString="<%$ ConnectionStrings:paperDataBase %>"
            SelectCommand="SELECT DISTINCT [grade] FROM [student]"></asp:SqlDataSource>
        &nbsp; &nbsp;
            　 &nbsp;&nbsp;<br />
        <br />
        <asp:Label ID="deleteMessage" runat="server"></asp:Label></asp:Panel>
</asp:Content>

