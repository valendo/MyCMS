<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ModuleSetting.aspx.cs" Inherits="MyCMS.Admin.ModuleSetting" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="/Styles/admin.css" rel="stylesheet" />
    <link href="/Content/themes/base/jquery.ui.all.css" rel="stylesheet" />
    <script src="/Scripts/jquery-1.7.1.min.js"></script>
    <script src="/Scripts/jquery-ui-1.8.20.min.js"></script>
    <script src="/Scripts/MyScripts/dialog.js"></script>

    <script>
        $(function () {
            $("#tabs_module_settings").tabs();
        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div id="tabs_module_settings">
            <ul>
                <li><a href="#tabs-setting">Settings</a></li>
            </ul>
            <div id="tabs-setting">
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
                        <td>
                            Display title
                        </td>
                        <td>
                            <asp:CheckBox ID="chkDisplayTitle" runat="server" Checked="true" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" />
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </form>
</body>
</html>
