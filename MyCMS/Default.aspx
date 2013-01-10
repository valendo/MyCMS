<%@ Page Title="Home Page" Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="MyCMS._Default" %>

<%@ Register Src="~/UserControls/DockPanel.ascx" TagPrefix="uc1" TagName="DockPanel" %>
<%@ Register Src="~/UserControls/TopPanel.ascx" TagPrefix="uc1" TagName="TopPanel" %>



<!DOCTYPE html>
<html lang="en">
<head id="Head1" runat="server">
    <meta charset="utf-8" />
    <title><%: Page.Title %> - My CMS</title>
    <link href="/Styles/reset.css" rel="stylesheet" />
    <link href="/Styles/Site.css" rel="stylesheet" />
    <link href="/Styles/admin.css" rel="stylesheet" />
    <link href="/Styles/xpanel.css" rel="stylesheet" />
    <link href="/Styles/module.css" rel="stylesheet" />
    <link href="/Styles/popupbox.css" rel="stylesheet" />
    <link href="/Content/themes/base/jquery.ui.all.css" rel="stylesheet" />
    <script src="/Scripts/jquery-1.7.1.min.js"></script>
    <script src="/Scripts/jquery-ui-1.8.20.min.js"></script>
    <script src="/Scripts/MyScripts/dragdrop.js"></script>
    <script src="/Scripts/MyScripts/dialog.js"></script>
    <script src="/Scripts/MyScripts/xpanel.js"></script>

</head>
<body id="Body">
    <form id="Form1" runat="server">
        <asp:Button ID="btnEdit" runat="server" Text="Edit" OnClick="btnEdit_Click"/>
        <div id="x_top" runat="server">
            <uc1:TopPanel runat="server" id="TopPanel" />
        </div>
        <div id="x_left" runat="server">
            <uc1:DockPanel runat="server" id="DockPanel" />
        </div>
        <div id="x_main">
            <asp:Label ID="lblMsg" runat="server" Text="hello"></asp:Label>
            <asp:PlaceHolder ID="pchDefault" runat="server"></asp:Placeholder>
            
            <div id="popup" style="z-index:999;"></div>
        </div>
        <script type="text/javascript">
            var PageId = "<%: this.PageId %>";            
        </script>
    </form>
</body>
</html>
