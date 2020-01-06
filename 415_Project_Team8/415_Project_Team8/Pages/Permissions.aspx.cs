using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;


public partial class Pages_Permissions : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserID"] == null)
        {
            // Always redirect to login if session ID is null.
            Response.Redirect("Login.aspx");
        }
        if (Request.QueryString["dept"] != null)
        {
            // Force the selected field if querystring attached.
            SelectDepartment.Enabled = false;
            SelectDepartment.SelectedValue = Request.QueryString["dept"];
            SelectDepartment.DataBind();
        }
    }
}