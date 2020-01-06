<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Base.master" AutoEventWireup="true" CodeFile="Departments.aspx.cs" Inherits="Pages_Departments" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div>
        <h1>Departments</h1>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BoogleConnectionString %>" SelectCommand="SELECT Department.DepartmentID, Department.Department_Name, Department.Department_Description, UserDepartmentPermissions.UserID, UserDepartmentPermissions.Can_Read FROM Department INNER JOIN UserDepartmentPermissions ON Department.DepartmentID = UserDepartmentPermissions.DepartmentID INNER JOIN Users ON UserDepartmentPermissions.UserID = Users.UserID WHERE (UserDepartmentPermissions.UserID = @UserID) AND (UserDepartmentPermissions.Can_Read = 1) AND (Users.Enabled = 1)">
            <selectparameters>
                <asp:SessionParameter Name="UserID" SessionField="UserID" />
            </selectparameters>
        </asp:SqlDataSource>
        <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
            <HeaderTemplate>
                <div class="col-70">
            </HeaderTemplate>
            <ItemTemplate>
                    <div class="container">
                        <center>
                            <p><a href="Meetings.aspx?dept=<%# Eval("DepartmentID") %>"><%# Eval("Department_Name") %></a></p>
                            <p><%# Eval("Department_Description") %></p>     
                        </center>
                    </div>
                    <br />
            </ItemTemplate>
            <FooterTemplate>
                </div>
            </FooterTemplate>
        </asp:Repeater>
        
        <div class="col-30">
            <div class="container yellow" style="text-align:center">
                <a href="ModifyDepartment.aspx" style="color: white; text-decoration: none">Create a Department</a>
            </div>
        </div>
    </div>
</asp:Content>

