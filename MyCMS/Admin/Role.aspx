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
            OnRowCommand="gvRoles_RowCommand" OnRowDeleting="gvRoles_RowDeleting" 
            OnRowDataBound="gvRoles_RowDataBound">
            <Columns>
                <asp:CommandField ShowDeleteButton="true" ButtonType="Image" 
                    DeleteImageUrl="~/Images/icons/16/Delete.png" DeleteText="" EditText="" />
                <asp:TemplateField HeaderText="Role">
                    <ItemTemplate>
                        <asp:Label ID="lblRoleName" runat="server" Text="<%# Container.DataItem.ToString() %>"></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtRoleName" runat="server" Text='<%# Container.DataItem.ToString() %>'></asp:TextBox>
                        
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtRoleName" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtRoleName" Display="None" ErrorMessage="Role name is required" ValidationGroup="add"></asp:RequiredFieldValidator>
                        <asp:Button ID="btnAdd" CommandName = "add" runat="server" Text="Add new role" ValidationGroup="add" CausesValidation="true" />
                        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="true" ShowSummary="false" EnableClientScript="true" ValidationGroup="add" />
                    </FooterTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        
    </div>
    </form>
</body>
</html>
