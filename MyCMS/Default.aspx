﻿<%@ Page Title="Home Page" Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="MyCMS._Default" %>

<%@ Register Src="~/UserControls/DockPanel.ascx" TagPrefix="uc1" TagName="DockPanel" %>



<!DOCTYPE html>
<html lang="en">
<head id="Head1" runat="server">
    <meta charset="utf-8" />
    <title><%: Page.Title %> - My CMS</title>
    <link href="Styles/Site.css" rel="stylesheet" />
    <link href="Styles/dragdrop.css" rel="stylesheet" />
    <link href="Styles/popupbox.css" rel="stylesheet" />
    <link href="Content/themes/base/jquery.ui.all.css" rel="stylesheet" />
    <script src="Scripts/jquery-1.7.1.min.js"></script>
    <script src="Scripts/jquery-ui-1.8.20.min.js"></script>
    <script src="Scripts/MyScripts/dockpanel.js"></script>
    <script src="Scripts/MyScripts/dragdrop.js"></script>
    <script src="Scripts/MyScripts/dialog.js"></script>
    
</head>
<body id="Body">
    <form id="Form1" runat="server">
        <uc1:DockPanel runat="server" id="DockPanel" />
        <div id="content">
            <asp:PlaceHolder ID="pchDefault" runat="server"></asp:Placeholder>
            <%--<a id="pop" href="/About.aspx" title="Ashish Blog">AshishBlog</a>--%>
            <a id="pop" title="Ashish Blog" onclick="openPopup('hello','/About.aspx');">AshishBlog</a>
            <div id="popup"></div>
            
        </div>
        <script type="text/javascript">
            var PageId = "<%: this.PageId %>";
    </script>
    </form>
</body>
</html>
