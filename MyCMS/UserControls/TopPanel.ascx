<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TopPanel.ascx.cs" Inherits="MyCMS.UserControls.TopPanel" %>



<div class="panel_button">
    <button onclick="" class="cpsecondary">
        <span style="background-image:url('/images/icons/20/zoom.png')" class="icon"></span>
    Preview</button>
</div>
<div class="panel_button">
    <button onclick="openPopup('Settings', '/admin/role.aspx');return false;" class="cpsecondary">
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