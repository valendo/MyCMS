<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="DockPanel.ascx.cs" Inherits="MyCMS.UserControls.DockPanel" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Src="~/UserControls/PageTree.ascx" TagPrefix="uc1" TagName="PageTree" %>

<div id="dockPanel" class="dockPanel">
    <div class="dock_pages">
        <div class="dock_panel_header">Pages</div>
        <uc1:PageTree runat="server" ID="PageTree" />
        <div style="clear:both;"></div>
    </div>
    <div id="dock_modules" class="dock_modules">
        <div class="dock_panel_header">Modules</div>
        <ul id="list_modules">
            <asp:Literal ID="ltModules" runat="server"></asp:Literal>
        </ul>
    </div>
</div>

<script type="text/javascript">
    $(function () {
        $("#dock_modules li").draggable({
            appendTo: "body",
            helper: "clone",
            cursor: "move"
        });
        $(".x_pane").droppable({
            hoverClass: "placeholder",
            accept: ":not(.ui-sortable-helper)",
            drop: function (event, ui) {
                var moduleDefId = ui.draggable.attr('id');
                var paneName = $(this).attr('id');
                openPopup('Module Settings', '/Admin/ModuleSetting.aspx?action=add&ModuleDefId=' + moduleDefId + '&PageId=' + PageId + '&PaneName=' + paneName);
            }
        });
    });
    </script>