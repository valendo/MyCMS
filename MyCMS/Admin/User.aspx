<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Admin/Admin.Master" CodeBehind="User.aspx.cs" Inherits="MyCMS.Admin.User" %>

<asp:Content runat="server" ID="Content1" ContentPlaceHolderID="Head">
    <script type="text/javascript">
        jQuery(document).ready(function ($) {
            $("#tabsUsersInRole").tabs({ cookie: { expires: 30 } });
        });
    </script>
</asp:Content>
<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <div id="tabsUsersInRole">
        <ul>
            <li><a href="#tabs-Users">Users</a></li>
            <li><a href="#tabs-Roles">Roles</a></li>
            <li><a href="#tabs-UsersInRole">Users In Role</a></li>
        </ul>
        <div id="tabs-Users">
            <asp:GridView ID="gvUsers" runat="server" AutoGenerateColumns="False" AllowPaging="true" PageSize="10" PagerSettings-Mode="NumericFirstLast"
                ShowFooter="True" CssClass="gridview"  ShowHeaderWhenEmpty="true" EmptyDataText="No users found."
                OnRowCommand="gvUsers_RowCommand" OnRowDeleting="gvUsers_RowDeleting" OnRowEditing="gvUsers_RowEditing" OnRowCancelingEdit="gvUsers_RowCancelingEdit" OnRowUpdating="gvUsers_RowUpdating" OnPageIndexChanging="gvUsers_PageIndexChanging">
                <Columns>
                    <asp:TemplateField HeaderText="UserName">
                        <ItemTemplate>
                            <asp:Label ID="lblUserName" runat="server" Text='<%# Bind("UserName") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:Label ID="lblUserName" runat="server" Text='<%# Bind("UserName") %>'></asp:Label>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtUserName" runat="server" ></asp:TextBox><br />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorUserName" runat="server" ForeColor="Red" ControlToValidate="txtUserName" Display="Dynamic" ErrorMessage="UserName is required" ValidationGroup="insert"></asp:RequiredFieldValidator>
                        </FooterTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Password">
                        <ItemTemplate>
                            <asp:Label ID="lblPassword" runat="server" Text="********"></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:Label ID="lblPassword" runat="server" Text="********"></asp:Label>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox><br />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorPassword" runat="server" ForeColor="Red" ControlToValidate="txtPassword" Display="Dynamic" ErrorMessage="Password is required" ValidationGroup="insert"></asp:RequiredFieldValidator>
                        </FooterTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Email">
                        <ItemTemplate>
                            <asp:Label ID="lblEmail" runat="server" Text='<%# Bind("Email") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtEmail" runat="server"  Text='<%# Bind("Email") %>'></asp:TextBox><br />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorEmail" runat="server" ForeColor="Red" ControlToValidate="txtEmail" Display="Dynamic" ErrorMessage="Email is required" ValidationGroup="update"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidatorEmail" ForeColor="Red" runat="server" Display="Dynamic" ErrorMessage="Email is not in the correct format" ValidationGroup="update" ControlToValidate="txtEmail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtEmail" runat="server" ></asp:TextBox><br />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorEmail" runat="server" ForeColor="Red" ControlToValidate="txtEmail" Display="Dynamic" ErrorMessage="Email is required" ValidationGroup="insert"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidatorEmail" ForeColor="Red" runat="server" Display="Dynamic" ErrorMessage="Email is not in the correct format" ValidationGroup="insert" ControlToValidate="txtEmail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                        </FooterTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Is Approved">
                        <ItemTemplate>
                            <asp:CheckBox  ID="chkIsApproved" runat="server" Checked='<%# Bind("IsApproved") %>' Enabled="false"/>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:CheckBox  ID="chkIsApproved" runat="server" Checked='<%# Bind("IsApproved") %>' />
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Creation Date">
                        <ItemTemplate>
                            <asp:Label ID="lblCreationDate" runat="server" Text='<%# Bind("CreationDate") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:Label ID="lblCreationDate" runat="server" Text='<%# Bind("CreationDate") %>'></asp:Label>
                        </EditItemTemplate>
                        <FooterTemplate>
                        </FooterTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Last Login Date">
                        <ItemTemplate>
                            <asp:Label ID="lblLastLoginDate" runat="server" Text='<%# Bind("LastLoginDate") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:Label ID="lblLastLoginDate" runat="server" Text='<%# Bind("LastLoginDate") %>'></asp:Label>
                        </EditItemTemplate>
                        <FooterTemplate>
                        </FooterTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Is Online">
                        <ItemTemplate>
                            <asp:CheckBox  ID="chkIsOnline" runat="server" Checked='<%# Bind("IsOnline") %>' Enabled="false"/>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:CheckBox  ID="chkIsOnline" runat="server" Checked='<%# Bind("IsOnline") %>' Enabled="false"/>
                        </EditItemTemplate>
                        <FooterTemplate>
                        </FooterTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
	                    <ItemTemplate>
		                    <asp:ImageButton ID="btnEdit" CommandName="edit" runat="server" CausesValidation="false" ImageUrl="~/Images/icons/16/Edit.png" ImageAlign="AbsMiddle" />
		                    <asp:ImageButton ID="btnDelete" CommandName="delete" runat="server" OnClientClick="return confirm('Do you want to delete?');" CausesValidation="false" ImageUrl="~/Images/icons/16/Delete.png" ImageAlign="AbsMiddle" />
	                    </ItemTemplate>
	                    <EditItemTemplate>
		                    <asp:ImageButton ID="btnUpdate" CommandName="update" runat="server" ValidationGroup="update" ImageUrl="~/Images/icons/16/Save.png" ImageAlign="AbsMiddle" />
		                    <asp:ImageButton ID="btnCanel" CommandName="cancel" runat="server" CausesValidation="false" ImageUrl="~/Images/icons/16/Cancel.png" ImageAlign="AbsMiddle" />
	                    </EditItemTemplate>
	                    <FooterTemplate>
		                    <asp:ImageButton ID="btnInsert" CommandName="insert" runat="server" ValidationGroup="insert" ImageUrl="~/Images/icons/16/Add.png" ImageAlign="AbsMiddle" />
	                    </FooterTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
        <div id="tabs-Roles">
            <asp:GridView ID="gvRoles" runat="server" AutoGenerateColumns="False" ShowHeaderWhenEmpty="true" EmptyDataText="No roles found."
                ShowFooter="True" CssClass="gridview"
                OnRowCommand="gvRoles_RowCommand" OnRowDeleting="gvRoles_RowDeleting" OnRowEditing="gvRoles_RowEditing" OnRowCancelingEdit="gvRoles_RowCancelingEdit">
                <Columns>
                    <asp:TemplateField HeaderText="Role">
                        <ItemTemplate>
                            <asp:Label ID="lblRoleName" runat="server" Text="<%# Container.DataItem.ToString() %>"></asp:Label>
                        </ItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtRoleName" runat="server" Width="340px"></asp:TextBox><br />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ForeColor="Red" ControlToValidate="txtRoleName" Display="Dynamic" ErrorMessage="Role name is required" ValidationGroup="insertRole"></asp:RequiredFieldValidator>
                        </FooterTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:ImageButton ID="btnDelete" CommandName="delete" runat="server" OnClientClick="return confirm('Do you want to delete?');" CausesValidation="false" ImageUrl="~/Images/icons/16/Delete.png" ImageAlign="AbsMiddle" />
                        </ItemTemplate>
                        <FooterTemplate>
                            <asp:ImageButton ID="btnInsert" CommandName="insert" runat="server" ValidationGroup="insertRole" ImageUrl="~/Images/icons/16/Add.png" ImageAlign="AbsMiddle" />
                        </FooterTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
        <div id="tabs-UsersInRole">
            <asp:Label ID="Msg" ForeColor="Red" runat="server" /><br />
            <table cellpadding="3" border="0">
                <tr>
                <td valign="top">
                    <strong>Roles:</strong></td>
                <td valign="top">
                    <asp:ListBox ID="RolesListBox" runat="server" Rows="20" AutoPostBack="true" /></td>
                <td valign="top">
                    <strong>Users:</strong></td>
                <td valign="top">
                    <asp:ListBox ID="UsersListBox" DataTextField="Username" Rows="20" SelectionMode="Multiple"
                    runat="server" /></td>
                <td valign="top">
                    <asp:Button Text="Add User(s) to Role" ID="AddUsersButton" runat="server" OnClick="AddUsers_OnClick" CssClass="save_button" /></td>
                </tr>
                <tr>
                <td valign="top">
                    <strong>Users In Role:</strong></td>
                <td valign="top">
                    <asp:GridView runat="server" ID="UsersInRoleGrid" AutoGenerateColumns="false"
                    CssClass="gridview" OnRowCommand="UsersInRoleGrid_RemoveFromRole" ShowHeaderWhenEmpty="true" EmptyDataText="No users in role or not role selected.">
                    <Columns>
                        <asp:TemplateField HeaderText="User Name" >
                        <ItemTemplate>
                            <%# Container.DataItem.ToString() %>
                        </ItemTemplate>
                        </asp:TemplateField>
                        <asp:ButtonField Text="Remove From Role" ButtonType="Link" />
                    </Columns>
                    </asp:GridView>
                </td>
                </tr>
            </table>
        </div>
    </div>
</asp:Content>
    
