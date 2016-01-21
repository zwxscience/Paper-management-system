<%@ Page Language="C#" MasterPageFile="~/student/Student.master" AutoEventWireup="true" CodeFile="guiMark.aspx.cs" Inherits="student_guiMark" Title="计软院论文管理系统-指导记录" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Panel ID="Panel1" runat="server" GroupingText="以往指导记录查看" Height="83px" Width="900px">
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True"
            AutoGenerateColumns="False" BackColor="White" BorderColor="White" BorderStyle="Ridge"
            BorderWidth="2px" CellPadding="3" DataSourceID="SqlDataSource1" EmptyDataText="暂无数据,请填写指导记录"
            PageSize="5" CellSpacing="1" GridLines="None">
            <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
            <Columns>
                <asp:BoundField DataField="student_ID" HeaderText="学号" SortExpression="student_ID" />
                <asp:TemplateField HeaderText="姓名" SortExpression="student_Name">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("student_Name") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("student_Name") %>' Width="75px"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="指导老师" SortExpression="teacher_Name">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("teacher_Name") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("teacher_Name") %>' Width="75px"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="填写日期" SortExpression="time">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("time") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("time", "{0:d}") %>' Width="80px"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="总次数" SortExpression="totalNum">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("totalNum") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("totalNum") %>' Width="50px"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="本次次数" SortExpression="count">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("count") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label5" runat="server" Text='<%# Bind("count") %>' Width="75px"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="指导记录" SortExpression="guimark">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("guimark") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Height="40px" Text='<%# Bind("guimark") %>'
                            TextMode="MultiLine" Width="350px" ReadOnly="True"></asp:TextBox>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <RowStyle BackColor="#DEDFDE" ForeColor="Black" />
            <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
            <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:paperDataBase %>"
            SelectCommand="SELECT * FROM [guiMark] WHERE ([student_ID] = @student_ID) ORDER BY [time] DESC">
            <SelectParameters>
                <asp:SessionParameter Name="student_ID" SessionField="username" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
    </asp:Panel>
    <br />
    <asp:Panel ID="Panel2" runat="server" GroupingText="指导记录填写" Height="229px" Width="900px" BackImageUrl="~/images/背景.jpg">
        <table width="850" border="1"  style=" border-color:Aqua">
            <caption>
                <span style="font-size: 16pt; font-family: 华文行楷;">指导记录</span></caption>
            <tr>
                <td style="width: 100px; height: 14px">
                    学号</td>
                <td style="width: 100px; height: 14px">
                    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label></td>
                <td style="width: 100px; height: 14px">
                    学生姓名</td>
                <td style="width: 229px; height: 14px">
                    <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label></td>
            </tr>
            <tr>
                <td style="width: 100px; height: 14px">
                    指导老师</td>
                <td style="width: 100px; height: 14px">
                    <asp:Label ID="Label3" runat="server" Text="Label"></asp:Label></td>
                <td style="width: 100px; height: 14px">
                    填写日期</td>
                <td style="width: 229px; height: 14px">
                    <asp:Label ID="Label4" runat="server" Text="Label"></asp:Label></td>
            </tr>
            <tr>
                <td style="width: 100px; height: 14px">
                    总次数</td>
                <td style="width: 100px; height: 14px">
                    <asp:Label ID="Label5" runat="server" Text="Label"></asp:Label></td>
                <td style="width: 100px; height: 14px">
                    本次次数为</td>
                <td style="width: 229px; height: 14px">
                    <asp:Label ID="Label6" runat="server" Text="Label"></asp:Label></td>
            </tr>
            <tr>
                <td style="width: 100px; height: 16px">
                    指导记录</td>
                <td colspan="3" style="height: 16px">
                    <asp:TextBox ID="TextBox1" runat="server" Height="200px" TextMode="MultiLine" Width="700px" OnTextChanged="TextBox1_TextChanged"></asp:TextBox></td>
            </tr>
            <tr>
                <td colspan="4" style="text-align: center">
                    <asp:Button ID="Button1" runat="server" BackColor="#C0FFFF" BorderColor="Blue" ForeColor="Blue"
                        OnClick="Button1_Click" Text="提交" />
                    <asp:Label ID="Label7" runat="server"></asp:Label></td>
            </tr>
        </table>
    </asp:Panel>
</asp:Content>

