<%@ Page Language="C#" MasterPageFile="~/teacher/Teacher.master" AutoEventWireup="true" CodeFile="STreportEA.aspx.cs" Inherits="teacher_STreportEA" Title="计软院论文管理系统-开题报告" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Panel ID="Panel1" runat="server" GroupingText="待审批开题报告" Height="143px" Width="900px">
        <table width="850">
            <caption>
                <span style="font-size: 16pt; font-family: 华文行楷;">开题报告</span></caption>
            <tr>
                <td style="width: 100px; height: 59px;">
                    请选择您的学生：</td>
                <td style="width: 100px; height: 59px;">
                    <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1"
                        DataTextField="student_Name" DataValueField="student_ID">
                    </asp:DropDownList><asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:paperDataBase %>"
                        SelectCommand="SELECT * FROM [select_Result] WHERE (([teacher_ID] = @teacher_ID) AND ([grade] = @grade))">
                        <SelectParameters>
                            <asp:SessionParameter Name="teacher_ID" SessionField="username" Type="String" />
                            <asp:SessionParameter Name="grade" SessionField="year1" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
                <td style="width: 225px; height: 59px;">
                    <asp:Button ID="Button1" runat="server" BackColor="#C0FFFF" BorderColor="Blue" ForeColor="Blue"
                        OnClick="Button1_Click" Text="查看" /></td>
            </tr>
            <tr>
                <td colspan="3" rowspan="2">
                    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True"
                        AutoGenerateColumns="False" BackColor="White" BorderColor="#3366CC" BorderStyle="None"
                        BorderWidth="1px" CellPadding="4" DataSourceID="student1" EmptyDataText="暂无数据"
                        Width="750px">
                        <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
                        <Columns>
                            <asp:BoundField DataField="Depart" HeaderText="院系" SortExpression="Depart" />
                            <asp:BoundField DataField="specify" HeaderText="专业" SortExpression="specify" />
                            <asp:BoundField DataField="student_ID" HeaderText="学号" ReadOnly="True" SortExpression="student_ID" />
                            <asp:BoundField DataField="name" HeaderText="学生姓名" SortExpression="name" />
                            <asp:BoundField DataField="title" HeaderText="论文题目" SortExpression="title" />
                     <asp:HyperLinkField DataNavigateUrlFields="name,title,student_ID" DataNavigateUrlFormatString="STreportEA1.aspx?student_ID={2}"
                                HeaderText="查看" Target="_self" Text="详细" />
                        </Columns>
                        <RowStyle BackColor="White" ForeColor="#003399" />
                        <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                        <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
                        <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="student1" runat="server" ConnectionString="<%$ ConnectionStrings:paperDataBase %>"
                        SelectCommand="SELECT * FROM [STReport] WHERE (([Year] = @Year) AND ([teacher_ID] = @teacher_ID) AND ([student_ID] = @student_ID))">
                        <SelectParameters>
                            <asp:SessionParameter Name="Year" SessionField="year" Type="Int32" />
                            <asp:SessionParameter Name="teacher_ID" SessionField="username" Type="String" />
                            <asp:ControlParameter ControlID="DropDownList1" Name="student_ID" PropertyName="SelectedValue"
                                Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" BackColor="White"
                        BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataSourceID="student2"
                        EmptyDataText="暂无数据" Width="750px">
                        <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
                        <Columns>
                            <asp:BoundField DataField="student_ID" HeaderText="学号" ReadOnly="True" SortExpression="student_ID" />
                            <asp:BoundField DataField="name" HeaderText="学生姓名" SortExpression="name" />
                            <asp:BoundField DataField="Depart" HeaderText="院系" SortExpression="Depart" />
                            <asp:BoundField DataField="specify" HeaderText="专业" SortExpression="specify" />
                            <asp:BoundField DataField="title" HeaderText="论文题目" SortExpression="title" />
                        <asp:HyperLinkField DataNavigateUrlFields="name,title,student_ID" DataNavigateUrlFormatString="STreportEA1.aspx?student_ID={2}"
                                HeaderText="查看" Target="_self" Text="详细" />
                        </Columns>
                        <RowStyle BackColor="White" ForeColor="#003399" />
                        <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                        <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
                        <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="student2" runat="server" ConnectionString="<%$ ConnectionStrings:paperDataBase %>"
                        SelectCommand="SELECT * FROM [STReport] WHERE (([teacher_ID] = @teacher_ID) AND ([Year] = @Year))">
                        <SelectParameters>
                            <asp:SessionParameter Name="teacher_ID" SessionField="username" Type="String" />
                            <asp:SessionParameter Name="Year" SessionField="year" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
            </tr>
            <tr>
            </tr>
        </table>
    </asp:Panel>
</asp:Content>

