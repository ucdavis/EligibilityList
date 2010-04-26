<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<EligibilityEditViewModel>" %>
<% using (Html.BeginForm()) {%>

    <%= Html.AntiForgeryToken() %>
    <%= Html.Hidden("Employee", Model.Eligibility.Employee.Id) %>
    <%= Html.Hidden("HasOriginalEligibility", Model.Eligibility.OriginalEligibility != null) %>
<fieldset>
    <legend>Fields</legend>
    <p>
        <%= this.Select("Unit")
                        .Options(Model.Units, x=>x.Id, x=>x.FullName)
                        .Selected(Model.Eligibility.Unit.Id)
                        .Label("Appointment Department: ")
        %>
    </p>
    <p>
        <%= this.Select("Action")
                        .Options(Model.Actions, x=>x.Id, x=>x.Name)
                        .Selected(Model.Eligibility.Action.Id)
                        .Label("Action Type: ")
                        
        %>
    </p>
    <p>
        <%= this.Select("Committee")
                        .Options(Model.Committees, x=>x.Id, x=>x.Name)
                        .Selected(Model.Eligibility.Committee.Id)
                        .Label("Committee: ")
                        
        %>
    </p>
    <p>
        Dean: TODO
        <%= this.Select("Dean")
                        .Options(Model.Deans)
                        .Selected(Model.Eligibility.Dean == null ? string.Empty : Model.Eligibility.Dean.Login)
        %>
    </p>
    <p>
        Analyst: TODO
        <%= this.Select("Analyst")
                        .Options(Model.Analysts)
                        .Selected(Model.Eligibility.Analyst == null ? string.Empty : Model.Eligibility.Analyst.Login)
        %>
    </p>
    <p>
        <%= this.Select("CurrentTitle") 
                        .Options(Model.Titles, x=>x.Id, x=>x.AbbreviatedName)
                        .Selected(Model.Eligibility.CurrentTitle.Id)
                        .Label("Current Title: ")
        %>
    </p>
    <p>
        <%= this.Select("CurrentStep") 
                        .Options(Model.Steps, x=>x.Id, x=>x.Name)
                        .Selected(Model.Eligibility.CurrentStep.Id)
                        .Label("Current Step: ")
        %>
    </p>
    <p>
        <%= this.TextBox("CurrentAppointmentPercent")
                    .Value(Model.Eligibility.CurrentAppointmentPercent)
                    .Label("Current Appt %: ")
        %>
    </p>
    <p>
        <%= this.TextBox("CurrentBlankTitle").Value(Model.Eligibility.CurrentBlankTitle).Label("Current Blank In the ---: ")%>
    </p>
    <p>
        <%= this.TextBox("YearsAtRank").Value(Model.Eligibility.YearsAtRank).Label("Current Years @ Rank: ")%>
    </p>
    <p>
        <%= this.TextBox("YearsAtStep").Value(Model.Eligibility.YearsAtStep).Label("Current Years @ Step: ")%>
    </p>
    <p>
        <%= this.Select("ProposedTitle") 
                        .Options(Model.Titles, x=>x.Id, x=>x.AbbreviatedName)
                        .Selected(Model.Eligibility.ProposedTitle == null ? string.Empty : Model.Eligibility.ProposedTitle.Id)
                        //.FirstOption("--No Title--")
                        .Label("Proposed Title: ")
        %>
    </p>
    <p>
        <%= this.Select("ProposedStep")
                        .Options(Model.Steps, x=>x.Id, x=>x.Name)
                        .Selected(Model.Eligibility.ProposedStep == null ? 0 : Model.Eligibility.ProposedStep.Id)
                        .Label("Propsed Step: ")
        %>
    </p>
    <p>
        <%= this.TextBox("ProposedAppointmentPercent").Value(Model.Eligibility.ProposedAppointmentPercent).Label("Proposed Appt %: ")%>
    </p>
    <p>
        <%= this.TextBox("ProposedBlankTitle").Value(Model.Eligibility.ProposedBlankTitle).Label("Proposed Blank In the ---: ")%>
    </p>
    <p>
        <%= this.CheckBox("Defer").Checked(Model.Eligibility.Defer).Label("Defer?: ") %>
    </p>
    <p>
        <%= this.TextBox("YearsAccelerated").Value(Model.Eligibility.YearsAccelerated).Label("Years at Acel: ")%>
    </p>
    <p>
        <%= this.TextBox("YearsDecelerated").Value(Model.Eligibility.YearsDecelerated).Label("Years at Decel: ")%>
    </p>
    <p>
        <%= this.TextBox("DateDue").Class("pickable-date").Value(Model.Eligibility.DateDue).Format("d").Label("Date Due: ")%>
    </p>
    <p>
        <%= this.TextBox("DateEffective").Class("pickable-date").Value(Model.Eligibility.DateEffective).Format("d").Label("Date Effective: ") %>
    </p>
    <p>
        <%= this.TextArea("Comment").Value(Model.Eligibility.Comment).Label("Comment: ")%>
    </p>
    <p>
        <input type="submit" value="Save" />
    </p>
</fieldset>
<% } %>

<div>
    <%=Html.ActionLink("Back to List", "Index") %>
</div>

<script type="text/javascript">
    $(function() {
        $(".pickable-date").datepicker();
    });
</script>
