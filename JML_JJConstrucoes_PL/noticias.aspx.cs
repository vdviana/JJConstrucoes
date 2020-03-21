using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using JML_JJConstrucoes_BLL;
using JML_JJConstrucoes_CLL;

namespace JML_JJConstrucoes_PL
{
    public partial class Noticias : Page
    {
        private readonly NoticiaCLL _noticiaCLL = new NoticiaCLL();
        private readonly NoticiaMDL _noticiaMDL = new NoticiaMDL();
        private ConexaoMDL _conexaoMDL2 = new ConexaoMDL();

        private int _linha;

        #region Page Load

        protected void Page_Load(object sender, EventArgs e)
        {
            CarregaGridNoticias();
        }

        #endregion

        #region Metodo Carrega Grid Noticias

        public void CarregaGridNoticias()
        {
            const string parametro = "";

            _conexaoMDL2.Ds.Clear();

            _conexaoMDL2 = _noticiaCLL.PesquisaNoticia(parametro);

            grdNoticias.DataSource = _conexaoMDL2.Ds;
            grdNoticias.DataBind();

            for (int i = 0; i < _conexaoMDL2.Ds.Tables[0].Rows.Count; i++)
            {
                var lblNome = (Label) grdNoticias.Rows[i].FindControl("lblNome");
                var lblDescricao = (Label) grdNoticias.Rows[i].FindControl("lblDescricao");

                lblNome.Text = _conexaoMDL2.Ds.Tables[0].Rows[i]["nome_noticia"].ToString();
                lblDescricao.Text = _conexaoMDL2.Ds.Tables[0].Rows[i]["descricao_noticia"].ToString();
            }
        }

        #endregion

        #region GrdNoticiasRowDeleting

        protected void GrdNoticiasRowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            _noticiaMDL.IdNoticia = Convert.ToInt32(_conexaoMDL2.Ds.Tables[0].Rows[_linha]["ID"].ToString());
            _conexaoMDL2 = _noticiaCLL.ExcluiNoticia(_noticiaMDL);

            Page.ClientScript.RegisterClientScriptBlock(GetType(), "alertscript",
                                                        _conexaoMDL2.ValidaProc
                                                            ? "<script>alert('Ocorreu um erro durante a exclusão da noticia!')</script>"
                                                            : "<script>alert('Noticia excluida com sucesso!')</script>");

            CarregaGridNoticias();
        }

        #endregion
    }
}