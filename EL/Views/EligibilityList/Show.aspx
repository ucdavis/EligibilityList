<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IQueryable<EL.Core.Domain.Eligibility>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Show
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <%= Html.RouteLink("Show All", new { changed = false }) %> | <%= Html.RouteLink("Show Changed", new { changed = true}) %>    

    <h2>Show</h2>
    <table border="0">
        <tr>
            <th>
                Name
            </th>
            <th>
                Dept.
            </th>
            <th>
                Action Type
            </th>
            <th>
                Y@R
            </th>
            <th>
                Y@S
            </th>
            <th>
                YA
            </th>
            <th>
                YD
            </th>
            <th>
                Current Status
            </th>
            <th>
                Proposed Status
            </th>
            <th>
                Review By
            </th>
            <th>
                DateDue
            </th>
            <th>
                Defer
            </th>
            <th>Comment</th>
        </tr>
        <% foreach (var el in Model)
           { %>
        <tr>
            <td><%= Html.Encode(el.Employee.FullName) %></td>
            <td><%= Html.Encode(el.Department.Abbreviation) %></td>
            <td><%= Html.Encode(el.Action.Name) %></td>
            <td><%= Html.Encode(el.YearsAtRank) %></td>
            <td><%= Html.Encode(el.YearsAtStep) %></td>
            <td><%= Html.Encode(el.YearsAccelerated) %></td>
            <td><%= Html.Encode(el.YearsDecelerated) %></td>
            <td><%= Html.Encode(el.CurrentStatus) %></td>
            <td><%= Html.Encode(el.ProposedStatus) %></td>
            <td><%= Html.Encode(el.CommitteeID) %></td>
            <td><%= Html.Encode(string.Format("{0:D}", el.DateDue)) %></td>
            <td><%= Html.CheckBox("Defer", el.Defer.HasValue ? el.Defer.Value : false, new { Disabled = "disabled" })%></td>
            <td><%= Html.Encode(el.Comment) %></td>
        </tr>
        <% } %>   
    </table>
</asp:Content>
