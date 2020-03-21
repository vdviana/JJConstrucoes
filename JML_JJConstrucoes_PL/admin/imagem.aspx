<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Estilos/Admin.Master" AutoEventWireup="true" CodeBehind="imagem.aspx.cs" Inherits="JML_JJConstrucoes_PL.Admin.Imagem" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" runat="server" contentplaceholderid="ContentPlaceHolder1">
        
    <table class="auto-style8">
        <tr>
            <td>
                <table class="auto-style8">
                    <tr>
                        <td class="auto-style14"></td>
                        <td class="auto-style12"></td>
                        <td class="auto-style13">
                        </td>
                        <td class="auto-style14"></td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td class="auto-style10">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;</td>
                        <td class="auto-style9">
                            <asp:Button ID="btnImagem" runat="server" OnClick="BtnImagemClick" Text="Nova Imagem" CssClass="botao" />
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style14"></td>
                        <td class="auto-style12"></td>
                        <td class="auto-style13">
                        </td>
                        <td class="auto-style14"></td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td class="auto-style9" colspan="2">
                            <asp:Panel ID="Panel1" runat="server" Height="390px" ScrollBars="Auto" Width="708px">
                                <asp:GridView ID="grdadminGaleria" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal" ShowHeader="False" style="text-align: center" Width="674px" OnRowDeleting="GrdadminGaleriaRowDeleting" OnSelectedIndexChanged="grdadminGaleria_SelectedIndexChanged">
                                    <Columns>
                                        <asp:TemplateField HeaderText="Imagem">
                                            <ItemTemplate>
                                                <asp:Label ID="lblDescricao" runat="server" Text="lblDescricao"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Descrição">
                                            <ItemTemplate>
                                                <asp:Image ID="imgNome" runat="server" Height="115px" Width="172px" ImageAlign="Bottom" />
                                                <br />
                                                <br />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:CommandField HeaderText="Excluir" ShowDeleteButton="True" ButtonType="Image" DeleteImageUrl="~/Estilos/botões/black curved Delete.jpg" />
                                    </Columns>
                                    <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                                    <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                                    <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                                    <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                                    <SortedAscendingCellStyle BackColor="#F7F7F7" />
                                    <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                                    <SortedDescendingCellStyle BackColor="#E5E5E5" />
                                    <SortedDescendingHeaderStyle BackColor="#242121" />
                                </asp:GridView>
                            </asp:Panel>
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td class="auto-style10">
                            &nbsp;</td>
                        <td class="auto-style9">
                            &nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
        
</asp:Content>
<asp:Content ID="Content4" runat="server" contentplaceholderid="head">
    <style type="text/css">
        .auto-style9 {
            text-align: center;
            width: 648px;
        }

        .auto-style10 {
            text-align: center;
            width: 1017px;
        }

        .auto-style12 {
            height: 15px;
            text-align: center;
            width: 1017px;
        }

        .auto-style13 {
            height: 15px;
            text-align: center;
            width: 648px;
        }

        .auto-style14 { height: 15px; }
    </style>
</asp:Content>