<%@ Page Title="" Language="C#" MasterPageFile="~/EL.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:CheckBox ID="cbGetAll" runat="server" AutoPostBack="True" 
        Text="All Records" />
    <br />
    <center>
        <asp:ListView ID="lvEL" runat="server" DataSourceID="ObjectDataSource1">
        <ItemTemplate>
            <tr style="">
                <td>
                    <asp:Label ID="EmployeeIDLabel" runat="server" 
                        Text='<%# Eval("EmployeeID") %>' />
                </td>
                <td>
                    <asp:Label ID="DeptCodeLabel" runat="server" Text='<%# Eval("DeptCode") %>' />
                </td>
                <td>
                    <asp:Label ID="DeanIDLabel" runat="server" Text='<%# Eval("DeanID") %>' />
                </td>
                <td>
                    <asp:Label ID="AnalystIDLabel" runat="server" Text='<%# Eval("AnalystID") %>' />
                </td>
                <td>
                    <asp:Label ID="ActionIDLabel" runat="server" Text='<%# Eval("ActionID") %>' />
                </td>
                <td>
                    <asp:Label ID="YearsAtRankLabel" runat="server" 
                        Text='<%# Eval("YearsAtRank") %>' />
                </td>
                <td>
                    <asp:Label ID="YearsAtStepLabel" runat="server" 
                        Text='<%# Eval("YearsAtStep") %>' />
                </td>
                <td>
                    <asp:Label ID="AppointmentPercentLabel" runat="server" 
                        Text='<%# Eval("AppointmentPercent") %>' />
                </td>
                <td>
                    <asp:Label ID="CommitteeIDLabel" runat="server" 
                        Text='<%# Eval("CommitteeID") %>' />
                </td>
                <td>
                    <asp:Label ID="TitleCodeLabel" runat="server" Text='<%# Eval("TitleCode") %>' />
                </td>
                <td>
                    <asp:Label ID="CurrentStepLabel" runat="server" 
                        Text='<%# Eval("CurrentStep") %>' />
                </td>
                <td>
                    <asp:Label ID="CurrentBlankTitleLabel" runat="server" 
                        Text='<%# Eval("CurrentBlankTitle") %>' />
                </td>
                <td>
                    <asp:Label ID="ProposedTitleCodeLabel" runat="server" 
                        Text='<%# Eval("ProposedTitleCode") %>' />
                </td>
                <td>
                    <asp:Label ID="ProposedStepLabel" runat="server" 
                        Text='<%# Eval("ProposedStep") %>' />
                </td>
                <td>
                    <asp:Label ID="ProposedBlankTitleLabel" runat="server" 
                        Text='<%# Eval("ProposedBlankTitle") %>' />
                </td>
                <td>
                    <asp:Label ID="YearsAcceleratedLabel" runat="server" 
                        Text='<%# Eval("YearsAccelerated") %>' />
                </td>
                <td>
                    <asp:Label ID="YearsDeceleratedLabel" runat="server" 
                        Text='<%# Eval("YearsDecelerated") %>' />
                </td>
                <td>
                    <asp:CheckBox ID="DeferCheckBox" runat="server" Checked='<%# Eval("Defer") %>' 
                        Enabled="false" />
                </td>
                <td>
                    <asp:Label ID="DateDueLabel" runat="server" Text='<%# Eval("DateDue") %>' />
                </td>
                <td>
                    <asp:Label ID="DateToCommitteeLabel" runat="server" 
                        Text='<%# Eval("DateToCommittee") %>' />
                </td>
                <td>
                    <asp:Label ID="DateCommitteeReceivedLabel" runat="server" 
                        Text='<%# Eval("DateCommitteeReceived") %>' />
                </td>
                <td>
                    <asp:Label ID="DateEffectiveLabel" runat="server" 
                        Text='<%# Eval("DateEffective") %>' />
                </td>
                <td>
                    <asp:Label ID="CommentLabel" runat="server" Text='<%# Eval("Comment") %>' />
                </td>
                <td>
                    <asp:Label ID="TPCCodeLabel" runat="server" Text='<%# Eval("TPCCode") %>' />
                </td>
                <td>
                    <asp:Label ID="AppNumLabel" runat="server" Text='<%# Eval("AppNum") %>' />
                </td>
                <td>
                    <asp:Label ID="LastUpdatedLabel" runat="server" 
                        Text='<%# Eval("LastUpdated") %>' />
                </td>
                <td>
                    <asp:Label ID="ProposedAppointmentPercentLabel" runat="server" 
                        Text='<%# Eval("ProposedAppointmentPercent") %>' />
                </td>
                <td>
                    <asp:CheckBox ID="IsActiveCheckBox" runat="server" 
                        Checked='<%# Eval("IsActive") %>' Enabled="false" />
                </td>
                <td>
                    <asp:Label ID="OriginalEligibilityLabel" runat="server" 
                        Text='<%# Eval("OriginalEligibility") %>' />
                </td>
                <td>
                    <asp:Label ID="IDLabel" runat="server" Text='<%# Eval("ID") %>' />
                </td>
            </tr>
        </ItemTemplate>
        <AlternatingItemTemplate>
            <tr style="">
                <td>
                    <asp:Label ID="EmployeeIDLabel" runat="server" 
                        Text='<%# Eval("EmployeeID") %>' />
                </td>
                <td>
                    <asp:Label ID="DeptCodeLabel" runat="server" Text='<%# Eval("DeptCode") %>' />
                </td>
                <td>
                    <asp:Label ID="DeanIDLabel" runat="server" Text='<%# Eval("DeanID") %>' />
                </td>
                <td>
                    <asp:Label ID="AnalystIDLabel" runat="server" Text='<%# Eval("AnalystID") %>' />
                </td>
                <td>
                    <asp:Label ID="ActionIDLabel" runat="server" Text='<%# Eval("ActionID") %>' />
                </td>
                <td>
                    <asp:Label ID="YearsAtRankLabel" runat="server" 
                        Text='<%# Eval("YearsAtRank") %>' />
                </td>
                <td>
                    <asp:Label ID="YearsAtStepLabel" runat="server" 
                        Text='<%# Eval("YearsAtStep") %>' />
                </td>
                <td>
                    <asp:Label ID="AppointmentPercentLabel" runat="server" 
                        Text='<%# Eval("AppointmentPercent") %>' />
                </td>
                <td>
                    <asp:Label ID="CommitteeIDLabel" runat="server" 
                        Text='<%# Eval("CommitteeID") %>' />
                </td>
                <td>
                    <asp:Label ID="TitleCodeLabel" runat="server" Text='<%# Eval("TitleCode") %>' />
                </td>
                <td>
                    <asp:Label ID="CurrentStepLabel" runat="server" 
                        Text='<%# Eval("CurrentStep") %>' />
                </td>
                <td>
                    <asp:Label ID="CurrentBlankTitleLabel" runat="server" 
                        Text='<%# Eval("CurrentBlankTitle") %>' />
                </td>
                <td>
                    <asp:Label ID="ProposedTitleCodeLabel" runat="server" 
                        Text='<%# Eval("ProposedTitleCode") %>' />
                </td>
                <td>
                    <asp:Label ID="ProposedStepLabel" runat="server" 
                        Text='<%# Eval("ProposedStep") %>' />
                </td>
                <td>
                    <asp:Label ID="ProposedBlankTitleLabel" runat="server" 
                        Text='<%# Eval("ProposedBlankTitle") %>' />
                </td>
                <td>
                    <asp:Label ID="YearsAcceleratedLabel" runat="server" 
                        Text='<%# Eval("YearsAccelerated") %>' />
                </td>
                <td>
                    <asp:Label ID="YearsDeceleratedLabel" runat="server" 
                        Text='<%# Eval("YearsDecelerated") %>' />
                </td>
                <td>
                    <asp:CheckBox ID="DeferCheckBox" runat="server" Checked='<%# Eval("Defer") %>' 
                        Enabled="false" />
                </td>
                <td>
                    <asp:Label ID="DateDueLabel" runat="server" Text='<%# Eval("DateDue") %>' />
                </td>
                <td>
                    <asp:Label ID="DateToCommitteeLabel" runat="server" 
                        Text='<%# Eval("DateToCommittee") %>' />
                </td>
                <td>
                    <asp:Label ID="DateCommitteeReceivedLabel" runat="server" 
                        Text='<%# Eval("DateCommitteeReceived") %>' />
                </td>
                <td>
                    <asp:Label ID="DateEffectiveLabel" runat="server" 
                        Text='<%# Eval("DateEffective") %>' />
                </td>
                <td>
                    <asp:Label ID="CommentLabel" runat="server" Text='<%# Eval("Comment") %>' />
                </td>
                <td>
                    <asp:Label ID="TPCCodeLabel" runat="server" Text='<%# Eval("TPCCode") %>' />
                </td>
                <td>
                    <asp:Label ID="AppNumLabel" runat="server" Text='<%# Eval("AppNum") %>' />
                </td>
                <td>
                    <asp:Label ID="LastUpdatedLabel" runat="server" 
                        Text='<%# Eval("LastUpdated") %>' />
                </td>
                <td>
                    <asp:Label ID="ProposedAppointmentPercentLabel" runat="server" 
                        Text='<%# Eval("ProposedAppointmentPercent") %>' />
                </td>
                <td>
                    <asp:CheckBox ID="IsActiveCheckBox" runat="server" 
                        Checked='<%# Eval("IsActive") %>' Enabled="false" />
                </td>
                <td>
                    <asp:Label ID="OriginalEligibilityLabel" runat="server" 
                        Text='<%# Eval("OriginalEligibility") %>' />
                </td>
                <td>
                    <asp:Label ID="IDLabel" runat="server" Text='<%# Eval("ID") %>' />
                </td>
            </tr>
        </AlternatingItemTemplate>
        <EmptyDataTemplate>
            <table runat="server" style="">
                <tr>
                    <td>
                        No data was returned.</td>
                </tr>
            </table>
        </EmptyDataTemplate>
        <InsertItemTemplate>
            <tr style="">
                <td>
                    <asp:Button ID="InsertButton" runat="server" CommandName="Insert" 
                        Text="Insert" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" 
                        Text="Clear" />
                </td>
                <td>
                    <asp:TextBox ID="EmployeeIDTextBox" runat="server" 
                        Text='<%# Bind("EmployeeID") %>' />
                </td>
                <td>
                    <asp:TextBox ID="DeptCodeTextBox" runat="server" 
                        Text='<%# Bind("DeptCode") %>' />
                </td>
                <td>
                    <asp:TextBox ID="DeanIDTextBox" runat="server" Text='<%# Bind("DeanID") %>' />
                </td>
                <td>
                    <asp:TextBox ID="AnalystIDTextBox" runat="server" 
                        Text='<%# Bind("AnalystID") %>' />
                </td>
                <td>
                    <asp:TextBox ID="ActionIDTextBox" runat="server" 
                        Text='<%# Bind("ActionID") %>' />
                </td>
                <td>
                    <asp:TextBox ID="YearsAtRankTextBox" runat="server" 
                        Text='<%# Bind("YearsAtRank") %>' />
                </td>
                <td>
                    <asp:TextBox ID="YearsAtStepTextBox" runat="server" 
                        Text='<%# Bind("YearsAtStep") %>' />
                </td>
                <td>
                    <asp:TextBox ID="AppointmentPercentTextBox" runat="server" 
                        Text='<%# Bind("AppointmentPercent") %>' />
                </td>
                <td>
                    <asp:TextBox ID="CommitteeIDTextBox" runat="server" 
                        Text='<%# Bind("CommitteeID") %>' />
                </td>
                <td>
                    <asp:TextBox ID="TitleCodeTextBox" runat="server" 
                        Text='<%# Bind("TitleCode") %>' />
                </td>
                <td>
                    <asp:TextBox ID="CurrentStepTextBox" runat="server" 
                        Text='<%# Bind("CurrentStep") %>' />
                </td>
                <td>
                    <asp:TextBox ID="CurrentBlankTitleTextBox" runat="server" 
                        Text='<%# Bind("CurrentBlankTitle") %>' />
                </td>
                <td>
                    <asp:TextBox ID="ProposedTitleCodeTextBox" runat="server" 
                        Text='<%# Bind("ProposedTitleCode") %>' />
                </td>
                <td>
                    <asp:TextBox ID="ProposedStepTextBox" runat="server" 
                        Text='<%# Bind("ProposedStep") %>' />
                </td>
                <td>
                    <asp:TextBox ID="ProposedBlankTitleTextBox" runat="server" 
                        Text='<%# Bind("ProposedBlankTitle") %>' />
                </td>
                <td>
                    <asp:TextBox ID="YearsAcceleratedTextBox" runat="server" 
                        Text='<%# Bind("YearsAccelerated") %>' />
                </td>
                <td>
                    <asp:TextBox ID="YearsDeceleratedTextBox" runat="server" 
                        Text='<%# Bind("YearsDecelerated") %>' />
                </td>
                <td>
                    <asp:CheckBox ID="DeferCheckBox" runat="server" 
                        Checked='<%# Bind("Defer") %>' />
                </td>
                <td>
                    <asp:TextBox ID="DateDueTextBox" runat="server" Text='<%# Bind("DateDue") %>' />
                </td>
                <td>
                    <asp:TextBox ID="DateToCommitteeTextBox" runat="server" 
                        Text='<%# Bind("DateToCommittee") %>' />
                </td>
                <td>
                    <asp:TextBox ID="DateCommitteeReceivedTextBox" runat="server" 
                        Text='<%# Bind("DateCommitteeReceived") %>' />
                </td>
                <td>
                    <asp:TextBox ID="DateEffectiveTextBox" runat="server" 
                        Text='<%# Bind("DateEffective") %>' />
                </td>
                <td>
                    <asp:TextBox ID="CommentTextBox" runat="server" Text='<%# Bind("Comment") %>' />
                </td>
                <td>
                    <asp:CheckBox ID="FinalActionCheckBox" runat="server" 
                        Checked='<%# Bind("FinalAction") %>' />
                </td>
                <td>
                    <asp:TextBox ID="TPCCodeTextBox" runat="server" Text='<%# Bind("TPCCode") %>' />
                </td>
                <td>
                    <asp:TextBox ID="AppNumTextBox" runat="server" Text='<%# Bind("AppNum") %>' />
                </td>
                <td>
                    <asp:TextBox ID="LastUpdatedTextBox" runat="server" 
                        Text='<%# Bind("LastUpdated") %>' />
                </td>
                <td>
                    <asp:TextBox ID="ProposedAppointmentPercentTextBox" runat="server" 
                        Text='<%# Bind("ProposedAppointmentPercent") %>' />
                </td>
                <td>
                    <asp:CheckBox ID="IsActiveCheckBox" runat="server" 
                        Checked='<%# Bind("IsActive") %>' />
                </td>
                <td>
                    <asp:TextBox ID="OriginalEligibilityTextBox" runat="server" 
                        Text='<%# Bind("OriginalEligibility") %>' />
                </td>
                <td>
                    <asp:TextBox ID="IDTextBox" runat="server" Text='<%# Bind("ID") %>' />
                </td>
            </tr>
        </InsertItemTemplate>
        <LayoutTemplate>
            <table runat="server">
                <tr runat="server">
                    <td runat="server">
                        <table ID="itemPlaceholderContainer" runat="server" border="0" style="">
                            <tr runat="server" style="">
                                <th runat="server">
                                    EmployeeID</th>
                                <th runat="server">
                                    DeptCode</th>
                                <th runat="server">
                                    DeanID</th>
                                <th runat="server">
                                    AnalystID</th>
                                <th runat="server">
                                    ActionID</th>
                                <th runat="server">
                                    YearsAtRank</th>
                                <th runat="server">
                                    YearsAtStep</th>
                                <th runat="server">
                                    AppointmentPercent</th>
                                <th runat="server">
                                    CommitteeID</th>
                                <th runat="server">
                                    TitleCode</th>
                                <th runat="server">
                                    CurrentStep</th>
                                <th runat="server">
                                    CurrentBlankTitle</th>
                                <th runat="server">
                                    ProposedTitleCode</th>
                                <th runat="server">
                                    ProposedStep</th>
                                <th runat="server">
                                    ProposedBlankTitle</th>
                                <th runat="server">
                                    YearsAccelerated</th>
                                <th runat="server">
                                    YearsDecelerated</th>
                                <th runat="server">
                                    Defer</th>
                                <th runat="server">
                                    DateDue</th>
                                <th runat="server">
                                    DateToCommittee</th>
                                <th runat="server">
                                    DateCommitteeReceived</th>
                                <th runat="server">
                                    DateEffective</th>
                                <th runat="server">
                                    Comment</th>
                                <th runat="server">
                                    FinalAction</th>
                                <th runat="server">
                                    TPCCode</th>
                                <th runat="server">
                                    AppNum</th>
                                <th runat="server">
                                    LastUpdated</th>
                                <th runat="server">
                                    ProposedAppointmentPercent</th>
                                <th runat="server">
                                    IsActive</th>
                                <th runat="server">
                                    OriginalEligibility</th>
                                <th runat="server">
                                    ID</th>
                            </tr>
                            <tr ID="itemPlaceholder" runat="server">
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr runat="server">
                    <td runat="server" style="">
                    </td>
                </tr>
            </table>
        </LayoutTemplate>
        <EditItemTemplate>
            <tr style="">
                <td>
                    <asp:Button ID="UpdateButton" runat="server" CommandName="Update" 
                        Text="Update" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" 
                        Text="Cancel" />
                </td>
                <td>
                    <asp:TextBox ID="EmployeeIDTextBox" runat="server" 
                        Text='<%# Bind("EmployeeID") %>' />
                </td>
                <td>
                    <asp:TextBox ID="DeptCodeTextBox" runat="server" 
                        Text='<%# Bind("DeptCode") %>' />
                </td>
                <td>
                    <asp:TextBox ID="DeanIDTextBox" runat="server" Text='<%# Bind("DeanID") %>' />
                </td>
                <td>
                    <asp:TextBox ID="AnalystIDTextBox" runat="server" 
                        Text='<%# Bind("AnalystID") %>' />
                </td>
                <td>
                    <asp:TextBox ID="ActionIDTextBox" runat="server" 
                        Text='<%# Bind("ActionID") %>' />
                </td>
                <td>
                    <asp:TextBox ID="YearsAtRankTextBox" runat="server" 
                        Text='<%# Bind("YearsAtRank") %>' />
                </td>
                <td>
                    <asp:TextBox ID="YearsAtStepTextBox" runat="server" 
                        Text='<%# Bind("YearsAtStep") %>' />
                </td>
                <td>
                    <asp:TextBox ID="AppointmentPercentTextBox" runat="server" 
                        Text='<%# Bind("AppointmentPercent") %>' />
                </td>
                <td>
                    <asp:TextBox ID="CommitteeIDTextBox" runat="server" 
                        Text='<%# Bind("CommitteeID") %>' />
                </td>
                <td>
                    <asp:TextBox ID="TitleCodeTextBox" runat="server" 
                        Text='<%# Bind("TitleCode") %>' />
                </td>
                <td>
                    <asp:TextBox ID="CurrentStepTextBox" runat="server" 
                        Text='<%# Bind("CurrentStep") %>' />
                </td>
                <td>
                    <asp:TextBox ID="CurrentBlankTitleTextBox" runat="server" 
                        Text='<%# Bind("CurrentBlankTitle") %>' />
                </td>
                <td>
                    <asp:TextBox ID="ProposedTitleCodeTextBox" runat="server" 
                        Text='<%# Bind("ProposedTitleCode") %>' />
                </td>
                <td>
                    <asp:TextBox ID="ProposedStepTextBox" runat="server" 
                        Text='<%# Bind("ProposedStep") %>' />
                </td>
                <td>
                    <asp:TextBox ID="ProposedBlankTitleTextBox" runat="server" 
                        Text='<%# Bind("ProposedBlankTitle") %>' />
                </td>
                <td>
                    <asp:TextBox ID="YearsAcceleratedTextBox" runat="server" 
                        Text='<%# Bind("YearsAccelerated") %>' />
                </td>
                <td>
                    <asp:TextBox ID="YearsDeceleratedTextBox" runat="server" 
                        Text='<%# Bind("YearsDecelerated") %>' />
                </td>
                <td>
                    <asp:CheckBox ID="DeferCheckBox" runat="server" 
                        Checked='<%# Bind("Defer") %>' />
                </td>
                <td>
                    <asp:TextBox ID="DateDueTextBox" runat="server" Text='<%# Bind("DateDue") %>' />
                </td>
                <td>
                    <asp:TextBox ID="DateToCommitteeTextBox" runat="server" 
                        Text='<%# Bind("DateToCommittee") %>' />
                </td>
                <td>
                    <asp:TextBox ID="DateCommitteeReceivedTextBox" runat="server" 
                        Text='<%# Bind("DateCommitteeReceived") %>' />
                </td>
                <td>
                    <asp:TextBox ID="DateEffectiveTextBox" runat="server" 
                        Text='<%# Bind("DateEffective") %>' />
                </td>
                <td>
                    <asp:TextBox ID="CommentTextBox" runat="server" Text='<%# Bind("Comment") %>' />
                </td>
                <td>
                    <asp:CheckBox ID="FinalActionCheckBox" runat="server" 
                        Checked='<%# Bind("FinalAction") %>' />
                </td>
                <td>
                    <asp:TextBox ID="TPCCodeTextBox" runat="server" Text='<%# Bind("TPCCode") %>' />
                </td>
                <td>
                    <asp:TextBox ID="AppNumTextBox" runat="server" Text='<%# Bind("AppNum") %>' />
                </td>
                <td>
                    <asp:TextBox ID="LastUpdatedTextBox" runat="server" 
                        Text='<%# Bind("LastUpdated") %>' />
                </td>
                <td>
                    <asp:TextBox ID="ProposedAppointmentPercentTextBox" runat="server" 
                        Text='<%# Bind("ProposedAppointmentPercent") %>' />
                </td>
                <td>
                    <asp:CheckBox ID="IsActiveCheckBox" runat="server" 
                        Checked='<%# Bind("IsActive") %>' />
                </td>
                <td>
                    <asp:TextBox ID="OriginalEligibilityTextBox" runat="server" 
                        Text='<%# Bind("OriginalEligibility") %>' />
                </td>
                <td>
                    <asp:TextBox ID="IDTextBox" runat="server" Text='<%# Bind("ID") %>' />
                </td>
            </tr>
        </EditItemTemplate>
        <SelectedItemTemplate>
            <tr style="">
                <td>
                    <asp:Label ID="EmployeeIDLabel" runat="server" 
                        Text='<%# Eval("EmployeeID") %>' />
                </td>
                <td>
                    <asp:Label ID="DeptCodeLabel" runat="server" Text='<%# Eval("DeptCode") %>' />
                </td>
                <td>
                    <asp:Label ID="DeanIDLabel" runat="server" Text='<%# Eval("DeanID") %>' />
                </td>
                <td>
                    <asp:Label ID="AnalystIDLabel" runat="server" Text='<%# Eval("AnalystID") %>' />
                </td>
                <td>
                    <asp:Label ID="ActionIDLabel" runat="server" Text='<%# Eval("ActionID") %>' />
                </td>
                <td>
                    <asp:Label ID="YearsAtRankLabel" runat="server" 
                        Text='<%# Eval("YearsAtRank") %>' />
                </td>
                <td>
                    <asp:Label ID="YearsAtStepLabel" runat="server" 
                        Text='<%# Eval("YearsAtStep") %>' />
                </td>
                <td>
                    <asp:Label ID="AppointmentPercentLabel" runat="server" 
                        Text='<%# Eval("AppointmentPercent") %>' />
                </td>
                <td>
                    <asp:Label ID="CommitteeIDLabel" runat="server" 
                        Text='<%# Eval("CommitteeID") %>' />
                </td>
                <td>
                    <asp:Label ID="TitleCodeLabel" runat="server" Text='<%# Eval("TitleCode") %>' />
                </td>
                <td>
                    <asp:Label ID="CurrentStepLabel" runat="server" 
                        Text='<%# Eval("CurrentStep") %>' />
                </td>
                <td>
                    <asp:Label ID="CurrentBlankTitleLabel" runat="server" 
                        Text='<%# Eval("CurrentBlankTitle") %>' />
                </td>
                <td>
                    <asp:Label ID="ProposedTitleCodeLabel" runat="server" 
                        Text='<%# Eval("ProposedTitleCode") %>' />
                </td>
                <td>
                    <asp:Label ID="ProposedStepLabel" runat="server" 
                        Text='<%# Eval("ProposedStep") %>' />
                </td>
                <td>
                    <asp:Label ID="ProposedBlankTitleLabel" runat="server" 
                        Text='<%# Eval("ProposedBlankTitle") %>' />
                </td>
                <td>
                    <asp:Label ID="YearsAcceleratedLabel" runat="server" 
                        Text='<%# Eval("YearsAccelerated") %>' />
                </td>
                <td>
                    <asp:Label ID="YearsDeceleratedLabel" runat="server" 
                        Text='<%# Eval("YearsDecelerated") %>' />
                </td>
                <td>
                    <asp:CheckBox ID="DeferCheckBox" runat="server" Checked='<%# Eval("Defer") %>' 
                        Enabled="false" />
                </td>
                <td>
                    <asp:Label ID="DateDueLabel" runat="server" Text='<%# Eval("DateDue") %>' />
                </td>
                <td>
                    <asp:Label ID="DateToCommitteeLabel" runat="server" 
                        Text='<%# Eval("DateToCommittee") %>' />
                </td>
                <td>
                    <asp:Label ID="DateCommitteeReceivedLabel" runat="server" 
                        Text='<%# Eval("DateCommitteeReceived") %>' />
                </td>
                <td>
                    <asp:Label ID="DateEffectiveLabel" runat="server" 
                        Text='<%# Eval("DateEffective") %>' />
                </td>
                <td>
                    <asp:Label ID="CommentLabel" runat="server" Text='<%# Eval("Comment") %>' />
                </td>
                <td>
                    <asp:CheckBox ID="FinalActionCheckBox" runat="server" 
                        Checked='<%# Eval("FinalAction") %>' Enabled="false" />
                </td>
                <td>
                    <asp:Label ID="TPCCodeLabel" runat="server" Text='<%# Eval("TPCCode") %>' />
                </td>
                <td>
                    <asp:Label ID="AppNumLabel" runat="server" Text='<%# Eval("AppNum") %>' />
                </td>
                <td>
                    <asp:Label ID="LastUpdatedLabel" runat="server" 
                        Text='<%# Eval("LastUpdated") %>' />
                </td>
                <td>
                    <asp:Label ID="ProposedAppointmentPercentLabel" runat="server" 
                        Text='<%# Eval("ProposedAppointmentPercent") %>' />
                </td>
                <td>
                    <asp:CheckBox ID="IsActiveCheckBox" runat="server" 
                        Checked='<%# Eval("IsActive") %>' Enabled="false" />
                </td>
                <td>
                    <asp:Label ID="OriginalEligibilityLabel" runat="server" 
                        Text='<%# Eval("OriginalEligibility") %>' />
                </td>
                <td>
                    <asp:Label ID="IDLabel" runat="server" Text='<%# Eval("ID") %>' />
                </td>
            </tr>
        </SelectedItemTemplate>
    </asp:ListView>
    <asp:Literal ID="litAction" runat="server" Text="Pending Actions" />   
    </center>
&nbsp;<asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetByStatus" 
        TypeName="EL.BLL.EligibilityBLL">
        <SelectParameters>
            <asp:ControlParameter ControlID="cbGetAll" Name="getAll" 
                PropertyName="Checked" Type="Boolean" />
        </SelectParameters>
    </asp:ObjectDataSource>
</asp:Content>

