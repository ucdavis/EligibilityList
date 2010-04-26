<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<ViewByDepartmentViewModel>" %>
<%@ Import Namespace="EligibilityList.Core.Domain"%>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Index
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <script type="text/javascript">
        $(function() {
            $('#Units').change(function() {
                var value = $(this).val();
                
                var newURL = "<%= Url.Action("ViewByDepartment", new { id=""}) %>/" + value;
                
                window.location = newURL;                
            });
        });
    </script>

    <h2>Viewing Eligibilities for <%= Model.Unit == null ? "All units" : Model.Unit.FullName %></h2>
    
    <%= this.Select("Units")
            .Options(Model.Units, x=>x.FISCode, x=>x.ShortName)
            .Selected(Model.Unit == null ? string.Empty : Model.Unit.FISCode)
            .FirstOption("--Select A Unit--")
            .Label("Select Unit: ")
    %>

    <%Html.Grid(Model.Eligibilities)
              .Transactional()
              .Name("EligibilityList")
              .PrefixUrlParameters(false)
              .Columns(c =>
                           {
                               c.Add(x =>
                                         {%>
                                            <%= Html.ActionLink("Details", "Details", new {id = x.Id}) %> 
                                         <%});
                               c.Add(x => x.Employee.FullName).Title("Name");
                               c.Add(x => x.Action.Name).Title("Action Type");
                               c.Add(x => x.YearsAtRank).Title("Y@R");
                               c.Add(x => x.YearsAtStep).Title("Y@S");
                               c.Add(x => x.YearsAccelerated).Title("YA");
                               c.Add(x => x.YearsDecelerated).Title("YD");
                               c.Add(x => x.CurrentStatus);
                               c.Add(x => x.ProposedStatus);
                               c.Add(x => x.Committee.Name).Title("Review By");
                               c.Add(x => x.DateDue).Format("{0:d}");
                               c.Add(x => x.Defer);   
                           })
              .Sortable()
              .Pageable(x => x.PageSize(20))
              .Render();
        %>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="AdditionalScripts" runat="server">
</asp:Content>
