<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Admin/Admin.Master" CodeBehind="ModuleSetting.aspx.cs" Inherits="MyCMS.Admin.ModuleSetting" %>

<asp:Content runat="server" ID="Content1" ContentPlaceHolderID="Head">
</asp:Content>
<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <table>
        <tr>
            <td>
                Module title
            </td>
            <td>
                <asp:TextBox ID="txtModuleTitle" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                Display title
            </td>
            <td>
                <asp:CheckBox ID="chkDisplayTitle" runat="server" Checked="true" />
            </td>
        </tr>
        <tr>
            <td>
                Container
            </td>
            <td>
                <asp:DropDownList ID="ddlContainer" runat="server"></asp:DropDownList>
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content runat="server" ID="Content3" ContentPlaceHolderID="ButtonArea">
    <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" CssClass="save_button" />
    <asp:Button ID="btnCancel" runat="server" Text="Cancel" OnClientClick="cancelPopup();" CssClass="cancel_button" />
</asp:Content>
