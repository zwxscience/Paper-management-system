<%@ Page Language="C#" MasterPageFile="~/teacher/Teacher.master" AutoEventWireup="true" CodeFile="paperOpe.aspx.cs" Inherits="teacher_paperOpe" Title="计软院论文管理系统－教师课题操作" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
 <asp:Panel ID="Panel1" runat="server" GroupingText="教师课题操作" Height="123px" Width="900px">
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True"
            AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="None"
            BorderWidth="1px" Caption="教师已出课题" CellPadding="3" DataKeyNames="title" DataSourceID="SqlDataSource1"
            EmptyDataText="暂无数据" GridLines="Vertical" Width="808px">
            <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
            <Columns>
                <asp:BoundField DataField="Year" HeaderText="出题年份" SortExpression="Year" />
                <asp:BoundField DataField="title" HeaderText="论文题目" ReadOnly="True" SortExpression="title" />
                <asp:BoundField DataField="state1" HeaderText="是否通过系审批" SortExpression="state1" />
                <asp:BoundField DataField="state2" HeaderText="是否通过院审批" SortExpression="state2" />
                <asp:HyperLinkField DataNavigateUrlFields="year,title,id" DataNavigateUrlFormatString="paperOpe1.aspx?year={0}&amp;title={1}&amp;id={2}&amp;tag=1"
                                HeaderText="查题" Target="_self" Text="详细" />
                <asp:HyperLinkField DataNavigateUrlFields="year,title,id" DataNavigateUrlFormatString="paperOpe1.aspx?year={0}&amp;title={1}&amp;id={2}&amp;tag=2"
                                HeaderText="改题" Target="_self" Text="修改" />
                <asp:HyperLinkField DataNavigateUrlFields="year,title,id" DataNavigateUrlFormatString="paperOpe1.aspx?year={0}&amp;title={1}&amp;id={2}&amp;tag=3"
                                HeaderText="删题" Target="_self" Text="删除" />
              
            </Columns>
            <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
            <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
            <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
            <AlternatingRowStyle BackColor="#DCDCDC" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:paperDataBase %>"
            DeleteCommand="DELETE FROM [paperApply] WHERE [title] = @title" InsertCommand="INSERT INTO [paperApply] ([teacher_ID], [preriod], [title], [kind], [project_Name], [project_Depart], [project_Num], [target], [aim_Meaning], [current_situation], [content], [reference], [remark], [state1], [state2], [Year], [first_select], [second_select], [third_select], [teacher_Name], [schedule]) VALUES (@teacher_ID, @preriod, @title, @kind, @project_Name, @project_Depart, @project_Num, @target, @aim_Meaning, @current_situation, @content, @reference, @remark, @state1, @state2, @Year, @first_select, @second_select, @third_select, @teacher_Name, @schedule)"
            SelectCommand="SELECT * FROM [paperApply] WHERE ([teacher_ID] = @teacher_ID)"
            UpdateCommand="UPDATE [paperApply] SET [id] = @id, [teacher_ID] = @teacher_ID, [preriod] = @preriod, [kind] = @kind, [project_Name] = @project_Name, [project_Depart] = @project_Depart, [project_Num] = @project_Num, [target] = @target, [aim_Meaning] = @aim_Meaning, [current_situation] = @current_situation, [content] = @content, [reference] = @reference, [remark] = @remark, [state1] = @state1, [state2] = @state2, [Year] = @Year, [first_select] = @first_select, [second_select] = @second_select, [third_select] = @third_select, [teacher_Name] = @teacher_Name, [schedule] = @schedule WHERE [title] = @title">
            <DeleteParameters>
                <asp:Parameter Name="title" Type="String" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="id" Type="Int32" />
                <asp:Parameter Name="teacher_ID" Type="String" />
                <asp:Parameter Name="preriod" Type="String" />
                <asp:Parameter Name="kind" Type="String" />
                <asp:Parameter Name="project_Name" Type="String" />
                <asp:Parameter Name="project_Depart" Type="String" />
                <asp:Parameter Name="project_Num" Type="String" />
                <asp:Parameter Name="target" Type="String" />
                <asp:Parameter Name="aim_Meaning" Type="String" />
                <asp:Parameter Name="current_situation" Type="String" />
                <asp:Parameter Name="content" Type="String" />
                <asp:Parameter Name="reference" Type="String" />
                <asp:Parameter Name="remark" Type="String" />
                <asp:Parameter Name="state1" Type="String" />
                <asp:Parameter Name="state2" Type="String" />
                <asp:Parameter Name="Year" Type="String" />
                <asp:Parameter Name="first_select" Type="Int32" />
                <asp:Parameter Name="second_select" Type="Int32" />
                <asp:Parameter Name="third_select" Type="Int32" />
                <asp:Parameter Name="teacher_Name" Type="String" />
                <asp:Parameter Name="schedule" Type="String" />
                <asp:Parameter Name="title" Type="String" />
            </UpdateParameters>
            <SelectParameters>
                <asp:SessionParameter Name="teacher_ID" SessionField="username" Type="String" />
            </SelectParameters>
            <InsertParameters>
                <asp:Parameter Name="teacher_ID" Type="String" />
                <asp:Parameter Name="preriod" Type="String" />
                <asp:Parameter Name="title" Type="String" />
                <asp:Parameter Name="kind" Type="String" />
                <asp:Parameter Name="project_Name" Type="String" />
                <asp:Parameter Name="project_Depart" Type="String" />
                <asp:Parameter Name="project_Num" Type="String" />
                <asp:Parameter Name="target" Type="String" />
                <asp:Parameter Name="aim_Meaning" Type="String" />
                <asp:Parameter Name="current_situation" Type="String" />
                <asp:Parameter Name="content" Type="String" />
                <asp:Parameter Name="reference" Type="String" />
                <asp:Parameter Name="remark" Type="String" />
                <asp:Parameter Name="state1" Type="String" />
                <asp:Parameter Name="state2" Type="String" />
                <asp:Parameter Name="Year" Type="String" />
                <asp:Parameter Name="first_select" Type="Int32" />
                <asp:Parameter Name="second_select" Type="Int32" />
                <asp:Parameter Name="third_select" Type="Int32" />
                <asp:Parameter Name="teacher_Name" Type="String" />
                <asp:Parameter Name="schedule" Type="String" />
            </InsertParameters>
        </asp:SqlDataSource>
        <br />
        <asp:Button ID="Button1" runat="server" BackColor="#C0FFFF" BorderColor="Blue" Text="教师出题" OnClick="Button1_Click" />
    </asp:Panel>
</asp:Content>

