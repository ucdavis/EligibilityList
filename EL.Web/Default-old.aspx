<%@ Page Title="" Language="C#" MasterPageFile="~/EL.master" AutoEventWireup="true" CodeFile="Default-old.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div>
        <div align="center">
        <asp:Button ID="btnReview" runat="server" Text="Review Pending Changes" />
        </div>
            <asp:Panel ID="pnlModalPopup" runat="server" CssClass="modalPopup" style="display:none;">
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
            <td><asp:Button ID="btnAccept" runat="server" Text="Accept" /></td>
            <td><asp:Button ID="btnReject" runat="server" Text="Reject" /></td>
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
            
            <td ></td>
            <td></td>
            <td><%# Eval("OriginalEligibility.EmployeeID") %></td>
            <td><%# Eval("OriginalEligibility.ActionID")%></td>
            <td><%# Eval("OriginalEligibility.YearsAtRank")%></td>
            <td><%# Eval("OriginalEligibility.YearsAtStep")%></td>
            <td><%# Eval("OriginalEligibility.YearsAccelerated")%></td>
            <td><%# Eval("OriginalEligibility.YearsDecelerated")%></td>
            <td><%# Eval("OriginalEligibility.TitleCode")%></td>
            <td><%# Eval("OriginalEligibility.ProposedTitleCode")%></td>
            <td><%# Eval("OriginalEligibility.CommitteeID")%></td>
            <td><%# Eval("OriginalEligibility.DateDue")%></td>
        </tr>
    </ItemTemplate>
    </asp:ListView>
                    <div align="center">
                        <asp:Button ID="btnClose" runat="server" Text="Close" />
                    </div>
             </asp:Panel>
             
        <AjaxControlToolkit:ModalPopupExtender ID="ModalPopupExtender1" runat="server" TargetControlID="btnReview" PopupControlID="pnlModalPopup" BackgroundCssClass="modalBackground" DropShadow="true" CancelControlID="btnClose" /> 
    </div>

    
    <asp:GridView runat="server" AllowPaging="True" AutoGenerateColumns="False" 
        CellPadding="4" DataSourceID="ObjectDataSource2" ForeColor="#333333" 
        GridLines="None">
        <RowStyle BackColor="#EFF3FB" />
        <Columns>
            <asp:CommandField ShowSelectButton="True" />
            <asp:BoundField DataField="EmployeeID" HeaderText="EmployeeID" 
                SortExpression="EmployeeID" />
            <asp:BoundField DataField="DeptCode" HeaderText="DeptCode" 
                SortExpression="DeptCode" />
            <asp:BoundField DataField="DeanID" HeaderText="DeanID" 
                SortExpression="DeanID" />
            <asp:BoundField DataField="AnalystID" HeaderText="AnalystID" 
                SortExpression="AnalystID" />
            <asp:BoundField DataField="ActionID" HeaderText="ActionID" 
                SortExpression="ActionID" />
            <asp:BoundField DataField="YearsAtRank" HeaderText="YearsAtRank" 
                SortExpression="YearsAtRank" />
            <asp:BoundField DataField="YearsAtStep" HeaderText="YearsAtStep" 
                SortExpression="YearsAtStep" />
            <asp:BoundField DataField="AppointmentPercent" HeaderText="AppointmentPercent" 
                SortExpression="AppointmentPercent" />
            <asp:BoundField DataField="CommitteeID" HeaderText="CommitteeID" 
                SortExpression="CommitteeID" />
            <asp:BoundField DataField="TitleCode" HeaderText="TitleCode" 
                SortExpression="TitleCode" />
            <asp:BoundField DataField="CurrentStep" HeaderText="CurrentStep" 
                SortExpression="CurrentStep" />
            <asp:BoundField DataField="CurrentBlankTitle" HeaderText="CurrentBlankTitle" 
                SortExpression="CurrentBlankTitle" />
            <asp:BoundField DataField="ProposedTitleCode" HeaderText="ProposedTitleCode" 
                SortExpression="ProposedTitleCode" />
            <asp:BoundField DataField="ProposedStep" HeaderText="ProposedStep" 
                SortExpression="ProposedStep" />
            <asp:BoundField DataField="ProposedBlankTitle" HeaderText="ProposedBlankTitle" 
                SortExpression="ProposedBlankTitle" />
            <asp:BoundField DataField="YearsAccelerated" HeaderText="YearsAccelerated" 
                SortExpression="YearsAccelerated" />
            <asp:BoundField DataField="YearsDecelerated" HeaderText="YearsDecelerated" 
                SortExpression="YearsDecelerated" />
            <asp:CheckBoxField DataField="Defer" HeaderText="Defer" 
                SortExpression="Defer" />
            <asp:BoundField DataField="DateDue" HeaderText="DateDue" 
                SortExpression="DateDue" />
            <asp:BoundField DataField="DateToCommittee" HeaderText="DateToCommittee" 
                SortExpression="DateToCommittee" />
            <asp:BoundField DataField="DateCommitteeReceived" 
                HeaderText="DateCommitteeReceived" SortExpression="DateCommitteeReceived" />
            <asp:BoundField DataField="DateEffective" HeaderText="DateEffective" 
                SortExpression="DateEffective" />
            <asp:BoundField DataField="Comment" HeaderText="Comment" 
                SortExpression="Comment" />
            <asp:CheckBoxField DataField="FinalAction" HeaderText="FinalAction" 
                SortExpression="FinalAction" />
            <asp:BoundField DataField="TPCCode" HeaderText="TPCCode" 
                SortExpression="TPCCode" />
            <asp:BoundField DataField="AppNum" HeaderText="AppNum" 
                SortExpression="AppNum" />
            <asp:BoundField DataField="LastUpdated" HeaderText="LastUpdated" 
                SortExpression="LastUpdated" />
            <asp:BoundField DataField="ProposedAppointmentPercent" 
                HeaderText="ProposedAppointmentPercent" 
                SortExpression="ProposedAppointmentPercent" />
            <asp:CheckBoxField DataField="IsActive" HeaderText="IsActive" 
                SortExpression="IsActive" />
            <asp:BoundField DataField="ID" HeaderText="ID" ReadOnly="True" 
                SortExpression="ID" />
        </Columns>
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <EditRowStyle BackColor="#2461BF" />
        <AlternatingRowStyle BackColor="White" />
    </asp:GridView>
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetChanged" 
        TypeName="EL.BLL.EligibilityBLL">
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetActive" 
        TypeName="EL.BLL.EligibilityBLL"></asp:ObjectDataSource>
</asp:Content>

