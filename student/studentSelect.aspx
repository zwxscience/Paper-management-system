<%@ Page Language="C#" MasterPageFile="~/student/Student.master" AutoEventWireup="true" CodeFile="studentSelect.aspx.cs" Inherits="student_studentSelect" Title="计软院论文管理系统-学生选题" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Panel ID="Panel1" runat="server" GroupingText="教师及论文题目查看" Height="50px" Width="900px">
        <table border="0" style="border-left-width: thin; font-size: 8pt; border-left-color: blue;
            border-bottom-width: thin; border-bottom-color: blue; color: black;
            border-top-color: blue; border-right-width: thin; border-right-color: blue" width="850">
            <caption style="background-color: #3399ff">
                <span style="font-size: 16pt; font-family: 华文行楷;"><strong>学生选题</strong></span></caption>
            <tr>
                <td colspan="3" style="height: 7px; text-align: center">
                    <span style="font-size: 10pt"><span style="display: block">
                        <asp:Label ID="Label1" runat="server" Text="请选择部门"></asp:Label><asp:DropDownList ID="DepartList" runat="server"
                        AutoPostBack="True" DataSourceID="Depart" DataTextField="department" DataValueField="department">
                    </asp:DropDownList>
                        <asp:SqlDataSource ID="Depart" runat="server" ConnectionString="<%$ ConnectionStrings:paperDataBase %>"
                        SelectCommand="SELECT DISTINCT [department] FROM [teacher]"></asp:SqlDataSource>
                    </span></span>
                        <asp:Label ID="Label2" runat="server" Text="教师姓名"></asp:Label><asp:DropDownList ID="teacherList" runat="server" AutoPostBack="True" DataSourceID="teachername"
                            DataTextField="name" DataValueField="teacher_ID">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="teachername" runat="server" ConnectionString="<%$ ConnectionStrings:paperDataBase %>"
                            SelectCommand="SELECT * FROM [teacher] WHERE ([department] = @department)">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="DepartList" Name="department" PropertyName="SelectedValue"
                                    Type="String" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <asp:Label ID="Label3" runat="server" Text="论文题目"></asp:Label>
                        <asp:DropDownList ID="titleList" runat="server" AutoPostBack="True" DataSourceID="paper"
                            DataTextField="title" DataValueField="title">
                        </asp:DropDownList>
                        <asp:Button ID="Button1" runat="server" BackColor="#C0FFFF" BorderColor="Blue" ForeColor="Blue"
                            Text="查看" OnClick="Button1_Click" />
                            
                        <asp:SqlDataSource ID="paper" runat="server" ConnectionString="<%$ ConnectionStrings:paperDataBase %>"
                            SelectCommand="SELECT * FROM [paperApply] WHERE (([teacher_ID] = @teacher_ID) AND ([state1] = @state1) AND ([state2] = @state2))">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="teacherList" Name="teacher_ID" PropertyName="SelectedValue"
                                    Type="String" />
                                <asp:Parameter DefaultValue="Y" Name="state1" Type="String" />
                                <asp:Parameter DefaultValue="Y" Name="state2" Type="String" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td colspan="4" style="width: 194px; height: 8px">
                    <asp:GridView ID="GridView2" runat="server" AllowPaging="True" AllowSorting="True"
                        DataSourceID="teacher1" PageSize="5" AutoGenerateColumns="False" Width="850px" BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" CellPadding="3" CellSpacing="1" GridLines="None">
                        <Columns>
                            <asp:BoundField DataField="teacher_Name" HeaderText="教师姓名" SortExpression="teacher_Name" />
                            <asp:BoundField DataField="title" HeaderText="论文题目" ReadOnly="True" SortExpression="title" />
                            <asp:BoundField DataField="kind" HeaderText="性质" SortExpression="kind" />
                            <asp:BoundField DataField="remark" HeaderText="备注" SortExpression="remark" />
                            <asp:BoundField DataField="first_select" HeaderText="第一志愿人数" SortExpression="first_select" />
                            <asp:BoundField DataField="second_select" HeaderText="第二志愿人数" SortExpression="second_select" />
                            <asp:BoundField DataField="third_select" HeaderText="t第三志愿人数" SortExpression="third_select" />
                              <asp:HyperLinkField HeaderText="查看" Text="详细" DataNavigateUrlFields="id"  Target="_self"  DataNavigateUrlFormatString="studentSelect1.aspx?paperid={0}" />
                        </Columns>
                        <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
                        <RowStyle BackColor="#DEDFDE" ForeColor="Black" />
                        <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
                        <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="teacher1" runat="server" ConnectionString="<%$ ConnectionStrings:paperDataBase %>"
                        SelectCommand="SELECT * FROM [paperApply] WHERE (([teacher_ID] = @teacher_ID) AND ([title] = @title) AND ([state1] = @state1) AND ([state2] = @state2) AND ([Year] = @Year))">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="teacherList" Name="teacher_ID" PropertyName="SelectedValue"
                                Type="String" />
                            <asp:ControlParameter ControlID="titleList" Name="title" PropertyName="SelectedValue"
                                Type="String" />
                            <asp:Parameter DefaultValue="Y" Name="state1" Type="String" />
                            <asp:Parameter DefaultValue="Y" Name="state2" Type="String" />
                            <asp:SessionParameter Name="Year" SessionField="year" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:GridView ID="GridView3" runat="server" AllowPaging="True" AllowSorting="True"
                        AutoGenerateColumns="False" DataKeyNames="title" DataSourceID="teacher" Width="850px" BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" CellPadding="3" CellSpacing="1" GridLines="None">
                        <Columns>
                            <asp:BoundField DataField="teacher_Name" HeaderText="教师姓名" SortExpression="teacher_Name" />
                            <asp:BoundField DataField="title" HeaderText="论文题目" ReadOnly="True" SortExpression="title" />
                            <asp:BoundField DataField="kind" HeaderText="性质" SortExpression="kind" />
                            <asp:BoundField DataField="remark" HeaderText="备注" SortExpression="remark" />
                            <asp:BoundField DataField="first_select" HeaderText="第一志愿人数" SortExpression="first_select" />
                            <asp:BoundField DataField="second_select" HeaderText="第二志愿人数" SortExpression="second_select" />
                            <asp:BoundField DataField="third_select" HeaderText="第三志愿人数" SortExpression="third_select" />
                            <asp:HyperLinkField HeaderText="查看" Text="详细" DataNavigateUrlFields="id"  Target="_self"  DataNavigateUrlFormatString="studentSelect1.aspx?paperid={0}" />
                        </Columns>
                        <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
                        <RowStyle BackColor="#DEDFDE" ForeColor="Black" />
                        <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
                        <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="teacher" runat="server" ConnectionString="<%$ ConnectionStrings:paperDataBase %>"
                        SelectCommand="SELECT * FROM [paperApply] WHERE (([state1] = @state1) AND ([state2] = @state2) AND ([Year] = @Year))">
                        <SelectParameters>
                            <asp:Parameter DefaultValue="Y" Name="state1" Type="String" />
                            <asp:Parameter DefaultValue="Y" Name="state2" Type="String" />
                            <asp:SessionParameter Name="Year" SessionField="year" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
            </tr>
        </table>
    </asp:Panel>
    <br />
    <asp:Panel ID="Panel2" runat="server" GroupingText="个人课题选择情况一览" Height="94px" Width="900px">
        &nbsp;<asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False"
            DataKeyNames="id" DataSourceID="SqlDataSource2" BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" CellPadding="3" CellSpacing="1" GridLines="None" Width="850px">
            <Columns>
                <asp:BoundField DataField="teacher_name" HeaderText="教师姓名" SortExpression="teacher_name" />
                <asp:BoundField DataField="title" HeaderText="论文题目" SortExpression="title" />
                <asp:BoundField DataField="direction" HeaderText="题目性质" SortExpression="direction" />
                <asp:BoundField DataField="priority" HeaderText="志愿优先级" SortExpression="priority" />
                 <asp:HyperLinkField HeaderText="查看" Text="详细" DataNavigateUrlFields="paperid"  Target="_self"  DataNavigateUrlFormatString="studentSelect1.aspx?paperid={0}" />
                 <asp:HyperLinkField HeaderText="删除" Text="删除" DataNavigateUrlFields="paperid,priority"  Target="_self"  DataNavigateUrlFormatString="studentSelect1.aspx?paperid={0}&amp;priority={1}&amp;tag=1" />
            </Columns>
            <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
            <RowStyle BackColor="#DEDFDE" ForeColor="Black" />
            <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
            <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:paperDataBase %>"
            DeleteCommand="DELETE FROM [themeSelectedResult] WHERE [id] = @id" InsertCommand="INSERT INTO [themeSelectedResult] ([student_ID], [name], [class], [teacher_ID], [teacher_name], [title], [direction], [introduce], [priority], [grade]) VALUES (@student_ID, @name, @class, @teacher_ID, @teacher_name, @title, @direction, @introduce, @priority, @grade)"
            SelectCommand="SELECT * FROM [themeSelectedResult] WHERE ([student_ID] = @student_ID)"
            UpdateCommand="UPDATE [themeSelectedResult] SET [student_ID] = @student_ID, [name] = @name, [class] = @class, [teacher_ID] = @teacher_ID, [teacher_name] = @teacher_name, [title] = @title, [direction] = @direction, [introduce] = @introduce, [priority] = @priority, [grade] = @grade WHERE [id] = @id">
            <DeleteParameters>
                <asp:Parameter Name="id" Type="Int32" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="student_ID" Type="String" />
                <asp:Parameter Name="name" Type="String" />
                <asp:Parameter Name="class" Type="String" />
                <asp:Parameter Name="teacher_ID" Type="String" />
                <asp:Parameter Name="teacher_name" Type="String" />
                <asp:Parameter Name="title" Type="String" />
                <asp:Parameter Name="direction" Type="String" />
                <asp:Parameter Name="introduce" Type="String" />
                <asp:Parameter Name="priority" Type="String" />
                <asp:Parameter Name="grade" Type="String" />
                <asp:Parameter Name="id" Type="Int32" />
            </UpdateParameters>
            <SelectParameters>
                <asp:SessionParameter Name="student_ID" SessionField="username" Type="String" />
            </SelectParameters>
            <InsertParameters>
                <asp:Parameter Name="student_ID" Type="String" />
                <asp:Parameter Name="name" Type="String" />
                <asp:Parameter Name="class" Type="String" />
                <asp:Parameter Name="teacher_ID" Type="String" />
                <asp:Parameter Name="teacher_name" Type="String" />
                <asp:Parameter Name="title" Type="String" />
                <asp:Parameter Name="direction" Type="String" />
                <asp:Parameter Name="introduce" Type="String" />
                <asp:Parameter Name="priority" Type="String" />
                <asp:Parameter Name="grade" Type="String" />
            </InsertParameters>
        </asp:SqlDataSource>
        &nbsp;
    </asp:Panel>
    <br />
    <asp:Panel ID="Panel3" runat="server" GroupingText="选题结果一览" Height="94px" Width="900px">
        <asp:GridView ID="GridView4" runat="server" AutoGenerateColumns="False"
            DataSourceID="SqlDataSource1" EmptyDataText="暂无结果，请等待通知" Width="850px" AllowSorting="True" Caption="个人选题信息一览" Font-Size="12px" BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" CellPadding="3" CellSpacing="1" DataKeyNames="student_ID" GridLines="None">
            <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
            <Columns>
                <asp:BoundField DataField="teacher_Name" HeaderText="导师姓名" SortExpression="teacher_Name" />
                <asp:BoundField DataField="title" HeaderText="论文题目" SortExpression="title" />
               <asp:HyperLinkField HeaderText="查看" Text="详细" DataNavigateUrlFields="paperid"  Target="_self"  DataNavigateUrlFormatString="studentSelect1.aspx?paperid={0}" />
                        </Columns>
            <RowStyle BackColor="#DEDFDE" ForeColor="Black" />
            <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
            <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:paperDataBase %>"
            SelectCommand="SELECT * FROM [select_Result] WHERE ([student_ID] = @student_ID)">
            <SelectParameters>
                <asp:SessionParameter Name="student_ID" SessionField="username" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        &nbsp;
    </asp:Panel>
</asp:Content>

