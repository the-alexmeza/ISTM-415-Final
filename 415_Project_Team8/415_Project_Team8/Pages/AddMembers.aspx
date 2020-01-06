<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Base.master" AutoEventWireup="true" CodeFile="AddMembers.aspx.cs" Inherits="Pages_AddMembers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BoogleConnectionString %>"
        SelectCommand="SELECT [Email], [UserID] FROM [Users]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:BoogleConnectionString %>"
        SelectCommand="SELECT [DepartmentID], [UserID] FROM [UserDepartmentPermissions] WHERE ([DepartmentID] = @DepartmentID)">
        <SelectParameters>
            <asp:QueryStringParameter Name="DepartmentID" QueryStringField="dept" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <div>
        <h1>Add Users</h1>

        <div class="container">
            <asp:Label ID="Label1" runat="server" CssClass="form-label"
                kkText="Enter a comma-delimited list of emails to add to your department (ex: user@user.com, user@user2.com): "></asp:Label><br />
            <asp:TextBox ID="MemberList" runat="server" CssClass="form-control" Columns="64" Rows="8" TextMode="MultiLine"></asp:TextBox>
            <asp:Button ID="btnAddMembers" runat="server" CssClass="form-button" Text="Add Members" OnClick="btnAddMembers_Click" />
            <br />
            <br />
            <asp:Label ID="lblErrors" runat="server" ForeColor="Red"></asp:Label>
            <br />
            <asp:Label ID="lblSuccessful" runat="server" ForeColor="Green"></asp:Label><br />
            <asp:Label ID="lblEditPermissions" runat="server" Text=""></asp:Label>
        </div>
    </div>

</asp:Content>

