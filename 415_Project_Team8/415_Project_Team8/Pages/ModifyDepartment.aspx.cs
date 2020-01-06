using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;


public partial class Pages_ModifyDepartment : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
        if (Session["UserID"] == null)
        {
            // Always redirect to login if session ID is null.
            Response.Redirect("Login.aspx");
        }
    }


    public String GetInsertedDepartmentID()
    {
        /* There is a slim possibility of this causing problems in a production environment, e.g. if two people make departments at the same time
         *  Essentially what this is doing is just sorting to the new highest department ID and returning it.
         *  
         *  It's returning it as a string so it doesn't have to be converted when used in the query in ListView1_ItemInserted.
         */
        DataView LatestTable = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
        LatestTable.Sort = "DepartmentID DESC";

        DataRowView row = LatestTable[0];
        return row["DepartmentID"].ToString();
    }

    protected void ListView1_ItemInserted(object sender, ListViewInsertedEventArgs e)
    {
        // This function runs AFTER the insertion has completed.

        // This if statement checks if there were any issues when the user tried
        // to insert something. Generally, it will catch if they try to create
        // a blank row.
        if (e.Exception != null)
        {
            if (e.AffectedRows == 0)
            {
                e.KeepInInsertMode = true;
                Message.Text = "An exception occurred inserting the new Department. " +
                  "Please verify your values and try again.";
            }
            else
                Message.Text = "An exception occurred inserting the new Department. " +
                  "Please verify the values in the newly inserted item.";

            e.ExceptionHandled = true;
        }
        else
        {

            /* 
             * Now that a new department has been created, we need to set the current user (the creator)
             * as an admin for the department. If we do not set the permissions now, then the user will
             * not be able to access the department again.
             * 
             * Since the current user is creating this department, it is safe to assume that they will
             * be acting as the admin. Because of that, we set all of this user's permissions to True
             * for this department.
             */

            // Get last inserted item from current user
            string DepartmentID = GetInsertedDepartmentID();

            // Stores the UserID from the session storage.
            string UserID = Session["UserID"].ToString();

            // This creates an insert command for the UserDepartmentPermissions table, which accepts
            // a foreign key from User and a foreign key from Department. 
            SqlDataSource2.InsertCommandType = SqlDataSourceCommandType.Text;
            SqlDataSource2.InsertCommand = "INSERT INTO UserDepartmentPermissions (UserID, DepartmentID, Can_Read, Can_Edit, Can_Schedule, Is_Admin) VALUES (@User_ID, @Department_ID, @Can_Read, @Can_Edit, @Can_Schedule, @Is_Admin)";

            // The symbols with @s in the InsertCommand string are parameters, which we add to the collection here.
            SqlDataSource2.InsertParameters.Add("User_ID", UserID);
            SqlDataSource2.InsertParameters.Add("Department_ID", DepartmentID);
            // Once again, we are setting all of the permissions to True. Permissions are stored
            // as a BIT type in the database, so we use 1 and 0 to represent the booleans.
            SqlDataSource2.InsertParameters.Add("Can_Read", 1.ToString());
            SqlDataSource2.InsertParameters.Add("Can_Edit", 1.ToString());
            SqlDataSource2.InsertParameters.Add("Can_Schedule", 1.ToString());
            SqlDataSource2.InsertParameters.Add("Is_Admin", 1.ToString());

            // This runs the completed insert command.
            SqlDataSource2.Insert();

            // Now that the user has proper permissions, we can display the link to allow them to add members to their
            // new department.
            addLink.Text = "<a class=\"nav-btn yellow\" href=\"AddMembers.aspx?dept=" + DepartmentID + "\">Add Members to Department</a>";
        }
    }
}