<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="EL.Web._Default" %>

<%-- Please do not delete this file. It is used to ensure that ASP.NET MVC is activated by IIS when a user makes a "/" request to the server. --%>
<%--   <asp:CheckBox ID="cbGetAll" runat="server" AutoPostBack="True" 
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
                <td>
                    <asp:Label ID="DeptLabel" runat="server" Text='<%# Eval("Department.Abbreviation") %>' />
                </td>
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
            <table id="Table1" runat="server">
                <tr id="Tr1" runat="server">
                    <td id="Td1" runat="server">
                        <table ID="itemPlaceholderContainer" runat="server" border="0" style="">
                            <tr id="Tr2" runat="server" style="">
                                <th id="Th1" runat="server">
                                    Name</th>
                                <th id="Th2" runat="server">
                                    Dept.</th>
                                <th id="Th3" runat="server">
                                    Action Type</th>
                                <th id="Th4" runat="server">
                                    Y@R</th>
                                <th id="Th5" runat="server">
                                    Y@S</th>
                                <th id="Th6" runat="server">
                                    YA</th>
                                <th id="Th7" runat="server">
                                    YD</th>
                                <th id="Th8" runat="server">
                                    Current Status</th>
                                <th id="Th9" runat="server">
                                    Proposed Status</th>
                                <th id="Th10" runat="server">
                                    Review By</th>
                                <th id="Th11" runat="server">
                                    DateDue</th>
                                <th id="Th12" runat="server">
                                    Defer</th>
                            </tr>
                            <tr ID="itemPlaceholder" runat="server">
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr id="Tr3" runat="server">
                    <td id="Td2" runat="server" style="">
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
--%>