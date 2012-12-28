<%@ Page Language="C#" AutoEventWireup="true" ValidateRequest="false" CodeBehind="EditModule.aspx.cs" Inherits="MyCMS.Admin.EditModule" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../Styles/admin.css" rel="stylesheet" />
    <link href="/Content/themes/base/jquery.ui.all.css" rel="stylesheet" />
    <script src="/Scripts/jquery-1.7.1.min.js"></script>
    <script src="/Scripts/jquery-ui-1.8.20.min.js"></script>
    <script src="/Scripts/MyScripts/dialog.js"></script>
    <script src="../Resources/ckeditor/ckeditor.js"></script>

</head>
<body>
    <form id="form1" runat="server">
        <asp:PlaceHolder ID="pchEdit" runat="server"></asp:PlaceHolder>
    </form>
</body>
</html>
