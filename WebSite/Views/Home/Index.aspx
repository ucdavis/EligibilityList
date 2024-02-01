<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="indexTitle" ContentPlaceHolderID="TitleContent" runat="server">
    Home Page
</asp:Content>

<asp:Content ID="indexContent" ContentPlaceHolderID="MainContent" runat="server">
<%--    <h2><%= Html.Encode(ViewData["Message"]) %></h2>
--%>    
    <ul class="menu">
    <li>
        <%= Html.ActionLink("View Eligibility List", "ViewByDepartment", "Eligibility")%>
    </li>
    <li>
        <%= Html.ActionLink<EligibilityController>(x=>x.ViewPending(null), "View Pending") %>
    </li>
    <li>
        <%= Html.ActionLink<EligibilityController>(x=>x.FindEmployee(null), "Add Eligibility") %>
    </li>
    <li>
        <%= Html.ActionLink<ReviewController>(a => a.Index(1130), "Review") %>
    </li>
    <li>
        <%= Html.ActionLink<AccountController>(a => a.Management(), "User Management") %>
    </li>
    <li>
        <%= Html.ActionLink<ActionController>(a=>a.Index(), "Manage Action Types") %><br />
        <%= Html.ActionLink<StepController>(a=>a.Index(), "Manage Steps") %>
    
    </li>
    </ul>
</asp:Content>
