<%@ Control Language="C#"%>


<div style="width:960px;">
    <div style="float:left; width:200px;min-height:500px;" class="pane" id="LeftPane">
        <asp:PlaceHolder ID="LeftPane" runat="server"></asp:Placeholder>
    </div>
    <div style="float:left; width:560px;min-height:500px;" class="pane" id="ContentPane">
        <asp:PlaceHolder ID="ContentPane" runat="server"></asp:Placeholder>
    </div>
    <div style="float:right; width:200px;min-height:500px;" class="pane" id="RightPane">
        <asp:PlaceHolder ID="RightPane" runat="server"></asp:Placeholder>
    </div>
    <div style="clear:both;"></div>
</div>
