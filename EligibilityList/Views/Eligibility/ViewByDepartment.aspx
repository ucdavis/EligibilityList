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

    <h2>Viewing All Eligibilities for <%= Model.Unit == null ? "All units" : Model.Unit.FullName %></h2>
    
    <% var fisCodeOrEmpty = Model.Unit == null ? string.Empty : Model.Unit.FISCode; %>
    
    <span class="switch-view">
        <%= Html.ActionLink("Click here to view changes to Eligibility List", "ViewPending")%>
    </span>
    <span class="switch-units">
        <%= this.Select("Units")
                .Options(Model.Units, x=>x.FISCode, x=>x.ShortName)
                .Selected(fisCodeOrEmpty)
                .FirstOption("-- All Units --")
                .Label("Select Unit: ")
        %>
    </span>
    
    <span><%= Html.ActionLink("Export To Excel", "GetEligibilityListReport", "Report", new { fisCode = fisCodeOrEmpty }, null)%></span>
    
    <% Html.RenderPartial("EligibilityList", Model.Eligibilities); %>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="AdditionalScripts" runat="server">
</asp:Content>
