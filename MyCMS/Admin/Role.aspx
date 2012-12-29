<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Role.aspx.cs" Inherits="MyCMS.Admin.Role" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../Styles/admin.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:GridView ID="gvRoles" runat="server" AutoGenerateColumns="False"  
            ShowFooter="True" CssClass="gridview"
            OnRowCommand="gvRoles_RowCommand" OnRowDeleting="gvRoles_RowDeleting" OnRowEditing="gvRoles_RowEditing" OnRowCancelingEdit="gvRoles_RowCancelingEdit">
            <Columns>
                <asp:TemplateField HeaderText="Role">
                    <ItemTemplate>
                        <asp:Label ID="lblRoleName" runat="server" Text="<%# Container.DataItem.ToString() %>"></asp:Label>
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtRoleName" runat="server" Width="340px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtRoleName" Display="None" ErrorMessage="Role name is required" ValidationGroup="role"></asp:RequiredFieldValidator>
                        
                    </FooterTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:ImageButton ID="btnDelete" CommandName="delete" runat="server" OnClientClick="return confirm('Do you want to delete?');" CausesValidation="false" ImageUrl="~/Images/icons/16/Delete.png" ImageAlign="AbsMiddle" />
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:ImageButton ID="btnInsert" CommandName="insert" runat="server" ValidationGroup="role" ImageUrl="~/Images/icons/16/Add.png" ImageAlign="AbsMiddle" />
                    </FooterTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="true" ShowSummary="false" EnableClientScript="true" ValidationGroup="role" />
    </div>
    </form>
</body>
</html>
