<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<EligibilityList.Controllers.ElibiilityReviewViewModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Index
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <script type="text/javascript">
        $(function() {
            $('form').validate();
        });
    </script>

    <h2>Review Eligibility</h2>

    <%= Html.ValidationSummary("Edit was unsuccessful. Please correct the errors and try again.") %>

    <% using (Html.BeginForm()) {%>
        <%= Html.AntiForgeryToken() %>
        <p>
            <label for="Employee.Id">Employee Id:</label>
            <%= Html.Encode(Model.Eligibility.Employee.Id) %>
        </p>
        <p>
            <label for="Employee.Fullname">Name:</label>
            <%= Html.Encode(Model.Eligibility.Employee.FullName) %>
        </p>
    
        <table>
            <tr class='<%= Model.Eligibility != Model.Eligibility.OriginalEligibility ? "Changed" : string.Empty %>'>
                <th></th>
                <th>Proposed</th>
                <th>Original</th>
            </tr>
            <tr class='<%= Model.Eligibility.Unit != Model.Eligibility.Unit ? "Changed" : string.Empty %>'>
                <td class="field-name">Unit:</td>
                <td class="field-value"><%= Html.Encode(Model.Eligibility.Unit.FullName) %></td>
                <td class="field-value"><%= Html.Encode(Model.Eligibility.OriginalEligibility.Unit.FullName) %></td>
            </tr>
            <tr class='odd <%= Model.Eligibility.DeanSafeName != Model.Eligibility.OriginalEligibility.DeanSafeName ? "Changed" : string.Empty %>'>
                <td class="field-name">Dean:</td>
                <td class="field-value"><%= Html.Encode(Model.Eligibility.DeanSafeName) %></td>
                <td class="field-value"><%= Html.Encode(Model.Eligibility.OriginalEligibility.DeanSafeName) %></td>
            </tr>
            <tr class='<%= Model.Eligibility.AnalystSafeName != Model.Eligibility.OriginalEligibility.AnalystSafeName ? "Changed" : string.Empty %>'>
                <td class="field-name">Analyst:</td>
                <td class="field-value"><%= Html.Encode(Model.Eligibility.AnalystSafeName) %></td>
                <td class="field-value"><%= Html.Encode(Model.Eligibility.OriginalEligibility.AnalystSafeName) %></td>
            </tr>
            <tr class='odd <%= Model.Eligibility.Action != Model.Eligibility.OriginalEligibility.Action ? "Changed" : string.Empty %>'>
                <td class="field-name">Action:</td>
                <td class="field-value"><%= Html.Encode(Model.Eligibility.Action.Name) %></td>
                <td class="field-value"><%= Html.Encode(Model.Eligibility.OriginalEligibility.Action.Name) %></td>
            </tr>
            <tr class='<%= Model.Eligibility.YearsAtRank != Model.Eligibility.OriginalEligibility.YearsAtRank ? "Changed" : string.Empty %>'>
                <td class="field-name">Years at Rank:</td>
                <td class="field-value"><%= Html.Encode(Model.Eligibility.YearsAtRank) %></td>
                <td class="field-value"><%= Html.Encode(Model.Eligibility.OriginalEligibility.YearsAtRank) %></td>
            </tr>
            <tr class='odd <%= Model.Eligibility.YearsAtStep != Model.Eligibility.OriginalEligibility.YearsAtStep ? "Changed" : string.Empty %>'>
                <td class="field-name">Years at Step:</td>
                <td class="field-value"><%= Html.Encode(Model.Eligibility.YearsAtStep) %></td>
                <td class="field-value"><%= Html.Encode(Model.Eligibility.OriginalEligibility.YearsAtStep) %></td>
            </tr>
            <tr class='<%= Model.Eligibility.CurrentAppointmentPercent != Model.Eligibility.OriginalEligibility.CurrentAppointmentPercent ? "Changed" : string.Empty %>'>
                <td class="field-name">Current Appointment %:</td>
                <td class="field-value"><%= Html.Encode(Model.Eligibility.CurrentAppointmentPercent) %>%</td>
                <td class="field-value"><%= Html.Encode(Model.Eligibility.OriginalEligibility.CurrentAppointmentPercent) %>%</td>
            </tr>
            <tr class='odd <%= Model.Eligibility.Committee != Model.Eligibility.OriginalEligibility.Committee ? "Changed" : string.Empty %>'>
                <td class="field-name">Commitee:</td>
                <td class="field-value"><%= Html.Encode(Model.Eligibility.Committee.Name) %></td>
                <td class="field-value"><%= Html.Encode(Model.Eligibility.OriginalEligibility.Committee.Name) %></td>
            </tr>
            <tr class='<%= Model.Eligibility.CurrentTitle != Model.Eligibility.OriginalEligibility.CurrentTitle ? "Changed" : string.Empty %>'>
                <td class="field-name">Current Title:</td>
                <td class="field-value"><%= Html.Encode(Model.Eligibility.CurrentTitle.Name) %></td>
                <td class="field-value"><%= Html.Encode(Model.Eligibility.OriginalEligibility.CurrentTitle.Name) %></td>
            </tr>
            <tr class='odd <%= Model.Eligibility.CurrentStep != Model.Eligibility.OriginalEligibility.CurrentStep ? "Changed" : string.Empty %>'>
                <td class="field-name">Current Step:</td>
                <td class="field-value"><%= Html.Encode(Model.Eligibility.CurrentStep.Name) %></td>
                <td class="field-value"><%= Html.Encode(Model.Eligibility.OriginalEligibility.CurrentStep.Name) %></td>
            </tr>
            <tr class='<%= Model.Eligibility.CurrentStatus != Model.Eligibility.OriginalEligibility.CurrentStatus ? "Changed" : string.Empty %>'>
                <td class="field-name">Current Status:</td>
                <td class="field-value"><%= Html.Encode(Model.Eligibility.CurrentStatus) %></td>
                <td class="field-value"><%= Html.Encode(Model.Eligibility.OriginalEligibility.CurrentStatus) %></td>
            </tr>
            <tr class='odd <%= Model.Eligibility.ProposedStatus != Model.Eligibility.OriginalEligibility.ProposedStatus ? "Changed" : string.Empty %>'>
                <td class="field-name">Proposed Status:</td>
                <td class="field-value"><%= Html.Encode(Model.Eligibility.ProposedStatus) %></td>
                <td class="field-value"><%= Html.Encode(Model.Eligibility.OriginalEligibility.ProposedStatus) %></td>
            </tr>
            <tr class='<%= Model.Eligibility.CurrentBlankTitle != Model.Eligibility.OriginalEligibility.CurrentBlankTitle ? "Changed" : string.Empty %>'>
                <td class="field-name">Current Blank Title:</td>
                <td class="field-value"><%= Html.Encode(Model.Eligibility.CurrentBlankTitle) %></td>
                <td class="field-value"><%= Html.Encode(Model.Eligibility.OriginalEligibility.CurrentBlankTitle) %></td>
            </tr>
            <tr class='odd <%= Model.Eligibility.ProposedTitle != Model.Eligibility.OriginalEligibility.ProposedTitle ? "Changed" : string.Empty %>'>
                <td class="field-name">Proposed Title:</td>
                <td class="field-value"><%= Html.Encode(Model.Eligibility.ProposedTitle.Name) %></td>
                <td class="field-value"><%= Html.Encode(Model.Eligibility.OriginalEligibility.ProposedTitle.Name) %></td>
            </tr>            
            <tr class='<%= Model.Eligibility.ProposedStep != Model.Eligibility.OriginalEligibility.ProposedStep ? "Changed" : string.Empty %>'>
                <td class="field-name">Proposed Step:</td>
                <td class="field-value"><%= Html.Encode(Model.Eligibility.ProposedStep.Name) %></td>
                <td class="field-value"><%= Html.Encode(Model.Eligibility.OriginalEligibility.ProposedStep.Name) %></td>
            </tr>
            <tr class='odd <%= Model.Eligibility.ProposedBlankTitle != Model.Eligibility.OriginalEligibility.ProposedBlankTitle ? "Changed" : string.Empty %>'>
                <td class="field-name">Proposed Blank Title:</td>
                <td class="field-value"><%= Html.Encode(Model.Eligibility.ProposedBlankTitle) %></td>
                <td class="field-value"><%= Html.Encode(Model.Eligibility.OriginalEligibility.ProposedBlankTitle) %></td>
            </tr>            
            <tr class='<%= Model.Eligibility.YearsAccelerated != Model.Eligibility.OriginalEligibility.YearsAccelerated ? "Changed" : string.Empty %>'>
                <td class="field-name">Years Accelerated:</td>
                <td class="field-value"><%= Html.Encode(Model.Eligibility.YearsAccelerated) %></td>
                <td class="field-value"><%= Html.Encode(Model.Eligibility.OriginalEligibility.YearsAccelerated) %></td>
            </tr>
            <tr class='odd <%= Model.Eligibility.YearsDecelerated != Model.Eligibility.OriginalEligibility.YearsDecelerated ? "Changed" : string.Empty %>'>
                <td class="field-name">Years Deccelerated:</td>
                <td class="field-value"><%= Html.Encode(Model.Eligibility.YearsDecelerated) %></td>
                <td class="field-value"><%= Html.Encode(Model.Eligibility.OriginalEligibility.YearsDecelerated) %></td>
            </tr>            
            <tr class='<%= Model.Eligibility.Defer != Model.Eligibility.OriginalEligibility.Defer ? "Changed" : string.Empty %>'>
                <td class="field-name">Defer</td>
                <td class="field-value"><%= Html.Encode(Model.Eligibility.Defer) %></td>
                <td class="field-value"><%= Html.Encode(Model.Eligibility.OriginalEligibility.Defer) %></td>
            </tr>
            <tr class='odd <%= Model.Eligibility.DateDue != Model.Eligibility.OriginalEligibility.DateDue ? "Changed" : string.Empty %>'>
                <td class="field-name">Date Due:</td>
                <td class="field-value"><%= Html.Encode(Model.Eligibility.DateDue) %></td>
                <td class="field-value"><%= Html.Encode(Model.Eligibility.OriginalEligibility.DateDue) %></td>
            </tr>            
            <tr class='<%= Model.Eligibility.DateToCommittee != Model.Eligibility.OriginalEligibility.DateToCommittee ? "Changed" : string.Empty %>'>
                <td class="field-name">Date to Committee:</td>
                <td class="field-value"><%= Html.Encode(Model.Eligibility.DateToCommittee) %></td>
                <td class="field-value"><%= Html.Encode(Model.Eligibility.OriginalEligibility.DateToCommittee) %></td>
            </tr>
            <tr class='odd <%= Model.Eligibility.DateCommitteeReceived != Model.Eligibility.OriginalEligibility.DateCommitteeReceived ? "Changed" : string.Empty %>'>
                <td class="field-name">Date Committee Recieved:</td>
                <td class="field-value"><%= Html.Encode(Model.Eligibility.DateCommitteeReceived) %></td>
                <td class="field-value"><%= Html.Encode(Model.Eligibility.OriginalEligibility.DateCommitteeReceived) %></td>
            </tr>            
            <tr class='<%= Model.Eligibility.DateEffective != Model.Eligibility.OriginalEligibility.DateEffective ? "Changed" : string.Empty %>'>
                <td class="field-name">Date Effective:</td>
                <td class="field-value"><%= Html.Encode(Model.Eligibility.DateEffective) %></td>
                <td class="field-value"><%= Html.Encode(Model.Eligibility.OriginalEligibility.DateEffective) %></td>
            </tr>
            <tr class='odd <%= Model.Eligibility.Comment != Model.Eligibility.OriginalEligibility.Comment ? "Changed" : string.Empty %>'>
                <td class="field-name">Comment:</td>
                <td class="field-value"><%= Html.Encode(Model.Eligibility.Comment) %></td>
                <td class="field-value"><%= Html.Encode(Model.Eligibility.OriginalEligibility.Comment) %></td>
            </tr>            
            <%--<tr class='<%= Model.Eligibility.FinalAction != Model.Eligibility.OriginalEligibility.FinalAction ? "Changed" : string.Empty %>'>
                <td class="field-name">Final Action:</td>
                <td class="field-value"><%= Html.Encode(Model.Eligibility.FinalAction) %></td>
                <td class="field-value"><%= Html.Encode(Model.Eligibility.FinalAction) %></td>
            </tr>--%>
            <tr class='odd <%= Model.Eligibility.TPCCode != Model.Eligibility.OriginalEligibility.TPCCode ? "Changed" : string.Empty %>'>
                <td class="field-name">TPCCode:</td>
                <td class="field-value"><%= Html.Encode(Model.Eligibility.TPCCode) %></td>
                <td class="field-value"><%= Html.Encode(Model.Eligibility.OriginalEligibility.TPCCode) %></td>
            </tr>            
            <%--<tr class='<%= Model.Eligibility.LastUpdated != Model.Eligibility.OriginalEligibility.LastUpdated ? "Changed" : string.Empty %>'>
                <td class="field-name">Last Updated:</td>
                <td class="field-value"><%= Html.Encode(Model.Eligibility.LastUpdated) %></td>
                <td class="field-value"><%= Html.Encode(Model.Eligibility.OriginalEligibility.LastUpdated) %></td>
            </tr>--%>
            <tr class='odd <%= Model.Eligibility.ProposedAppointmentPercent != Model.Eligibility.OriginalEligibility.ProposedAppointmentPercent ? "Changed" : string.Empty %>'>
                <td class="field-name">Proposed Appointment %:</td>
                <td class="field-value"><%= Html.Encode(Model.Eligibility.ProposedAppointmentPercent) %></td>
                <td class="field-value"><%= Html.Encode(Model.Eligibility.OriginalEligibility.ProposedAppointmentPercent) %></td>
            </tr>                                             
            <tr class='<%= Model.Eligibility.Inactive != Model.Eligibility.OriginalEligibility.Inactive ? "Changed" : string.Empty %>'>
                <td class="field-name">Inactive:</td>
                <td class="field-value"><%= Html.Encode(Model.Eligibility.Inactive) %></td>
                <td class="field-value"><%= Html.Encode(Model.Eligibility.OriginalEligibility.Inactive) %></td>
            </tr>                                                    
        </table>

        <div id="review-section">
            <br />
            Review Action: <br /><br />
            
            <label>Review Comments (will be included in the confirmation email)</label><br />
            <%= this.TextArea("comments").Rows(10).Columns(50) %>
            
            <%= this.RadioSet("reviewAction").Options(new[] { "Approve", "Deny" }) %>
            
            <input type="submit" value="Perform Review" />
            
        </div>
        
    <% } %>

    <div>
        <%=Html.ActionLink("Back to List", "Index") %>
    </div>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="AdditionalScripts" runat="server">

<style type="text/css">
    .Changed
    {
        background-color: Yellow;
    }
    
    .odd
    {
        
    }
</style>

</asp:Content>

