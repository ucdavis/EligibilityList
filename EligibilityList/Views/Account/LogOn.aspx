<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Eligibility List
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>You do not have permission to view this page</h2>
    
    <% if (User.Identity.IsAuthenticated)
       { %>
    <p>
        <%= Html.ActionLink("Log Off", "LogOff")%>
    </p>    
    <% } %>
    
    <p>
        <%= Html.ActionLink("Go back to the home page", "Index", "Home") %>
    </p>
    
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="AdditionalScripts" runat="server">
</asp:Content>
