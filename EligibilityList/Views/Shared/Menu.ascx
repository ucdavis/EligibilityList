<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<%= Html.ActionLink<EligibilityController>(x=>x.ViewPending(null), "View") %>

<% if (HttpContext.Current.User.IsInRole(RoleNames.Admin)) { %>

| <%= Html.ActionLink<EligibilityController>(x=>x.FindEmployee(null), "Add") %>
| <%= Html.ActionLink<AccountController>(a => a.Management(), "User Management") %>
| <%= Html.ActionLink<ActionController>(a=>a.Index(), "Action Types") %>
| <%= Html.ActionLink<StepController>(a=>a.Index(), "Steps") %>

<% } %>