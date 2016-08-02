<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewCustomers.aspx.cs" Inherits="EDM_Project.ViewCustomers" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="EDM.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .auto-style1 {
            width: 100%;
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
            <p>Customer List</p>
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
        <asp:Panel ID="Panel1" runat="server">
            <table class="auto-style1">
                <tr>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>
                        <asp:Label ID="lblDpt" runat="server" Text="Department"></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlDept" runat="server">
                        </asp:DropDownList>
                    </td>
                    <td>
                        <asp:Label ID="lblCMM" runat="server" Text="CMM Level"></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlCMM" runat="server">
                            <asp:ListItem Selected="True">--Select--</asp:ListItem>
                            <asp:ListItem>1</asp:ListItem>
                            <asp:ListItem>2</asp:ListItem>
                            <asp:ListItem>3</asp:ListItem>
                            <asp:ListItem>4</asp:ListItem>
                            <asp:ListItem>5</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td>
                        <asp:Label ID="lblSize" runat="server" Text="Company Size"></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlScale" runat="server">
                            <asp:ListItem>--Select--</asp:ListItem>
                            <asp:ListItem Value="1">Small</asp:ListItem>
                            <asp:ListItem Value="2">Medium</asp:ListItem>
                            <asp:ListItem Value="3">Large</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>
                        <asp:Button ID="btnView" runat="server" Text="View" OnClick="btnView_Click" />
                    </td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
            </table>
            <br />
            <asp:GridView ID="gviewCust" runat="server" Width="800px" AutoGenerateColumns="False" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="Black">
                <AlternatingRowStyle BackColor="#CCCCCC" />
                <Columns>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:CheckBox ID="chkboxKnw" runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="kid" HeaderText="KID" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="15%">
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="cid" HeaderText="CID" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="15%">
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="cname" HeaderText="Customer Name" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="25%">
                    <ItemStyle HorizontalAlign="Center" Width="25%" />
                    </asp:BoundField>
                    <asp:BoundField DataField="phone" HeaderText="Phone Number" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="20%">
                    <ItemStyle HorizontalAlign="Center" Width="20%" />
                    </asp:BoundField>
                    <asp:BoundField DataField="email" HeaderText="Email Address" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="25%">
                    <ItemStyle HorizontalAlign="Center" Width="25%" />
                    </asp:BoundField>
                    <asp:BoundField DataField="name" HeaderText="Knowledge Name" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="30%">
                    <ItemStyle HorizontalAlign="Center" Width="30%" />
                    </asp:BoundField>
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
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="btnDelete" runat="server" OnClick="btnDelete_Click" Text="Delete Selected" Visible="False" />
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="Label1" runat="server" Font-Bold="True" ForeColor="Red" Text="Records Deleted Successfully!!" Visible="False"></asp:Label>
            <br />
        </asp:Panel>
    
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
