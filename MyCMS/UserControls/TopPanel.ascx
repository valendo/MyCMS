<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TopPanel.ascx.cs" Inherits="MyCMS.UserControls.TopPanel" %>


<asp:ImageButton ID="btnPreview" runat="server" ImageUrl="~/Images/Site/preview.png" OnClick="btnPreview_Click" CssClass="preview_button" />
<div class="panel_button">
    <div class="panel_button">
        <asp:Button ID="btnLogout" runat="server" Text="Log off" CssClass="cpsecondary" OnClick="btnLogout_Click" />
    </div>
</div>
<div class="panel_button">
    <button onclick="openPopup('Settings', '/admin/setting.aspx');return false;" class="cpsecondary">
        <span style="background-image:url('/images/icons/20/gear.png')" class="icon"></span>
    Settings</button>
</div>
<div class="panel_button">
    <button onclick="openPopup('Users', '/admin/user.aspx');return false;" class="cpsecondary">
        <span style="background-image:url('/images/icons/20/users.png')" class="icon"></span>
    Users</button>
</div>
<div class="panel_button">
    <button onclick="openPopup('Files', '/resources/ckfinder/ckfinder.html');return false;" class="cpsecondary">
        <span style="background-image:url('/images/icons/20/folder.png')" class="icon"></span>
    Files</button>
</div>