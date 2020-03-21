<%@ Page Title="JJ CONSTRUÇÕES" Language="C#" MasterPageFile="~/Estilos/Site.master" AutoEventWireup="true" CodeBehind="Galeria.aspx.cs" Inherits="JML_JJConstrucoes_PL.Galeria" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<%@ Import Namespace="JML_JJConstrucoes_CLL" %>
<%@ Import Namespace ="JML_JJConstrucoes_BLL" %>
<%@ Import Namespace =" JML_JJConstrucoes_PL" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" runat="server" contentplaceholderid="ContentPlaceHolder1">

<link href="css_pirobox/style_1/style.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="css/css.css"/>
<link rel="stylesheet" type="text/css" href="content/css/default.css"/>
<link rel="stylesheet" type="text/css" href="css/sansation/stylesheet.css"/>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery-ui-1.8.2.custom.min.js"></script>
<script type="text/javascript" src="js/pirobox_extended.js"></script>
<script type="text/javascript">
    $(document).ready(function () {
        $().piroBox_ext({
            piro_speed: 700,
            bg_alpha: 0.5,
            piro_scroll: true // pirobox always positioned at the center of the page
        });
    });
</script>
    
    <center>
        <table class="auto-style11">
            <tr>
                <td>
        <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
        </asp:ToolkitScriptManager>
                            </td>
            </tr>
            <tr>
                <td>
    
     <asp:Panel ID="Panel1" runat="server" Height="390px" ScrollBars="Auto" Width="767px">
         <asp:Repeater ID="rptImagem" runat="server">
             <ItemTemplate>
                 <center>
                     <table>
                         <tr>
                             <td Width="250px">
                                 <asp:Label ID="Label1" runat="server" Text='<%# DataBinder.Eval (Container.DataItem, "descricao_imagem") %>' Font-Bold=true></asp:Label>
                             </td>
                             <td Width="250px"><a href='../Galeria/<%# DataBinder.Eval (Container.DataItem, "nome_imagem") + ".jpg" %>' rel="gallery"  class="pirobox_gall" title='<%# DataBinder.Eval (Container.DataItem, "nome_imagem") %>'>
                                 <asp:Image ID="Image1" runat="server" Height="269px" ImageUrl='<%#"/Galeria/" + DataBinder.Eval (Container.DataItem, "nome_imagem" )+ ".jpg" %>' Width="353px" />
                                 </a>
                                 <br />
                             </td>
                         </tr>
                     </table>
                 </center>
             </ItemTemplate>
         </asp:Repeater>
                            </asp:Panel>
    
        
                </td>
            </tr>
        </table>
    </center>
    
             
</asp:Content>
<asp:Content ID="Content4" runat="server" contentplaceholderid="head">
    <style type="text/css">
        .auto-style11 {
            width: 100%;
        }
    </style>
</asp:Content>