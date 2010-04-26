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
                    <asp:Label ID="YearsAcceleratedLabel" runat="server" 
                        Text='<%# Eval("YearsAccelerated") %>' />
                </td>
                <td>
                    <asp:Label ID="YearsDeceleratedLabel" runat="server" 
                        Text='<%# Eval("YearsDecelerated") %>' />
                </td>
                <td>
                    <asp:Label ID="CurrentStatusLabel" runat="server" Text='<%# Eval("CurrentStatus") %>' />
                </td>
                <td>
                    <asp:Label ID="ProposedStatusLabel" runat="server" 
                        Text='<%# Eval("ProposedStatus") %>' />
                </td>
                <td>
                </td>
                    <asp:Label ID="ReviewByLabel" runat="server" Text='<%# Eval("CommitteeID") %>' />
                <td>            
                    <asp:Label ID="DateDueLabel" runat="server" Text='<%# Eval("DateDue") %>' />
                </td>
                <td>
                    <asp:CheckBox ID="DeferCheckBox" runat="server" Checked='<%# Eval("Defer") %>' 
                        Enabled="false" />
                </td>
            </tr>    
            <tr>
                <td>
                    <asp:Label ID="CommentLabel" runat="server" Text='<%# Eval("Comment") %>' />
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
                                <th id="Th1" runat="server">
                                    YA</th>
                                <th id="Th2" runat="server">
                                    YD</th>
                                <th runat="server">
                                    Current Status</th>
                                <th runat="server">
                                    Proposed Status</th>
                                <th runat="server">
                                    Review By</th>
                                <th id="Th3" runat="server">
                                    DateDue</th>
                                <th runat="server">
                                    Defer</th>
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

