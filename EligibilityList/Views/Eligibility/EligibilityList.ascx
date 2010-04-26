<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<IEnumerable<Eligibility>>" %>
<%@ Import Namespace="EligibilityList.Core.Domain"%>

    
    <%Html.Grid(Model)
              .Transactional()
              .Name("EligibilityList")
              .PrefixUrlParameters(false)
              .Columns(c =>
                           {
                               c.Add(x =>
                                         {%>
                                            <%= Html.ActionLink("Edit", "Edit", new {id = x.Id}) %> 
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