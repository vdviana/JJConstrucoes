using System;
using System.Data;
using System.Web.UI;
using JML_JJConstrucoes_BLL;
using JML_JJConstrucoes_CLL;
using JML_JJConstrucoes_GLL;

namespace JML_JJConstrucoes_PL.Admin
{
    public partial class Novoartigo : Page
    {
        private readonly NoticiaCLL _noticiaCLL = new NoticiaCLL();
        private readonly NoticiaMDL _noticiaMDL = new NoticiaMDL();
        private readonly UsuarioGLL _usuarioGLL = new UsuarioGLL();
        private ConexaoMDL _conexaoMDL = new ConexaoMDL();

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
        }

        #endregion

        #region Botão Enviar

        protected void BtnEnviarClick(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(txtTituloNoticia.Text) || string.IsNullOrWhiteSpace(txtDescricaoNoticia.Text))
            {
                Page.ClientScript.RegisterClientScriptBlock(GetType(), "alertscript",
                                                            "<script>alert('Por favor, preencha todos os campos da noticia.');</script>");
            }
            else
            {
                _noticiaMDL.NomeNoticia = txtTituloNoticia.Text;
                _noticiaMDL.DescricaoNoticia = txtDescricaoNoticia.Text;

                _conexaoMDL = _noticiaCLL.CadastraNoticia(_noticiaMDL);

                Page.ClientScript.RegisterClientScriptBlock(GetType(), "alertscript",
                                                            _conexaoMDL.ValidaProc == false
                                                                ? "<script>alert('Noticia enviada com sucesso!');location.href='home.aspx';</script>"
                                                                : "<script>alert('Já existe uma noticia com este nome no sistema.');</script>");
            }
        }

        #endregion

        #region Botão Limpar

        protected void BtnLimparClick(object sender, EventArgs e)
        {
            txtTituloNoticia.Text = "";
            txtDescricaoNoticia.Text = "";
        }

        #endregion
    }
}