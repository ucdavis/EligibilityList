<%@ Page Title="" Language="C#" Inherits="System.Web.Mvc.ViewPage<ELReportViewModel>" MasterPageFile="~/Views/Shared/Site.Master" %>
<asp:Content runat="server" ID="Content" ContentPlaceHolderID="TitleContent">Eligibility List Report</asp:Content>
<asp:Content runat="server" ID="Content1" ContentPlaceHolderID="AdditionalScripts"></asp:Content>
<asp:Content runat="server" ID="Content2" ContentPlaceHolderID="MainContent">

<h3>Eligibility List by Action Report: </h3>

<% using (Html.BeginForm("GetEligibilityListReport", "Report", FormMethod.Get)) { %>

<ul>
    <li>
        Select a department <%= this.Select("fisCode").Options(Model.Units, x=>x.FISCode, x=>x.ShortName).FirstOption("", "All Units").HideFirstOptionWhen(!Model.AllowAllUnits) %>
    </li>
    <li>
        Select an action:  <%= this.Select("actionName").Options(Model.Actions, x => x.Name, x => x.Name).FirstOption("", "All Actions")%>
    </li>
</ul>

<input type="submit" value="Get Report!" />

<% } %>
</asp:Content>
