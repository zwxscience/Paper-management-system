<%@ Page Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeFile="teacher_informationInput.aspx.cs" Inherits="admin_teacher_informationInput" Title="教师信息导入" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
 <asp:Panel ID="Panel1" runat="server" Height="98px" Width="493px">           
      <strong><span style="font-size: 16pt; font-family: 华文行楷;">上传教师信息</span></strong>
      <hr />
        <table style="width: 430px" >

            <tr>
                <td style="width: 161px">
                    请选择您要上传的Excel文件</td>
                <td style="width: 259px">
                    <asp:FileUpload ID="FileUpload1" runat="server"   BackColor="#80FFFF" BorderColor="Blue" ForeColor="Blue" /></td>
            </tr>
            <tr>
                <td colspan="2" style="text-align: center">
                    <asp:Button ID="Button1" runat="server" Text="上传"   BackColor="#80FFFF" BorderColor="Blue" ForeColor="Blue" OnClick="Button1_Click"/></td>
            </tr>
        </table>
    
    </asp:Panel>
    <asp:Panel ID="Panel2" runat="server" Height="55px" Width="491px">
      
        <strong><span style="font-size: 16pt; font-family: 华文行楷;">导入到数据库</span></strong>
        <hr />
        <table style="width: 430px" >     
            <tr>
                <td style="width: 428px; height: 43px; text-align: center;">
        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label><br />
                    请点击导入键将Excel中的内容导入</td>
            </tr>
            <tr>
                <td style="width: 430px; height: 26px; text-align: center;">
                    <asp:Button ID="Button2" runat="server" Text="导入"   BackColor="#80FFFF" BorderColor="Blue" ForeColor="Blue" OnClick="Button2_Click"/></td>
            </tr>
        </table>
    </asp:Panel>
    <p style=" text-align:center">
        <asp:Label ID="Label2" runat="server" Text="Label" Visible="False" ></asp:Label></p>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White"
        BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" CellPadding="3" CellSpacing="1" GridLines="None" AllowPaging="True" Caption="教师信息一览" CaptionAlign="Top" HorizontalAlign="Center" PageSize="8" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" AllowSorting="True" DataSourceID="SqlDataSource1" EmptyDataText="暂无数据导入">
        <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
        <Columns>
            <asp:BoundField DataField="teacher_ID" HeaderText="教师号" SortExpression="teacher_ID" />
            <asp:BoundField DataField="name" HeaderText="教师姓名" SortExpression="name" />
            <asp:BoundField DataField="role" HeaderText="教师" SortExpression="role" />
            <asp:BoundField DataField="sex" HeaderText="性别" SortExpression="sex" />
            <asp:BoundField DataField="department" HeaderText="部门" SortExpression="department" />
            <asp:BoundField DataField="zhicheng" HeaderText="职称" SortExpression="zhicheng" />
            <asp:BoundField DataField="position" HeaderText="职位" SortExpression="position" />
        </Columns>
        <RowStyle BackColor="#DEDFDE" ForeColor="Black" />
        <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
        <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:paperDataBase %>"
        SelectCommand="SELECT * FROM [teacher]"></asp:SqlDataSource>
</asp:Content>

