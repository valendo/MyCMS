<%@ Control Language="C#"%>


<div style="width:1200px;">
    <div style="float:left; width:200px;border:1px solid red;min-height:500px;" class="pane" id="LeftPane">
        <asp:PlaceHolder ID="LeftPane" runat="server"></asp:Placeholder>
    </div>
    <div style="float:left; width:700px;border:1px solid red;min-height:500px;" class="pane" id="ContentPane">
        <asp:PlaceHolder ID="ContentPane" runat="server"></asp:Placeholder>
    </div>
    <div style="float:right; width:200px;border:1px solid red;min-height:500px;" class="pane" id="RightPane">
        <asp:PlaceHolder ID="RightPane" runat="server"></asp:Placeholder>
    </div>
</div>
