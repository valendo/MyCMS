<%@ Control Language="C#"%>

<div style="float:left; width:200px;border:1px solid red;min-height:500px;">
    <asp:PlaceHolder ID="LeftPane" runat="server"></asp:Placeholder>
</div>
<div style="float:right; width:800px;border:1px solid red;min-height:500px;">
    <asp:PlaceHolder ID="ContentPane" runat="server"></asp:Placeholder>
</div>
