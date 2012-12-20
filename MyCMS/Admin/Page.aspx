<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Page.aspx.cs" Inherits="MyCMS.Admin.Page" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1
        {
            height: 23px;
        }
        .auto-style2
        {
            height: 23px;
            width: 136px;
        }
        .auto-style3
        {
            width: 136px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <table style="width:100%;">
            <tr>
                <td class="auto-style2">Page Name</td>
                <td class="auto-style1">
                    <asp:TextBox ID="txtPageName" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">Title</td>
                <td>
                    <asp:TextBox ID="txtTittle" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">Parent Page</td>
                <td>
                    <asp:DropDownList ID="ddlParentPage" runat="server">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">Page SEO</td>
                <td>
                    <asp:TextBox ID="txtPageSEO" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">Page Order</td>
                <td>
                    <asp:TextBox ID="txtPageOrder" runat="server" Width="128px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">Is Visible</td>
                <td>
                    <asp:CheckBox ID="chkIsVisible" runat="server" />
                </td>
            </tr>
            <tr>
                <td class="auto-style3">Description</td>
                <td>
                    <asp:TextBox ID="txtDescription" runat="server" TextMode="MultiLine"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">Keywords</td>
                <td>
                    <asp:TextBox ID="txtKeywords" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">Theme</td>
                <td>
                    <asp:DropDownList ID="ddlTheme" runat="server" AutoPostBack="True">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">Layout</td>
                <td>
                    <asp:DropDownList ID="ddlLayout" runat="server">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" />
                </td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
