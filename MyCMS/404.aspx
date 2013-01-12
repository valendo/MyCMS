<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="404.aspx.cs" Inherits="MyCMS._404" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Literal ID="ltrMsg" runat="server"></asp:Literal>
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="/">Back to home page</asp:HyperLink>
    </div>
    </form>
</body>
</html>
