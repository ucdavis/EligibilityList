<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<IEnumerable<Eligibility>>" %>
<%@ Import Namespace="EligibilityList.Core.Domain"%>

    <%Html.Grid(Model.OrderBy(x=>x.Employee.FullName))
              .DisplayAlternateMessageWhen(Model.Count() == 0, "No Eligibilities Found")
              .Transactional()
              .Name("EligibilityList")
              .PrefixUrlParameters(false)
              .Columns(c =>
                           {
                               c.Template(x =>
                                         {%>
                                            <% if (HttpContext.Current.User.IsInRole(RoleNames.Admin) && x.OriginalEligibility != null) { %>
                                                <%= Html.ActionLink("Review", "Index", "Review", new {id = x.Id}, null) %> |
                                            <% } %>
                                            <%= Html.ActionLink("Edit", "Edit", new {id = x.Id}) %> 
                                         <%});
                               c.Bound(x => x.Employee.FullName).Title("Name");
                               c.Bound(x => x.Action.Name).Title("Action Type");
                               c.Bound(x => x.YearsAtRank).Title("Y@R");
                               c.Bound(x => x.YearsAtStep).Title("Y@S");
                               c.Bound(x => x.YearsAccelerated).Title("YA");
                               c.Bound(x => x.YearsDecelerated).Title("YD");
                               c.Bound(x => x.CurrentStatus);
                               c.Bound(x => x.ProposedStatus);
                               c.Bound(x => x.Committee.Name).Title("Review By");
                               c.Bound(x => x.DateDue).Format("{0:d}");
                               c.Bound(x => x.Defer);   
                           })
              //.Groupable(groupings => groupings.Groups(group=>group.Add(x=> x.Employee.FullName)))
              .Sortable()
              .Pageable(x => x.PageSize(20))
              .Render();
        %>