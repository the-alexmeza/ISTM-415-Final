<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Base.master" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Pages_Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BoogleConnectionString %>" DeleteCommand="DELETE FROM [Users] WHERE [UserID] = @UserID" InsertCommand="INSERT INTO [Users] ([First_Name], [Last_Name], [Address], [City], [State], [ZipCode], [Country], [Email], [Password], [Phone_Number]) VALUES (@First_Name, @Last_Name, @Address, @City, @State, @ZipCode, @Country, @Email, @Password, @Phone_Number)" SelectCommand="SELECT * FROM [Users]" UpdateCommand="UPDATE [Users] SET [First_Name] = @First_Name, [Last_Name] = @Last_Name, [Address] = @Address, [City] = @City, [State] = @State, [ZipCode] = @ZipCode, [Country] = @Country, [Email] = @Email, [Password] = @Password, [Phone_Number] = @Phone_Number WHERE [UserID] = @UserID">
        <deleteparameters>
            <asp:Parameter Name="UserID" Type="Int32" />
        </deleteparameters>
        <insertparameters>
            <asp:ControlParameter Name="First_Name" Type="String" ControlID="txtFirstName" />
            <asp:ControlParameter Name="Last_Name" Type="String" ControlID="txtLastName" />
            <asp:ControlParameter Name="Address" Type="String" ControlID="txtAddress" />
            <asp:ControlParameter Name="City" Type="String" ControlID="txtCity" />
            <asp:ControlParameter Name="State" Type="String" ControlID="txtState" />
            <asp:ControlParameter Name="ZipCode" Type="String" ControlID="txtZipCode"/>
            <asp:ControlParameter Name="Country" Type="String" ControlID="ddlCountry"/>
            <asp:ControlParameter Name="Email" Type="String" ControlID="txtEmail" />
            <asp:ControlParameter Name="Password" Type="String" ControlID="txtPassword" />
            <asp:ControlParameter Name="Phone_Number" Type="String" ControlID="txtPhoneNumber" />
        </insertparameters>
        <updateparameters>
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
            <asp:Parameter Name="UserID" Type="Int32" />
        </updateparameters>
    </asp:SqlDataSource>
    <div id="login">
        <h1>Register</h1>
        <div class="container">
            <p class="form-label" style="float: right"><span class="required">*</span> is a required field.</p>
            <asp:Label ID="lblMessage" runat="server" Text="" CssClass="form-label" ForeColor="Red"></asp:Label>
            <p class="form-label">First Name: <span class="required">*</span></p>
            <asp:textbox id="txtFirstName" runat="server" CssClass="form-control"></asp:textbox>
            <asp:requiredfieldvalidator id="RequiredFieldValidator1" runat="server" controltovalidate="txtFirstName" display="Dynamic" errormessage="This field is required." CssClass="form-label" forecolor="Red"></asp:requiredfieldvalidator>
            <p class="form-label">Last Name: <span class="required">*</span></p>
            <asp:textbox id="txtLastName" runat="server" CssClass="form-control"></asp:textbox>
            <asp:requiredfieldvalidator id="RequiredFieldValidator2" runat="server" CssClass="form-label" controltovalidate="txtLastName" display="Dynamic" errormessage="This field is required." forecolor="Red"></asp:requiredfieldvalidator>
            <p class="form-label">Address: <span class="required">*</span></p>
            <asp:textbox id="txtAddress" CssClass="form-control" runat="server"></asp:textbox>
            <asp:requiredfieldvalidator id="RequiredFieldValidator3" CssClass="form-label" runat="server" controltovalidate="txtAddress" display="Dynamic" errormessage="This field is required." forecolor="Red"></asp:requiredfieldvalidator>
            <p class="form-label">City: <span class="required">*</span></p>
            <asp:textbox id="txtCity" CssClass="form-control" runat="server"></asp:textbox>
            <asp:requiredfieldvalidator id="RequiredFieldValidator4" CssClass="form-label" runat="server" display="Dynamic" errormessage="This field is required." forecolor="Red" controltovalidate="txtCity"></asp:requiredfieldvalidator>
            <p class="form-label">State/Province: <span class="required">*</span></p>
            <asp:textbox id="txtState" CssClass="form-control" runat="server"></asp:textbox>
            <asp:requiredfieldvalidator id="RequiredFieldValidator10" CssClass="form-label" runat="server" display="Dynamic" errormessage="This field is required." forecolor="Red" controltovalidate="txtState"></asp:requiredfieldvalidator>
            <p class="form-label">Zip Code: <span class="required">*</span></p>
            <asp:textbox id="txtZipCode" CssClass="form-control" runat="server"></asp:textbox>
            <asp:requiredfieldvalidator id="RequiredFieldValidator5" runat="server" CssClass="form-label" controltovalidate="txtZipCode" display="Dynamic" errormessage="This field is required." forecolor="Red"></asp:requiredfieldvalidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" CssClass="form-label" ControlToValidate="txtZipCode" Display="Dynamic" ErrorMessage="Zip Code must be 5 or 9 digits long with no dashes." ForeColor="Red" ValidationExpression="\d{5}(\d{4})?"></asp:RegularExpressionValidator>
            <p class="form-label">Country: <span class="required">*</span></p>
            <asp:dropdownlist id="ddlCountry" CssClass="form-control" runat="server">
                <asp:ListItem Value="AF">Afghanistan</asp:ListItem>
                <asp:ListItem Value="AL">Albania</asp:ListItem>
                <asp:ListItem Value="DZ">Algeria</asp:ListItem>
                <asp:ListItem Value="AS">American Samoa</asp:ListItem>
                <asp:ListItem Value="AD">Andorra</asp:ListItem>
                <asp:ListItem Value="AO">Angola</asp:ListItem>
                <asp:ListItem Value="AI">Anguilla</asp:ListItem>
                <asp:ListItem Value="AR">Argentina</asp:ListItem>
                <asp:ListItem Value="AU">Australia</asp:ListItem>
                <asp:ListItem Value="AT">Austria</asp:ListItem>
                <asp:ListItem Value="AZ">Azerbaijan</asp:ListItem>
                <asp:ListItem Value="BH">Bahrain</asp:ListItem>
                <asp:ListItem Value="BB">Barbados</asp:ListItem>
                <asp:ListItem Value="BE">Belgium</asp:ListItem>
                <asp:ListItem Value="BM">Bermuda</asp:ListItem>
                <asp:ListItem Value="BR">Brazil</asp:ListItem>
                <asp:ListItem Value="KH">Cambodia</asp:ListItem>
                <asp:ListItem Value="CA">Canada</asp:ListItem>
                <asp:ListItem Value="CL">Chile</asp:ListItem>
                <asp:ListItem Value="CN">China</asp:ListItem>
                <asp:ListItem Value="CR">Costa Rica</asp:ListItem>
                <asp:ListItem Value="DK">Denmark</asp:ListItem>
                <asp:ListItem Value="EC">Ecuador</asp:ListItem>
                <asp:ListItem Value="SV">El Salvador</asp:ListItem>
                <asp:ListItem Value="FI">Finland</asp:ListItem>
                <asp:ListItem Value="FR">France</asp:ListItem>
                <asp:ListItem Value="DE">Germany</asp:ListItem>
                <asp:ListItem Value="GT">Guatemala</asp:ListItem>
                <asp:ListItem Value="HN">Honduras</asp:ListItem>
                <asp:ListItem Value="HK">Hong Kong</asp:ListItem>
                <asp:ListItem Value="IN">India</asp:ListItem>
                <asp:ListItem Value="IT">Italy</asp:ListItem>
                <asp:ListItem Value="LU">Luxembourg</asp:ListItem>
                <asp:ListItem Value="MX">Mexico</asp:ListItem>
                <asp:ListItem Value="MS">Montserrat</asp:ListItem>
                <asp:ListItem Value="NL">Netherlands</asp:ListItem>
                <asp:ListItem Value="NZ">New Zealand</asp:ListItem>
                <asp:ListItem Value="NO">Norway</asp:ListItem>
                <asp:ListItem Value="PA">Panama</asp:ListItem>
                <asp:ListItem Value="PE">Peru</asp:ListItem>
                <asp:ListItem Value="PR">Puerto Rico</asp:ListItem>
                <asp:ListItem Value="QA">Qatar</asp:ListItem>
                <asp:ListItem Value="RU">Russia</asp:ListItem>
                <asp:ListItem Value="RS">Serbia</asp:ListItem>
                <asp:ListItem Value="ES">Spain</asp:ListItem>
                <asp:ListItem Value="SE">Sweden</asp:ListItem>
                <asp:ListItem Value="CH">Switzerland</asp:ListItem>
                <asp:ListItem Value="TH">Thailand</asp:ListItem>
                <asp:ListItem Value="TR">Turkey</asp:ListItem>
                <asp:ListItem Value="UG">Uganda</asp:ListItem>
                <asp:ListItem Value="UA">Ukraine</asp:ListItem>
                <asp:ListItem Value="AE">United Arab Emirates</asp:ListItem>
                <asp:ListItem Value="GB">United Kingdom</asp:ListItem>
                <asp:ListItem Value="US">United States</asp:ListItem>
                <asp:ListItem Value="UM">United States Minor Outlying Islands</asp:ListItem>
                <asp:ListItem Value="UY">Uruguay</asp:ListItem>
                <asp:ListItem Value="UZ">Uzbekistan</asp:ListItem>
                <asp:ListItem Value="VE">Venezuela</asp:ListItem>
                <asp:ListItem Value="VI">US Virgin Islands</asp:ListItem>
                <asp:ListItem Value="YE">Yemen</asp:ListItem>
                <asp:ListItem Value="ZM">Zambia</asp:ListItem>
                <asp:ListItem Value="ZW">Zimbabwe</asp:ListItem>
            </asp:dropdownlist>
            <p class="form-label">Phone Number: <span class="required">*</span></p>
            <asp:textbox id="txtPhoneNumber" CssClass="form-control" runat="server" TextMode="Phone"></asp:textbox>
            <asp:requiredfieldvalidator id="RequiredFieldValidator7" CssClass="form-label" runat="server" controltovalidate="txtPhoneNumber" Display="Dynamic" errormessage="This field is required." forecolor="Red"></asp:requiredfieldvalidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" CssClass="form-label" runat="server" ControlToValidate="txtPhoneNumber" Display="Dynamic" ErrorMessage="Phone number must be 10 digits long." ForeColor="Red" ValidationExpression="\d{10}"></asp:RegularExpressionValidator>
            <p class="form-label">Email Address: <span class="required">*</span></p>
            <asp:textbox id="txtEmail" CssClass="form-control" runat="server" TextMode="Email"></asp:textbox>
            <asp:requiredfieldvalidator id="RequiredFieldValidator6" CssClass="form-label" runat="server" controltovalidate="txtEmail" display="Dynamic" errormessage="This field is required." forecolor="Red"></asp:requiredfieldvalidator>
            <asp:regularexpressionvalidator id="RegularExpressionValidator1" CssClass="form-label" runat="server" controltovalidate="txtEmail" display="Dynamic" errormessage="Please enter a valid email address." forecolor="Red" validationexpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:regularexpressionvalidator>
            <p class="form-label">Password: <span class="required">*</span></p>
            <asp:textbox id="txtPassword" runat="server" CssClass="form-control" TextMode="Password"></asp:textbox>
            <asp:requiredfieldvalidator id="RequiredFieldValidator8" CssClass="form-label" runat="server" controltovalidate="txtPassword" display="Dynamic" errormessage="This field is required." forecolor="Red"></asp:requiredfieldvalidator>
            <p class="form-label">Password (Again): <span class="required">*</span></p>
            <asp:textbox id="txtPassword2" runat="server" CssClass="form-control" TextMode="Password"></asp:textbox>
            <asp:requiredfieldvalidator id="RequiredFieldValidator9" CssClass="form-label" runat="server" controltovalidate="txtPassword2" display="Dynamic" errormessage="This field is required." forecolor="Red"></asp:requiredfieldvalidator>
            <asp:CompareValidator ID="CompareValidator1" runat="server" CssClass="form-label" ControlToCompare="txtPassword" ControlToValidate="txtPassword2" Display="Dynamic" ErrorMessage="Passwords must match." ForeColor="Red"></asp:CompareValidator>
            <br />
            <br />
            <asp:button id="btnSubmit" runat="server" text="Submit" CssClass="form-button" />
        </div>
    </div>
</asp:Content>
