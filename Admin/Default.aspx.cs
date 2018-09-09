using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        gvEditDeleteProducts.Visible = true;
        dvAddProduct.Visible = false;
        btnAddNewProduct.Visible = true;
    }

    protected void btnAddNewProduct_Click(object sender, EventArgs e)
    {
        btnAddNewProduct.Visible = false;
        gvEditDeleteProducts.Visible = false;
        dvAddProduct.Visible = true;
        dvAddProduct.ChangeMode(DetailsViewMode.Insert); //put into insert mode
    }

    protected void dvAddProduct_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
    {
        btnAddNewProduct.Visible = true;
        gvEditDeleteProducts.Visible = true;
        gvEditDeleteProducts.DataBind();  //Refresh the data
        dvAddProduct.Visible = false;
    }

    protected void dvAddProduct_ItemInserting(object sender, DetailsViewInsertEventArgs e)
    {
            FileUpload flUp = (FileUpload)(dvAddProduct.FindControl("FileUpload1"));
        if (flUp.HasFile)
        {
            dataMaintainProducts.InsertParameters["Image"].DefaultValue = "~/ProductImages/" + flUp.FileName;
            string filePath = Server.MapPath("~/ProductImages/" + flUp.FileName);
            flUp.SaveAs(filePath);
        }
        else
        {
            dataMaintainProducts.InsertParameters["Image"].DefaultValue =
                "~/ProductImages/noimage.jpg";
        }
    }
}