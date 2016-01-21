<%@ Page Language="C#" MasterPageFile="~/teacher/Teacher.master" AutoEventWireup="true" CodeFile="departExamine.aspx.cs" Inherits="teacher_departExamine" Title="计软院论文管理系统-系领导审核" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Panel ID="Panel1" runat="server" GroupingText="待审核列表" Height="92px" Width="900px">
        <table width="850">
            <caption>
                <span style="font-size: 16pt; font-family: 华文行楷;">系领导审核</span></caption>
            <tr>
                <td colspan="3" style="width: 540px; height: 14px; text-align: center;">
                    <span style="font-size: 10pt"></span>请选择&nbsp;教师姓名<asp:DropDownList ID="teacherList" runat="server" AutoPostBack="True" DataSourceID="teachername"
                        DataTextField="name" DataValueField="teacher_ID">
                    </asp:DropDownList><asp:SqlDataSource ID="teachername" runat="server" ConnectionString="<%$ ConnectionStrings:paperDataBase %>"
                        SelectCommand="SELECT * FROM [teacher] WHERE ([department] = @department)">
                        <SelectParameters>
                            <asp:SessionParameter Name="department" SessionField="department" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    论文题目<asp:DropDownList ID="titleList" runat="server" AutoPostBack="True" DataSourceID="paper"
                        DataTextField="title" DataValueField="title">
                    </asp:DropDownList>
                    <asp:Button ID="Button1" runat="server" BackColor="#C0FFFF" BorderColor="Blue" CausesValidation="False"
                        ForeColor="Blue" OnClick="Button1_Click" Text="查看" />
                    <asp:SqlDataSource ID="paper" runat="server" ConnectionString="<%$ ConnectionStrings:paperDataBase %>"
                        SelectCommand="SELECT * FROM [paperApply] WHERE (([teacher_ID] = @teacher_ID) AND ([state1] = @state1) AND ([Year] = @Year))">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="teacherList" Name="teacher_ID" PropertyName="SelectedValue"
                                Type="String" />
                            <asp:Parameter DefaultValue="N" Name="state1" Type="String" />
                            <asp:SessionParameter Name="Year" SessionField="year" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td colspan="3" rowspan="2" style="width: 540px; text-align: center;">
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="title"
                        DataSourceID="teacher1" Width="850px" AllowPaging="True" AllowSorting="True" EmptyDataText="暂无数据查看" BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" CellPadding="3" CellSpacing="1" GridLines="None">
                        <Columns>
                            <asp:TemplateField HeaderText="教师姓名" SortExpression="teacher_Name">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("teacher_Name") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("teacher_Name") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="论文题目" SortExpression="title">
                                <EditItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("title") %>'></asp:Label>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("title") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="性质" SortExpression="kind">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("kind") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("kind") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="备注" SortExpression="remark">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("remark") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("remark") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                         
                            <asp:HyperLinkField HeaderText="查看" Text="详细" DataNavigateUrlFields="teacher_ID,id,teacher_Name"  Target="_self"  DataNavigateUrlFormatString="departExamine1.aspx?teacher_ID={0}&amp;paperid={1}&amp;teacher_Name={2}" />
                        </Columns>
                        <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
                        <RowStyle BackColor="#DEDFDE" ForeColor="Black" />
                        <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
                        <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="teacher1" runat="server" ConnectionString="<%$ ConnectionStrings:paperDataBase %>"
                        SelectCommand="SELECT * FROM [paperApply] WHERE (([teacher_ID] = @teacher_ID) AND ([title] = @title))">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="teacherList" Name="teacher_ID" PropertyName="SelectedValue"
                                Type="String" />
                            <asp:ControlParameter ControlID="titleList" Name="title" PropertyName="SelectedValue"
                                Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="title"
                        DataSourceID="teacher2" Width="850px" AllowPaging="True" AllowSorting="True" EmptyDataText="暂无数据查看" PageSize="8" BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" CellPadding="3" CellSpacing="1" GridLines="None">
                        <Columns>
                            <asp:TemplateField HeaderText="教师姓名" SortExpression="teacher_Name">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("teacher_Name") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("teacher_Name") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="论文题目" SortExpression="title">
                                <EditItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("title") %>'></asp:Label>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("title") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="性质" SortExpression="kind">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("kind") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("kind") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="备注" SortExpression="remark">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("remark") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("remark") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:HyperLinkField HeaderText="查看" Text="详细" DataNavigateUrlFields="teacher_ID,id,teacher_Name"  Target="_self"  DataNavigateUrlFormatString="departExamine1.aspx?teacher_ID={0}&amp;paperid={1}&amp;teacher_Name={2}" />
                        </Columns>
                        <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
                        <RowStyle BackColor="#DEDFDE" ForeColor="Black" />
                        <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
                        <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="teacher2" runat="server" ConnectionString="<%$ ConnectionStrings:paperDataBase %>"
                        SelectCommand="SELECT * FROM [paperApply] WHERE (([state1] = @state1) AND ([state2] = @state2) AND ([Year] = @Year))">
                        <SelectParameters>
                            <asp:Parameter DefaultValue="N" Name="state1" Type="String" />
                            <asp:Parameter DefaultValue="N" Name="state2" Type="String" />
                            <asp:SessionParameter Name="Year" SessionField="year" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
            </tr>
            <tr>
            </tr>
        </table>
    </asp:Panel>
</asp:Content>

