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
            YearsAtRank:
            <%= Html.Encode(Model.YearsAtRank) %>
        </p>
        <p>
            YearsAtStep:
            <%= Html.Encode(Model.YearsAtStep) %>
        </p>
        <p>
            AppointmentPercent:
            <%= Html.Encode(String.Format("{0:F}", Model.CurrentAppointmentPercent)) %>
        </p>
        <p>
            CurrentStatus:
            <%= Html.Encode(Model.CurrentStatus) %>
        </p>
        <p>
            ProposedStatus:
            <%= Html.Encode(Model.ProposedStatus) %>
        </p>
        <p>
            CurrentBlankTitle:
            <%= Html.Encode(Model.CurrentBlankTitle) %>
        </p>
        <p>
            ProposedBlankTitle:
            <%= Html.Encode(Model.ProposedBlankTitle) %>
        </p>
        <p>
            YearsAccelerated:
            <%= Html.Encode(Model.YearsAccelerated) %>
        </p>
        <p>
            YearsDecelerated:
            <%= Html.Encode(Model.YearsDecelerated) %>
        </p>
        <p>
            Defer:
            <%= Html.Encode(Model.Defer) %>
        </p>
        <p>
            DateDue:
            <%= Html.Encode(String.Format("{0:g}", Model.DateDue)) %>
        </p>
        <p>
            DateToCommittee:
            <%= Html.Encode(String.Format("{0:g}", Model.DateToCommittee)) %>
        </p>
        <p>
            DateCommitteeReceived:
            <%= Html.Encode(String.Format("{0:g}", Model.DateCommitteeReceived)) %>
        </p>
        <p>
            DateEffective:
            <%= Html.Encode(String.Format("{0:g}", Model.DateEffective)) %>
        </p>
        <p>
            Comment:
            <%= Html.Encode(Model.Comment) %>
        </p>
        <p>
            FinalAction:
            <%= Html.Encode(Model.FinalAction) %>
        </p>
        <p>
            TPCCode:
            <%= Html.Encode(Model.TPCCode) %>
        </p>
        <p>
            AppNum:
            <%= Html.Encode(Model.AppNum) %>
        </p>
        <p>
            LastUpdated:
            <%= Html.Encode(String.Format("{0:g}", Model.LastUpdated)) %>
        </p>
        <p>
            ProposedAppointmentPercent:
            <%= Html.Encode(String.Format("{0:F}", Model.ProposedAppointmentPercent)) %>
        </p>
        <p>
            Inactive:
            <%= Html.Encode(Model.Inactive) %>
        </p>
        <p>
            Id:
            <%= Html.Encode(Model.Id) %>
        </p>
    </fieldset>
    <p>
        <%=Html.ActionLink("Edit", "Edit", new { /* id=Model.PrimaryKey */ }) %> |
        <%=Html.ActionLink("Back to List", "ViewByDepartment") %>
    </p>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="AdditionalScripts" runat="server">
</asp:Content>

