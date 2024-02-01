<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<EligibilityList.Core.Domain.Eligibility>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Details
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Appointment Details for <%= Html.Encode(Model.Employee.FullName) %></h2>

    <fieldset>
        <legend>Fields</legend>
        <div class="col left">
        <ul>
        <li>
            <span>Apt Department:</span>
            <%= Html.Encode(Model.Unit.FullName) %>
        </li>
        <li>
            <span>Action Type:</span>
            <%= Html.Encode(Model.Action.Name) %>
        </li>
        <li>
            <span>Committee:</span> <%= Html.Encode(Model.Committee.Name) %>
        </li>
        <li>
            <span>Dean:</span> <%= Html.Encode(Model.DeanSafeName) %>
        </li>
        <li>
            <span>Analyst:</span> <%= Html.Encode(Model.AnalystSafeName) %>
        </li>
        <li>
            <span>Current Title:</span> <%= Html.Encode(Model.CurrentTitle.AbbreviatedName) %>
        </li>
        <li>
            <span>Current Step:</span> <%= Html.Encode(Model.CurrentStep.Name) %>
        </li>
        <li>
            <span>Current Appt %:</span> <%= Html.Encode(Model.CurrentAppointmentPercent) %>
        </li>
        <li>
            <span>Current Working Title:</span> <%= Html.Encode(Model.CurrentWorkingTitle) %>
        </li>
        <li>
            <span>Current Years @ Rank:</span> <%= Html.Encode(Model.YearsAtRank) %>
        </li>
        <li>
            <span>Current Years @ Step:</span> <%= Html.Encode(Model.YearsAtStep) %>
        </li>
        </ul>
        </div>
        <div class="col right">
        <ul>
        <li>
            <span>Proposed Title:</span> <%= Html.Encode(Model.ProposedTitle == null ? "None" : Model.ProposedTitle.AbbreviatedName) %>
        </li>
        <li>
            <span>Proposed Step:</span> <%= Html.Encode(Model.ProposedStep == null ? "None" : Model.ProposedStep.Name) %>
        </li>
        <li>
            <span>Proposed Appt %:</span> <%= Html.Encode(Model.ProposedAppointmentPercent) %>
        </li>
        <li>
            <span>Proposed Working Title:</span> <%= Html.Encode(Model.ProposedWorkingTitle) %>
        </li>
        <li>
            <span>Defer?:</span> <%= Html.Encode(Model.Defer) %>
        </li>
        <li>
            <span>Years at Acel:</span> <%= Html.Encode(Model.YearsAccelerated) %>
        </li>
        <li>
            <span>Years at Decel:</span> <%= Html.Encode(Model.YearsDecelerated) %>
        </li>
        <li>
            <span>Date Due:</span>
            <%= Html.Encode(String.Format("{0:d}", Model.DateDue)) %>
        </li>
        <li>
            <span>Date Effective:</span>
            <%= Html.Encode(String.Format("{0:d}", Model.DateEffective)) %>
        </li>
        <li>
            <span>Comment:</span>
            <%= Html.Encode(Model.Comment) %>
        </li>
        </ul>
        </div>
    </fieldset>
    <li>
        <%=Html.ActionLink("Edit", "Edit", new { id = Model.Id }) %> |
        <%=Html.ActionLink("Back to List", "ViewByDepartment")%>
    </li>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="AdditionalScripts" runat="server">
</asp:Content>

