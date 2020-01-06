using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;


public partial class Pages_ViewMeeting : System.Web.UI.Page
{
    private Page currentPage;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserID"] == null)
        {
            // Always redirect to login if session ID is null.
            Response.Redirect("Login.aspx");

        }
        if (Request.QueryString["meeting"] != null)
        {
            // Loads current page information from class object
            currentPage = GetCurrentPage();
            // Append the HTML.
            lblPageHeader.Text = "<h2>" + currentPage.Page_Title + "</h2>";
            lblPageBody.Text = "<pre>" + currentPage.Page_Content + "</pre>";
            if (EditPermissions(currentPage.DepartmentID))
            {
                lblEdit.Text = "<a href=\"ModifyMeeting.aspx?page=" + currentPage.PageID + "\" class=\"nav-btn red\">Edit Page</a>";
            }
        }
    }

    public Page GetCurrentPage()
    {
        // Line for line what we did in class re: selectedRecord and MMABooks database.
        DataView dv = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
        dv.RowFilter = "EventID = '" + Request.QueryString["meeting"] + "'";
        DataRowView dr = dv[0];
        Page selected = new Page();
        selected.PageID = Convert.ToInt32(dr["PageID"].ToString());
        selected.DepartmentID = Convert.ToInt32(dr["DepartmentID"].ToString());
        selected.EventID = Convert.ToInt32(dr["EventID"].ToString());
        selected.Page_Title = dr["Page_Title"].ToString();
        selected.Page_Content = dr["Page_Content"].ToString();

        return selected;
    }

    public bool EditPermissions(int DepartmentID)
    {
        // Check whether or not the user has edit permissions.
        // If so, the edit button will be displayed.
        DataView dv = (DataView)SqlDataSource2.Select(DataSourceSelectArguments.Empty);
        dv.RowFilter = "UserID = '" + Session["UserID"] + "' AND DepartmentID = " + DepartmentID;
        DataRowView dr = dv[0];
        if (dr["Can_Edit"].ToString() == "True")
        {
            return true;
        }
        return false;
    }
}