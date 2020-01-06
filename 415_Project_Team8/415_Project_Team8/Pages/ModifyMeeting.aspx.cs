using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;


public partial class Pages_ModifyMeeting : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserID"] == null)
        {
            // Always redirect to login if session ID is null.
            Response.Redirect("Login.aspx");
        }
    }

    /*
     * All handled by the FormView.
     */

    protected void FormView1_ItemUpdated(object sender, FormViewUpdatedEventArgs e)
    {
        // It was difficult for users to tell if they had actually pressed save
        // so this event listener displays the message after updating.
        lblMessage.Text = "Your changes have been saved!";
        lblMessage.Visible = true;
    }
}