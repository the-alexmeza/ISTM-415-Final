<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Base.master" AutoEventWireup="true" CodeFile="ModifyMeeting.aspx.cs" Inherits="Pages_ModifyMeeting" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div>
        <h1>Edit Meeting Page
        </h1>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:BoogleConnectionString %>" DeleteCommand="DELETE FROM [Page] WHERE [PageID] = @original_PageID AND [DepartmentID] = @original_DepartmentID AND [EventID] = @original_EventID AND [Page_Title] = @original_Page_Title AND [Page_Content] = @original_Page_Content" InsertCommand="INSERT INTO [Page] ([DepartmentID], [EventID], [Page_Title], [Page_Content]) VALUES (@DepartmentID, @EventID, @Page_Title, @Page_Content)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Page] WHERE ([PageID] = @PageID)" UpdateCommand="UPDATE [Page] SET [DepartmentID] = @DepartmentID, [EventID] = @EventID, [Page_Title] = @Page_Title, [Page_Content] = @Page_Content WHERE [PageID] = @original_PageID AND [DepartmentID] = @original_DepartmentID AND [EventID] = @original_EventID AND [Page_Title] = @original_Page_Title AND [Page_Content] = @original_Page_Content">
            <DeleteParameters>
                <asp:Parameter Name="original_PageID" Type="Int32" />
                <asp:Parameter Name="original_DepartmentID" Type="Int32" />
                <asp:Parameter Name="original_EventID" Type="Int32" />
                <asp:Parameter Name="original_Page_Title" Type="String" />
                <asp:Parameter Name="original_Page_Content" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="DepartmentID" Type="Int32" />
                <asp:Parameter Name="EventID" Type="Int32" />
                <asp:Parameter Name="Page_Title" Type="String" />
                <asp:Parameter Name="Page_Content" Type="String" />
            </InsertParameters>
            <SelectParameters>
                <asp:QueryStringParameter Name="PageID" QueryStringField="page" Type="Int32" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="DepartmentID" Type="Int32" />
                <asp:Parameter Name="EventID" Type="Int32" />
                <asp:Parameter Name="Page_Title" Type="String" />
                <asp:Parameter Name="Page_Content" Type="String" />
                <asp:Parameter Name="original_PageID" Type="Int32" />
                <asp:Parameter Name="original_DepartmentID" Type="Int32" />
                <asp:Parameter Name="original_EventID" Type="Int32" />
                <asp:Parameter Name="original_Page_Title" Type="String" />
                <asp:Parameter Name="original_Page_Content" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <div class="container">
            <center>
                <asp:Label ID="lblMessage" runat="server" Text="" Visible="false" ForeColor="Green" CssClass="form-label"></asp:Label>
            </center>
            <asp:FormView ID="FormView1" runat="server" DataKeyNames="PageID" DataSourceID="SqlDataSource1" DefaultMode="Edit" RenderOuterTable="false" OnItemUpdated="FormView1_ItemUpdated">
                <EditItemTemplate>
                    <a href="ViewMeeting.aspx?meeting=<%# Eval("EventID") %>">Back</a>
                    <asp:LinkButton ID="UpdateButton" runat="server" Style="float: right" CausesValidation="True" CommandName="Update" Text="Save" />
                    <asp:Label ID="PageIDLabel1" runat="server" Text='<%# Eval("PageID") %>' Visible="false" />
                    <asp:TextBox ID="DepartmentIDTextBox" runat="server" Text='<%# Bind("DepartmentID") %>' Enabled="false" Visible="false" />
                    <asp:TextBox ID="EventIDTextBox" runat="server" Text='<%# Bind("EventID") %>' Enabled="false" Visible="false" />
                    <p class="form-label">Title:</p>
                    <asp:TextBox ID="Page_TitleTextBox" CssClass="form-control-title" runat="server" Text='<%# Bind("Page_Title") %>' />
                    <hr />
                    <br />
                    <asp:TextBox ID="Page_ContentTextBox" runat="server" Text='<%# Bind("Page_Content") %>' TextMode="MultiLine" CssClass="form-control" Rows="32" />
                    <br />
                </EditItemTemplate>
                <ItemTemplate>
                    PageID:
                    <asp:Label ID="PageIDLabel" runat="server" Text='<%# Eval("PageID") %>' />
                    <br />
                    DepartmentID:
                    <asp:Label ID="DepartmentIDLabel" runat="server" Text='<%# Bind("DepartmentID") %>' />
                    <br />
                    EventID:
                    <asp:Label ID="EventIDLabel" runat="server" Text='<%# Bind("EventID") %>' />
                    <br />
                    Page_Title:
                    <asp:Label ID="Page_TitleLabel" runat="server" Text='<%# Bind("Page_Title") %>' />
                    <br />
                    Page_Content:
                    <asp:Label ID="Page_ContentLabel" runat="server" Text='<%# Bind("Page_Content") %>' />
                    <br />
                    <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
                </ItemTemplate>
            </asp:FormView>
        </div>
    </div>
    <br />
    <br />
    <br />
    <br />
</asp:Content>

