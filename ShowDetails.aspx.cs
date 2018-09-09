using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_ShowDetails : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnAddToCart_Click(object sender, EventArgs e)
    {
        HttpCookie myCookie = new
                  HttpCookie(dvProduct.DataKey.Value.ToString());
        myCookie["Category"] = dvProduct.DataKey["Category"].ToString();
        myCookie["Product"] = dvProduct.DataKey["Product"].ToString();
        myCookie["Quantity"] = txtQuantity.Text;
        myCookie["Price"] = dvProduct.DataKey["Price"].ToString();
        myCookie.Expires = DateTime.Now.AddDays(1d);
        Response.Cookies.Add(myCookie);
        Response.Redirect("ViewCart.aspx", true);
    }
}