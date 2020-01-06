using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;


public partial class Pages_Meetings : System.Web.UI.Page
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
            SqlDataSource1.SelectParameters["DepartmentID"].DefaultValue = Request.QueryString["dept"];
        }

        // If the user can schedule, then we display the Schedule Meeting button.
        if (SchedulePermissions(Convert.ToInt32(Request.QueryString.Get("dept"))))
        {
            lblSchedule.Text = "<a href=\"CreateMeeting.aspx?dept=" + Request.QueryString.Get("dept") + "\"class=\"nav-btn yellow\">Schedule Meeting</a>";
        }

        // If the user is an admin for this department, then we also display the button to add
        // new members, which in turn leads to the EditPermissions page.
        if (AdminPermissions(Convert.ToInt32(Request.QueryString.Get("dept"))))
        {
            lblAddMembers.Text = "<a href=\"AddMembers.aspx?dept=" + Request.QueryString.Get("dept") + "\" class=\"nav-btn green\">Add People</a>";
        }
    }
    public bool SchedulePermissions(int DepartmentID)
    {
        // Checks if the user has the Can_Schedule permission for this department
        DataView dv = (DataView)SqlDataSource2.Select(DataSourceSelectArguments.Empty);
        dv.RowFilter = "UserID = '" + Session["UserID"] + "' AND DepartmentID = " + DepartmentID;
        DataRowView dr = dv[0];
        if (dr["Can_Schedule"].ToString() == "True")
        {
            return true;
        }
        return false;
    }

    public bool AdminPermissions(int DepartmentID)
    {
        // Checks if the user has Is_Admin permission for this department
        DataView dv = (DataView)SqlDataSource2.Select(DataSourceSelectArguments.Empty);
        dv.RowFilter = "UserID = '" + Session["UserID"] + "' AND DepartmentID = " + DepartmentID;
        DataRowView dr = dv[0];
        if (dr["Is_Admin"].ToString() == "True")
        {
            return true;
        }
        return false;
    }

    /*
     * This event is called to display an invisible label on the event that there are no
     * meetings to display. This serves to show users that there was no error, there just
     * isn't any information to display.
     */
    protected void Repeater1_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if (Repeater1.Items.Count < 1)
        {
            if (e.Item.ItemType == ListItemType.Footer)
            {
                Label lblFooter = (Label)e.Item.FindControl("Label1");
                lblFooter.Visible = true;
            }
        }
    }
}