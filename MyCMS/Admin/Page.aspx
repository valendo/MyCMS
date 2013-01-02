<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Page.aspx.cs" Inherits="MyCMS.Admin.Page" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="../Scripts/MyScripts/dialog.js"></script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Literal ID="Literal1" runat="server"></asp:Literal>
        <table style="width:100%;">
            <tr>
                <td class="auto-style2">Page Name</td>
                <td class="auto-style1">
                    <asp:TextBox ID="txtPageName" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorPageName" runat="server" ControlToValidate="txtPageName" Display="None" ErrorMessage="Page name is required" ValidationGroup="page"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">Title</td>
                <td>
                    <asp:TextBox ID="txtTitle" runat="server"></asp:TextBox>
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
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorPageSEO" runat="server" ControlToValidate="txtPageSEO" Display="None" ErrorMessage="Page SEO is required" ValidationGroup="page"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtPageSEO" Display="None" ErrorMessage="Page SEO only charactor a-z and 0-9" ValidationGroup="page" ValidationExpression="[a-z0-9-]*$"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">Page Order</td>
                <td>
                    <asp:TextBox ID="txtPageOrder" runat="server" Width="128px" ></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidatorPageSEO" runat="server" ControlToValidate="txtPageOrder" Display="None" ErrorMessage="Page order only number" ValidationGroup="page" ValidationExpression="^\d+$"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">Is Visible</td>
                <td>
                    <asp:CheckBox ID="chkIsVisible" runat="server" Checked="true" />
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
                    <asp:DropDownList ID="ddlTheme" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlTheme_SelectedIndexChanged">
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
                    <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" ValidationGroup="page" />
                </td>
            </tr>
        </table>
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="true" ShowSummary="false" EnableClientScript="true" ValidationGroup="page" />
    </div>
    </form>
</body>
</html>
