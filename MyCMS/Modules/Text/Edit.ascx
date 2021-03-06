﻿<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Edit.ascx.cs" Inherits="MyCMS.Modules.Text.Edit" %>

<div class="content_area">
    <asp:TextBox ID="txtContent" runat="server" TextMode="MultiLine" CssClass="ckeditor"></asp:TextBox>
</div>
<div class="buttons_area">
    <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" CssClass="save_button" />
    <asp:Button ID="btnCancel" runat="server" Text="Cancel" OnClientClick="cancelPopup();" CssClass="cancel_button" />
</div>