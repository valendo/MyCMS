<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Edit.ascx.cs" Inherits="MyCMS.Modules.Redirect.Edit" %>

<script src="/Resources/ckfinder/ckfinder.js"></script>

<div class="content_area">
    <span>Redirect to: </span>
    <asp:RadioButtonList ID="rbtType" runat="server" AutoPostBack="True" RepeatDirection="Horizontal" OnSelectedIndexChanged="rbtType_SelectedIndexChanged">
        <asp:ListItem Selected="True" Value="page">Page</asp:ListItem>
        <asp:ListItem Value="link">External url</asp:ListItem>
        <asp:ListItem Value="file">File</asp:ListItem>
    </asp:RadioButtonList>
    <br />
    <div style="height:80%; border: 1px solid gray; padding:10px; overflow:auto;">
        <asp:Panel ID="panelPage" runat="server">
            <asp:RadioButtonList ID="rbtPage" runat="server"></asp:RadioButtonList>
        </asp:Panel>
        <asp:Panel ID="panelLink" runat="server">
            <asp:TextBox ID="txtExternalUrl" runat="server" Width="300px"></asp:TextBox>
        </asp:Panel>
        <asp:Panel ID="panelFile" runat="server">
            <%--<input type="text" style="width:300px;" id="txtFile" name="txtFile" value=""/>--%>
            <asp:TextBox ID="txtFile" runat="server"></asp:TextBox>
            <input type="button" value="Browse ..." id="btnSelectFile" name="btnSelectFile" />
        </asp:Panel>
    </div>
</div>
<div class="buttons_area">
    <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" CssClass="save_button" />
    <asp:Button ID="btnCancel" runat="server" Text="Cancel" OnClientClick="cancelPopup();" CssClass="cancel_button" />
</div>

<script type="text/javascript">
    jQuery(document).ready(function ($) {
        {
            $('#btnSelectFile').click(function () {
                {
                    var finder = new CKFinder();
                    finder.selectActionFunction = function (fileUrl) {
                        {
                            $('#<%= txtFile.ClientID %>').val(fileUrl);
                        }
                    };
                    finder.popup();
                }
            });
        }
    });
</script>