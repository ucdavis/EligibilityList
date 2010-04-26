<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<EligibilityEditViewModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Edit
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Editing Elgibility for <%= Html.Encode(Model.Eligibility.Employee.FullName) %></h2>

    <%= Html.ValidationSummary("Edit was unsuccessful. Please correct the errors and try again.") %>

    <% using (Html.BeginForm()) {%>

        <fieldset>
            <legend>Fields</legend>
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
                <input type="submit" value="Save" />
            </p>
        </fieldset>

    <% } %>

    <div>
        <%=Html.ActionLink("Back to List", "Index") %>
    </div>

</asp:Content>