<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ListView ID="ListView1" runat="server" DataSourceID="ObjectDataSource1">
    <LayoutTemplate>
            <table cellpadding="2" border="1" id="tbl1" runat="server">
                
                <tr>
                    <th></th>
                    <th></th>
                    <th>Name</th>
                    <th>Action Type</th>
                    <th>Y@R</th>
                    <th>Y@S</th>
                    <th>YA</th>
                    <th>YD</th>
                    <th>Current Status</th>
                    <th>Proposed Status</th>
                    <th>Review By</th>
                    <th>Due Date</th>
                </tr>
                <tr id="itemPlaceHolder" runat="server"></tr>
            </table>
    </LayoutTemplate>
    <ItemTemplate>
        
        <tr>
            <td ></td>
            <td></td>
            <td><%# Eval("EmployeeID") %></td>
            <td><%# Eval("ActionID") %></td>
            <td><%# Eval("YearsAtRank") %></td>
            <td><%# Eval("YearsAtStep") %></td>
            <td><%# Eval("YearsAccelerated") %></td>
            <td><%# Eval("YearsDecelerated") %></td>
            <td><%# Eval("TitleCode") %></td>
            <td><%# Eval("ProposedTitleCode") %></td>
            <td><%# Eval("CommitteeID") %></td>
            <td><%# Eval("DateDue") %></td>
        </tr>
        
        
        <tr>
            <td><asp:Button ID="btnAccept" runat="server" Text="Accept" /></td>
            <td><asp:Button ID="btnReject" runat="server" Text="Reject" /></td>
            <td><%# Eval("Original.EmployeeID") %></td>
            <td><%# Eval("Original.ActionID")%></td>
            <td><%# Eval("Original.YearsAtRank")%></td>
            <td><%# Eval("Original.YearsAtStep")%></td>
            <td><%# Eval("Original.YearsAccelerated")%></td>
            <td><%# Eval("Original.YearsDecelerated")%></td>
            <td><%# Eval("Original.TitleCode")%></td>
            <td><%# Eval("Original.ProposedTitleCode")%></td>
            <td><%# Eval("Original.CommitteeID")%></td>
            <td><%# Eval("Original.DateDue")%></td>
        </tr>
    </ItemTemplate>
    </asp:ListView>
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetActive" 
        TypeName="EL.BLL.EligibilityBLL">
    </asp:ObjectDataSource>
    <script type="text/javascript"></script>
</asp:Content>

