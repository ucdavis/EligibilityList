<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="indexTitle" ContentPlaceHolderID="TitleContent" runat="server">
    Home Page
</asp:Content>

<asp:Content ID="indexContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%= Html.Encode(ViewData["Message"]) %></h2>
    <p>
        <%= Html.ActionLink("View Eligibility List", "ViewByDepartment", "Eligibility")%>
    </p>
    <p>
        <%= Html.ActionLink<EligibilityController>(x=>x.ViewPending(null), "View Pending") %>
    </p>
    
    <p>
        <%= Html.ActionLink<ReviewController>(a => a.Index(1130), "Review") %>
    </p>
</asp:Content>
