<%@ Control Language="C#"%>

<div class="container_module" style="border:1px solid red;">
    <div class="container_title" style="font-size:14px; font-weight:bold; color:red;">
        <asp:PlaceHolder ID="ModuleTitle" runat="server"></asp:Placeholder>
    </div>
    <div class="container_content">
        <asp:PlaceHolder ID="ModuleContent" runat="server"></asp:Placeholder>
    </div>
</div>