using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;


/// <summary>
/// Summary description for Page
/// </summary>
public class Page
{
    public Page()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    public int PageID { get; set; }
    public int DepartmentID { get; set; }
    public int EventID { get; set; }
    public string Page_Title { get; set; }
    public string Page_Content { get; set; }
}