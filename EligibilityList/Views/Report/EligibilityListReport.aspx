<%@ Page Title="" Language="C#" Inherits="System.Web.Mvc.ViewPage<System.Collections.Generic.List<EligibilityList.Core.Domain.Action>>" MasterPageFile="~/Views/Shared/Site.Master" %>
<asp:Content runat="server" ID="Content" ContentPlaceHolderID="TitleContent">Eligibility List Report</asp:Content>
<asp:Content runat="server" ID="Content1" ContentPlaceHolderID="AdditionalScripts"></asp:Content>
<asp:Content runat="server" ID="Content2" ContentPlaceHolderID="MainContent">

<h3>Eligibility List by Action Report: </h3>

<% using (Html.BeginForm()) { %>

<%= Html.AntiForgeryToken() %>

Selection an action:  <%= this.Select("actionName").Options(Model, x => x.Name, x => x.Name).FirstOption("", "All Actions")%>

<input type="submit" value="Get Report!" />

<% } %>
</asp:Content>
