<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Base.master" AutoEventWireup="true" CodeFile="Meetings.aspx.cs" Inherits="Pages_Meetings" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div>
        <h1>Meetings</h1>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BoogleConnectionString %>" SelectCommand="SELECT * FROM [Event] WHERE DepartmentID = @DepartmentID">
            <SelectParameters>
                <asp:Parameter Name="DepartmentID" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:BoogleConnectionString %>" SelectCommand="SELECT * FROM [UserDepartmentPermissions]"></asp:SqlDataSource>
        
        <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1" OnItemDataBound="Repeater1_ItemDataBound">
            <HeaderTemplate>
                <div class="col-70">
            </HeaderTemplate>
            <ItemTemplate>
                <div class="container">
                    <center>
                        <h3>
                            <a href="ViewMeeting.aspx?meeting=<%# Eval("EventID") %>">
                                <%# Eval("Event_Title") %>
                            </a>
                        </h3>
                        <p class="form-label" style="margin-top: 0">
                            <%# Eval("Event_Description") %>
                        </p>
                        <p class="form-label" style="margin-top: 0">
                            <%# Eval("Event_Location") %>
                        </p>
                        <p>
                            <strong style="font-size:14px"><%# Eval("Starting_DateTime") %> - <%# Eval("Ending_DateTime") %></strong>
                        </p>
                    </center>
                </div>
                <br />
            </ItemTemplate>
            <FooterTemplate>
                </div>
                <asp:Label ID="Label1" runat="server" Text="There is nothing here yet!" Visible="false"></asp:Label>
            </FooterTemplate>
        </asp:Repeater>

        <div class="col-30">
            <div class="container" style="padding:0;background:none;">
            <asp:Label ID="lblSchedule" runat="server" Text=""></asp:Label>
                <br />
                <br />
            <asp:Label ID="lblAddMembers" runat="server" Text=""></asp:Label>
            </div>
        </div>
    </div>
</asp:Content>

