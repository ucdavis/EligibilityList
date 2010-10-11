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
                
                var newURL = "<%= Url.Action("ViewPending", new { id=""}) %>/" + value;
                
                window.location = newURL;                
            });
        });
    </script>

    <h2>Viewing Pending Eligibilities for <%= Model.Unit == null ? "All units" : Model.Unit.FullName %></h2>

    <span class="switch-view">
        <%= Html.ActionLink("Click here to view all Eligibility List", "ViewByDepartment")%>
    </span>
    <span class="switch-units">
        <%= this.Select("Units")
                .Options(Model.Units, x=>x.FISCode, x=>x.ShortName)
                .Selected(Model.Unit == null ? string.Empty : Model.Unit.FISCode)
                .FirstOption("-- All Units --")
                .Label("Select Unit: ")
        %>
    </span>

    <% Html.RenderPartial("EligibilityList", Model.Eligibilities); %>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="AdditionalScripts" runat="server">
</asp:Content>
