<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Setting.aspx.cs" Inherits="MyCMS.Admin.Setting" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <table style="width: 100%;">
        <tr>
            <td>Home Page</td>
            <td>
                <asp:DropDownList ID="ddlPages" runat="server"></asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td>Site Title</td>
            <td>
                <asp:TextBox ID="txtSiteTitle" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" />
            </td>
        </tr> 
    </table>
</asp:Content>
