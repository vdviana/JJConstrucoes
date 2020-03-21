<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Estilos/Admin.Master" AutoEventWireup="true" CodeBehind="artigo.aspx.cs" Inherits="JML_JJConstrucoes_PL.Admin.Artigo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" runat="server" contentplaceholderid="ContentPlaceHolder1">
        
    <table class="auto-style8">
        <tr>
            <td class="auto-style9">
                <table class="auto-style8">
                    <tr>
                        <td class="auto-style17"></td>
                        <td class="auto-style18">
                        </td>
                        <td class="auto-style17">
                        </td>
                        <td class="auto-style17"></td>
                    </tr>
                    <tr>
                        <td class="auto-style15"></td>
                        <td class="auto-style16">
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;</td>
                        <td class="auto-style15">
                            <asp:Button ID="btnArtigo" runat="server" Text="Novo Artigo" OnClick="BtnArtigoClick" CssClass="botao"/>
                        </td>
                        <td class="auto-style15"></td>
                    </tr>
                    <tr>
                        <td class="auto-style17"></td>
                        <td class="auto-style18">
                        </td>
                        <td class="auto-style17">
                        </td>
                        <td class="auto-style17"></td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td colspan="2">
                            <asp:Panel ID="Panel2" runat="server" Height="390px" ScrollBars="Auto" Width="749px">
                                <asp:GridView ID="grdAdminNoticias" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal" Height="163px" PageSize="3" style="text-align: center" Width="724px" OnRowDeleting="GrdAdminNoticiasRowDeleting" OnSelectedIndexChanged="grdAdminNoticias_SelectedIndexChanged">
                                    <Columns>
                                        <asp:TemplateField HeaderText="Nomes">
                                            <ItemTemplate>
                                                <div class="auto-style11">
                                                    <span class="auto-style12">
                                                        <asp:Label ID="lblNome" runat="server" CssClass="auto-style13" style="color: #000000; font-weight: 700; text-align: right;" Text="lblNome"></asp:Label>
                                                    </span>
                                                    <br />
                                                </div>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:CommandField DeleteText="Excluir" HeaderText="Excluir" ShowDeleteButton="True" ButtonType="Image" DeleteImageUrl="~/Estilos/botões/black curved Delete.jpg" />
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
                        <td class="auto-style14"></td>
                        <td class="auto-style14" colspan="2">
                            &nbsp;</td>
                        <td class="auto-style14"></td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
        
</asp:Content>
<asp:Content ID="Content4" runat="server" contentplaceholderid="head">
    <style type="text/css">
        .auto-style9 { height: 28px; }

        .auto-style14 { height: 20px; }

        .auto-style11 { text-align: center; }

        .auto-style12 { color: #996633; }

        .auto-style13 {
            background-color: #FFFFFF;
            text-align: center;
        }

        .auto-style15 {
            height: 30px;
            text-align: center;
        }

        .auto-style16 {
            height: 30px;
            text-align: center;
            width: 360px;
        }

        .auto-style17 {
            height: 15px;
            text-align: center;
        }

        .auto-style18 {
            height: 15px;
            text-align: center;
            width: 360px;
        }
    </style>
</asp:Content>