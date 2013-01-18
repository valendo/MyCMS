<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="MyCMS.Admin.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
    <link href="/Styles/admin.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <section id="loginForm">
        <asp:Login ID="Login1" runat="server" ViewStateMode="Disabled" RenderOuterTable="false">
            <LayoutTemplate>
                <table cellpadding="5" style="margin:100px auto 0;">
                    <tr>
                        <td>
                            User name
                        </td>
                        <td>
                            <asp:TextBox runat="server" ID="UserName" Width="200" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="UserName" CssClass="field-validation-error" ErrorMessage="The user name field is required." ForeColor="Red" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Password
                        </td>
                        <td>
                            <asp:TextBox runat="server" ID="Password" TextMode="Password" Width="200"/>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="Password" CssClass="field-validation-error" ErrorMessage="The password field is required." ForeColor="Red" />
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>
                            <asp:CheckBox runat="server" ID="RememberMe"  />
                        <asp:Label ID="Label3" runat="server" AssociatedControlID="RememberMe" CssClass="checkbox">Remember me?</asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>
                            <asp:Button ID="btnLogin" runat="server" CommandName="Login" Text="Log in" CssClass="save_button" />
                            <asp:Button ID="btnCancel" runat="server" Text="Cancel" 
                                CssClass="cancel_button" OnClick="btnCancel_Click" CausesValidation="false" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <p class="validation-summary-errors" style="margin-top:10px;color:red;">
                                <asp:Literal runat="server" ID="FailureText"  />
                            </p>
                        </td>
                    </tr>
                </table>
            </LayoutTemplate>
        </asp:Login>
    </section>
</asp:Content>
