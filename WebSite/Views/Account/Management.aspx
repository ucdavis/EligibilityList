<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Management
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>User Management</h2>
    
    <div id="loading">
        Loading...
    </div>
    <div style="width: 100%; height: 800px;" align="center">
        <iframe id="frame"  frameborder="0" 
            src='<%= ConfigurationManager.AppSettings["CatbertUserService"] %>' 
            scrolling="auto" name="frame" style="width:100%; height:100%;">
        </iframe> 
    </div>


</asp:Content>
<asp:Content ContentPlaceHolderID="AdditionalScripts" runat="server">
    <script type="text/javascript">
        $(function() {
            $("#frame").load(function() {
                $("#loading").hide();
            });
        });
    </script>
</asp:Content>