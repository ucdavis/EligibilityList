<%@ Page Title="" Language="C#" MasterPageFile="~/EL.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:CheckBox ID="cbGetAll" runat="server" AutoPostBack="True" 
        Text="All Records" />
    <br />
    <center>
        <asp:Literal ID="litAction" runat="server" Text="Pending Actions" />   
    </center>
    <asp:ListView ID="lvEL" runat="server" DataSourceID="ObjectDataSource1">
        <ItemTemplate>
            <tr>
                <td>
                    <asp:Label ID="NameLabel" runat="server" 
                        Text='<%# Eval("Employee.FullName") %>' />
                </td>
                <%--<td>
                    <asp:Label ID="DeptLabel" runat="server" Text='<%# Eval("DeptCode") %>' />
                </td>--%>
                <td>
                    <asp:Label ID="DeptLabel" runat="server" Text='<%# Eval("Department.Abbreviation") %>' />
                </td>
                <%--<td>
                    <asp:Label ID="ActionIDLabel" runat="server" Text='<%# Eval("ActionID") %>' />
                </td>--%>
                <td>
                    <asp:Label ID="ActionIDLabel" runat="server" Text='<%# Eval("Action.Name") %>' />
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
        <LayoutTemplate>
            <table runat="server">
                <tr runat="server">
                    <td runat="server">
                        <table ID="itemPlaceholderContainer" runat="server" border="0" style="">
                            <tr runat="server" style="">
                                <th runat="server">
                                    Name</th>
                                <th runat="server">
                                    Dept.</th>
                                <th runat="server">
                                    Action Type</th>
                                <th runat="server">
                                    Y@R</th>
                                <th runat="server">
                                    Y@S</th>
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
    </asp:ListView>
    
&nbsp;<asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetByStatus" 
        TypeName="EL.BLL.EligibilityBLL">
        <SelectParameters>
            <asp:ControlParameter ControlID="cbGetAll" Name="getAll" 
                PropertyName="Checked" Type="Boolean" />
        </SelectParameters>
    </asp:ObjectDataSource>
</asp:Content>

