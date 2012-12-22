<%@ Page Title="About" Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master"  CodeBehind="About.aspx.cs" Inherits="MyCMS.About" %>

<%@ Register Src="~/UserControls/PageTree.ascx" TagPrefix="uc1" TagName="PageTree" %>




<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <uc1:PageTree runat="server" ID="PageTree" />
</asp:Content>