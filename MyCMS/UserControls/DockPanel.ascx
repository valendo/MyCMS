<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="DockPanel.ascx.cs" Inherits="MyCMS.UserControls.DockPanel" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Src="~/UserControls/PageTree.ascx" TagPrefix="uc1" TagName="PageTree" %>

<script type="text/javascript">
    $(document).ready(function () {
        $("#showDockPanel").click(function () {
            $("#dockPanel").removeClass("undock");
            $("#dockPanel").addClass("dock");
            $("#content").css("margin-left", "252px");
            $(this).hide();
            $("#hideDockPanel").show();
        });
        $("#hideDockPanel").click(function () {
            $("#dockPanel").removeClass("dock");
            $("#dockPanel").addClass("undock");
            $("#content").css("margin-left", "0");
            $(this).hide();
            $("#showDockPanel").show();
        });
    });
</script>
<div id="showDockPanel" class="iconDockPanel" style="display:none;"><img src="/Images/DockPanel/show.png" alt="Show" /></div>
<div id="hideDockPanel" class="iconDockPanel"><img src="/Images/DockPanel/hide.png" alt="Hide" /></div>

<div id="dockPanel" class="dockPanel dock">
    <div class="dock_pages">
        <div class="dock_panel_header">Pages</div>
        <uc1:PageTree runat="server" ID="PageTree" />
    </div>
    <div id="dock_modules" class="dock_modules">
        <div class="dock_panel_header">Modules</div>
        <ul>
            <asp:Literal ID="ltModules" runat="server"></asp:Literal>
        </ul>
    </div>
</div>
<%--<ul id="dock">
    <li id="links">
        <ul class="free">
            <li class="header"><a href="#" class="dock">Dock</a><a href="#" class="undock">Undock</a>Links</li>
            <asp:Literal ID="ltModules" runat="server"></asp:Literal>
        </ul>
    </li>
    <li id="files">
        <ul class="free">
            <li class="header"><a href="#" class="dock">Dock</a><a href="#" class="undock">Undock</a>Files</li>
            <li>
                <div>
                
                </div>
            </li>
        </ul>
    </li>
    <li id="tools">
        <ul class="free">
            <li class="header"><a href="#" class="dock">Dock</a><a href="#" class="undock">Undock</a>Tools</li>
            <li><a href="#">This is one item</a></li>
            <li><a href="#">This is one item</a></li>
            <li><a href="#">This is one item</a></li>
            <li><a href="#">This is one item</a></li>
            <li><a href="#">This is one item</a></li>
        </ul>
    </li>
</ul>--%>

<script type="text/javascript">
    $(function () {
        $("#dock_modules li").draggable({
            appendTo: "body",
            helper: "clone",
            cursor: "move"
        });
        $(".pane").droppable({
            activeClass: "ui-state-default",
            hoverClass: "ui-state-hover",
            accept: ":not(.ui-sortable-helper)",
            drop: function (event, ui) {
                var moduleDefId = ui.draggable.attr('id');
                var paneName = $(this).attr('id');
                var pageId = 1;
                var returnURL = window.location.pathname;
                //window.location.href = '/page/dragdropmodule?moduleDefinitionId=' + moduleDefinitionId + '&pageId=' + pageId + '&pane=' + pane + '&returnURL=' + returnURL;
                $.ajax({
                    type: "POST",
                    url: "Cmd.asmx/DragModules",
                    data: "{'ModuleDefId':'" + moduleDefId + "', 'PageId':'" + pageId + "', 'PaneName':'" + paneName + "'}",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (response) {
                        //window.location.href = window.location.pathname;
                        openPopup('Edit module', '/Admin/HandleModuleControls.aspx?mid=' + response.d);
                    },
                    failure: function (msg) {
                        alert(msg);
                    }
                });
            }
        });
    });
    </script>