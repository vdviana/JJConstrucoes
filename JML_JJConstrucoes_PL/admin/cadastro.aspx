<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Estilos/Admin.Master" AutoEventWireup="true" CodeBehind="cadastro.aspx.cs" Inherits="JML_JJConstrucoes_PL.Admin.Cadastro" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style9 { font-weight: bold; }

        .auto-style29 { color: #FFFFFF; }

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="auto-style8">
        <tr>
            <td>&nbsp;</td>
            <td colspan="3">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td colspan="3">
                <asp:Panel ID="Panel1" runat="server" style="background-color: #505050" >
                    <table class="auto-style8">
                        <tr>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr class="auto-style29">
                            <td>&nbsp;</td>
                            <td><b>Nome Completo:</b></td>
                            <td><b>Senha:</b></td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;</td>
                            <td>
                                <asp:TextBox ID="txtNome" runat="server" CssClass="auto-style9" MaxLength="40" Width="200px"></asp:TextBox>
                            </td>
                            <td>
                                <asp:TextBox ID="txtSenha" runat="server" CssClass="auto-style9" MaxLength="25" TextMode="Password" Width="200px" ToolTip="Insira uma senha de no máximo 25 caractéres"></asp:TextBox>
                            </td>
                        </tr>
                        <tr class="auto-style29">
                            <td>&nbsp;</td>
                            <td><b>Telefone:</b></td>
                            <td><b>Confirme a Senha:</b></td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;</td>
                            <td>
                                <asp:TextBox ID="txtTelefone" runat="server" CssClass="auto-style9" MaxLength="15" Width="200px"></asp:TextBox>
                                <asp:MaskedEditExtender ID="txtTelefone_MaskedEditExtender" runat="server" AutoComplete="False" ClearMaskOnLostFocus="False" CultureAMPMPlaceholder="" CultureCurrencySymbolPlaceholder="" CultureDateFormat="" CultureDatePlaceholder="" CultureDecimalPlaceholder="" CultureThousandsPlaceholder="" CultureTimePlaceholder="" Enabled="True" Mask="(99) 9999-9999" TargetControlID="txtTelefone">
                                </asp:MaskedEditExtender>
                            </td>
                            <td>
                                <asp:TextBox ID="txtConfirmaSenha" runat="server" CssClass="auto-style9" MaxLength="25" TextMode="Password" Width="200px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr class="auto-style29">
                            <td>&nbsp;</td>
                            <td><b>Email:</b></td>
                            <td><b>Nivel de Acesso:</b></td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;</td>
                            <td>
                                <asp:TextBox ID="txtEmail" runat="server" CssClass="auto-style9" MaxLength="40" Width="200px"></asp:TextBox>
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlAcesso" runat="server" CssClass="auto-style9" ToolTip="Acesso parcial permite apenas publicar notícias">
                                    <asp:ListItem></asp:ListItem>
                                    <asp:ListItem Value="2">Administrador</asp:ListItem>
                                    <asp:ListItem Value="1">Usuário</asp:ListItem>
                                    <asp:ListItem Value="0">Inativo</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                    </table>
                </asp:Panel>

                <asp:DropShadowExtender ID="Panel1_DropShadowExtender" runat="server" Enabled="True" Rounded="True" TargetControlID="Panel1">
                </asp:DropShadowExtender>

            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td colspan="3">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>
                <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
                </asp:ToolkitScriptManager>
            </td>
            <td>
                <asp:Button ID="btnCadastrar" runat="server" OnClick="BtnCadastrarClick" Text="Cadastrar" CssClass="botao" />
            </td>
            <td>
                <asp:Button ID="btnLimpar" runat="server" Text="Limpar" style="font-weight: 700" Height="26px" OnClick="BtnLimparClick" CssClass="botao"  />
            </td>
            <td>&nbsp;</td>
        </tr>
    </table>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="MainContent" runat="server">
</asp:Content>