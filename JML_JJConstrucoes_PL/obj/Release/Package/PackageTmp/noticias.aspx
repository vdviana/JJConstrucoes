<%@ Page Title="JJ CONSTRUÇÕES" Language="C#" MasterPageFile="~/Estilos/site.master" AutoEventWireup="true" CodeBehind="noticias.aspx.cs" Inherits="JML_JJConstrucoes_PL.Noticias" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
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
                        <td class="auto-style15"></td>
                        <td class="auto-style15">
                            <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
                            </asp:ToolkitScriptManager>
                        </td>
                        <td class="auto-style15"></td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td>
                            <asp:Panel ID="Panel2" runat="server" Height="390px" ScrollBars="Auto" Width="767px">
                                <asp:GridView ID="grdNoticias" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal" Height="116px" PageSize="3" style="text-align: center" Width="750px">
                                    <Columns>
                                        <asp:TemplateField HeaderText="Nossos Artigos">
                                            <ItemTemplate>
                                                <div class="auto-style11">
                                                    <span class="auto-style12">
                                                        <br />
                                                        <asp:Label ID="lblNome" runat="server" CssClass="auto-style13" style="color: #000000; font-weight: 700; text-align: right;" Text="lblNome"></asp:Label>
                                                    </span>
                                                    <br />
                                                    <br />
                                                    <asp:Label ID="lblDescricao" runat="server" Text="lblDescricao"></asp:Label>
                                                    <br />
                                                </div>
                                            </ItemTemplate>
                                        </asp:TemplateField>
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
                        <td class="auto-style14">
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
        .auto-style9 {
            height: 28px;
            width: 770px;
        }

        .auto-style14 { height: 20px; }

        .auto-style11 { text-align: center; }

        .auto-style12 { color: #996633; }

        .auto-style13 {
            background-color: #FFFFFF;
            text-align: center;
        }

        .auto-style15 { height: 30px; }
    </style>
</asp:Content>