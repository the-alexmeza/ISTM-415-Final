using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Pages_Login : System.Web.UI.Page
{
    private int UserID;
    protected void Page_Load(object sender, EventArgs e)
    {
        UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
        if (Session["UserID"] == null)
        {
            if (IsPostBack)
            {
                // Adds validation
                UserID = ValidateUser();
                if (UserID == -1)
                {
                    // TODO: Change a label to say invalid email or password
                } else
                {
                    Session["UserID"] = UserID;
                    Response.Redirect("~/Default.aspx");
                }

            } else
            {
                txtEmail.DataBind();
            }
        } else
        {
            // TODO: Change a label to say you are already logged in.
        }
    }
    public int ValidateUser()
    {
        /*
         * This function is an extremely simple log in check. It queries the email based
         * on what the user inputted, then checks if the record that is returned has a
         * matching password. If the function returns -1, we know that the user
         * failed validation since no user has the UserID of -1.
         */
        DataView dv = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
        dv.RowFilter = "Email = '" + txtEmail.Text+ "'";
        try
        {
            DataRowView dr = dv[0];
            if (dr["Password"].ToString() == txtPassword.Text)
            {
                return Convert.ToInt32(dr["UserID"]);
            }
            else
            {
                return -1;
            }
        } catch
        {
            return -1;
        }

    }
}