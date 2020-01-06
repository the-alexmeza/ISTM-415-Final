<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Base.master" AutoEventWireup="true" CodeFile="ViewMeeting.aspx.cs" Inherits="Pages_ViewMeeting" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div>
        
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BoogleConnectionString %>" SelectCommand="SELECT * FROM [Page]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:BoogleConnectionString %>" SelectCommand="SELECT [UserID], [DepartmentID], [Can_Edit] FROM [UserDepartmentPermissions]"></asp:SqlDataSource>
        <h1>Meeting Details</h1>
        <div class="col-80">
            <div class="container">
                <asp:Label ID="lblPageHeader" runat="server" Text=""></asp:Label>
                <hr />
                <asp:Label ID="lblPageBody" runat="server" Text=""></asp:Label>
            </div>
        </div>
        <div class="col-20">
            <asp:Label ID="lblEdit" runat="server" Text=""></asp:Label>
        </div>
        <br />
    </div>
</asp:Content>

