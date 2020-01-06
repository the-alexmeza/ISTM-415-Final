<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Base.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Pages_Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="login">
        <h1>Sign In</h1>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BoogleConnectionString %>" SelectCommand="SELECT * FROM [Users]"></asp:SqlDataSource>

        <div class="container">
            <p class="form-label">Email Address:</p>
            <asp:textbox id="txtEmail" runat="server" CssClass="form-control"></asp:textbox>
            <asp:requiredfieldvalidator runat="server" errormessage="RequiredFieldValidator" ControlToValidate="txtEmail" Display="Dynamic" ForeColor="Red">This field is required!</asp:requiredfieldvalidator>
            <asp:regularexpressionvalidator runat="server" errormessage="RegularExpressionValidator" ControlToValidate="txtEmail" Display="Dynamic" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">Please enter a valid email address.</asp:regularexpressionvalidator>

            <p class="form-label">Password:</p>
            <asp:textbox id="txtPassword" runat="server" TextMode="Password" CssClass="form-control"></asp:textbox>
            <asp:requiredfieldvalidator runat="server" errormessage="RequiredFieldValidator" ControlToValidate="txtPassword" Display="Dynamic" ForeColor="Red">This field is required!</asp:requiredfieldvalidator>
            <br />
            <br />
            <asp:button runat="server" text="Sign In" CssClass="form-button" />
            <br />
            <p class="form-label"><a href="Register.aspx">Or click here to sign up.</a></p>
        </div>

        
    </div>
</asp:Content>

