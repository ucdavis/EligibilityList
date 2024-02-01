<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<EligibilityList.Core.Domain.Eligibility>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Delete
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Deleting Eligibility for <%= Html.Encode(Model.Employee.FullName) %></h2>

    <p>
        Are you sure you would like to delete this eligibility?  This action cannot be undone.
    </p>
    <span class="button">

    <% using (Html.BeginForm<EligibilityController>(a=>a.DeleteEligibility(Model.Id))) { %>
    
        <%= Html.AntiForgeryToken() %>
    
        <%--<%= Html.Hidden("Id", Model.Id) %>--%>
        <%= Html.SubmitButton("Delete", "Delete") %>
    
        <%= Html.ActionLink<EligibilityController>(a=>a.Edit(Model.Id), "Cancel") %>
    
    <% } %></span>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="AdditionalScripts" runat="server">
</asp:Content>
