<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="ViewCart.aspx.cs" Inherits="ViewCart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
   
    <asp:Table ID="tblCart" runat="server" ForeColor="#CCCCCC" Height="45px" Width="385px" GridLines="Vertical">
        <asp:TableRow runat="server">
            <asp:TableCell runat="server">Category</asp:TableCell>
            <asp:TableCell runat="server">Product</asp:TableCell>
            <asp:TableCell runat="server">Price</asp:TableCell>
            <asp:TableCell runat="server" HorizontalAlign="Center" VerticalAlign="Middle">Quantity</asp:TableCell>
            <asp:TableCell runat="server">Total</asp:TableCell>
        </asp:TableRow>
    </asp:Table><br />
    <br />
     Order Total:
<asp:Label ID="lblOrderTotal" runat="server" Text="$0.00"></asp:Label>
<br />
<asp:Button ID="btnClearCart" runat="server" ForeColor="Black" OnClick="btnClearCart_Click" Text="Clear Cart" />
</asp:Content>

