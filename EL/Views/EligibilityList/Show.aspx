<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Show
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    ID IS: <%= Html.Encode(ViewData["id"]) %>
    <h2>Show</h2>
    
    <ul>
    <% foreach (var el in ((IQueryable<EL.Core.Domain.Eligibility>)ViewData["EligibilityList"]).Where(e => e.Comment.StartsWith("Merit")).Take(5) )
        { %>
            
        <li><%= Html.ActionLink("Click to Edit", "Edit", new { id = el.ID }) %></li>
        <li><%= el.Action.Name %> </li>
        <li><%= el.Comment %></li>
            
    <% } %>
    </ul>
</asp:Content>
