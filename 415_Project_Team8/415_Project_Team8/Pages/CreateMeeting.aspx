<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Base.master" AutoEventWireup="true" CodeFile="CreateMeeting.aspx.cs" Inherits="Pages_CreateMeeting" %>
<%@ MasterType VirtualPath="~/MasterPages/Base.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div>
        <h1>Schedule a Meeting</h1>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BoogleConnectionString %>" 
            SelectCommand="SELECT Department.DepartmentID, Department.Department_Name FROM Department INNER JOIN UserDepartmentPermissions ON Department.DepartmentID = UserDepartmentPermissions.DepartmentID WHERE (UserDepartmentPermissions.UserID = @UserID) AND (Department.DepartmentID IN (SELECT DepartmentID from UserDepartmentPermissions WHERE UserID = @UserID AND Can_Schedule=1))">
            <SelectParameters>
                <asp:SessionParameter Name="UserID" SessionField="UserID" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:BoogleConnectionString %>" 
            SelectCommand="SELECT * FROM [Event]" OnInserted="SqlDataSource2_Inserted"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:BoogleConnectionString %>" SelectCommand="SELECT * FROM [Page]"></asp:SqlDataSource>
        <div class="container">
        <asp:Label ID="lblMessage" runat="server" Text="" ForeColor="#33CC33"></asp:Label>
            <p class="form-label">Select Department:</p>
            <asp:dropdownlist ID="ddlDepartment" CssClass="form-control" runat="server" DataSourceID="SqlDataSource1" DataTextField="Department_Name" DataValueField="DepartmentID"></asp:dropdownlist>
            <p class="form-label">Start Time<span class="required">*</span>:</p>
            <asp:textbox ID="txtStartingTime" CssClass="form-control" runat="server" TextMode="DateTime"></asp:textbox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" CssClass="form-label" runat="server" ControlToValidate="txtStartingTime" Display="Dynamic" ErrorMessage="This field is required." ForeColor="Red"></asp:RequiredFieldValidator>
            <p class="form-label">Ending Time<span class="required">*</span>:</p>
            <asp:textbox ID="txtEndingTime" CssClass="form-control" runat="server" TextMode="DateTime"></asp:textbox>
            <asp:CompareValidator ID="CompareValidator2" CssClass="form-label" runat="server" ControlToCompare="txtStartingTime" ControlToValidate="txtEndingTime" Display="Dynamic" ErrorMessage="Ending datetime must be after start time." ForeColor="Red" Operator="GreaterThan"></asp:CompareValidator>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" CssClass="form-label" runat="server" ControlToValidate="txtEndingTime" Display="Dynamic" ErrorMessage="This field is required." ForeColor="Red"></asp:RequiredFieldValidator>
            <p class="form-label">Event Title<span class="required">*</span>:</p>
            <asp:textbox ID="txtEventTitle" CssClass="form-control" runat="server"></asp:textbox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" CssClass="form-label" runat="server" ControlToValidate="txtEventTitle" Display="Dynamic" ErrorMessage="This field is required." ForeColor="Red"></asp:RequiredFieldValidator>
            <p class="form-label">Event Description<span class="required">*</span>:</p>
            <asp:textbox ID="txtEventDescription" CssClass="form-control" runat="server"></asp:textbox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" CssClass="form-label" runat="server" ControlToValidate="txtEventDescription" Display="Dynamic" ErrorMessage="This field is required." ForeColor="Red"></asp:RequiredFieldValidator>
            <p class="form-label">Event Location:</p>
            <asp:textbox ID="txtLocation" CssClass="form-control" runat="server"></asp:textbox>
            <br />
            <br />
            <asp:button ID="btnSchedule" CssClass="form-button" runat="server" text="Schedule" OnClick="btnSchedule_Click" />
        </div>
    </div>
</asp:Content>


