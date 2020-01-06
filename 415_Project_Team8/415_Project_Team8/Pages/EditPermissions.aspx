<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Base.master" AutoEventWireup="true" CodeFile="EditPermissions.aspx.cs" Inherits="Pages_EditPermissions" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:BoogleConnectionString %>" DeleteCommand="DELETE FROM [Users] WHERE [UserID] = @original_UserID AND [First_Name] = @original_First_Name AND [Last_Name] = @original_Last_Name AND [Address] = @original_Address AND [City] = @original_City AND [State] = @original_State AND [ZipCode] = @original_ZipCode AND [Country] = @original_Country AND [Email] = @original_Email AND [Password] = @original_Password AND [Phone_Number] = @original_Phone_Number AND [Enabled] = @original_Enabled" InsertCommand="INSERT INTO [Users] ([First_Name], [Last_Name], [Address], [City], [State], [ZipCode], [Country], [Email], [Password], [Phone_Number], [Enabled]) VALUES (@First_Name, @Last_Name, @Address, @City, @State, @ZipCode, @Country, @Email, @Password, @Phone_Number, @Enabled)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Users] WHERE ([UserID] = @UserID)" UpdateCommand="UPDATE [Users] SET [First_Name] = @First_Name, [Last_Name] = @Last_Name, [Address] = @Address, [City] = @City, [State] = @State, [ZipCode] = @ZipCode, [Country] = @Country, [Email] = @Email, [Password] = @Password, [Phone_Number] = @Phone_Number, [Enabled] = @Enabled WHERE [UserID] = @original_UserID AND [First_Name] = @original_First_Name AND [Last_Name] = @original_Last_Name AND [Address] = @original_Address AND [City] = @original_City AND [State] = @original_State AND [ZipCode] = @original_ZipCode AND [Country] = @original_Country AND [Email] = @original_Email AND [Password] = @original_Password AND [Phone_Number] = @original_Phone_Number AND [Enabled] = @original_Enabled">
        <DeleteParameters>
            <asp:Parameter Name="original_UserID" Type="Int32" />
            <asp:Parameter Name="original_First_Name" Type="String" />
            <asp:Parameter Name="original_Last_Name" Type="String" />
            <asp:Parameter Name="original_Address" Type="String" />
            <asp:Parameter Name="original_City" Type="String" />
            <asp:Parameter Name="original_State" Type="String" />
            <asp:Parameter Name="original_ZipCode" Type="String" />
            <asp:Parameter Name="original_Country" Type="String" />
            <asp:Parameter Name="original_Email" Type="String" />
            <asp:Parameter Name="original_Password" Type="String" />
            <asp:Parameter Name="original_Phone_Number" Type="String" />
            <asp:Parameter Name="original_Enabled" Type="Boolean" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="First_Name" Type="String" />
            <asp:Parameter Name="Last_Name" Type="String" />
            <asp:Parameter Name="Address" Type="String" />
            <asp:Parameter Name="City" Type="String" />
            <asp:Parameter Name="State" Type="String" />
            <asp:Parameter Name="ZipCode" Type="String" />
            <asp:Parameter Name="Country" Type="String" />
            <asp:Parameter Name="Email" Type="String" />
            <asp:Parameter Name="Password" Type="String" />
            <asp:Parameter Name="Phone_Number" Type="String" />
            <asp:Parameter Name="Enabled" Type="Boolean" />
        </InsertParameters>
        <SelectParameters>
            <asp:QueryStringParameter Name="UserID" QueryStringField="user" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="First_Name" Type="String" />
            <asp:Parameter Name="Last_Name" Type="String" />
            <asp:Parameter Name="Address" Type="String" />
            <asp:Parameter Name="City" Type="String" />
            <asp:Parameter Name="State" Type="String" />
            <asp:Parameter Name="ZipCode" Type="String" />
            <asp:Parameter Name="Country" Type="String" />
            <asp:Parameter Name="Email" Type="String" />
            <asp:Parameter Name="Password" Type="String" />
            <asp:Parameter Name="Phone_Number" Type="String" />
            <asp:Parameter Name="Enabled" Type="Boolean" />
            <asp:Parameter Name="original_UserID" Type="Int32" />
            <asp:Parameter Name="original_First_Name" Type="String" />
            <asp:Parameter Name="original_Last_Name" Type="String" />
            <asp:Parameter Name="original_Address" Type="String" />
            <asp:Parameter Name="original_City" Type="String" />
            <asp:Parameter Name="original_State" Type="String" />
            <asp:Parameter Name="original_ZipCode" Type="String" />
            <asp:Parameter Name="original_Country" Type="String" />
            <asp:Parameter Name="original_Email" Type="String" />
            <asp:Parameter Name="original_Password" Type="String" />
            <asp:Parameter Name="original_Phone_Number" Type="String" />
            <asp:Parameter Name="original_Enabled" Type="Boolean" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:BoogleConnectionString %>" DeleteCommand="DELETE FROM [UserDepartmentPermissions] WHERE [UserID] = @UserID AND [DepartmentID] = @DepartmentID" InsertCommand="INSERT INTO [UserDepartmentPermissions] ([UserID], [DepartmentID], [Can_Read], [Can_Edit], [Can_Schedule], [Is_Admin]) VALUES (@UserID, @DepartmentID, @Can_Read, @Can_Edit, @Can_Schedule, @Is_Admin)" SelectCommand="SELECT Can_Read, Can_Edit, Can_Schedule, Is_Admin FROM UserDepartmentPermissions WHERE (DepartmentID = @DepartmentID) AND (UserID = @UserID)" UpdateCommand="UPDATE [UserDepartmentPermissions] SET [Can_Read] = @Can_Read, [Can_Edit] = @Can_Edit, [Can_Schedule] = @Can_Schedule, [Is_Admin] = @Is_Admin WHERE [UserID] = @Orig_UserID AND [DepartmentID] = @Orig_DepartmentID">
        <DeleteParameters>
            <asp:Parameter Name="UserID" Type="Int32" />
            <asp:Parameter Name="DepartmentID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="UserID" Type="Int32" />
            <asp:Parameter Name="DepartmentID" Type="Int32" />
            <asp:Parameter Name="Can_Read" Type="Boolean" />
            <asp:Parameter Name="Can_Edit" Type="Boolean" />
            <asp:Parameter Name="Can_Schedule" Type="Boolean" />
            <asp:Parameter Name="Is_Admin" Type="Boolean" />
        </InsertParameters>
        <SelectParameters>
            <asp:QueryStringParameter Name="DepartmentID" QueryStringField="dept" Type="Int32" />
            <asp:QueryStringParameter Name="UserID" QueryStringField="user" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="Can_Read" Type="Boolean" />
            <asp:Parameter Name="Can_Edit" Type="Boolean" />
            <asp:Parameter Name="Can_Schedule" Type="Boolean" />
            <asp:Parameter Name="Is_Admin" Type="Boolean" />
            <asp:QueryStringParameter Name="Orig_DepartmentID" QueryStringField="dept" Type="Int32" />
            <asp:QueryStringParameter Name="Orig_UserID" QueryStringField="user" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:BoogleConnectionString %>" SelectCommand="SELECT * FROM [UserDepartmentPermissions]"></asp:SqlDataSource>
    <div id="login">
        <h1>Edit User/Permissions</h1>
        <div class="container">
            <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label>
            <p>User:</p>
            <center>
            <asp:DetailsView ID="DetailsView1" runat="server" Height="50px" Width="125px" AutoGenerateRows="False" DataKeyNames="UserID" DataSourceID="SqlDataSource1" OnItemUpdating="DetailsView1_ItemUpdating">
                <Fields>
                    <asp:TemplateField HeaderText="UserID" InsertVisible="False" SortExpression="UserID">
                        <EditItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("UserID") %>'></asp:Label>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("UserID") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="First_Name" SortExpression="First_Name">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("First_Name") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="First Name is required." ForeColor="Red" CssClass="form-label" ControlToValidate="TextBox1" Display="Dynamic"></asp:RequiredFieldValidator>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("First_Name") %>'></asp:TextBox>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("First_Name") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Last_Name" SortExpression="Last_Name">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Last_Name") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Last Name is required." ForeColor="Red" CssClass="form-label" ControlToValidate="TextBox2" Display="Dynamic"></asp:RequiredFieldValidator>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Last_Name") %>'></asp:TextBox>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("Last_Name") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Address" SortExpression="Address">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Address") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Address is required." ForeColor="Red" CssClass="form-label" ControlToValidate="TextBox3" Display="Dynamic"></asp:RequiredFieldValidator>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Address") %>'></asp:TextBox>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label4" runat="server" Text='<%# Bind("Address") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="City" SortExpression="City">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("City") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="City is required." ForeColor="Red" CssClass="form-label" ControlToValidate="TextBox4" Display="Dynamic"></asp:RequiredFieldValidator>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("City") %>'></asp:TextBox>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label5" runat="server" Text='<%# Bind("City") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="State" SortExpression="State">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("State") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="State is required." ForeColor="Red" CssClass="form-label" ControlToValidate="TextBox5" Display="Dynamic"></asp:RequiredFieldValidator>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("State") %>'></asp:TextBox>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label6" runat="server" Text='<%# Bind("State") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="ZipCode" SortExpression="ZipCode">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("ZipCode") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Zip code is required." ForeColor="Red" CssClass="form-label" ControlToValidate="TextBox6" Display="Dynamic"></asp:RequiredFieldValidator>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("ZipCode") %>'></asp:TextBox>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label7" runat="server" Text='<%# Bind("ZipCode") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Country" SortExpression="Country">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("Country") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="Country is required." ForeColor="Red" CssClass="form-label" ControlToValidate="TextBox7" Display="Dynamic"></asp:RequiredFieldValidator>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("Country") %>'></asp:TextBox>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label8" runat="server" Text='<%# Bind("Country") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Email" SortExpression="Email">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("Email") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="Email is required." ForeColor="Red" CssClass="form-label" ControlToValidate="TextBox8" Display="Dynamic"></asp:RequiredFieldValidator>
                            <asp:regularexpressionvalidator id="RegularExpressionValidator1" CssClass="form-label" runat="server" controltovalidate="TextBox8" display="Dynamic" errormessage="Please enter a valid email address." forecolor="Red" validationexpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:regularexpressionvalidator>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("Email") %>'></asp:TextBox>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label9" runat="server" Text='<%# Bind("Email") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Password" SortExpression="Password">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox9" runat="server" Text='<%# Bind("Password") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="Password is required." ForeColor="Red" CssClass="form-label" ControlToValidate="TextBox9" Display="Dynamic"></asp:RequiredFieldValidator>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBox9" runat="server" Text='<%# Bind("Password") %>'></asp:TextBox>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label10" runat="server" Text='<%# Bind("Password") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Phone_Number" SortExpression="Phone_Number">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox10" runat="server" Text='<%# Bind("Phone_Number") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ErrorMessage="Phone Number is required." ForeColor="Red" CssClass="form-label" ControlToValidate="TextBox10" Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" CssClass="form-label" runat="server" ControlToValidate="TextBox10" Display="Dynamic" ErrorMessage="Phone number must be 10 digits long." ForeColor="Red" ValidationExpression="\d{10}"></asp:RegularExpressionValidator>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBox10" runat="server" Text='<%# Bind("Phone_Number") %>'></asp:TextBox>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label11" runat="server" Text='<%# Bind("Phone_Number") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Enabled" SortExpression="Enabled">
                        <EditItemTemplate>
                            <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("Enabled") %>' />
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("Enabled") %>' />
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("Enabled") %>' Enabled="false" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:CommandField ShowEditButton="True" />
                </Fields>
            </asp:DetailsView>
            </center>
            <p>Permissions:</p>
            <center>
                <asp:DetailsView ID="DetailsView2" runat="server" Height="50px" Width="125px" DataSourceID="SqlDataSource2" AutoGenerateRows="False">
                    <Fields>
                        <asp:CheckBoxField DataField="Can_Read" HeaderText="Can_Read" SortExpression="Can_Read" />
                        <asp:CheckBoxField DataField="Can_Edit" HeaderText="Can_Edit" SortExpression="Can_Edit" />
                        <asp:CheckBoxField DataField="Can_Schedule" HeaderText="Can_Schedule" SortExpression="Can_Schedule" />
                        <asp:CheckBoxField DataField="Is_Admin" HeaderText="Is_Admin" SortExpression="Is_Admin" />
                        <asp:CommandField ShowEditButton="True" />
                    </Fields>
                </asp:DetailsView>
            </center>
        </div>
     </div>
</asp:Content>

