<%@ Page Language="C#" AutoEventWireup="true" ValidateRequest="false" MasterPageFile="~/Admin/Admin.Master" CodeBehind="EditModule.aspx.cs" Inherits="MyCMS.Admin.EditModule" %>

<asp:Content runat="server" ID="Content1" ContentPlaceHolderID="Head">
    <script src="/Resources/ckeditor/ckeditor.js"></script>
</asp:Content>
<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <asp:PlaceHolder ID="pchEdit" runat="server"></asp:PlaceHolder>
</asp:Content>
