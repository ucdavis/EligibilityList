<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<EligibilityEditViewModel>" %>
<%@ Import Namespace="EligibilityList.Core.Domain"%>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Edit
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Editing Elgibility for <%= Html.Encode(Model.Eligibility.Employee.FullName) %></h2>

    <%= Html.ValidationSummary("Edit was unsuccessful. Please correct the errors and try again.") %>
    <%= Html.ClientSideValidation<Eligibility>() %>

    <% using (Html.BeginForm()) {%>

        <fieldset>
            <legend>Fields</legend>
            <p>
                <%= this.Select("Unit")
                        .Options(Model.Units, x=>x.FISCode, x=>x.FullName)
                        .Selected(Model.Eligibility.Unit.FISCode)
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
                <%= this.Select("CurrentTitle") 
                        .Options(Model.Titles, x=>x.Id, x=>x.AbbreviatedName)
                        .Selected(Model.Eligibility.CurrentTitle.Id)
                        .Label("Current Title: ")
                    %>
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
            <%= this.TextBox("CurrentAppointmentPercent")
                    .Value(Model.Eligibility.CurrentAppointmentPercent)
                    .Label("Current Appt %: ")
                %>
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