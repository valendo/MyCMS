<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="ShareModule.aspx.cs" Inherits="MyCMS.Admin.ShareModule" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:CheckBoxList ID="chkListPages" runat="server"></asp:CheckBoxList>
    <br />
</asp:Content>
<asp:Content runat="server" ID="Content3" ContentPlaceHolderID="ButtonArea">
    <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" CssClass="save_button" />
    <asp:Button ID="btnCancel" runat="server" Text="Cancel" OnClientClick="cancelPopup();" CssClass="cancel_button" />
</asp:Content>