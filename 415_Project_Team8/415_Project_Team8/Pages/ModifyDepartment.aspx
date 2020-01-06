<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Base.master" AutoEventWireup="true" CodeFile="ModifyDepartment.aspx.cs" Inherits="Pages_ModifyDepartment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div>
        <h1>Create Department</h1>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BoogleConnectionString %>" DeleteCommand="DELETE FROM [Department] WHERE [DepartmentID] = @original_DepartmentID" InsertCommand="INSERT INTO [Department] ([Department_Name], [Department_Description]) VALUES (@Department_Name, @Department_Description)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Department]" UpdateCommand="UPDATE [Department] SET [Department_Name] = @Department_Name, [Department_Description] = @Department_Description WHERE [DepartmentID] = @original_DepartmentID">
            <deleteparameters>
                <asp:Parameter Name="original_DepartmentID" Type="Int32" />
            </deleteparameters>
            <insertparameters>
                <asp:Parameter Name="Department_Name" Type="String" />
                <asp:Parameter Name="Department_Description" Type="String" />
            </insertparameters>
            <updateparameters>
                <asp:Parameter Name="Department_Name" Type="String" />
                <asp:Parameter Name="Department_Description" Type="String" />
                <asp:Parameter Name="original_DepartmentID" Type="Int32" />
            </updateparameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:BoogleConnectionString %>" SelectCommand="SELECT * FROM [UserDepartmentPermissions]"></asp:SqlDataSource>
        <div class="container">
            <asp:ListView ID="ListView1" runat="server" DataKeyNames="DepartmentID" DataSourceID="SqlDataSource1" InsertItemPosition="LastItem" OnItemInserted="ListView1_ItemInserted">
                <edititemtemplate>
                <tr style="background-color:#008A8C;color: #FFFFFF;">
                    <td>
                        <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                    </td>
                    <td>
                        <asp:Label ID="DepartmentIDLabel1" runat="server" Text='<%# Eval("DepartmentID") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="Department_NameTextBox" runat="server" Text='<%# Bind("Department_Name") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="Department_DescriptionTextBox" runat="server" Text='<%# Bind("Department_Description") %>' />
                    </td>
                </tr>
            </edititemtemplate>
                <emptydatatemplate>
                <table runat="server" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;">
                    <tr>
                        <td>No data was returned.</td>
                    </tr>
                </table>
            </emptydatatemplate>
                <insertitemtemplate>
                <tr style="">
                    <td>
                        <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                    </td>
                    <td>&nbsp;</td>
                    <td>
                        <asp:TextBox ID="Department_NameTextBox" runat="server" Text='<%# Bind("Department_Name") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="Department_DescriptionTextBox" runat="server" Text='<%# Bind("Department_Description") %>' />
                    </td>
                </tr>
            </insertitemtemplate>
                <itemtemplate>
                <tr style="color: #333333;">
                    <td>
                    </td>
                    <td>
                        <asp:Label ID="DepartmentIDLabel" runat="server" Text='<%# Eval("DepartmentID") %>' />
                    </td>
                    <td>
                        <asp:Label ID="Department_NameLabel" runat="server" Text='<%# Eval("Department_Name") %>' />
                    </td>
                    <td>
                        <asp:Label ID="Department_DescriptionLabel" runat="server" Text='<%# Eval("Department_Description") %>' />
                    </td>
                </tr>
            </itemtemplate>
                <layouttemplate>
                <table runat="server">
                    <tr runat="server">
                        <td runat="server">
                            <table id="itemPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                                <tr runat="server" style="color: #333333;">
                                    <th runat="server"></th>
                                    <th runat="server">Department ID</th>
                                    <th runat="server">Department Name</th>
                                    <th runat="server">Department Description</th>
                                </tr>
                                <tr id="itemPlaceholder" runat="server">
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr runat="server">
                        <td runat="server" style="text-align: center;background-color: #FAFAFA; color: #333333;">
                            <asp:DataPager ID="DataPager1" runat="server">
                                <Fields>
                                    <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowLastPageButton="True" />
                                </Fields>
                            </asp:DataPager>
                        </td>
                    </tr>
                </table>
            </layouttemplate>
                <selecteditemtemplate>
                <tr style="background-color:#008A8C;font-weight: bold;color: #FFFFFF;">
                    <td>
                    </td>
                    <td>
                        <asp:Label ID="DepartmentIDLabel" runat="server" Text='<%# Eval("DepartmentID") %>' />
                    </td>
                    <td>
                        <asp:Label ID="Department_NameLabel" runat="server" Text='<%# Eval("Department_Name") %>' />
                    </td>
                    <td>
                        <asp:Label ID="Department_DescriptionLabel" runat="server" Text='<%# Eval("Department_Description") %>' />
                    </td>
                </tr>
            </selecteditemtemplate>
            </asp:ListView>
            <br />
            <asp:Label ID="Message" runat="server" Text="" ForeColor="Red" Font-Size="Medium"></asp:Label>
        </div>
        
        <br />
        <asp:Label ID="addLink" runat="server" Text=""></asp:Label>
    </div>
</asp:Content>

