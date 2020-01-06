using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Pages_Register : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;

        if (IsPostBack)
        {
            // If check email is true, that means that the email is already in the User table.
            // So if it is false, we can safely insert and move on to the Log In page.
            if (!CheckEmail(txtEmail.Text))
            {
                SqlDataSource1.Insert();
                Response.Redirect("Login.aspx");
            }
            else
            {
                lblMessage.Text = "That email is already in use!";
            }
        }
        else
        {
            // Bind all of the fields!
            txtFirstName.DataBind();
            txtLastName.DataBind();
            txtAddress.DataBind();
            txtCity.DataBind();
            txtState.DataBind();
            txtZipCode.DataBind();
            ddlCountry.DataBind();
            txtEmail.DataBind();
            txtPhoneNumber.DataBind();
            txtPassword.DataBind();
        }
    }

    public bool CheckEmail(string email)
    {
        // Queries the inserted email to see if it already exists in the database.
        // If it does, then it notifies the user and does not continue the
        // insertion.

        DataView userTable = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
        userTable.RowFilter = string.Format("Email = '{0}'", txtEmail.Text);
        try
        {
            // This logic is just to check that the row is not empty. It doesn't serve any other purpose.
            DataRowView row = userTable[0];
            User nu = new User();
            nu.First_Name = row["First_Name"].ToString();
            return true;
        }
        catch
        {
            return false;
        }
    }
}