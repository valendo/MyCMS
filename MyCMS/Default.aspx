<%@ Page Title="Home Page" Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="MyCMS._Default" %>

<%@ Register Src="~/UserControls/DockPanel.ascx" TagPrefix="uc1" TagName="DockPanel" %>
<%@ Register Src="~/UserControls/TopPanel.ascx" TagPrefix="uc1" TagName="TopPanel" %>



<!DOCTYPE html>
<html lang="en">
<head id="Head1" runat="server">
    <meta charset="utf-8" />
                                 
    <link href="/Styles/reset.css" rel="stylesheet" />
    <link href="/Styles/Site.css" rel="stylesheet" />
    <link href="/Styles/admin.css" rel="stylesheet" />
    <link id="XPanelStyleSheet" rel="stylesheet" type="text/css" runat="server" />
    <link href="/Styles/module.css" rel="stylesheet" />
    <link href="/Styles/popupbox.css" rel="stylesheet" />
    <link href="/Content/themes/base/jquery.ui.all.css" rel="stylesheet" />
    <script src="/Scripts/jquery-1.7.1.min.js"></script>
    <script src="/Scripts/jquery-ui-1.8.20.min.js"></script>
    <script src="/Scripts/MyScripts/dragdrop.js"></script>
    <script src="/Scripts/MyScripts/dialog.js"></script>

</head>
<body id="Body">
    <form id="Form1" runat="server">
        <asp:ImageButton ID="btnEdit" runat="server" ImageUrl="~/Images/Site/preview_edit.png" OnClick="btnEdit_Click" CssClass="preview_edit_button" />
        <div id="x_top" runat="server">
            <uc1:TopPanel runat="server" id="TopPanel" />
        </div>
        <div id="x_left" runat="server">
            <uc1:DockPanel runat="server" id="DockPanel" />
        </div>
        <div id="x_main">
            <asp:PlaceHolder ID="pchDefault" runat="server"></asp:Placeholder>
            <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
            <div id="popup" style="z-index:999;"></div>
        </div>
        <script type="text/javascript">
            var PageId = "<%: this.PageId %>";            
        </script>
    </form>
</body>
</html>
