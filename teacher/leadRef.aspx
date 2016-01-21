<%@ Page Language="C#" MasterPageFile="~/teacher/Teacher.master" AutoEventWireup="true" CodeFile="leadRef.aspx.cs" Inherits="teacher_leadRef" Title="计软院论文管理系统-领导反馈" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Panel ID="Panel1" runat="server" GroupingText="领导反馈" Height="144px" Width="577px">
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True"
            AutoGenerateColumns="False" Caption="领导意见反馈" CellPadding="1" DataKeyNames="id" DataSourceID="paperref"
            EmptyDataText="暂无评论" PageSize="5" GridLines="None" BackColor="White" BorderColor="White" BorderStyle="None" BorderWidth="2px" CellSpacing="1" Width="900px">
            <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
            <EmptyDataRowStyle Font-Bold="True" />
            <Columns>
                <asp:TemplateField HeaderText="职位" SortExpression="role">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("role") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("role") %>' Width="70px"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="领导姓名" SortExpression="lead_Name">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("lead_Name") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("lead_Name") %>' Width="70px"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="论文题目" SortExpression="title">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("title") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("title") %>' Width="250px"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="评论时间" SortExpression="time">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("time") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%# Eval("time", "{0:d}") %>' Width="150px"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="state" HeaderText="是否通过" SortExpression="state" />
                <asp:TemplateField HeaderText="评论内容" SortExpression="content">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("content") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Height="56px" ReadOnly="True" Text='<%# Bind("content") %>'
                            TextMode="MultiLine" Width="305px"></asp:TextBox>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <RowStyle BackColor="#DEDFDE" ForeColor="Black" />
            <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
            <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" />
        </asp:GridView>
        <asp:SqlDataSource ID="paperref" runat="server" ConnectionString="<%$ ConnectionStrings:paperDataBase %>"
            SelectCommand="SELECT * FROM [TtoLContent] WHERE ([teacher_ID] = @teacher_ID) ORDER BY [time] DESC">
            <SelectParameters>
                <asp:SessionParameter Name="teacher_ID" SessionField="username" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <span style="font-size: 18pt; font-family: 华文行楷"></span>
      <a href="paperOpe.aspx" target= " _self" style=" font-size:16px;   background-color:White ; text-align:center;" >
          <span style="font-size: 18pt; font-family: 华文行楷">修改去》》</span></a><span style="font-size: 18pt;
              font-family: 华文行楷"> &nbsp; &nbsp;</span>&nbsp;</asp:Panel>
</asp:Content>

