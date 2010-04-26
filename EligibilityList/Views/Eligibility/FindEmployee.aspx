<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<FindEmployeeViewModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Find Employee
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Find Employee</h2>

    <p>
        <%= this.Select("Units")
                .Options(Model.Units, x=>x.PPSCode, x=>x.ShortName)
                .Selected(Model.Unit == null ? string.Empty : Model.Unit.PPSCode)
                .FirstOption("-- Select a Unit --")
                .Class("required")
                .Label("Select Unit: ")
        %>
    </p>
    
    <% if (Model.PayrollPersons.Count() > 0) { %>
    <p>
       <%= Html.Grid(Model.PayrollPersons) 
                .Name("PayrollPersons")
                .PrefixUrlParameters(false)
                .Columns(col =>
                             {
                                 col.Add(x => x.Name);
                                 col.Add(x => x.EmployeeID);
                                 col.Add(x => x.TitleCode);
                                 col.Add(x => x.Department).Title("Department Code");
                             })
                .Sortable()
           %> 
    </p>
    <% } %>
    
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="AdditionalScripts" runat="server">
    <script type="text/javascript">
        $(function() {
            $('#Units').change(function() {
                var value = $(this).val();
                
                var newURL = "<%= Url.Action("FindEmployee", new { id=""}) %>/" + value;
                
                window.location = newURL;                
            });
        });
    </script>
</asp:Content>
