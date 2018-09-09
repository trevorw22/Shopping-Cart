
<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Shop.aspx.cs" Inherits="Admin_Shop" %>


<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <asp:SqlDataSource ID="dataProductsByCategory" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [Products] WHERE ([Category] = @Category) ORDER BY [Product]">
    <SelectParameters>
        <asp:QueryStringParameter Name="Category" QueryStringField="Category" Type="String" />
    </SelectParameters>
</asp:SqlDataSource>

<asp:GridView ID="gvProductsByCategory" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="dataProductsByCategory" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal" Width="100%">
    <Columns>
        <asp:BoundField DataField="Category" HeaderText="Category" SortExpression="Category" />
        <asp:BoundField DataField="Product" HeaderText="Product" SortExpression="Product" />
        <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" DataFormatString="{0:c}" />
        <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
        <asp:ImageField DataImageUrlField="Image">
            <ControlStyle Height="50px" Width="50px" />
        </asp:ImageField>
        <asp:HyperLinkField DataNavigateUrlFields="ID" DataNavigateUrlFormatString="ShowDetails.aspx?ID={0}" Text="View" />
    </Columns>
    <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
    <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
    <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
    <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
    <SortedAscendingCellStyle BackColor="#F7F7F7" />
    <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
    <SortedDescendingCellStyle BackColor="#E5E5E5" />
    <SortedDescendingHeaderStyle BackColor="#242121" />
</asp:GridView>
</asp:Content>

