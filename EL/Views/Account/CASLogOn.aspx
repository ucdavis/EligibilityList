<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>CASLogOn</title>
</head>
<body>
    <div>
        <h2>Access Denied</h2>
        <p>
            You do not have access to view this page: <%= Html.Encode(ViewData["URL"]) %>
        </p>
    </div>
</body>
</html>
