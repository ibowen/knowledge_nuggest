<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="EDM_Project.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="EDM.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .auto-style13 {
            width: 92px;
        }
        .auto-style17 {
            width: 100%;
            border-collapse: collapse;
        }
        .auto-style18 {
            width: 104px;
        }
        .auto-style19 {
            width: 108px;
        }
        .auto-style20 {
            width: 117px;
        }
        .auto-style21 {
            height: 13px;
        }
        .auto-style22 {
            width: 92px;
            height: 13px;
        }
        .auto-style23 {
            width: 104px;
            height: 13px;
        }
        .auto-style24 {
            width: 108px;
            height: 13px;
        }
        .auto-style25 {
            width: 117px;
            height: 13px;
        }
        .auto-style26 {
            width: 134px;
        }
        .auto-style27 {
            height: 13px;
            width: 134px;
        }
        .auto-style28 {
            width: 100%;
        }
        .auto-style29 {
            width: 277px;
        }
        .auto-style30 {
            width: 136px;
        }
        .auto-style32 {
            width: 164px;
        }
        .auto-style33 {
            width: 214px;
        }
        .auto-style34 {
            width: 213px;
        }
        .auto-style35 {
            width: 124px;
        }
        .auto-style36 {
            width: 155px;
        }
        .auto-style37 {
            width: 130px;
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
            <p>Create Knowledge</p>
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
        <table class="auto-style17">
            <tr>
                <td>&nbsp;</td>
                <td class="auto-style13">&nbsp;</td>
                <td class="auto-style18">&nbsp;</td>
                <td class="auto-style18">&nbsp;</td>
                <td class="auto-style19">&nbsp;</td>
                <td class="auto-style20">&nbsp;</td>
                <td class="auto-style26">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td class="auto-style13">
                    <asp:Label ID="lblDepartment" runat="server" Text="Department"></asp:Label>
                </td>
                <td class="auto-style18">
                    <asp:DropDownList ID="ddlDept" runat="server">
                    </asp:DropDownList>
                </td>
                <td class="auto-style18">
                    <asp:Label ID="lblCMM" runat="server" style="text-align: left" Text="CMM Level"></asp:Label>
                </td>
                <td class="auto-style19">
                    <asp:DropDownList ID="ddlCMM" runat="server">
                        <asp:ListItem Selected="True" Value="Select">--Select--</asp:ListItem>
                        <asp:ListItem>1</asp:ListItem>
                        <asp:ListItem>2</asp:ListItem>
                        <asp:ListItem>3</asp:ListItem>
                        <asp:ListItem>4</asp:ListItem>
                        <asp:ListItem>5</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td class="auto-style20">
                    <asp:Label ID="lblBusScale" runat="server" Text="Business Scale"></asp:Label>
                </td>
                <td class="auto-style26">
                    <asp:DropDownList ID="ddlBusScale" runat="server">
                        <asp:ListItem Selected="True" Value="Select">--Select--</asp:ListItem>
                        <asp:ListItem Value="1">Small</asp:ListItem>
                        <asp:ListItem Value="2">Medium</asp:ListItem>
                        <asp:ListItem Value="3">Large</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td class="auto-style13">&nbsp;</td>
                <td class="auto-style18">&nbsp;</td>
                <td class="auto-style18">&nbsp;</td>
                <td class="auto-style19">&nbsp;</td>
                <td class="auto-style20">&nbsp;</td>
                <td class="auto-style26">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td class="auto-style13">&nbsp;</td>
                <td class="auto-style18">&nbsp;</td>
                <td class="auto-style18">&nbsp;</td>
                <td class="auto-style19">&nbsp;</td>
                <td class="auto-style20">&nbsp;</td>
                <td class="auto-style26">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td class="auto-style13">&nbsp;</td>
                <td class="auto-style18">&nbsp;</td>
                <td class="auto-style18">
                    <asp:Button ID="btnSearch" runat="server" OnClick="btnSearch_Click" Text="Search" />
                </td>
                <td class="auto-style19">
                    <asp:Button ID="btnReset" runat="server" OnClick="btnReset_Click" Text="Reset" />
                </td>
                <td class="auto-style20">&nbsp;</td>
                <td class="auto-style26">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style21"></td>
                <td class="auto-style22"></td>
                <td class="auto-style23"></td>
                <td class="auto-style23"></td>
                <td class="auto-style24"></td>
                <td class="auto-style25"></td>
                <td class="auto-style27"></td>
                <td class="auto-style21"></td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td class="auto-style13">&nbsp;</td>
                <td class="auto-style18">&nbsp;</td>
                <td class="auto-style18">&nbsp;</td>
                <td class="auto-style19">&nbsp;</td>
                <td class="auto-style20">&nbsp;</td>
                <td class="auto-style26">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>
        <asp:Panel ID="Panel1" runat="server">
            <table class="auto-style28">
                <tr>
                    <td class="auto-style29">&nbsp;</td>
                    <td class="auto-style30">&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style29">&nbsp;</td>
                    <td class="auto-style30">
                        <asp:Label ID="lblExistKnowledge" runat="server" Text="Existing Knowledge"></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlExistKnowledge" runat="server">
                            <asp:ListItem Value="Select">--Select--</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style29">&nbsp;</td>
                    <td class="auto-style30">&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style29">&nbsp;</td>
                    <td class="auto-style30">
                        <asp:Button ID="btnEditKnowledge" runat="server" Text="Edit" Width="88px" OnClick="btnEditKnowledge_Click" />
                    </td>
                    <td>
                        <asp:Button ID="btnCreateNewKnw" runat="server" Text="Create New" OnClick="btnCreateNewKnw_Click" />
                    </td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style29">&nbsp;</td>
                    <td class="auto-style30">&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
            </table>
        </asp:Panel>
        <br />                 
                    
                <asp:Panel ID="Panel2" runat="server" Visible="False">
                    <table class="auto-style28">
                        <tr>
                            <td>&nbsp;</td>
                            <td class="auto-style33">&nbsp;</td>
                            <td class="auto-style32">
                                <asp:Label ID="lblNuggs" runat="server" Text="Available Nuggets"></asp:Label>
                            </td>
                            <td>&nbsp;</td>
                            <td>
                                <asp:Label ID="lblAvNuggs" runat="server" Text="Nuggets for Knowledge"></asp:Label>
                            </td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td class="auto-style33">&nbsp;</td>
                            <td class="auto-style32">&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td class="auto-style33">&nbsp;</td>
                            <td class="auto-style32">
                                <asp:ListBox ID="ListBox1" runat="server" Height="191px" SelectionMode="Multiple" Width="149px">
                                </asp:ListBox>                                
                            </td>
                            <td><asp:Button ID="btnAddKnw" runat="server" Font-Bold="True" OnClick="btnAddKnw_Click" style="text-align: center; position:relative; top:0px; left: 0px;" Text="&gt;" />
                                <br />
                                <br />
                                <asp:Button ID="btnRemoveKnw" runat="server" Font-Bold="True" OnClick="btnRemoveKnw_Click" style="text-align: center" Text="&lt;" />
                            </td>
                            <td><asp:ListBox ID="ListBox2" runat="server" Height="190px" SelectionMode="Multiple" Width="140px">
                    </asp:ListBox></td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;</td>
                            <td class="auto-style33">&nbsp;</td>
                            <td class="auto-style32">&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                    </table>
                    <br />
                    <table class="auto-style28">
                        <tr>
                            <td>&nbsp;</td>
                            <td class="auto-style34">&nbsp;</td>
                            <td class="auto-style37">
                                <asp:Label ID="lblKnowledge" runat="server" Text="Knowledge Name"></asp:Label>
                            </td>
                            <td class="auto-style36">
                                <asp:TextBox ID="txtKnowledge" runat="server"></asp:TextBox>
                            </td>
                            <td>
                                <asp:Button ID="btnCreateKnowledge" runat="server" Text="Create" OnClick="btnCreateKnowledge_Click" />
                            </td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td class="auto-style34">&nbsp;</td>
                            <td class="auto-style37">&nbsp;</td>
                            <td class="auto-style36">&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td class="auto-style34">&nbsp;</td>
                            <td class="auto-style37">&nbsp;</td>
                            <td class="auto-style36">&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                    </table>
                    <br />
        </asp:Panel>
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="lblmsg" runat="server" Font-Bold="True" ForeColor="Red" Text="Knowledge Created Successfully!!" Visible="False"></asp:Label>
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
