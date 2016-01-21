<%@ Page Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeFile="time_Set.aspx.cs" Inherits="admin_time_Set" Title="计算机论文管理系统-时间设定" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Panel ID="Panel1" runat="server" GroupingText="时间设定" Height="135px" Width="800px">
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True"
            AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="time" OnRowEditing="GridView1_RowEditing" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" Caption="各阶段时间设定" PageSize="12" BackColor="Maroon" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" CaptionAlign="Top" CellPadding="3" CellSpacing="1" ForeColor="#8080FF" GridLines="None" Width="700px">
            <Columns>
                <asp:TemplateField HeaderText="阶段" SortExpression="period">
                    <EditItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("period") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("period") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="开始时间" SortExpression="period_Start">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("period_Start", "{0:d}") %>' Width="75px"></asp:TextBox>
                        <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="TextBox3"
                            Display="Dynamic" ErrorMessage="*请输入正确的日期格式(2009-07-12)" Operator="DataTypeCheck"
                            Type="Date"></asp:CompareValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("period_Start", "{0:d}") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="结束时间" SortExpression="period_End">
                    <EditItemTemplate>
                        <br />
                        &nbsp; &nbsp;
                        <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("period_End", "{0:d}") %>' Width="75px"></asp:TextBox>
                        <asp:CompareValidator ID="CompareValidator2" runat="server" ControlToCompare="TextBox3"
                            ControlToValidate="TextBox4" ErrorMessage="*开始时间不得大于结束时间" Operator="GreaterThan" Type="Date"></asp:CompareValidator>
                        <asp:CompareValidator ID="CompareValidator3" runat="server" ControlToCompare="TextBox3"
                            ControlToValidate="TextBox4" Display="Dynamic" ErrorMessage="*请输入正确的日期格式(2009-07-12)"
                            Operator="DataTypeCheck" Type="Date"></asp:CompareValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("period_End", "{0:d}") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="备注" SortExpression="remark">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("remark") %>' Width="100px" TextMode="MultiLine"></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label5" runat="server" Text='<%# Bind("remark") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="开关" SortExpression="flag">
                    <EditItemTemplate>
                        &nbsp;<asp:RadioButtonList ID="RadioButtonList1" runat="server" RepeatDirection="Horizontal"
                            SelectedValue='<%# Bind("flag") %>'>
                            <asp:ListItem>开</asp:ListItem>
                            <asp:ListItem>关</asp:ListItem>
                        </asp:RadioButtonList>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("flag") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:CommandField ShowEditButton="True" ButtonType="Button" EditText="设定" UpdateText="更改" >
                    <ControlStyle BackColor="#80FFFF" BorderColor="Blue" />
                </asp:CommandField>
            </Columns>
            <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
            <RowStyle BackColor="#C0FFFF" ForeColor="Black" />
            <EditRowStyle BackColor="#8080FF" ForeColor="#80FFFF" />
            <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
            <HeaderStyle BackColor="#8080FF" Font-Bold="True" ForeColor="#E7E7FF" />
        </asp:GridView>
        <asp:SqlDataSource ID="time" runat="server" ConnectionString="<%$ ConnectionStrings:paperDataBase %>"
            DeleteCommand="DELETE FROM [time] WHERE [id] = @id" InsertCommand="INSERT INTO [time] ([period], [period_Start], [period_End], [remark], [flag]) VALUES (@period, @period_Start, @period_End, @remark, @flag)"
            SelectCommand="SELECT * FROM [time]" UpdateCommand="UPDATE [time] SET [period] = @period, [period_Start] = @period_Start, [period_End] = @period_End, [remark] = @remark, [flag] = @flag WHERE [id] = @id">
            <DeleteParameters>
                <asp:Parameter Name="id" Type="Int32" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="period" Type="String" />
                <asp:Parameter Name="period_Start" Type="String" />
                <asp:Parameter Name="period_End" Type="String" />
                <asp:Parameter Name="remark" Type="String" />
                <asp:Parameter Name="flag" Type="String" />
                <asp:Parameter Name="id" Type="Int32" />
            </UpdateParameters>
            <InsertParameters>
                <asp:Parameter Name="period" Type="String" />
                <asp:Parameter Name="period_Start" Type="String" />
                <asp:Parameter Name="period_End" Type="String" />
                <asp:Parameter Name="remark" Type="String" />
                <asp:Parameter Name="flag" Type="String" />
            </InsertParameters>
        </asp:SqlDataSource>
    </asp:Panel>
</asp:Content>

