<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PageTree.ascx.cs" Inherits="MyCMS.UserControls.PageTree" %>

<%@ Register Assembly="ASTreeView" Namespace="Geekees.Common.Controls" TagPrefix="ct" %>
<link href="../Styles/dynatree/ui.dynatree.css" rel="stylesheet" />
<link href="../Styles/contextmenu/jquery.contextMenu.css" rel="stylesheet" />
<script src="../Scripts/MyScripts/jquery.dynatree-1.2.2.js"></script>
<script src="../Styles/contextmenu/jquery.contextMenu-custom.js"></script>


<script type="text/javascript">
    $(function () {
        $("#tree").dynatree({
            onCreate: function (node, span) {
                bindContextMenu(span);
            },
            onActivate: function (node) {
                window.location.href = "/" + node.data.url;
            },
            dnd: {
                onDragStart: function (node) {
                    /** This function MUST be defined to enable dragging for the tree.
                     *  Return false to cancel dragging of node.
                     */
                    logMsg("tree.onDragStart(%o)", node);
                    return true;
                },
                onDrop: function (node, sourceNode, hitMode, ui, draggable) {
                    /** This function MUST be defined to enable dropping of items on
                     * the tree.
                     */
                    logMsg("tree.onDrop(%o, %o, %s)", node, sourceNode, hitMode);
                    sourceNode.move(node, hitMode);
                }
            },
            debugLevel: 0
        });

        function bindContextMenu(span) {
            // Add context menu to this node:
            $(span).contextMenu({ menu: "myMenu" }, function (action, el, pos) {
                // The event was bound to the <span> tag, but the node object
                // is stored in the parent <li> tag
                var node = $.ui.dynatree.getNode(el);
                switch (action) {
                    case "add":
                        openPopup('hello', '/admin/page.aspx?act=add&pid=' + node.data.key);
                        break;
                    case "edit":
                        openPopup('hello', '/admin/page.aspx?act=update&pid=' + node.data.key);
                        break;
                    case "delete":
                        var sel = confirm('Do you want to delete this page?');
                        if (sel) {
                            openPopup('hello', '/admin/page.aspx?act=delete&pid=' + node.data.key);
                        }
                        break;
                }
            });
        };
    });
</script>

<ul id="myMenu" class="contextMenu">
    <li class="add"><a href="#add">Add</a></li>
    <li class="edit"><a href="#edit">Edit</a></li>
    <li class="delete"><a href="#delete">Delete</a></li>
  </ul>

<div id="tree">
	<ul style="display:none">
        <li id="-1" class="expanded folder">Root
            <ul>
                <asp:Literal ID="ltrPages" runat="server" />
            </ul>
	</ul>
</div>