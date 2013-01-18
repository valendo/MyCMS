<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Admin/Admin.Master" CodeBehind="Page.aspx.cs" Inherits="MyCMS.Admin.Page" %>

<asp:Content runat="server" ID="Content1" ContentPlaceHolderID="Head">
    
</asp:Content>
<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <div>
        <asp:Literal ID="Literal1" runat="server"></asp:Literal>
        <table style="width:100%;">
            <tr>
                <td class="auto-style2">Page Name</td>
                <td class="auto-style1">
                    <asp:TextBox ID="txtPageName" runat="server"></asp:TextBox><br />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorPageName" runat="server" ForeColor="Red" ControlToValidate="txtPageName" Display="Dynamic" ErrorMessage="Page name is required" ValidationGroup="page"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">Title</td>
                <td>
                    <asp:TextBox ID="txtTitle" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">Parent Page</td>
                <td>
                    <asp:DropDownList ID="ddlParentPage" runat="server">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">Page SEO</td>
                <td>
                    <asp:TextBox ID="txtPageSEO" runat="server"></asp:TextBox><br />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorPageSEO" runat="server" ForeColor="Red" ControlToValidate="txtPageSEO" Display="Dynamic" ErrorMessage="Page SEO is required" ValidationGroup="page"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ForeColor="Red" ControlToValidate="txtPageSEO" Display="Dynamic" ErrorMessage="Page SEO only charactor a-z and 0-9" ValidationGroup="page" ValidationExpression="[a-z0-9-]*$"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">Page Order</td>
                <td>
                    <asp:TextBox ID="txtPageOrder" runat="server" Width="128px" ></asp:TextBox><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidatorPageSEO" runat="server" ForeColor="Red" ControlToValidate="txtPageOrder" Display="Dynamic" ErrorMessage="Page order only number" ValidationGroup="page" ValidationExpression="^\d+$"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">Is Visible</td>
                <td>
                    <asp:CheckBox ID="chkIsVisible" runat="server" Checked="true" />
                </td>
            </tr>
            <tr>
                <td class="auto-style3">Description</td>
                <td>
                    <asp:TextBox ID="txtDescription" runat="server" TextMode="MultiLine"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">Keywords</td>
                <td>
                    <asp:TextBox ID="txtKeywords" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">Layout</td>
                <td>
                    <asp:DropDownList ID="ddlLayout" runat="server">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="auto-style3" valign="top">Permissions</td>
                <td>
                    <asp:CheckBoxList ID="chkListRoles" runat="server"></asp:CheckBoxList>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" ValidationGroup="page" CausesValidation="true" CssClass="save_button" />
                </td>
            </tr>
        </table>
    </div>
</asp:Content>