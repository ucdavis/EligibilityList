<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<EligibilityModifyViewModel>" %>
<%@ Import Namespace="EligibilityList.Core.Domain"%>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Add
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Adding Eligibility for <%= Html.Encode(Model.Eligibility.Employee.FullName) %></h2>

    <%= Html.ValidationSummary("Add was unsuccessful. Please correct the errors and try again.") %>
    <%= Html.ClientSideValidation<Eligibility>() %>

    <% Html.RenderPartial("EligibilityForm"); %>

</asp:Content>

