<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HandleModuleControls.aspx.cs" Inherits="MyCMS.Admin.HandleModuleControls" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        body
        {
            font-size:11px;
            margin:0;
            padding:0;
        }
        .ui-widget {
            font-size:12px !important;
        }
    </style>
    <link href="/Content/themes/base/jquery.ui.all.css" rel="stylesheet" />
    <script src="/Scripts/jquery-1.7.1.min.js"></script>
    <script src="/Scripts/jquery-ui-1.8.20.min.js"></script>
    <script src="/Scripts/MyScripts/dialog.js"></script>

    <script>
        $(function () {
            $("#tabs").tabs();
        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div id="tabs">
            <ul>
                <li><a href="#tabs-edit">Edit</a></li>
                <li><a href="#tabs-setting">Settings</a></li>
            </ul>
            <div id="tabs-edit">
                <asp:PlaceHolder ID="pchEdit" runat="server"></asp:PlaceHolder>
            </div>
            <div id="tabs-setting">
                <asp:PlaceHolder ID="pchSetting" runat="server"></asp:PlaceHolder>
            </div>
        </div>
    </form>
</body>
</html>
