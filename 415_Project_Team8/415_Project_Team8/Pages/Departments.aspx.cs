using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;


public partial class Pages_Departments : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserID"] == null)
        {
            // Always redirect to login if session ID is null.
            Response.Redirect("Login.aspx");
        }

        /* 
         * The code for displaying/getting the departments that a user is in
         * is all in the ASPX part of this page. The difficult part of this
         * page was making sure that it would only show the departments that
         * the logged in user had access to, which is all handled in the query
         * for the SqlDataSource. 
         * 
         * Then, the page uses a linked Repeater to add the style for each item
         * returned by the Select statement. No need for C# here.
         */
    }
}