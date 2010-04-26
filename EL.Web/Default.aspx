<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ListView ID="ListView1" runat="server" DataSourceID="ObjectDataSource1">
    <LayoutTemplate>
            <table cellpadding="2" border="1" id="tbl1" runat="server">
                <tr id="itemPlaceHolder" runat="server"></tr>
            </table>
    </LayoutTemplate>
    <ItemTemplate>
        <tr><td>
            <asp:Button ID="Button1" runat="server" Text="Select" /></td><td><%# Eval("EmployeeID") %></td></tr>
    </ItemTemplate>
    </asp:ListView>
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetActive" 
        TypeName="EL.BLL.EligibilityBLL">
    </asp:ObjectDataSource>
    <script type="text/javascript"></script>
</asp:Content>

