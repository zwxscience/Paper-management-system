<%@ Page Language="C#" MasterPageFile="~/teacher/Teacher.master" AutoEventWireup="true" CodeFile="inspect.aspx.cs" Inherits="teacher_inspect" Title="计软院论文管理系统-进度情况监控" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Panel ID="Panel1" runat="server" GroupingText="进度情况监控" Height="50px" Width="900px">
        <table width="850">
            <caption>
                <span style="font-size: 16pt; font-family: 华文行楷">学生论文情况进度监控</span></caption>
            <tr>
                <td colspan="3" style="width: 541px; height: 14px">
                    <span style="font-size: 10pt">请选择专业</span><asp:DropDownList ID="DepartList" runat="server"
                        AutoPostBack="True" DataSourceID="Depart" DataTextField="specialty" DataValueField="specialty">
                    </asp:DropDownList><asp:SqlDataSource ID="Depart" runat="server" ConnectionString="<%$ ConnectionStrings:paperDataBase %>"
                        SelectCommand="SELECT DISTINCT [specialty] FROM [student] WHERE ([grade] = @grade)">
                        <SelectParameters>
                            <asp:SessionParameter Name="grade" SessionField="year1" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    学生班级<asp:DropDownList ID="studentClassList" runat="server" DataSourceID="studentClass"
                        DataTextField="class" DataValueField="class">
                    </asp:DropDownList><asp:SqlDataSource ID="studentClass" runat="server" ConnectionString="<%$ ConnectionStrings:paperDataBase %>"
                        SelectCommand="SELECT * FROM [student] WHERE (([grade] = @grade) AND ([specialty] = @specialty))">
                        <SelectParameters>
                            <asp:SessionParameter Name="grade" SessionField="year1" Type="String" />
                            <asp:ControlParameter ControlID="DepartList" Name="specialty" PropertyName="SelectedValue"
                                Type="String" /> 
                        </SelectParameters>
                    </asp:SqlDataSource>
                    学生学号<asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="student_ID"
                        DataTextField="student_ID" DataValueField="student_ID">
                    </asp:DropDownList><asp:SqlDataSource ID="student_ID" runat="server" ConnectionString="<%$ ConnectionStrings:paperDataBase %>" SelectCommand="SELECT [student_ID] FROM [student] WHERE (([grade] = @grade) AND ([class] = @class))">
                        <SelectParameters>
                            <asp:SessionParameter Name="grade" SessionField="year1" Type="String" />
                            <asp:ControlParameter ControlID="studentClassList" Name="class" PropertyName="SelectedValue"
                                Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:Button ID="Button1" runat="server" BackColor="#C0FFFF" BorderColor="Blue" CausesValidation="False"
                        ForeColor="Blue" OnClick="Button1_Click" Text="查看" />&nbsp;
                </td>
            </tr>
            <tr>
                <td colspan="3" rowspan="2" style="width: 541px">
                    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True"
                        AutoGenerateColumns="False" BackColor="White" BorderColor="White" BorderStyle="Ridge"
                        BorderWidth="2px" CellPadding="3" CellSpacing="1" DataSourceID="inspect1"
                        EmptyDataText="暂无数据查看" GridLines="None" Width="850px">
                        <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
                        <RowStyle BackColor="#DEDFDE" ForeColor="Black" />
                        <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
                        <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" />
                        <Columns>
                            <asp:BoundField DataField="grade" HeaderText="年级" SortExpression="grade" />
                            <asp:BoundField DataField="specialty" HeaderText="专业" SortExpression="specialty" />
                            <asp:BoundField DataField="class" HeaderText="班级" SortExpression="class" />
                            <asp:BoundField DataField="student_ID" HeaderText="学号" ReadOnly="True" SortExpression="student_ID" />
                            <asp:BoundField DataField="student_Name" HeaderText="学生姓名" SortExpression="student_Name" />
                            <asp:BoundField DataField="title" HeaderText="论文题目" SortExpression="title" />
                            <asp:BoundField DataField="studentTaskPaper" HeaderText="学生任务书" SortExpression="studentTaskPaper" />
                            <asp:BoundField DataField="STReport" HeaderText="开题报告" SortExpression="STReport" />
                            <asp:BoundField DataField="GuiNum" HeaderText="指导记录次数" SortExpression="GuiNum" />
                            <asp:BoundField DataField="Summ" HeaderText="论文小结" SortExpression="Summ" />
                            <asp:BoundField DataField="IsUpLoad" HeaderText="论文是否上传" SortExpression="IsUpLoad" />
                        </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource ID="inspect1" runat="server" ConnectionString="<%$ ConnectionStrings:paperDataBase %>"
                        SelectCommand="SELECT * FROM [inspect] WHERE ([grade] = @grade)">
                        <SelectParameters>
                            <asp:SessionParameter Name="grade" SessionField="year1" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    &nbsp;
                    <asp:GridView ID="GridView2" runat="server" AllowPaging="True" AllowSorting="True"
                        AutoGenerateColumns="False" BackColor="White" BorderColor="White" BorderStyle="Ridge"
                        BorderWidth="2px" CellPadding="3" CellSpacing="1" DataSourceID="inspect2"
                        EmptyDataText="暂无数据查看" GridLines="None" PageSize="8" Width="850px">
                        <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
                        <RowStyle BackColor="#DEDFDE" ForeColor="Black" />
                        <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
                        <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" />
                        <Columns>
                            <asp:BoundField DataField="grade" HeaderText="年级" SortExpression="grade" />
                            <asp:BoundField DataField="specialty" HeaderText="专业" SortExpression="specialty" />
                            <asp:BoundField DataField="class" HeaderText="班级" SortExpression="class" />
                            <asp:BoundField DataField="student_ID" HeaderText="学号" ReadOnly="True" SortExpression="student_ID" />
                            <asp:BoundField DataField="student_Name" HeaderText="学生姓名" SortExpression="student_Name" />
                            <asp:BoundField DataField="title" HeaderText="论文题目" SortExpression="title" />
                            <asp:BoundField DataField="studentTaskPaper" HeaderText="学生任务书" SortExpression="studentTaskPaper" />
                            <asp:BoundField DataField="STReport" HeaderText="开题报告" SortExpression="STReport" />
                            <asp:BoundField DataField="GuiNum" HeaderText="指导记录次数" SortExpression="GuiNum" />
                            <asp:BoundField DataField="Summ" HeaderText="论文小结" SortExpression="Summ" />
                            <asp:BoundField DataField="IsUpLoad" HeaderText="论文是否上传" SortExpression="IsUpLoad" />
                        </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource ID="inspect2" runat="server" ConnectionString="<%$ ConnectionStrings:paperDataBase %>"
                        SelectCommand="SELECT * FROM [inspect] WHERE (([grade] = @grade) AND ([student_ID] = @student_ID))">
                        <SelectParameters>
                            <asp:SessionParameter Name="grade" SessionField="year1" Type="Int32" />
                            <asp:ControlParameter ControlID="DropDownList1" Name="student_ID" PropertyName="SelectedValue"
                                Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
            </tr>
            <tr>
            </tr>
        </table>
    </asp:Panel>
</asp:Content>

