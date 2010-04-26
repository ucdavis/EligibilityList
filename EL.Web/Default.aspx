<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ListView ID="ListView1" runat="server" DataSourceID="ObjectDataSource1">
    </asp:ListView>
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetByName" 
        TypeName="EL.BLL.ActionTypeBLL">
        <SelectParameters>
            <asp:Parameter Name="name" Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <script type="text/javascript"></script>
</asp:Content>

