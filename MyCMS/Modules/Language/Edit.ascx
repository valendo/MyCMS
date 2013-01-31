<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Edit.ascx.cs" Inherits="MyCMS.Modules.Language.Edit" %>

<div class="content_area">
    <asp:GridView ID="gvLanguages" runat="server" AutoGenerateColumns="False"
        ShowFooter="True" CssClass="gridview"  ShowHeaderWhenEmpty="true" EmptyDataText="No languages found."
        OnRowCommand="gvLanguages_RowCommand" 
        OnRowDeleting="gvLanguages_RowDeleting" OnRowEditing="gvLanguages_RowEditing" 
        OnRowCancelingEdit="gvLanguages_RowCancelingEdit" 
        OnRowUpdating="gvLanguages_RowUpdating" DataKeyNames="LanguageId" 
        OnRowDataBound="gvLanguages_RowDataBound">
        <Columns>
            <asp:TemplateField HeaderText="Culture Code">
                <ItemTemplate>
                    <asp:Label ID="lblCultureCode" runat="server" Text='<%# Bind("CultureCode") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:DropDownList ID="ddlCultureCode" runat="server" 
                        ItemType="MyCMS.Model.LanguageInfo" SelectMethod="GetCultures"
                        DataTextField="CultureName" DataValueField="CultureCode">
                    </asp:DropDownList>
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:DropDownList ID="ddlCultureCode" runat="server" 
                        ItemType="MyCMS.Model.LanguageInfo" SelectMethod="GetCultures"
                        DataTextField="CultureName" DataValueField="CultureCode">
                    </asp:DropDownList>
                </FooterTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Culture Name">
                <ItemTemplate>
                    <asp:Label ID="lblCultureName" runat="server" Text='<%# Bind("CultureName") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="txtCultureName" runat="server" Text='<%# Bind("CultureName") %>' ValidationGroup="update_language"></asp:TextBox><br />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorCultureName" runat="server" ForeColor="Red" ControlToValidate="txtCultureName" Display="Dynamic" ErrorMessage="Culture Name is required" ValidationGroup="update_language"></asp:RequiredFieldValidator>
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:TextBox ID="txtCultureName" runat="server" ValidationGroup="insert_language"></asp:TextBox><br />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorCultureName" runat="server" ForeColor="Red" ControlToValidate="txtCultureName" Display="Dynamic" ErrorMessage="Culture Name is required" ValidationGroup="insert_language"></asp:RequiredFieldValidator>
                </FooterTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Redirect Page">
                <ItemTemplate>
                    <asp:Label ID="lblpage" runat="server" Text='<%# Bind("PageId") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:DropDownList ID="ddlPage" runat="server" 
                        SelectMethod="GetPages"
                        DataTextField="Text" DataValueField="Value">
                    </asp:DropDownList>
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:DropDownList ID="ddlPage" runat="server" 
                        SelectMethod="GetPages"
                        DataTextField="Text" DataValueField="Value">
                    </asp:DropDownList>
                </FooterTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Sort Order">
                <ItemTemplate>
                    <asp:Label ID="lblSortOrder" runat="server" Text='<%# Bind("SortOrder") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="txtSortOrder" runat="server" Text='<%# Bind("SortOrder") %>'></asp:TextBox><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidatorSortOrder" runat="server" ForeColor="Red" ControlToValidate="txtSortOrder" Display="Dynamic" ErrorMessage="Sort order only number" ValidationGroup="update_language" ValidationExpression="^\d+$"></asp:RegularExpressionValidator>
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:TextBox ID="txtSortOrder" runat="server" ></asp:TextBox><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidatorSortOrder" runat="server" ForeColor="Red" ControlToValidate="txtSortOrder" Display="Dynamic" ErrorMessage="Sort order only number" ValidationGroup="insert_language" ValidationExpression="^\d+$"></asp:RegularExpressionValidator>
                </FooterTemplate>
            </asp:TemplateField>
            <asp:TemplateField>
	            <ItemTemplate>
		            <asp:ImageButton ID="btnEdit" CommandName="edit" runat="server" CausesValidation="false" ImageUrl="~/Images/icons/16/Edit.png" ImageAlign="AbsMiddle" />
		            <asp:ImageButton ID="btnDelete" CommandName="delete" runat="server" OnClientClick="return confirm('Do you want to delete?');" CausesValidation="false" ImageUrl="~/Images/icons/16/Delete.png" ImageAlign="AbsMiddle" />
	            </ItemTemplate>
	            <EditItemTemplate>
		            <asp:ImageButton ID="btnUpdate" CommandName="update" runat="server" ValidationGroup="update_language" ImageUrl="~/Images/icons/16/Save.png" ImageAlign="AbsMiddle" />
		            <asp:ImageButton ID="btnCanel" CommandName="cancel" runat="server" CausesValidation="false" ImageUrl="~/Images/icons/16/Cancel.png" ImageAlign="AbsMiddle" />
	            </EditItemTemplate>
	            <FooterTemplate>
		            <asp:ImageButton ID="btnInsert" CommandName="insert" runat="server" ValidationGroup="insert_language" ImageUrl="~/Images/icons/16/Add.png" ImageAlign="AbsMiddle" />
	            </FooterTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <br /><br />
    <span>Language type</span>
    <asp:DropDownList ID="ddlType" runat="server">
        <asp:ListItem Value="flag" Selected="True">Flag</asp:ListItem>
        <asp:ListItem Value="flagtext">Flag &amp; Text</asp:ListItem>
        <asp:ListItem Value="text">Text</asp:ListItem>
        <asp:ListItem Value="dropdown">Dropdown</asp:ListItem>
    </asp:DropDownList>
    <br />
    <span>Hide current language</span>
    <asp:CheckBox ID="chkHideCurrent" runat="server" />
</div>
<div class="buttons_area">
    <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" CssClass="save_button" />
    <asp:Button ID="btnCancel" runat="server" Text="Cancel" OnClientClick="cancelPopup();" CssClass="cancel_button" />
</div>
