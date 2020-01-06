using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text.RegularExpressions;
using System.Data;

public partial class Pages_AddMembers : System.Web.UI.Page
{
        /* 
         * Input: Comma delimited list of emails: i.e. test@user.com, test2@user.com, test3@user.com
         * Process: Separate emails, query to see if user exists.
         *              If user exists:
         *                  Create UserDepartmentPermissions entry
         *              else:
         *                  Store email
         * Output: Count of emails successfully added, list of emails unsuccessfully added.
         */
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserID"] == null)
        {
            // Always redirect to login if session ID is null.
            Response.Redirect("Login.aspx");
        }
    }

    protected void btnAddMembers_Click(object sender, EventArgs e)
    {
        /*
         * This function takes in the user provided list, uses RegEx to find each email,
         * checks that the email exists within the User table, and adds a record to
         * the UserDepartmentPermissions table (if one is not already present).
         * 
         * It outputs a list of emails that were unable to be identified, in case the 
         * user mis-typed any.
         */
        string emailList = MemberList.Text;
        List<string> errorMembers = new List<string>();
        List<string> successMembers = new List<string>();

        // Copied from RegEx Validator.
        string emailPattern = @"\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*";

        foreach(Match match in Regex.Matches(emailList, emailPattern)){
            // checkEmail is the same function as in the Register page.
            if (checkEmail(match.ToString()))
            {
                // If the emails exists, then it is a success
                successMembers.Add(match.ToString());
            } else
            {
                // Otherwise it will be displayed on the error list.
                errorMembers.Add(match.ToString());
            }
        }

        // Converts the error list to an HTML element to be displayed.
        if (errorMembers.Count() > 0)
        {
            string errorList = "";
            foreach(String s in errorMembers)
            {
                errorList += "<br />" + s;
            }

            lblErrors.Text = "There were errors with the following emails:" + errorList;
        }

        // Now that we know the members exist, we still need to make sure that we aren't
        // creating duplicate UserDepartmentPermission rows. This checks that no member who
        // already has permissions set will be added again.
        if (successMembers.Count() > 0)
        {
            // This is the final list of members that need to have UDP items created.
            List<int> membersToAdd = new List<int>();
            foreach(String s in successMembers)
            {
                int uid = getUserID(s);
                if (uid < 0)
                {
                    // This condition is only met if the user doesnt actually exist, so we just swap it to the error list.
                    errorMembers.Add(s);
                    successMembers.Remove(s);
                } else
                {
                    // isUserAlreadyAdded is essentially checkEmail, but rather than checking
                    // inside the Users table, it is checking if the UID and DID bring up
                    // a UDP record.
                    if (!isUserAlreadyAdded(uid))
                    {
                        membersToAdd.Add(uid); // Final list of members to add using UserID
                    }
                }
            }
            // If the count is still positive, then we will display how many members were added and show the link
            // to edit the permissions of each member.
            if (membersToAdd.Count() > 0)
            {
                foreach(int member in membersToAdd)
                {
                    InsertIntoPermissions(member);
                }
                lblSuccessful.Text = "Successfully added " + membersToAdd.Count().ToString() + " new members!";
                lblEditPermissions.Text = "<a href=\"Permissions.aspx?dept=" + Request.QueryString.Get("dept") +"\">Edit Permissions</a>";
            }
        }

    }

    public bool checkEmail(String email)
    {
        // This is the same as the Register checkEmail. Simply queries the User table,
        // returns true if it exists or false if it doesnt.
        DataView dv = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
        dv.RowFilter = "Email = '" + email + "'";
        try
        {
            DataRowView dr = dv[0];
            if (dr["Email"].ToString() == email)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
        catch
        {
            return false;
        }
    }

    public int getUserID(String email)
    {
        // This function converts an email into a User ID. We need the UserID
        // to create the Permissions row.
        DataView dv = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
        dv.RowFilter = "Email = '" + email + "'";
        try
        {
            DataRowView dr = dv[0];
            return Convert.ToInt32(dr["UserID"]);
        }
        catch
        {
            return -1;
        }
    }

    public bool isUserAlreadyAdded(int userID)
    {
        // Checks if the user ID associated with the inserted email address is already in
        // the permissions for the department. This is to prevent duplicates.

        DataView dv = (DataView)SqlDataSource2.Select(DataSourceSelectArguments.Empty);
        dv.RowFilter = "UserID = '" + userID.ToString() + "'";
        try
        {
            DataRowView dr = dv[0];
            if (dr["UserID"].ToString() == userID.ToString()) // This line is just to check that dr is not empty
            {
                return true;
            }
            else
            {
                return false;
            }
        }
        catch
        {
            return false;
        }
    }

    protected void InsertIntoPermissions(int uid)
    {
        // This line is needed to keep running this function within a loop, otherwise parameter already exists.
        SqlDataSource2.InsertParameters.Clear();

        SqlDataSource2.InsertCommandType = SqlDataSourceCommandType.Text;
        SqlDataSource2.InsertCommand = "INSERT INTO UserDepartmentPermissions (UserID, DepartmentID, Can_Read, Can_Edit, Can_Schedule, Is_Admin) VALUES (@Ins_User_ID, @Ins_Department_ID, @Can_Read, @Can_Edit, @Can_Schedule, @Is_Admin)";

        // Default permissions are only Can_Read
        SqlDataSource2.InsertParameters.Add("Ins_User_ID", uid.ToString());
        SqlDataSource2.InsertParameters.Add("Ins_Department_ID", Request.QueryString.Get("dept"));
        SqlDataSource2.InsertParameters.Add("Can_Read", 1.ToString());
        SqlDataSource2.InsertParameters.Add("Can_Edit", 0.ToString());
        SqlDataSource2.InsertParameters.Add("Can_Schedule", 0.ToString());
        SqlDataSource2.InsertParameters.Add("Is_Admin", 0.ToString());

        SqlDataSource2.Insert();


    } 
}