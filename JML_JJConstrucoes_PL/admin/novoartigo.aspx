<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Estilos/Admin.Master" AutoEventWireup="true" CodeBehind="novoartigo.aspx.cs" Inherits="JML_JJConstrucoes_PL.Admin.Novoartigo" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">


        .auto-style9 { font-weight: bold; }

        .style1 {
            font-weight: 700;
            text-align: center;
            width: 100%;
        }

        .auto-style10 { width: 490px; }

        .auto-style11 { height: 160px; }

        .auto-style12 { height: 20px; }

        .auto-style27 {
            color: #FFFFFF;
            height: 20px;
        }

        .auto-style28 {
            height: 20px;
            width: 12px;
        }

        .auto-style29 { width: 12px; }

        .auto-style30 {
            height: 160px;
            width: 12px;
        }

        .auto-style31 {
            background-color: #FFFFFF;
            height: 20px;
            width: 350px;
        }

        .auto-style32 {
            color: #FFFFFF;
            font-weight: normal;
            height: 20px;
        }

        .auto-style33 {
            height: 20px;
            width: 60px;
        }

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="style1">
        <tr>
            <td style="text-align: center" class="auto-style28">&nbsp;</td>
            <td style="text-align: center" colspan="3" class="auto-style12">&nbsp;</td>
            <td></td>
        </tr>
        <tr>
            <td class="auto-style30">
                &nbsp;</td>
            <td colspan="3" class="auto-style11">
                <asp:Panel ID="Panel2" runat="server" style="background-color: #505050" >
                    <table class="auto-style8">
                        <tr>
                            <td class="auto-style12" colspan="3">&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style32" colspan="3"><strong>Nome do Artigo:</strong></td>
                        </tr>
                        <tr>
                            <td class="auto-style12" colspan="3">
                                <asp:TextBox ID="txtTituloNoticia" runat="server" MaxLength="40" Width="200px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style27" colspan="3">Descrição do Artigo:</td>
                        </tr>
                        <tr>
                            <td class="auto-style33">
                                &nbsp;</td>
                            <td class="auto-style31">
                                <asp:TextBox ID="txtDescricaoNoticia" runat="server" BorderStyle="None" Height="245px" MaxLength="150" Width="565px" Wrap="False" TextMode="MultiLine" ToolTip="Insira uma descrição de no máximo 150 caractéres"></asp:TextBox>
                            </td>
                            <td class="auto-style12">&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style12" colspan="3">&nbsp;</td>
                        </tr>
                    </table>
                </asp:Panel>
            </asp:Panel>
                <asp:DropShadowExtender ID="Panel2_DropShadowExtender" runat="server" Enabled="True" Rounded="True" TargetControlID="Panel2">
                </asp:DropShadowExtender>
            </td>
            <td class="auto-style11">
                &nbsp;&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style29">&nbsp;</td>
            <td colspan="3">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style29">
                &nbsp;</td>
            <td class="auto-style10">
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