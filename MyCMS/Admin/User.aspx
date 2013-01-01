<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="User.aspx.cs" Inherits="MyCMS.Admin.User" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../Styles/admin.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
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
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorUserName" runat="server" ControlToValidate="txtUserName" Display="None" ErrorMessage="UserName is required" ValidationGroup="insert"></asp:RequiredFieldValidator>
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
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorPassword" runat="server" ControlToValidate="txtPassword" Display="None" ErrorMessage="Password is required" ValidationGroup="insert"></asp:RequiredFieldValidator>
                    </FooterTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Email">
                    <ItemTemplate>
                        <asp:Label ID="lblEmail" runat="server" Text='<%# Bind("Email") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtEmail" runat="server"  Text='<%# Bind("Email") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorEmail" runat="server" ControlToValidate="txtEmail" Display="None" ErrorMessage="Email is required" ValidationGroup="update"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidatorEmail" runat="server" Display="None" ErrorMessage="Email is not in the correct format" ValidationGroup="update" ControlToValidate="txtEmail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtEmail" runat="server" ></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorEmail" runat="server" ControlToValidate="txtEmail" Display="None" ErrorMessage="Email is required" ValidationGroup="insert"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidatorEmail" runat="server" Display="None" ErrorMessage="Email is not in the correct format" ValidationGroup="insert" ControlToValidate="txtEmail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
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
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="true" ShowSummary="false" EnableClientScript="true" ValidationGroup="insert" />
        <asp:ValidationSummary ID="ValidationSummary2" runat="server" ShowMessageBox="true" ShowSummary="false" EnableClientScript="true" ValidationGroup="update" />
    </div>
    </form>
</body>
</html>
