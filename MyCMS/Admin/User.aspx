<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="User.aspx.cs" Inherits="MyCMS.Admin.User" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="/Styles/admin.css" rel="stylesheet" />
    <link href="/Content/themes/base/jquery.ui.all.css" rel="stylesheet" />
    <script src="/Scripts/jquery-1.7.1.min.js"></script>
    <script src="/Scripts/jquery-ui-1.8.20.min.js"></script>
    <script>
        $(function () {
            $("#tabs").tabs();
        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div id="tabs">
            <ul>
                <li><a href="#tabs-1">Nunc tincidunt</a></li>
                <li><a href="#tabs-2">Proin dolor</a></li>
                <li><a href="#tabs-3">Aenean lacinia</a></li>
            </ul>
            <div id="tabs-1">
                <p>Proin elit arcu, rutrum commodo, vehicula tempus, commodo a, risus. Curabitur nec arcu. Donec sollicitudin mi sit amet mauris. Nam elementum quam ullamcorper ante. Etiam aliquet massa et lorem. Mauris dapibus lacus auctor risus. Aenean tempor ullamcorper leo. Vivamus sed magna quis ligula eleifend adipiscing. Duis orci. Aliquam sodales tortor vitae ipsum. Aliquam nulla. Duis aliquam molestie erat. Ut et mauris vel pede varius sollicitudin. Sed ut dolor nec orci tincidunt interdum. Phasellus ipsum. Nunc tristique tempus lectus.</p>
            </div>
            <div id="tabs-2">
                <p>Morbi tincidunt, dui sit amet facilisis feugiat, odio metus gravida ante, ut pharetra massa metus id nunc. Duis scelerisque molestie turpis. Sed fringilla, massa eget luctus malesuada, metus eros molestie lectus, ut tempus eros massa ut dolor. Aenean aliquet fringilla sem. Suspendisse sed ligula in ligula suscipit aliquam. Praesent in eros vestibulum mi adipiscing adipiscing. Morbi facilisis. Curabitur ornare consequat nunc. Aenean vel metus. Ut posuere viverra nulla. Aliquam erat volutpat. Pellentesque convallis. Maecenas feugiat, tellus pellentesque pretium posuere, felis lorem euismod felis, eu ornare leo nisi vel felis. Mauris consectetur tortor et purus.</p>
            </div>
            <div id="tabs-3">
                <p>Mauris eleifend est et turpis. Duis id erat. Suspendisse potenti. Aliquam vulputate, pede vel vehicula accumsan, mi neque rutrum erat, eu congue orci lorem eget lorem. Vestibulum non ante. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Fusce sodales. Quisque eu urna vel enim commodo pellentesque. Praesent eu risus hendrerit ligula tempus pretium. Curabitur lorem enim, pretium nec, feugiat nec, luctus a, lacus.</p>
                <p>Duis cursus. Maecenas ligula eros, blandit nec, pharetra at, semper at, magna. Nullam ac lacus. Nulla facilisi. Praesent viverra justo vitae neque. Praesent blandit adipiscing velit. Suspendisse potenti. Donec mattis, pede vel pharetra blandit, magna ligula faucibus eros, id euismod lacus dolor eget odio. Nam scelerisque. Donec non libero sed nulla mattis commodo. Ut sagittis. Donec nisi lectus, feugiat porttitor, tempor ac, tempor vitae, pede. Aenean vehicula velit eu tellus interdum rutrum. Maecenas commodo. Pellentesque nec elit. Fusce in lacus. Vivamus a libero vitae lectus hendrerit hendrerit.</p>
            </div>
        </div>
        <div id="tabsUsersInRole">
            <ul>
                <li><a href="#tabs-Users">Users</a></li>
                <li><a href="#tabs-Roles">Roles</a></li>
                <li><a href="#tabs-UsersInRole">Users In Role</a></li>
            </ul>
            <div id="tabs-Users">
                <asp:GridView ID="gvUsers" runat="server" AutoGenerateColumns="False" AllowPaging="true" PageSize="10" PagerSettings-Mode="NumericFirstLast"
                    ShowFooter="True" CssClass="gridview"
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
                                <asp:TextBox ID="txtUserName" runat="server" ></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidatorUserName" runat="server" EnableClientScript="false" ControlToValidate="txtUserName" Display="None" ErrorMessage="UserName is required" ValidationGroup="insert"></asp:RequiredFieldValidator>
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
                                <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidatorPassword" runat="server" EnableClientScript="false" ControlToValidate="txtPassword" Display="None" ErrorMessage="Password is required" ValidationGroup="insert"></asp:RequiredFieldValidator>
                            </FooterTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Email">
                            <ItemTemplate>
                                <asp:Label ID="lblEmail" runat="server" Text='<%# Bind("Email") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txtEmail" runat="server"  Text='<%# Bind("Email") %>'></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidatorEmail" runat="server" EnableClientScript="false" ControlToValidate="txtEmail" Display="None" ErrorMessage="Email is required" ValidationGroup="update"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidatorEmail" EnableClientScript="true" runat="server" Display="None" ErrorMessage="Email is not in the correct format" ValidationGroup="update" ControlToValidate="txtEmail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox ID="txtEmail" runat="server" ></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidatorEmail" runat="server" EnableClientScript="false" ControlToValidate="txtEmail" Display="None" ErrorMessage="Email is required" ValidationGroup="insert"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidatorEmail" EnableClientScript="true" runat="server" Display="None" ErrorMessage="Email is not in the correct format" ValidationGroup="insert" ControlToValidate="txtEmail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
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
                
            </div>
            <div id="tabs-UsersInRole">
                <h3>
                  Role Membership</h3>
                <asp:Label ID="Msg" ForeColor="maroon" runat="server" /><br />
                <table cellpadding="3" border="0">
                  <tr>
                    <td valign="top">
                      Roles:</td>
                    <td valign="top">
                      <asp:ListBox ID="RolesListBox" runat="server" Rows="8" AutoPostBack="true" /></td>
                    <td valign="top">
                      Users:</td>
                    <td valign="top">
                      <asp:ListBox ID="UsersListBox" DataTextField="Username" Rows="8" SelectionMode="Multiple"
                        runat="server" /></td>
                    <td valign="top">
                      <asp:Button Text="Add User(s) to Role" ID="AddUsersButton" runat="server" OnClick="AddUsers_OnClick" /></td>
                  </tr>
                  <tr>
                    <td valign="top">
                      Users In Role:</td>
                    <td valign="top">
                      <asp:GridView runat="server" CellPadding="4" ID="UsersInRoleGrid" AutoGenerateColumns="false"
                        GridLines="None" CellSpacing="0" OnRowCommand="UsersInRoleGrid_RemoveFromRole">
                        <HeaderStyle BackColor="navy" ForeColor="white" />
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
        
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="true" ShowSummary="false" EnableClientScript="true" ValidationGroup="insert" />
        <asp:ValidationSummary ID="ValidationSummary2" runat="server" ShowMessageBox="true" ShowSummary="false" EnableClientScript="true" ValidationGroup="update" />
    </form>
</body>
</html>
