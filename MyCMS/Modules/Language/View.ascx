<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="View.ascx.cs" Inherits="MyCMS.Modules.Language.View" %>

<div class="language_box">
    <asp:PlaceHolder ID="pchContent" runat="server"></asp:PlaceHolder>
</div>
<asp:Literal ID="ltrContent" runat="server"></asp:Literal>
<%--<asp:Label ID="Label1" runat="server" Text='<%$ Resources:Module,TestGlobal %>'></asp:Label>--%>
