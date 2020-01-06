using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

// SqlDataSource1 generates the list of departments that a user has permission to schedule events for, and populates ddlDepartments
// SqlDataSource2 handles Event table
// SqlDataSource3 handles Page table

public partial class Pages_CreateMeeting : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
        if (Session["UserID"] == null)
        {
            // Always redirect to login if session ID is null.
            Response.Redirect("Login.aspx");
        }

        if (Request.QueryString["dept"] != null)
        {
            ddlDepartment.SelectedValue = Request.QueryString.Get("dept");
        }
        lblMessage.Text = "";
    }

    protected void btnSchedule_Click(object sender, EventArgs e)
    {
        // Runs the insert command to create a new Event.
        SqlDataSource2.InsertCommandType = SqlDataSourceCommandType.Text;
        SqlDataSource2.InsertCommand = "INSERT INTO Event (DepartmentID, UserID, Starting_DateTime, Ending_DateTime, Event_Title, Event_Description, Event_Location, Created_At) VALUES (@DID, @UID, @SDT, @EDT, @ET, @ED, @EL, @CA)";

        SqlDataSource2.InsertParameters.Add("DID", ddlDepartment.SelectedValue);
        SqlDataSource2.InsertParameters.Add("UID", Session["UserID"].ToString());
        SqlDataSource2.InsertParameters.Add("SDT", txtStartingTime.Text);
        SqlDataSource2.InsertParameters.Add("EDT", txtEndingTime.Text);
        SqlDataSource2.InsertParameters.Add("ET", txtEventTitle.Text);
        SqlDataSource2.InsertParameters.Add("ED", txtEventDescription.Text);
        SqlDataSource2.InsertParameters.Add("EL", txtLocation.Text);
        SqlDataSource2.InsertParameters.Add("CA", DateTime.Now.ToString());

        SqlDataSource2.Insert();
    }

    /*
     * After an event is created, we need to create a page (there is a 1:1 relationship).
     * To do that, we attach the InsertCommand for the Page SqlDataSource to the OnInserted
     * event handler for the Event SqlDataSource.
     */
    protected void SqlDataSource2_Inserted(object sender, SqlDataSourceStatusEventArgs e)
    {
        lblMessage.Text = "Event scheduled successfully!";
        // e.Command.Parameters[...] returns the parameters from the completed insert, which we recycle with the Page object insert.
        SqlDataSource3.InsertCommandType = SqlDataSourceCommandType.Text;


        // Creating Page object for new Event object.
        // NOTE: parameter names are different every time to avoid parameter confliction errors!
        SqlDataSource3.InsertCommand = "INSERT INTO Page (DepartmentID, EventID, Page_Title, Page_Content) VALUES (@DepID, @EvID, @PT, @PC)";
        SqlDataSource3.InsertParameters.Add("DepID", e.Command.Parameters["@DID"].Value.ToString());
        SqlDataSource3.InsertParameters.Add("EvID", InsertedEventID());
        SqlDataSource3.InsertParameters.Add("PT", e.Command.Parameters["@ET"].Value.ToString());
        SqlDataSource3.InsertParameters.Add("PC", e.Command.Parameters["@ED"].Value.ToString());
        SqlDataSource3.Insert();

        // Clear text boxes to help user know that the task is completed.
        txtStartingTime.Text = "";
        txtEndingTime.Text = "";
        txtEventTitle.Text = "";
        txtEventDescription.Text = "";
        txtLocation.Text = "";
    }

    // Returns the newest event ID.
    public String InsertedEventID()
    {
        DataView dv = (DataView)SqlDataSource2.Select(DataSourceSelectArguments.Empty);
        dv.Sort = "Created_At DESC";
        DataRowView dr = dv[0];
        return dr["EventID"].ToString();
    }
}