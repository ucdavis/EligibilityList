<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<EligibilityList.Core.Domain.Step>" %>
<%@ Import Namespace="EligibilityList.Core.Domain"%>

<%= Html.ClientSideValidation<Step>() %>
    <%= Html.ValidationSummary("Modify was unsuccessful. Please correct the errors and try again.") %>

    <% using (Html.BeginForm()) {%>
        <%= Html.AntiForgeryToken() %>
        <fieldset>
            <legend>Fields</legend>
            <p>
                <label for="Name">Name:</label>
                <%= Html.TextBox("Name", Model.Name) %>
                <%= Html.ValidationMessage("Name", "*") %>
            </p>
            
            <p>
                <input type="submit" value="Save" />
            </p>
        </fieldset>

    <% } %>

    <div>
        <%=Html.ActionLink("Back to List", "Index") %>
    </div>
