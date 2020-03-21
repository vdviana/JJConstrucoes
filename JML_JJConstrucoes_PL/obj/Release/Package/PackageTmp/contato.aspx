<%@ Page Title="JJ CONSTRUÇÕES" Language="C#" MasterPageFile="~/Estilos/Site.Master" AutoEventWireup="true" CodeBehind="contato.aspx.cs" Inherits="JML_JJConstrucoes_PL.Contato" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .style4 { }

        .auto-style2 { height: 47px; }

        .auto-style3 { height: 25px; }

        .auto-style8 {
            height: 67px;
            width: 770px;
        }

        .style1 { width: 802px; }
    

        .auto-style9 { font-weight: bold; }

        .auto-style10 { width: 490px; }

        .auto-style26 { color: #FFFFFF; }

        .auto-style27 {
            color: #FFFFFF;
            height: 20px;
        }

        .auto-style25 { height: 26px; }

        .auto-style28 { width: 12px; }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
</asp:Content>




<asp:Content ID="Content3" runat="server" contentplaceholderid="ContentPlaceHolder1">
        
    <table class="auto-style8">
        <tr>
            <td style="text-align: center" class="auto-style28">
                &nbsp;</td>
            <td style="text-align: center" colspan="3">
                &nbsp;</td>
            <td style="text-align: center">
                &nbsp;</td>
        </tr>
        <tr>
            <td style="text-align: center" class="auto-style28">
                &nbsp;</td>
            <td style="text-align: center" colspan="3">
                <asp:Panel ID="Panel2" runat="server" style="background-color: #505050">
                <table class="auto-style8" border="0">
                <tr>
                    <td class="auto-style10"></td>
                </tr>
                <tr>
                    <td class="auto-style26"><strong>Nome:</strong></td>
                </tr>
                <tr>
                    <td>
                        <asp:TextBox ID="txtNome" runat="server" MaxLength="40" Width="200px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                <td class="auto-style27"><strong>Email:</strong></td>
                </span><span>
                       </span></td>
        </tr>
        <tr>
            <td class="auto-style25">
                <asp:TextBox ID="txtEmail" runat="server" MaxLength="40" Width="200px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style26"><strong>Telefone:</strong></td>
        </span><span>
               </span></td>
        </tr>
        <tr>
            <td>
                <strong>
                    <asp:TextBox ID="txtTelefone" runat="server" MaxLength="15" Width="200px"></asp:TextBox>
                    <asp:MaskedEditExtender ID="txtTelefone_MaskedEditExtender" runat="server" AutoComplete="False" Century="2000" ClearMaskOnLostFocus="False" CultureAMPMPlaceholder="" CultureCurrencySymbolPlaceholder="" CultureDateFormat="" CultureDatePlaceholder="" CultureDecimalPlaceholder="" CultureThousandsPlaceholder="" CultureTimePlaceholder="" Enabled="True" ErrorTooltipEnabled="True" Mask="(99) 9999-9999" MaskType="Number" TargetControlID="txtTelefone">
                    </asp:MaskedEditExtender>
                </strong>
            </td>
        </tr>
        <tr>
            <td class="auto-style26"><strong>Assunto:</strong></td>
        </tr>
        <tr>
            <td>
                <asp:DropDownList ID="ddlAssunto" runat="server">
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem>Dúvida</asp:ListItem>
                    <asp:ListItem>Sugestão</asp:ListItem>
                    <asp:ListItem>Reclamação</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="auto-style26"><strong>Mensagem:</strong></td>
        </tr>
        <tr>
            <td>
                <asp:TextBox ID="txtMensagem" runat="server" Height="150px" MaxLength="150" Rows="15" TextMode="MultiLine" ToolTip="Insira uma mensagem de no máximo 150 caractéres" Width="400px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
        </tr>
    </table>
</asp:Panel>
    <asp:DropShadowExtender ID="Panel2_DropShadowExtender" runat="server" Enabled="True" Rounded="True" TargetControlID="Panel2">
    </asp:DropShadowExtender>
</td>
    <td style="text-align: center">
        &nbsp;</td>
</tr>
    <tr>
        <td style="text-align: center" class="auto-style28">
            &nbsp;</td>
        <td style="text-align: center" class="auto-style10">
            &nbsp;</td>
        <td style="text-align: center">
            &nbsp;</td>
        <td style="text-align: center">
            &nbsp;</td>
        <td style="text-align: center">
            &nbsp;</td>
    </tr>
    <tr>
        <td style="text-align: center" class="auto-style28">
            &nbsp;</td>
        <td style="text-align: center" class="auto-style10">
            <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
            </asp:ToolkitScriptManager>
        </td>
        <td style="text-align: center">
            <asp:Button ID="btnEnviar" runat="server" Text="Enviar" OnClick="BtnEnviarClick" style="font-weight: 700" CssClass="botao" />
        </td>
        <td style="text-align: center">
            <asp:Button ID="btnLimpar" runat="server" CssClass="botao" Text="Limpar" OnClick="BtnLimparClick" />
        </td>
        <td style="text-align: center">
            &nbsp;</td>
    </tr>
</table>
        
</asp:Content>