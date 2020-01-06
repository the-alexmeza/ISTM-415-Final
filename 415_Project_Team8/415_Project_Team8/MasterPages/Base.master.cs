using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class MasterPages_Base : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void SignOut_Click(object sender, EventArgs e)
    {
        Session["UserID"] = null;
        Response.Redirect(Request.RawUrl);
    }
}
