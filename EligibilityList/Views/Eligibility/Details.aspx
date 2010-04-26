<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<EligibilityList.Core.Domain.Eligibility>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Details
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Appointment Details for <%= Html.Encode(Model.Employee.FullName) %></h2>

    <fieldset>
        <legend>Fields</legend>
        <p>
            Apt Department:
            <%= Html.Encode(Model.Unit.FullName) %>
        </p>
        <p>
            Action Type:
            <%= Html.Encode(Model.Action.Name) %>
        </p>
        <p>
            Committee: <%= Html.Encode(Model.Committee.Name) %>
        </p>
        <p>
            Dean: <%= Html.Encode(Model.DeanSafeName) %>
        </p>
        <p>
            Analyst: <%= Html.Encode(Model.AnalystSafeName) %>
        </p>
        <p>
            Current Title: <%= Html.Encode(Model.CurrentTitle.AbbreviatedName) %>
        </p>
        <p>
            Current Step: <%= Html.Encode(Model.CurrentStep.Name) %>
        </p>
        <p>
            Current Appt %: <%= Html.Encode(Model.CurrentAppointmentPercent) %>
        </p>
        <p>
            Current Blank In the ---: <%= Html.Encode(Model.CurrentBlankTitle) %>
        </p>
        <p>
            Current Years @ Rank: <%= Html.Encode(Model.YearsAtRank) %>
        </p>
        <p>
            Current Years @ Step: <%= Html.Encode(Model.YearsAtStep) %>
        </p>
        <p>
            Proposed Title: <%= Html.Encode(Model.ProposedTitle == null ? "None" : Model.ProposedTitle.AbbreviatedName) %>
        </p>
        <p>
            Proposed Step: <%= Html.Encode(Model.ProposedStep == null ? "None" : Model.ProposedStep.Name) %>
        </p>
        <p>
            Proposed Appt %: <%= Html.Encode(Model.ProposedAppointmentPercent) %>
        </p>
        <p>
            Proposed Blank in The ---: <%= Html.Encode(Model.ProposedBlankTitle) %>
        </p>
        <p>
            Years at Acel: <%= Html.Encode(Model.YearsAccelerated) %>
        </p>
        <p>
            Years at Decel: <%= Html.Encode(Model.YearsDecelerated) %>
        </p>
        <p>
            DateDue:
            <%= Html.Encode(String.Format("{0:d}", Model.DateDue)) %>
        </p>
        <p>
            DateEffective:
            <%= Html.Encode(String.Format("{0:d}", Model.DateEffective)) %>
        </p>
        <p>
            Comment:
            <%= Html.Encode(Model.Comment) %>
        </p>
    </fieldset>
    <p>
        <%=Html.ActionLink("Edit", "Edit", new { id = Model.Id }) %> |
        <%=Html.ActionLink("Back to List", "ViewByDepartment") %>
    </p>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="AdditionalScripts" runat="server">
</asp:Content>

