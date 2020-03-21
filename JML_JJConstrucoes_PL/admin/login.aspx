<%@ Page Title="ACESSO ADMINISTRATIVO" Language="C#" MasterPageFile="~/Admin/Estilos/Login.Master" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="JML_JJConstrucoes_PL.Admin.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style2 { width: 100%; }

        .auto-style3 { height: 20px; }

        .auto-style4 { height: 26px; }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="auto-style2">
        <tr>
            <td class="auto-style3">
                <strong>
                    Login</strong></td>
        </tr>
        <tr>
            <td class="auto-style4">
                <asp:TextBox ID="txtEmail" runat="server" Width="200px" MaxLength="40"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <strong>Senha</strong></td>
        </tr>
        <tr>
            <td>
                <asp:TextBox ID="txtSenha" runat="server" TextMode="Password" Width="200px" MaxLength="25"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                <asp:ImageButton ID="btnEntrar" runat="server" ImageUrl="~/Admin/Estilos/Imagens/btnLogin.png" OnClick="BtnEntrarClick" />
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="MainContent" runat="server">
</asp:Content>