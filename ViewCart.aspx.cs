using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ViewCart : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        double total = 0.0;
        double price = 0.0;
        int quantity = 0;
        System.Collections.Specialized.NameValueCollection UserInfoCookieCollection;
        for (int i = 0; i < Request.Cookies.Count; i++)
        {
            Button b = new Button();
            b.ForeColor = System.Drawing.Color.Black;
            b.Text = "Remove";
            b.Click += new EventHandler(delete_Item);
            b.TabIndex = (short)i;
            UserInfoCookieCollection = Request.Cookies[i].Values;
            price = Convert.ToDouble(Server.HtmlDecode(UserInfoCookieCollection["Price"]));
            try
            {
                quantity = Convert.ToInt16(Server.HtmlDecode(UserInfoCookieCollection["Quantity"]));
            }
            catch
            {
                quantity = 1;
            }
            TableRow tr = new TableRow();
            TableCell tcCategory = new TableCell();
            TableCell tcProduct = new TableCell();
            TableCell tcQuantity = new TableCell();
            TableCell tcPrice = new TableCell();
            TableCell tcProductTotal = new TableCell();
            TableCell tcDelete = new TableCell();
            tcCategory.Text = Server.HtmlDecode(UserInfoCookieCollection["Category"]);
            tr.Cells.Add(tcCategory);
            tcProduct.Text = Server.HtmlDecode(UserInfoCookieCollection["Product"]);
            tr.Cells.Add(tcProduct);
            tcPrice.Text = String.Format("{0:c}", price);
            tcPrice.HorizontalAlign = HorizontalAlign.Right;
            tr.Cells.Add(tcPrice);
            tcQuantity.Text = Convert.ToString(quantity);
            tr.Cells.Add(tcQuantity);
            tcProductTotal.Text = String.Format("{0:c}", quantity * price);
            tcProductTotal.HorizontalAlign = HorizontalAlign.Right;
            tr.Cells.Add(tcProductTotal);
            tcDelete.Controls.Add(b);
            tr.Cells.Add(tcDelete);
            if (quantity != 0) tblCart.Rows.Add(tr);
            total = total + quantity * price;
        }
        lblOrderTotal.Text = String.Format("{0:c}", total);
    }
    protected void delete_Item(object sender, EventArgs e)
       {
        HttpCookie aCookie;
        string cookieName;
        Button myButton = (Button)sender;

        int myIndex = myButton.TabIndex;
        cookieName = Request.Cookies[myIndex].Name;
        aCookie = new HttpCookie(cookieName);
        aCookie.Expires = DateTime.Now.AddDays(-1);
        Response.Cookies.Add(aCookie);

        Response.Redirect("ViewCart.aspx", true);

       }


    protected void btnClearCart_Click(object sender, EventArgs e)
    {
        HttpCookie aCookie;
        string cookieName;
        int limit = Request.Cookies.Count;
        for (int i = 0; i < limit; i++)
        {
            cookieName = Request.Cookies[i].Name;
            aCookie = new HttpCookie(cookieName);
            aCookie.Expires = DateTime.Now.AddDays(-1);
            Response.Cookies.Add(aCookie);
        }
        Response.Redirect("ViewCart.aspx", true);

    }
}