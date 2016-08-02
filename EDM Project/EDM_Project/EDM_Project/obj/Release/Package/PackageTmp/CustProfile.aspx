<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CustProfile.aspx.cs" Inherits="EDM_Project.CustProfile" %>

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
            width: 114px;
        }
        .auto-style3 {
            width: 169px;
        }
        .auto-style4 {
            width: 137px;
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
            <p>Profile</p>
        </div>
        </div>
        <div id="leftcolumnwrap">
        <div id="leftcolumn">
            <p> <a href="CustProfile.aspx">Profile</a></p>
            <p> <a href="BuyKnowledge.aspx">Buy Knowledge</a></p>
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
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style3">&nbsp;</td>
                <td class="auto-style4">&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td class="auto-style2">
                    <asp:Label ID="lblFName" runat="server" Text="First Name"></asp:Label>
                </td>
                <td class="auto-style3">
                    <asp:TextBox ID="txtFName" runat="server" Enabled="False"></asp:TextBox>
                </td>
                <td class="auto-style4">
                    <asp:Label ID="lblLName" runat="server" Text="Last Name"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtLName" runat="server" Enabled="False"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style3">&nbsp;</td>
                <td class="auto-style4">&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td class="auto-style2">
                    <asp:Label ID="lblEMail" runat="server" Text="Email"></asp:Label>
                </td>
                <td class="auto-style3">
                    <asp:TextBox ID="txtEMail" runat="server" Enabled="False"></asp:TextBox>
                </td>
                <td class="auto-style4">
                    <asp:Label ID="lblPhone" runat="server" Text="Phone"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtPhone" runat="server" Enabled="False"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style3">&nbsp;</td>
                <td class="auto-style4">&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td class="auto-style2">
                    <asp:Label ID="lblSize" runat="server" Text="Company Size"></asp:Label>
                </td>
                <td class="auto-style3">
                    <asp:TextBox ID="txtSize" runat="server" Enabled="False"></asp:TextBox>
                </td>
                <td class="auto-style4">
                    <asp:Label ID="lblCustID" runat="server" Text="Customer ID"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtCustID" runat="server" Enabled="False"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style3">&nbsp;</td>
                <td class="auto-style4">&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style3">&nbsp;</td>
                <td class="auto-style4">&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style3">&nbsp;</td>
                <td class="auto-style4">
                    <asp:Button ID="btnSave" runat="server" Text="Save" Visible="False" OnClick="btnSave_Click" />
                </td>
                <td>
                    <asp:Button ID="btnEditCancel" runat="server" OnClick="btnEditCancel_Click" Text="Edit" />
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>
        <br />
        <asp:Panel ID="Panel1" runat="server">
            <asp:GridView ID="GridView1" runat="server"  Width="800px" AutoGenerateColumns="False" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="Black">
                <AlternatingRowStyle BackColor="#CCCCCC" />
                <Columns>
                    <asp:BoundField DataField="Name" HeaderText="Name" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="35%">
                    <ItemStyle HorizontalAlign="Center" Width="35%" />
                    </asp:BoundField>
                    <asp:BoundField DataField="price" HeaderText="Price" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="30%">
                    <ItemStyle HorizontalAlign="Center" Width="30%" />
                    </asp:BoundField>
                    <asp:BoundField DataField="startdate" HeaderText="Purchase Date" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="35%">
                    <ItemStyle HorizontalAlign="Center" Width="35%" />
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
