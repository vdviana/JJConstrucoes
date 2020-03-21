<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Estilos/Admin.Master" AutoEventWireup="true" CodeBehind="novaimagem.aspx.cs" Inherits="JML_JJConstrucoes_PL.Admin.Novaimagem" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">

        .style1 {
            font-weight: 700;
            text-align: center;
            width: 100%;
        }

        .auto-style11 { width: 490px; }

        .auto-style9 { font-weight: bold; }

        .auto-style21 { width: 12px; }

        .auto-style17 {
            color: #505050;
            font-weight: bold;
        }

        .auto-style19 { color: #505050; }

        .auto-style26 { color: #FFFFFF; }

        .auto-style27 { width: 60px; }

        .auto-style28 {
            background-color: #FFFFFF;
            width: 169px;
        }

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="style1">
        <tr>
            <td style="text-align: center" class="auto-style21">&nbsp;</td>
            <td colspan="3" style="text-align: center">&nbsp;</td>
            <td></td>
        </tr>
        <tr>
            <td style="text-align: center" class="auto-style21"></td>
            <td colspan="3" style="text-align: center">
                <asp:Panel ID="Panel2" runat="server" style="background-color: #505050" >
                    <table class="auto-style8">
                        <tr>
                            <td colspan="3">&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style26" colspan="3">Caminho da Imagem:</td>
                        </tr>
                        <tr>
                            <td colspan="3">
                                <asp:FileUpload ID="fuImagem" runat="server" CssClass="auto-style17" ToolTip="Insira uma imagem de no máximo 2,5mb" />
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style26" colspan="3">Descrição da Imagem:</td>
                        </tr>
                        <tr>
                            <td class="auto-style27">
                                &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            </td>
                            <td class="auto-style28">
                                <asp:TextBox ID="txtDescricaoImagem" runat="server" CssClass="auto-style19" Height="245px" MaxLength="150" TextMode="MultiLine" Width="565px" Wrap="False" ToolTip="Insira uma descrição de no máximo 150 caractéres"></asp:TextBox>
                            </td>
                            <td>&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </td>
                        </tr>
                        <tr>
                            <td colspan="3">&nbsp;</td>
                        </tr>
                    </table>
                </asp:Panel>
            </asp:Panel>
                <asp:DropShadowExtender ID="Panel2_DropShadowExtender" runat="server" Enabled="True" Rounded="True" TargetControlID="Panel2">
                </asp:DropShadowExtender>
            </td>
            <td style="text-align: center">&nbsp;&nbsp;</td>
        </tr>
        <tr>
            <td style="text-align: center" class="auto-style21">&nbsp;</td>
            <td colspan="3" style="text-align: center">&nbsp;</td>
            <td style="text-align: center">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style21">&nbsp;</td>
            <td class="auto-style11">
                <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
                </asp:ToolkitScriptManager>
            </td>
            <td>
                <asp:Button ID="btnEnviar" runat="server" CssClass="botao" Text="Enviar" OnClick="BtnEnviarClick" />
            </td>
            <td>
                <asp:Button ID="btnLimpar" runat="server" CssClass="botao" Text="Limpar" OnClick="BtnLimparClick" />
            </td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="MainContent" runat="server">
</asp:Content>