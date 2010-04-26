<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<EL.Core.Domain.Eligibility>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Edit
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Edit</h2>

    <%= Html.ValidationSummary("Edit was unsuccessful. Please correct the errors and try again.") %>

    <% using (Html.BeginForm()) {%>

        <fieldset>
            <legend>Fields</legend>
            <p>
                <label for="DeanID">DeanID:</label>
                <%= Html.TextBox("DeanID", Model.DeanID) %>
                <%= Html.ValidationMessage("DeanID", "*") %>
            </p>
            <p>
                <label for="AnalystID">AnalystID:</label>
                <%= Html.TextBox("AnalystID", Model.AnalystID) %>
                <%= Html.ValidationMessage("AnalystID", "*") %>
            </p>
            <p>
                <label for="YearsAtRank">YearsAtRank:</label>
                <%= Html.TextBox("YearsAtRank", Model.YearsAtRank) %>
                <%= Html.ValidationMessage("YearsAtRank", "*") %>
            </p>
            <p>
                <label for="YearsAtStep">YearsAtStep:</label>
                <%= Html.TextBox("YearsAtStep", Model.YearsAtStep) %>
                <%= Html.ValidationMessage("YearsAtStep", "*") %>
            </p>
            <p>
                <label for="AppointmentPercent">AppointmentPercent:</label>
                <%= Html.TextBox("AppointmentPercent", String.Format("{0:F}", Model.AppointmentPercent)) %>
                <%= Html.ValidationMessage("AppointmentPercent", "*") %>
            </p>
            <p>
                <label for="CommitteeID">CommitteeID:</label>
                <%= Html.TextBox("CommitteeID", Model.CommitteeID) %>
                <%= Html.ValidationMessage("CommitteeID", "*") %>
            </p>
            <p>
                <label for="CurrentBlankTitle">CurrentBlankTitle:</label>
                <%= Html.TextBox("CurrentBlankTitle", Model.CurrentBlankTitle) %>
                <%= Html.ValidationMessage("CurrentBlankTitle", "*") %>
            </p>
            <p>
                <label for="ProposedBlankTitle">ProposedBlankTitle:</label>
                <%= Html.TextBox("ProposedBlankTitle", Model.ProposedBlankTitle) %>
                <%= Html.ValidationMessage("ProposedBlankTitle", "*") %>
            </p>
            <p>
                <label for="YearsAccelerated">YearsAccelerated:</label>
                <%= Html.TextBox("YearsAccelerated", Model.YearsAccelerated) %>
                <%= Html.ValidationMessage("YearsAccelerated", "*") %>
            </p>
            <p>
                <label for="YearsDecelerated">YearsDecelerated:</label>
                <%= Html.TextBox("YearsDecelerated", Model.YearsDecelerated) %>
                <%= Html.ValidationMessage("YearsDecelerated", "*") %>
            </p>
            <p>
                <label for="Defer">Defer:</label>
                <%= Html.TextBox("Defer", Model.Defer) %>
                <%= Html.ValidationMessage("Defer", "*") %>
            </p>
            <p>
                <label for="DateDue">DateDue:</label>
                <%= Html.TextBox("DateDue", String.Format("{0:g}", Model.DateDue)) %>
                <%= Html.ValidationMessage("DateDue", "*") %>
            </p>
            <p>
                <label for="DateToCommittee">DateToCommittee:</label>
                <%= Html.TextBox("DateToCommittee", String.Format("{0:g}", Model.DateToCommittee)) %>
                <%= Html.ValidationMessage("DateToCommittee", "*") %>
            </p>
            <p>
                <label for="DateCommitteeReceived">DateCommitteeReceived:</label>
                <%= Html.TextBox("DateCommitteeReceived", String.Format("{0:g}", Model.DateCommitteeReceived)) %>
                <%= Html.ValidationMessage("DateCommitteeReceived", "*") %>
            </p>
            <p>
                <label for="DateEffective">DateEffective:</label>
                <%= Html.TextBox("DateEffective", String.Format("{0:g}", Model.DateEffective)) %>
                <%= Html.ValidationMessage("DateEffective", "*") %>
            </p>
            <p>
                <label for="Comment">Comment:</label>
                <%= Html.TextBox("Comment", Model.Comment) %>
                <%= Html.ValidationMessage("Comment", "*") %>
            </p>
            <p>
                <label for="FinalAction">FinalAction:</label>
                <%= Html.TextBox("FinalAction", Model.FinalAction) %>
                <%= Html.ValidationMessage("FinalAction", "*") %>
            </p>
            <p>
                <label for="TPCCode">TPCCode:</label>
                <%= Html.TextBox("TPCCode", Model.TPCCode) %>
                <%= Html.ValidationMessage("TPCCode", "*") %>
            </p>
            <p>
                <label for="AppNum">AppNum:</label>
                <%= Html.TextBox("AppNum", Model.AppNum) %>
                <%= Html.ValidationMessage("AppNum", "*") %>
            </p>
            <p>
                <label for="LastUpdated">LastUpdated:</label>
                <%= Html.TextBox("LastUpdated", String.Format("{0:g}", Model.LastUpdated)) %>
                <%= Html.ValidationMessage("LastUpdated", "*") %>
            </p>
            <p>
                <label for="ProposedAppointmentPercent">ProposedAppointmentPercent:</label>
                <%= Html.TextBox("ProposedAppointmentPercent", String.Format("{0:F}", Model.ProposedAppointmentPercent)) %>
                <%= Html.ValidationMessage("ProposedAppointmentPercent", "*") %>
            </p>
            <p>
                <label for="IsActive">IsActive:</label>
                <%= Html.TextBox("IsActive", Model.IsActive) %>
                <%= Html.ValidationMessage("IsActive", "*") %>
            </p>
            <p>
                <input type="submit" value="Save" />
            </p>
        </fieldset>

    <% } %>

    <div>
        <%=Html.ActionLink("Back to List", "Index") %>
    </div>

</asp:Content>

