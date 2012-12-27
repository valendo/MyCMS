<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ModuleSetting.aspx.cs" Inherits="MyCMS.Admin.ModuleSetting" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="/Content/themes/base/jquery.ui.all.css" rel="stylesheet" />
    <script src="/Scripts/jquery-1.7.1.min.js"></script>
    <script src="/Scripts/jquery-ui-1.8.20.min.js"></script>
    <script src="/Scripts/MyScripts/dialog.js"></script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        ModuleSetting
    </div>
    <table>
        <tr>
            <td>
                Module title
            </td>
            <td>
                <asp:TextBox ID="txtModuleTitle" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" />
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
