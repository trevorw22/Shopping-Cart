<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Contact.aspx.cs" Inherits="Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %>.</h2>
    <h3>Text, call or email us at anytime!</h3>
    <address>
        boards4less@gmail.com<br />
        
        <abbr title="Phone">P:</abbr>
        425.555.0100
    </address>

    <address>
        <strong>Support:</strong>   <a href="mailto:boards4lessSupport@gmail.com">boards4lessSupport@gmail.com</a><br />
        <strong>Marketing:</strong> <a href="mailto:boards4lessMarketing@gmail.com">boards4lessMarketing@gmail.com</a>
    </address>
</asp:Content>
