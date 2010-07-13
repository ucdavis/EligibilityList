<%@ Page Title="" Language="C#" Inherits="System.Web.Mvc.ViewPage" MasterPageFile="~/Views/Shared/Site.Master" %>
<asp:Content runat="server" ID="Content" ContentPlaceHolderID="TitleContent">Eligibility List: Reports</asp:Content>
<asp:Content runat="server" ID="Content1" ContentPlaceHolderID="AdditionalScripts"></asp:Content>
<asp:Content runat="server" ID="Content2" ContentPlaceHolderID="MainContent">

<h3>Available Reports</h3>

<ul>
    <li><%= Html.ActionLink<ReportController>(x => x.EligibilityListReport(), "Eligibility List by Action")%></li>
</ul>
</asp:Content>
