using System;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;
using JML_JJConstrucoes_BLL;
using JML_JJConstrucoes_CLL;
using JML_JJConstrucoes_GLL;

namespace JML_JJConstrucoes_PL.Admin
{
    public partial class Home : Page
    {
        private readonly ContatoCLL _contatoCLL = new ContatoCLL();
        private readonly ContatoMDL _contatoMDL = new ContatoMDL();
        private readonly UsuarioGLL _usuarioGLL = new UsuarioGLL();
        private ConexaoMDL _conexaoMDL = new ConexaoMDL();
        private ConexaoMDL _conexaoMDL2 = new ConexaoMDL();

        private int _linha;

        #region Page Load

        protected void Page_Load(object sender, EventArgs e)
        {
            _conexaoMDL.Ds = (DataSet) Session["PassaInfo"];
            _conexaoMDL = _usuarioGLL.ValidaAcesso(_conexaoMDL);

            if (_conexaoMDL.ValidaProc)
            {
                Page.ClientScript.RegisterClientScriptBlock(GetType(), "alertscript",
                                                            "<script>alert('Voce não está autorizado a acessar o sistema');location.href='login.aspx';</script>");
            }

            CarregaGrid();
        }

        #endregion

        #region Metodo CarregaGrid

        private void CarregaGrid()
        {
            _conexaoMDL2.Ds.Clear();

            _conexaoMDL2 = _contatoCLL.PesquisaMensagem(_conexaoMDL2);

            grdContatos.DataSource = _conexaoMDL2.Ds;
            grdContatos.DataBind();

            for (int i = 0; i < _conexaoMDL2.Ds.Tables[0].Rows.Count; i++)
            {
                var lbkNome = (LinkButton) grdContatos.Rows[i].FindControl("lbkNome");
                var lbkAssunto = (LinkButton) grdContatos.Rows[i].FindControl("lbkAssunto");
                var lbkTempo = (LinkButton) grdContatos.Rows[i].FindControl("lbkTempo");

                lbkNome.Text = Convert.ToString(_conexaoMDL2.Ds.Tables[0].Rows[i]["nome_solicitante"].ToString());
                lbkAssunto.Text = Convert.ToString(_conexaoMDL2.Ds.Tables[0].Rows[i]["assunto_mensagem"].ToString());
                lbkTempo.Text = Convert.ToString(_conexaoMDL2.Ds.Tables[0].Rows[i]["data_mensagem"].ToString());
            }
        }

        #endregion

        #region GrdContatosRowCommand

        protected void GrdContatosRowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Delete")
            {
                _linha = Convert.ToInt32(e.CommandArgument);
            }

            else if (e.CommandName == "Ver")
            {
                _linha = Convert.ToInt32(e.CommandArgument);
                _contatoMDL.IdChamado = Convert.ToInt32(_conexaoMDL2.Ds.Tables[0].Rows[_linha]["id_chamado"].ToString());

                _conexaoMDL2.Ds.Clear();
                _conexaoMDL2 = _contatoCLL.VisualizaMensagem(_contatoMDL);

                Session["PassaMsg"] = _conexaoMDL2.Ds;
                Response.Redirect("mensagem.aspx");
            }
        }

        #endregion

        #region GrdContatosRowDeleting

        protected void GrdContatosRowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            _contatoMDL.IdChamado = Convert.ToInt32(_conexaoMDL2.Ds.Tables[0].Rows[_linha]["id_chamado"].ToString());

            _conexaoMDL = _contatoCLL.ExcluiMensagem(_contatoMDL);

            Page.ClientScript.RegisterClientScriptBlock(GetType(), "alertscript",
                                                        _conexaoMDL.ValidaProc
                                                            ? "<script>alert('Ocorreu um erro durante a exclusão da conta!')</script>"
                                                            : "<script>alert('Cadastro excluido com sucesso!')</script>");

            CarregaGrid();
        }

        #endregion
    }
}