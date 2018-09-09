<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="ShowDetails.aspx.cs" Inherits="Admin_ShowDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [Products] WHERE ([Id] = @Id)">
        <SelectParameters>
            <asp:QueryStringParameter Name="Id" QueryStringField="ID" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:DetailsView ID="dvProduct" runat="server" AutoGenerateRows="False" DataKeyNames="Id,Category,Product,Price" DataSourceID="SqlDataSource1" Height="50px" Width="125px">
        <Fields>
            <asp:BoundField DataField="Category" HeaderText="Category" SortExpression="Category" />
            <asp:BoundField DataField="Product" HeaderText="Product" SortExpression="Product" />
            <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" DataFormatString="{0:c}" />
        </Fields>
    </asp:DetailsView>
    Quantity<asp:TextBox ID="txtQuantity" runat="server" ForeColor="Black" Width="124px"></asp:TextBox>
    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtQuantity" ErrorMessage="Enter only Numbers" ValidationExpression="[0-9]*"></asp:RegularExpressionValidator>
    <asp:Button ID="btnAddToCart" runat="server" ForeColor="Black" OnClick="btnAddToCart_Click" Text="Add to Cart" />
</asp:Content>

