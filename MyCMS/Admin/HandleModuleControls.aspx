<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HandleModuleControls.aspx.cs" Inherits="MyCMS.Admin.HandleModuleControls" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="../Scripts/MyScripts/dialog.js"></script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        Hello, everybody!!!
        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
    </div>
        <div>Edit</div>
        <asp:PlaceHolder ID="pchEdit" runat="server"></asp:PlaceHolder>
        <div>Setting</div>
        <asp:PlaceHolder ID="pchSetting" runat="server"></asp:PlaceHolder>
    <input id="btnCancel" type="button" value="Cancel" onclick="closePopup();" />
    </form>
</body>
</html>
