using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;

/// <summary>
/// Summary description for User
/// </summary>
public class User
{
    public User()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    public int UserID { get; set; }
    public string First_Name { get; set; }
    public string Last_Name { get; set; }
    public string Address { get; set; }
    public string City { get; set; }
    public string State { get; set; }
    public string ZipCode { get; set; }
    public string Country { get; set; }
    public string Email { get; set; }
    public string PhoneNumber { get; set; }
    public string Password { get; set; }
}