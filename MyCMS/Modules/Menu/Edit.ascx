<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Edit.ascx.cs" Inherits="MyCMS.Modules.Menu.Edit" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<link href="/modules/menu/style.css" rel="stylesheet" />
 <script>
     jQuery(document).ready(function ($) {
         $(".sort_menu_item").sortable();
         $(".sort_menu_item").disableSelection();
     });
</script>

<div class="content_area">
    <div style="width:40%;float:left;">
        <ajaxToolkit:TabContainer ID="TabMenuItem" runat="server">
            <ajaxToolkit:TabPanel ID="TabPanePage" runat="server" HeaderText="Pages">
                <ContentTemplate>
                    <table cellpadding="5">
                        <tr>
                            <td>
                                <div style="height:300px; overflow:auto;">
                                    <asp:CheckBoxList ID="chkListPages" runat="server"></asp:CheckBoxList>
                                </div>
                            </td>
                        </tr>
                            <tr>
                                <td>
                                    <asp:Button ID="btnAddPageItems" runat="server" Text="Add page item" CssClass="save_button" OnClick="btnAddPageItems_Click" />
                                </td>
                            </tr>
                        </table>
                </ContentTemplate>
            </ajaxToolkit:TabPanel>
            <ajaxToolkit:TabPanel ID="TabPanelLink" runat="server" HeaderText="Link">
                <ContentTemplate>
                    <table cellpadding="5">
                        <tr>
                            <td>Link title</td>
                            <td>
                                <asp:HiddenField ID="hfMenuItemId" runat="server" Value="-1" />
                                <asp:TextBox ID="txtTitle" runat="server" Width="200"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>Link url</td>
                            <td>
                                <asp:TextBox ID="txtLinkUrl" runat="server" Width="200"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                            <td>
                                <asp:CheckBox ID="chkOpenInNewWindow" runat="server" Text="Open in new window"/>
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                            <td>
                                <asp:Button ID="btnAddLinkItem" runat="server" Text="Add link item" CssClass="save_button" OnClick="btnAddLinkItem_Click" />
                                <asp:Button ID="btnCancelLinkItem" runat="server" Text="Cancel" CssClass="cancel_button" Visible="false" OnClick="btnCancelLinkItem_Click"/>
                            </td>
                        </tr>
                    </table>
                </ContentTemplate>
            </ajaxToolkit:TabPanel>
        </ajaxToolkit:TabContainer>
    </div>
    <div style="width:40%;float:right;">
        <div style="height:300px; overflow:auto;">
            <asp:Literal ID="ltrMenuItems" runat="server"></asp:Literal>
            <ul class="sort_menu_item">
                <asp:Repeater ID="rptMenuItems" runat="server" OnItemCommand="rptMenuItems_ItemCommand">
                    <ItemTemplate>
                        <li class="ui-state-default"><span class="ui-icon <%#Eval("Icon") %>"></span><%#Eval("Title")%>
                            <asp:ImageButton Visible='<%# Eval("IsLink") %>' ID="btnEditItem" runat="server" CommandName="edit_item" CommandArgument='<%#Eval("MenuItemId") %>' ImageUrl="/images/icons/16/edit.png" CssClass="edit_item" />
                            <asp:ImageButton ID="btnDeleteItem" runat="server" OnClientClick="return confirm('Do you want to delete?');" CommandName="delete_item" CommandArgument='<%#Eval("MenuItemId") %>' ImageUrl="/images/icons/16/delete.png" CssClass="delete_item" />
                        </li>
                    </ItemTemplate>
                </asp:Repeater>
            </ul>
        </div>
    </div>
</div>
<div class="buttons_area">
    <%--<asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" CssClass="save_button" />--%>
    <asp:Button ID="btnCancel" runat="server" Text="Cancel" OnClientClick="cancelPopup();" CssClass="cancel_button" />
</div>
