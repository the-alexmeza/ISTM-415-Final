using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_EditPermissions : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
        if (Session["UserID"] == null)
        {
            // Always redirect to login if session ID is null.
            Response.Redirect("Login.aspx");
        }

        lblMessage.Text = "<a href=\"/Pages/Permissions.aspx?dept=" + Request.QueryString.Get("dept") + "\">Back</a>";
    }
    /*
     * This page is mainly controlled by the DetailsView. The only changes we had to make
     * were to add validation on the User editing portion. That was accomplished by changing
     * the bound fields into template fields, then using the same validators that are used
     * on the Register page.
     */

    protected void DetailsView1_ItemUpdating(object sender, DetailsViewUpdateEventArgs e)
    {
        // In lieu of a Delete operation, we have a User Disable feature.
        // This checks if the user was set to be disabled.
        if (e.NewValues["Enabled"].ToString() == "False")
        {
            // If the user is going to be disabled, we want to update all user department permissions 
            // that the user has, and set them all to 0. This prevents them from seeing any data
            // while not deleting their prior contributions.

            SqlDataSource3.UpdateCommandType = SqlDataSourceCommandType.Text;
            // Sets all permissions to 0.
            SqlDataSource3.UpdateCommand = "UPDATE UserDepartmentPermissions SET Can_Read = 0, Can_Edit = 0, Can_Schedule = 0, Is_Admin = 0 WHERE UserID = " +
                e.Keys["UserID"].ToString();
            SqlDataSource3.Update();
            
            // Updates the permission detail view to show changes.
            DetailsView2.DataBind();
        }
    }
}