<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Edit.ascx.cs" Inherits="MyCMS.Modules.Menu.Edit" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<link href="/modules/menu/style.css" rel="stylesheet" />
<%-- <script>
     jQuery(document).ready(function ($) {
         $(".sort_menu_item").sortable();
         $(".sort_menu_item").disableSelection();
     });
</script>--%>

<div class="content_area">
        <ajaxToolkit:TabContainer ID="TabMenuItem" runat="server">
                <ajaxToolkit:TabPanel ID="TabPaneMenuItem" runat="server" HeaderText="Menu items">
                    <ContentTemplate>
                        <div style="width:40%;float:left;">
                            <asp:RadioButtonList ID="rbtLinkType" runat="server" AutoPostBack="True" 
                                RepeatDirection="Horizontal" 
                                OnSelectedIndexChanged="rbtLinkType_SelectedIndexChanged">
                                <asp:ListItem Selected="True" Value="page">Page</asp:ListItem>
                                <asp:ListItem Value="link">Link</asp:ListItem>
                            </asp:RadioButtonList>
                            <br />
                            <asp:Panel ID="panelPage" runat="server">
                                <div style="height:200px; overflow:auto;">
                                    <asp:CheckBoxList ID="chkListPages" runat="server"></asp:CheckBoxList>
                                </div>
                            </asp:Panel>
                            <asp:Panel ID="panelLink" runat="server" Visible="false">
                                <table cellpadding="5">
                                    <tr>
                                        <td>Link title</td>
                                        <td>
                                            <asp:HiddenField ID="hfMenuItemId" runat="server" Value="-1" />
                                            <asp:TextBox ID="txtTitle" runat="server" Width="200"></asp:TextBox><br />
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorTitle" runat="server" ForeColor="Red" ControlToValidate="txtTitle" Display="Dynamic" ErrorMessage="Link title is required" ValidationGroup="menu_item"></asp:RequiredFieldValidator>
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
                                </table>
                            </asp:Panel>
                            <br /><br />
                            <span>Parent item</span>
                            <asp:DropDownList ID="ddlParent" runat="server"></asp:DropDownList>
                            <br />
                            <span>Item order</span>
                            <asp:TextBox ID="txtMenuOrder" runat="server" /><br />
                            <asp:RegularExpressionValidator ID="RegularExpressionValidatorMenuOrder" runat="server" ForeColor="Red" ControlToValidate="txtMenuOrder" Display="Dynamic" ErrorMessage="Menu order only number" ValidationGroup="menu_item" ValidationExpression="^\d+$"></asp:RegularExpressionValidator>
                            <br /><br />
                            <asp:Button ID="btnAddMenuItem" runat="server" Text="Add menu item" ValidationGroup="menu_item"
                                CssClass="save_button" OnClick="btnAddMenuItem_Click" />
                            <asp:Button ID="btnCancelMenuItem" runat="server" Text="Cancel" CausesValidation="false"
                                CssClass="cancel_button" Visible="false" OnClick="btnCancelMenuItem_Click" />
                        </div>
                        <div style="width:40%;float:right;">
                            <br /><br />
                            <div style="height:300px; overflow:auto;">
                                <ul class="sort_menu_item">
                                    <asp:Repeater ID="rptMenuItems" runat="server" OnItemCommand="rptMenuItems_ItemCommand">
                                        <ItemTemplate>
                                            <li class="ui-state-default" style="margin-left:<%#Eval("Margin") %>px"><span class="ui-icon <%#Eval("Icon") %>"></span><%#Eval("Title")%>
                                                <asp:ImageButton ID="btnEditItem" runat="server" CommandName='<%# (Eval("IsLink").ToString() == "True") ? "edit_link" : "edit_page" %>' CommandArgument='<%#Eval("MenuItemId") %>' ImageUrl="/images/icons/16/edit.png" CssClass="edit_item" />
                                                <asp:ImageButton ID="btnDeleteItem" runat="server" OnClientClick="return confirm('Do you want to delete?');" CommandName="delete_item" CommandArgument='<%#Eval("MenuItemId") %>' ImageUrl="/images/icons/16/delete.png" CssClass="delete_item" />
                                            </li>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </ul>
                            </div>
                        </div>
                    </ContentTemplate>
                </ajaxToolkit:TabPanel>
                <ajaxToolkit:TabPanel ID="TabPanelSetting" runat="server" HeaderText="Settings">
                    <ContentTemplate>
                    
                    </ContentTemplate>
                </ajaxToolkit:TabPanel>
            </ajaxToolkit:TabContainer>
        
        
        
</div>
<div class="buttons_area">
    <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" CssClass="save_button" />
    <asp:Button ID="btnCancel" runat="server" Text="Cancel" OnClientClick="cancelPopup();" CssClass="cancel_button" />
</div>
