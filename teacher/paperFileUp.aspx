<%@ Page Language="C#" MasterPageFile="~/teacher/Teacher.master" AutoEventWireup="true" CodeFile="paperFileUp.aspx.cs" Inherits="teacher_paperFileUp" Title="计软院论文管理系统- 论文提交" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Panel ID="Panel1" runat="server" GroupingText="论文提交" Height="147px" Width="900px" BackImageUrl="~/images/背景.jpg">
        <table>
            <caption>
                <span style="font-size: 16pt; font-family: 华文行楷;">论文上传</span></caption>
            <tr>
                <td style="width: 100px">
                    请选择您的学生：</td>
                <td colspan="2">
                    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1"
                        DataTextField="student_Name" DataValueField="student_ID">
                    </asp:DropDownList><asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:paperDataBase %>"
                        SelectCommand="SELECT * FROM [select_Result] WHERE (([teacher_ID] = @teacher_ID) AND ([grade] = @grade))">
                        <SelectParameters>
                            <asp:SessionParameter Name="teacher_ID" SessionField="username" Type="String" />
                            <asp:SessionParameter Name="grade" SessionField="year1" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td style="width: 100px">
                    <asp:Button ID="Button1" runat="server" BackColor="#C0FFFF" BorderColor="Blue" ForeColor="Blue"
                        OnClick="Button1_Click" Text="上传" /></td>
                <td colspan="2">
                    <asp:FileUpload ID="FileUpload1" runat="server" BackColor="#8080FF" BorderColor="Blue"
                        ForeColor="Blue" /></td>
            </tr>
            <tr>
                <td colspan="3" style="text-align: center">
                    <asp:Label ID="Label1" runat="server"></asp:Label></td>
            </tr>
        </table>
    </asp:Panel>
</asp:Content>

