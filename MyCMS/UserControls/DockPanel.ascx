<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="DockPanel.ascx.cs" Inherits="MyCMS.UserControls.DockPanel" %>

<ul id="dock">
    <li id="links">
        <ul class="free">
            <li class="header"><a href="#" class="dock">Dock</a><a href="#" class="undock">Undock</a>Links</li>
            <asp:Literal ID="ltModules" runat="server"></asp:Literal>
        </ul>
    </li>
    <li id="files">
        <ul class="free">
            <li class="header"><a href="#" class="dock">Dock</a><a href="#" class="undock">Undock</a>Files</li>
            <li><a href="#">This is one item</a></li>
            <li><a href="#">This is one item</a></li>
            <li><a href="#">This is one item</a></li>
            <li><a href="#">This is one item</a></li>
            <li><a href="#">This is one item</a></li>
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
</ul>

<script type="text/javascript">
    $(function () {
        $("#links li").draggable({
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
                        window.location.href = window.location.pathname;
                    },
                    failure: function (msg) {
                        alert(msg);
                    }
                });
            }
        });
    });
    </script>