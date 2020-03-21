using System;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;
using JML_JJConstrucoes_BLL;
using JML_JJConstrucoes_CLL;
using JML_JJConstrucoes_GLL;

namespace JML_JJConstrucoes_PL.Admin
{
    public partial class Artigo : Page
    {
        private readonly NoticiaCLL _noticiaCLL = new NoticiaCLL();
        private readonly NoticiaMDL _noticiaMDL = new NoticiaMDL();
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

            CarregaGridAdminNoticias();
        }

        #endregion

        #region Metodo Carrega Grid AdminNoticias

        public void CarregaGridAdminNoticias()
        {
            const string parametro = "";

            _conexaoMDL2.Ds.Clear();

            _conexaoMDL2 = _noticiaCLL.PesquisaNoticia(parametro);

            grdAdminNoticias.DataSource = _conexaoMDL2.Ds;
            grdAdminNoticias.DataBind();

            for (int i = 0; i < _conexaoMDL2.Ds.Tables[0].Rows.Count; i++)
            {
                var lblNome = (Label) grdAdminNoticias.Rows[i].FindControl("lblNome");
                lblNome.Text = _conexaoMDL2.Ds.Tables[0].Rows[i]["nome_noticia"].ToString();
            }
        }

        #endregion

        #region GrdAdminNoticiasRowCommand

        protected void GrdAdminNoticiasRowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Delete")
            {
                _linha = Convert.ToInt32(e.CommandArgument);
            }
        }

        #endregion

        #region GrdAdminNoticiasRowDeleting

        protected void GrdAdminNoticiasRowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            _linha = e.RowIndex;
            _noticiaMDL.IdNoticia = Convert.ToInt32(_conexaoMDL2.Ds.Tables[0].Rows[_linha]["id_noticia"].ToString());
            _conexaoMDL2 = _noticiaCLL.ExcluiNoticia(_noticiaMDL);

            Page.ClientScript.RegisterClientScriptBlock(GetType(), "alertscript",
                                                        _conexaoMDL2.ValidaProc
                                                            ? "<script>alert('Notícia excluida com sucesso!')</script>"
                                                            :"<script>alert('Ocorreu um erro durante a exclusão da Notícia!')</script>" );

            CarregaGridAdminNoticias();
        }

        #endregion

        #region Botão Novo Artigo

        protected void BtnArtigoClick(object sender, EventArgs e)
        {
            Response.Redirect("novoartigo.aspx");
        }

        #endregion

        protected void grdAdminNoticias_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}