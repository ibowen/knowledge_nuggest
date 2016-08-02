<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Report.aspx.cs" Inherits="EDM_Project.Report" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="EDM.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 189px;
        }
        .auto-style3 {
            width: 326px;
        }
        .auto-style4 {
            width: 193px;
        }
    </style>
</head>
<body>
    <div id="wrapper">
        <div id="headerwrap">
        <div id="header">
            <img src="Images/Logo.png" width="100" height="75" alt="logo" style ="position:relative;TOP:0px; left:887px;" />
        </div>
        </div>
        <div id="navigationwrap">
        <div id="navigation">
            <p>Sales Report</p>
        </div>
        </div>
        <div id="leftcolumnwrap">
        <div id="leftcolumn">
            <p> <a href="Default.aspx">Create Knowledge</a></p>
            <p> <a href="ViewCustomers.aspx">View Customers</a></p>
            <p> <a href="Report.aspx">Report</a></p>
        </div>
        </div>
        <div id="contentwrap">
        <div id="content">
    <form id="form1" runat="server">
    <div>
    <div style ="position:relative; left:750px; top: 0px; width: 75px;"> 
        <asp:LinkButton ID="lbtnLogout" runat="server" OnClick="lbtnLogout_Click" >Log Out</asp:LinkButton>  
            </div>
        <table class="auto-style1">
            <tr>
                <td>&nbsp;</td>
                <td class="auto-style2">
                    <asp:ScriptManager ID="ScriptManager1" runat="server">
                    </asp:ScriptManager>
                </td>
                <td class="auto-style4">&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td class="auto-style2">
                    <asp:Label ID="lblFrmDate" runat="server" Text="From Date"></asp:Label>
                </td>
                <td class="auto-style4">
                    <asp:TextBox ID="txtFromDate" runat="server"></asp:TextBox>
                    <ajaxToolkit:CalendarExtender ID="txtFromDate_CalendarExtender" runat="server" TargetControlID="txtFromDate" />
                </td>
                <td>
                    <asp:Label ID="lblToDate" runat="server" Text="To Date"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtToDate" runat="server"></asp:TextBox>
                    <ajaxToolkit:CalendarExtender ID="txtToDate_CalendarExtender" runat="server" TargetControlID="txtToDate" />
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style4">&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style4">
                    <asp:Button ID="btnReport" runat="server" Text="Generate Report" OnClick="btnReport_Click" />
                </td>
                <td>&nbsp;</td>
                <td>
                    <asp:Label ID="lblDateMsg" runat="server" Font-Bold="True" ForeColor="Red" Text="Enter Date" Visible="False"></asp:Label>
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>
        <br />
        <table class="auto-style1">
            <tr>
                <td class="auto-style3">&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">&nbsp;</td>
                <td>
                    <asp:GridView ID="gviewReport" runat="server" Width="800px" AutoGenerateColumns="False" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="Black">
                            <AlternatingRowStyle BackColor="#CCCCCC"/>
                            <Columns>
                                <asp:BoundField DataField="cname" HeaderText="Customer Name" ItemStyle-HorizontalAlign="Center"/>
                                <asp:BoundField DataField="mode" HeaderText="Payment Mode" ItemStyle-HorizontalAlign="Center"/>
                                <asp:BoundField DataField="date" HeaderText="Date of Purchase" ItemStyle-HorizontalAlign="Center"/>
                                <asp:BoundField DataField="pfee" HeaderText="Provider Fee" ItemStyle-HorizontalAlign="Center"/>
                                <asp:BoundField DataField="vfee" HeaderText="Vendor Fee" ItemStyle-HorizontalAlign="Center"/>
                                <asp:BoundField DataField="kname" HeaderText="Knowledge Name" ItemStyle-HorizontalAlign="Center"/>
                                <asp:BoundField DataField="pname" HeaderText="Provider Name" ItemStyle-HorizontalAlign="Center"/>
                            </Columns>
                        <FooterStyle BackColor="#CCCCCC" />
                <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
                <RowStyle BackColor="White" />
                <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                <SortedAscendingHeaderStyle BackColor="Gray" />
                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                <SortedDescendingHeaderStyle BackColor="#383838" />
                    </asp:GridView>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>
        <br />
    
    </div>
    </form>
            </div>
        </div>
        <div id="footerwrap">
        <div id="footer">
            <p> Created By: DBHustlers </p>
        </div>
        </div>
    </div>
</body>
</html>
