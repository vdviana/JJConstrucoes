<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Estilos/Admin.Master" AutoEventWireup="true" CodeBehind="home.aspx.cs" Inherits="JML_JJConstrucoes_PL.Admin.Home" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="auto-style8">
        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp; &nbsp;</td>
            <td>
                <asp:Panel ID="Panel1" runat="server" Height="390px" ScrollBars="Auto" Width="697px">
                    <asp:GridView ID="grdContatos" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal" Height="121px" HorizontalAlign="Right" OnRowCommand="GrdContatosRowCommand" OnRowDeleting="GrdContatosRowDeleting" style="font-weight: 700; margin-left: 0px; text-align: center;" Width="700px">
                        <Columns>
                            <asp:TemplateField HeaderText="Nome">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:LinkButton ID="lbkNome" runat="server" BorderStyle="None" CommandArgument='<%#                                        DataBinder.Eval(Container, "RowIndex") %>' CommandName="Ver" ForeColor="#999966">lbkNome</asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Assunto">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:LinkButton ID="lbkAssunto" runat="server" CommandArgument='<%#                                        DataBinder.Eval(Container, "RowIndex") %>' CommandName="Ver" ForeColor="#999966">lbkAssunto</asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Data">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:LinkButton ID="lbkTempo" runat="server" CommandArgument='<%#                                        DataBinder.Eval(Container, "RowIndex") %>' CommandName="Ver" ForeColor="#999966">lbkTempo</asp:LinkButton>
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
            <td>&nbsp; &nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>
                &nbsp;</td>
            <td>&nbsp;</td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="MainContent" runat="server">
</asp:Content>