<%@ Page Language="C#" MasterPageFile="~/student/Student.master" AutoEventWireup="true" CodeFile="teacherRef.aspx.cs" Inherits="student_teacherRef" Title="计软院论文管理系统-教师反馈" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Panel ID="Panel1" runat="server" GroupingText="教师反馈" Height="50px" Width="900px">
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White"
            BorderColor="#999999" BorderStyle="None" BorderWidth="1px" Caption="教师信息反馈" CellPadding="3"
            DataKeyNames="id" DataSourceID="SqlDataSource1" EmptyDataText="暂无信息反馈" ForeColor="Blue"
            Height="119px" PageSize="5" Width="800px" AllowPaging="True" AllowSorting="True">
            <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
            <Columns>
                <asp:BoundField DataField="topic" HeaderText="主题" SortExpression="topic" />
                <asp:BoundField DataField="teacher_Name" HeaderText="导师姓名" SortExpression="teacher_Name" />
                <asp:BoundField DataField="state" HeaderText="是否同意" SortExpression="state" />
                <asp:TemplateField HeaderText="反馈信息" SortExpression="Content">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Content") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Height="40px" Text='<%# Bind("Content") %>'
                            TextMode="MultiLine" Width="300px" ReadOnly="True"></asp:TextBox>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="count" HeaderText="批复或记录次数" SortExpression="count" />
                <asp:BoundField DataField="time" HeaderText="时间" SortExpression="time" />
            </Columns>
            <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
            <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
            <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
            <AlternatingRowStyle BackColor="Gainsboro" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:paperDataBase %>"
            SelectCommand="SELECT * FROM [StoTContent] WHERE (([student_ID] = @student_ID) AND ([Year] = @Year)) ORDER BY [time] DESC">
            <SelectParameters>
                <asp:SessionParameter Name="student_ID" SessionField="username" Type="String" />
                <asp:SessionParameter Name="Year" SessionField="year" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
    </asp:Panel>
</asp:Content>

