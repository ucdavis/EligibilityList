<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<EligibilityModifyViewModel>" %>
<% using (Html.BeginForm()) {%>

    <%= Html.AntiForgeryToken() %>
    <%= Html.Hidden("Employee", Model.Eligibility.Employee.Id) %>
    <%= Html.Hidden("HasOriginalEligibility", Model.Eligibility.OriginalEligibility != null) %>
<fieldset>
    <legend>Fields</legend>
    <div class="col left"><ul>
    <li>
        <%= this.Select("Unit")
                        .Options(Model.Units, x=>x.Id, x=>x.FullName)
                        .Selected(Model.Eligibility.Unit.Id)
                        .Label("Appointment Department: ")
        %>
    </li>
    <li>
        <%= this.Select("Action")
                        .Options(Model.Actions, x=>x.Id, x=>x.Name)
                        .Selected(Model.Eligibility.Action.Id)
                        .Label("Action Type: ")
                        
        %>
    </li>
    <li>
        <%= this.Select("Committee")
                        .Options(Model.Committees, x=>x.Id, x=>x.Name)
                        .Selected(Model.Eligibility.Committee.Id)
                        .Label("Committee: ")
                        
        %>
    </li>
    <li>
        <label>Dean: TODO</label>
        <%= this.Select("Dean")
                        .Options(Model.Deans)
                        .Selected(Model.Eligibility.Dean == null ? string.Empty : Model.Eligibility.Dean.Login)
        %>
    </li>
    <li>
        <label>Analyst: TODO</label>
        <%= this.Select("Analyst")
                        .Options(Model.Analysts)
                        .Selected(Model.Eligibility.Analyst == null ? string.Empty : Model.Eligibility.Analyst.Login)
        %>
    </li>
    <li>
        <%= this.Select("CurrentTitle") 
                        .Options(Model.Titles, x=>x.Id, x=>x.AbbreviatedName)
                        .Selected(Model.Eligibility.CurrentTitle.Id)
                        .Label("Current Title: ")
        %>
    </li>
    <li>
        <%= this.Select("CurrentStep") 
                        .Options(Model.Steps, x=>x.Id, x=>x.Name)
                        .Selected(Model.Eligibility.CurrentStep.Id)
                        .Label("Current Step: ")
        %>
    </li>
    <li>
        <%= this.TextBox("CurrentAppointmentPercent")
                    .Value(Model.Eligibility.CurrentAppointmentPercent)
                    .Label("Current Appt %: ")
        %>
    </li>
    <li>
        <%= this.TextBox("CurrentBlankTitle").Value(Model.Eligibility.CurrentBlankTitle).Label("Current Blank In the ---: ")%>
    </li>
    <li>
        <%= this.TextBox("YearsAtRank").Value(Model.Eligibility.YearsAtRank).Label("Current Years @ Rank: ")%>
    </li>
    <li>
        <%= this.TextBox("YearsAtStep").Value(Model.Eligibility.YearsAtStep).Label("Current Years @ Step: ")%>
    </li></ul>
    </div>
    <div class="col right"><ul>
    <li>
        <%= this.Select("ProposedTitle") 
                        .Options(Model.Titles, x=>x.Id, x=>x.AbbreviatedName)
                        .Selected(Model.Eligibility.ProposedTitle == null ? string.Empty : Model.Eligibility.ProposedTitle.Id)
                        //.FirstOption("--No Title--")
                        .Label("Proposed Title: ")
        %>
    </li>
    <li>
        <%= this.Select("ProposedStep")
                        .Options(Model.Steps, x=>x.Id, x=>x.Name)
                        .Selected(Model.Eligibility.ProposedStep == null ? 0 : Model.Eligibility.ProposedStep.Id)
                        .Label("Propsed Step: ")
        %>
    </li>
    <li>
        <%= this.TextBox("ProposedAppointmentPercent").Value(Model.Eligibility.ProposedAppointmentPercent).Label("Proposed Appt %: ")%>
    </li>
    <li>
        <%= this.TextBox("ProposedBlankTitle").Value(Model.Eligibility.ProposedBlankTitle).Label("Proposed Blank In the ---: ")%>
    </li>
    <li>
        <%= this.CheckBox("Defer").Checked(Model.Eligibility.Defer).Label("Defer?: ") %>
    </li>
    <li>
        <%= this.TextBox("YearsAccelerated").Value(Model.Eligibility.YearsAccelerated).Label("Years at Acel: ")%>
    </li>
    <li>
        <%= this.TextBox("YearsDecelerated").Value(Model.Eligibility.YearsDecelerated).Label("Years at Decel: ")%>
    </li>
    <li>
        <%= this.TextBox("DateDue").Class("pickable-date").Value(Model.Eligibility.DateDue).Format("d").Label("Date Due: ")%>
    </li>
    <li>
        <%= this.TextBox("DateEffective").Class("pickable-date").Value(Model.Eligibility.DateEffective).Format("d").Label("Date Effective: ") %>
    </li>
    <li>
        <%= this.TextArea("Comment").Value(Model.Eligibility.Comment).Label("Comment: ")%>
    </li></ul>
    </div>
    
        <input type="submit" value="Save" />
    
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

