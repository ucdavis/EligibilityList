<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<EligibilityList.Core.Domain.Step>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Index
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Index</h2>

    <table>
        <tr>
            <th></th>
            <th>
                Name
            </th>
            <th></th>
        </tr>

    <% foreach (var item in Model) { %>
    
        <tr>
            <td>
                <%= Html.ActionLink("Edit", "Edit", new { id = item.Id }) %> |
            </td>    
            <td>
                <%= Html.Encode(item.Name) %>
            </td>
            <td>
                <%
    using (Html.BeginForm("Remove", "Step", new {id=item.Id})) { %> 
        <%= Html.AntiForgeryToken() %>
       
       <input class="remove" type="submit" value="Remove" />
        
    <% } %>
            </td>
        </tr>
    
    <% } %>

    </table>

    <p>
        <%= Html.ActionLink("Create New", "Create") %>
    </p>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="AdditionalScripts" runat="server">
</asp:Content>

