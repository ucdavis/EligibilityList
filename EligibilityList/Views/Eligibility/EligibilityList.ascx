<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<IQueryable<EligibilityListQuery>>" %>
<%@ Import Namespace="EligibilityList.Core.Queries"%>
<%@ Import Namespace="EligibilityList.Core.Domain"%>

    <%Html.Grid(Model)
              .DisplayAlternateMessageWhen(Model.Count() == 0, "No Eligibilities Found")
              .Transactional()
              .Name("EligibilityList")
              .PrefixUrlParameters(false)
              .Columns(c =>
                           {
                               c.Template(x =>
                                         {%>
                                            <% if (HttpContext.Current.User.IsInRole(RoleNames.Admin) && x.HasOriginalEligibility) { %>
                                                <%= Html.ActionLink("Review", "Index", "Review", new {id = x.Id}, null) %> |
                                            <% } %>
                                            <%= Html.ActionLink("Edit", "Edit", new {id = x.Id}) %> 
                                         <%});
                               c.Bound(x => x.Name).Title("Name");
                               c.Bound(x => x.ActionType).Title("Action Type");
                               c.Bound(x => x.YearsAtRank).Title("Y@R");
                               c.Bound(x => x.YearsAtStep).Title("Y@S");
                               c.Bound(x => x.YearsAccelerated).Title("YA");
                               c.Bound(x => x.YearsDecelerated).Title("YD");
                               c.Bound(x => x.CurrentStatus);
                               c.Bound(x => x.ProposedStatus);
                               c.Bound(x => x.Committee).Title("Review By");
                               c.Bound(x => x.DateDue).Format("{0:d}");
                               c.Bound(x => x.Defer);   
                           })
              //.Groupable(groupings => groupings.Groups(group=>group.Add(x=> x.Employee.FullName)))
              .Sortable()
              .Pageable(x => x.PageSize(20))
              .Render();
        %>