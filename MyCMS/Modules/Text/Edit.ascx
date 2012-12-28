<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Edit.ascx.cs" Inherits="MyCMS.Modules.Text.Edit" %>

<asp:TextBox ID="txtContent" runat="server" TextMode="MultiLine" CssClass="ckeditor"></asp:TextBox>
<br /><br />

<asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" />