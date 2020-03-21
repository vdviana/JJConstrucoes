<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Estilos/Admin.Master" AutoEventWireup="true" CodeBehind="mensagem.aspx.cs" Inherits="JML_JJConstrucoes_PL.Admin.Mensagem" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style10 {
            font-weight: bold;
            text-align: center;
        }

        .auto-style13 {
            font-weight: bold;
            height: 20px;
            text-align: center;
        }

        .auto-style36 { color: #FEFFFF; }

        .auto-style37 { width: 707px; }

        .auto-style38 {
            font-weight: bold;
            height: 20px;
            text-align: center;
            width: 707px;
        }

        .auto-style39 {
            font-weight: bold;
            text-align: center;
            width: 707px;
        }

        .auto-style40 { height: 20px; }

        .auto-style41 { width: 20px; }

        .auto-style42 {
            color: #FEFFFF;
            width: 20px;
        }

        .auto-style43 {
            height: 20px;
            width: 20px;
        }

        .auto-style44 {
            color: #FEFFFF;
            height: 20px;
            width: 20px;
        }

        .auto-style45 {
            color: #FEFFFF;
            height: 20px;
        }

        .auto-style48 {
            color: #FEFFFF;
            height: 20px;
            width: 656px;
        }

        .auto-style49 {
            height: 20px;
            width: 656px;
        }

        .auto-style50 { width: 655px; }

        .auto-style51 {
            color: #FEFFFF;
            width: 655px;
        }

        .auto-style52 { width: 656px; }

        .auto-style53 {
            color: #FEFFFF;
            width: 656px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="auto-style8">
        <tr>
            <td class="auto-style13">
                &nbsp;</td>
            <td class="auto-style37"></td>
            <td>&nbsp; </td>
        </tr>
        <tr>
            <td class="auto-style13">
                &nbsp;&nbsp; &nbsp;</td>
            <td class="auto-style38">
            </asp:Panel>
                <asp:Panel ID="Panel2" runat="server" style="background-color: #505050" Width="707px" >
                    <table class="auto-style8" style="width: 101%">
                        <tr>
                            <td class="auto-style41">&nbsp;</td>
                            <td class="auto-style52">&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style42">&nbsp;</td>
                            <td class="auto-style53">Mensagem de <b>
                                                                     <asp:Label ID="lblNome" runat="server"></asp:Label>
                                                                 </b></td>
                            <td class="auto-style36">&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style42">&nbsp;</td>
                            <td class="auto-style53">&nbsp;</td>
                            <td class="auto-style36">&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style41">
                                &nbsp;</td>
                            <td class="auto-style52">
                                <asp:Label ID="lblTelefone" runat="server" CssClass="auto-style36"></asp:Label>
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style41">
                                &nbsp;</td>
                            <td class="auto-style52">
                                <asp:Label ID="lblEmail" runat="server" CssClass="auto-style36"></asp:Label>
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style41">
                                &nbsp;</td>
                            <td class="auto-style52">
                                <asp:Label ID="lblAssunto" runat="server" CssClass="auto-style36"></asp:Label>
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style44"></td>
                            <td class="auto-style48"></td>
                            <td class="auto-style45">&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style41">
                                &nbsp;</td>
                            <td class="auto-style52">
                                <asp:Label ID="lblMensagem" runat="server" CssClass="auto-style36"></asp:Label>
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style43"></td>
                            <td class="auto-style49"></td>
                            <td class="auto-style40">&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style41">
                            </td>
                            <td class="auto-style52">&nbsp;<asp:Button ID="btnFechar" runat="server" OnClick="BtnFecharClick" Text="Fechar" />
                            </td>
                            <td>&nbsp;&nbsp; &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style41">&nbsp;</td>
                            <td class="auto-style52">&nbsp;&nbsp;&nbsp; &nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                    </table>
                </asp:Panel>
                <asp:DropShadowExtender ID="Panel2_DropShadowExtender" runat="server" Enabled="True" Rounded="True" TargetControlID="Panel2">
                </asp:DropShadowExtender>
            </td>
            <td class="auto-style13">
                &nbsp;&nbsp; &nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style10">
                &nbsp;</td>
            <td class="auto-style39">
                <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
                </asp:ToolkitScriptManager>
            </td>
            <td class="auto-style10">
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="MainContent" runat="server">
</asp:Content>