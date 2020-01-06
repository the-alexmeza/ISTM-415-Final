<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Base.master" AutoEventWireup="true" CodeFile="Permissions.aspx.cs" Inherits="Pages_Permissions" %>

<%@ MasterType VirtualPath="~/MasterPages/Base.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div>
        <h1>Department Permissions</h1>
        <asp:sqldatasource id="SqlDataSource1" runat="server" connectionstring="<%$ ConnectionStrings:BoogleConnectionString %>" selectcommand="SELECT Department.Department_Name, Users.First_Name, Users.Last_Name, UserDepartmentPermissions.UserID, UserDepartmentPermissions.DepartmentID, UserDepartmentPermissions.Can_Read, UserDepartmentPermissions.Can_Edit, UserDepartmentPermissions.Can_Schedule, UserDepartmentPermissions.Is_Admin FROM UserDepartmentPermissions INNER JOIN Department ON UserDepartmentPermissions.DepartmentID = Department.DepartmentID INNER JOIN Users ON UserDepartmentPermissions.UserID = Users.UserID WHERE Department.DepartmentID = @SelectedDepartment" oldvaluesparameterformatstring="original_" updatecommand="UPDATE UserDepartmentPermissions SET Can_Edit = @Can_Edit, Can_Schedule = @Can_Schedule, Is_Admin = @Is_Admin, Can_Read = @Can_Read WHERE (UserID = @original_UserID) AND (DepartmentID = @original_DepartmentID)">
            <UpdateParameters>
                <asp:Parameter Name="Can_Edit" Type="Boolean" />
                <asp:Parameter Name="Can_Schedule" Type="Boolean" />
                <asp:Parameter Name="Is_Admin" Type="Boolean" />
                <asp:Parameter Name="Can_Read" Type="Boolean" />
                <asp:Parameter Name="original_UserID" />
                <asp:Parameter Name="original_DepartmentID" />
            </UpdateParameters>
            <SelectParameters>
                <asp:ControlParameter Name="SelectedDepartment" ControlID="SelectDepartment" Type="Int32" />
            </SelectParameters>
        </asp:sqldatasource>
        <asp:sqldatasource runat="server" ID="DeptDataSource" ConnectionString="<%$ ConnectionStrings:BoogleConnectionString %>" SelectCommand="SELECT * FROM [Department]"></asp:sqldatasource>
        
        <div class="container">
            <center>
        <table>
            <tr>
                <td>
                    Filter by Department
                </td>
            </tr>
            <tr>
                <td>
                    <asp:dropdownlist ID="SelectDepartment" CssClass="form-control" runat="server" DataSourceID="DeptDataSource" DataTextField="Department_Name" DataValueField="DepartmentID" AutoPostBack="True"></asp:dropdownlist>
                </td>
            </tr>
        </table>
        <asp:repeater ID="Repeater1" runat="server" datasourceid="SqlDataSource1">
            <HeaderTemplate>
                <table border="1" style="border-collapse: collapse">
                    <tr>
                        <td></td>
                        <td>Department Name</td>
                        <td>First Name</td>
                        <td>Last Name</td>
                        <td>Can Read</td>
                        <td>Can Schedule</td>
                        <td>Can Edit</td>
                        <td>Is Admin</td>
                    </tr>
            </HeaderTemplate>
            <ItemTemplate>
                <tr>
                    <td>
                        <a href="EditPermissions.aspx?user=<%# Eval("UserID") %>&dept=<%# Eval("DepartmentID") %>">Edit</a>
                    </td>
                    <td>
                         <%# Eval("Department_Name") %>
                    </td>
                    <td>
                        <%# Eval("First_Name") %>
                    </td>
                    <td>
                        <%# Eval("Last_Name") %>
                    </td>
                    <td>
                        <select id="CanRead_<%# Eval("UserID") %>_<%# Eval("DepartmentID") %>" disabled>
                            <option value="<%# Convert.ToInt32(Eval("Can_Read")) == 1 %>" selected><%# Convert.ToInt32(Eval("Can_Read")) == 1 %></option>
                            <option value="<%# Convert.ToInt32(Eval("Can_Read")) != 1 %>"><%# Convert.ToInt32(Eval("Can_Read")) != 1 %></option>
                        </select>
                    </td>
                    <td>
                        <select id="CanSchedule_<%# Eval("UserID") %>_<%# Eval("DepartmentID") %>" disabled>
                            <option value="<%# Convert.ToInt32(Eval("Can_Schedule")) == 1 %>" selected><%# Convert.ToInt32(Eval("Can_Schedule")) == 1 %></option>
                            <option value="<%# Convert.ToInt32(Eval("Can_Schedule")) != 1 %>"><%# Convert.ToInt32(Eval("Can_Schedule")) != 1 %></option>
                        </select>
                    </td>
                    <td>
                        <select id="CanEdit_<%# Eval("UserID") %>_<%# Eval("DepartmentID") %>" disabled>
                            <option value="<%# Convert.ToInt32(Eval("Can_Edit")) == 1 %>" selected><%# Convert.ToInt32(Eval("Can_Edit")) == 1 %></option>
                            <option value="<%# Convert.ToInt32(Eval("Can_Edit")) != 1 %>"><%# Convert.ToInt32(Eval("Can_Edit")) != 1 %></option>
                        </select>
                    </td>
                    <td>
                        <select id="IsAdmin_<%# Eval("UserID") %>_<%# Eval("DepartmentID") %>" disabled>
                            <option value="<%# Convert.ToInt32(Eval("Is_Admin")) == 1 %>" selected><%# Convert.ToInt32(Eval("Is_Admin")) == 1 %></option>
                            <option value="<%# Convert.ToInt32(Eval("Is_Admin")) != 1 %>"><%# Convert.ToInt32(Eval("Is_Admin")) != 1 %></option>
                        </select>
                    </td>
                </tr>
            </ItemTemplate>
            <FooterTemplate>
                </table>
            </FooterTemplate>
        </asp:repeater>
                </center>
        </div>
    </div>
</asp:Content>

