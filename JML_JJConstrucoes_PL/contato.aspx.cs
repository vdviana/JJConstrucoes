using System;
using System.Web.UI;
using JML_JJConstrucoes_BLL;
using JML_JJConstrucoes_CLL;

namespace JML_JJConstrucoes_PL
{
    public partial class Contato : Page
    {
        private readonly ContatoCLL _contatoCLL = new ContatoCLL();
        private readonly ContatoMDL _contatoMDL = new ContatoMDL();
        private ConexaoMDL _conexaoMDL = new ConexaoMDL();

        #region Page Load

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        #endregion

        #region Botão Enviar

        protected void BtnEnviarClick(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(txtNome.Text) || string.IsNullOrWhiteSpace(txtTelefone.Text) ||
                string.IsNullOrWhiteSpace(txtEmail.Text) || string.IsNullOrWhiteSpace(ddlAssunto.Text) ||
                string.IsNullOrWhiteSpace(txtMensagem.Text))
            {
                Page.ClientScript.RegisterClientScriptBlock(GetType(), "alertscript",
                                                            "<script>alert('Por favor, preencha todos os campos para o envio da mensagem.');</script>");
            }
            else
            {
                _contatoMDL.NomeSolicitante = txtNome.Text;
                _contatoMDL.EmailSolicitante = txtEmail.Text;
                _contatoMDL.TelefoneSolicitante = txtTelefone.Text;
                _contatoMDL.AssuntoMensagem = ddlAssunto.Text;
                _contatoMDL.MensagemSolicitante = txtMensagem.Text;

                _conexaoMDL = _contatoCLL.EnviaMensagem(_contatoMDL);

                Page.ClientScript.RegisterClientScriptBlock(GetType(), "alertscript",
                                                            _conexaoMDL.ValidaProc == false
                                                                ? "<script>alert('Mensagem enviada com sucesso! Entraremos em contato o mais breve possivel.');location.href='default.aspx';</script>"
                                                                : "<script>alert('Ocorreu um erro ao enviar sua mensagem, tente novamente mais tarde!');</script>");
            }
        }

        #endregion

        #region Botão Limpar

        protected void BtnLimparClick(object sender, EventArgs e)
        {
            txtNome.Text = "";
            txtTelefone.Text = "";
            txtEmail.Text = "";
            ddlAssunto.Text = "";
            txtMensagem.Text = "";
        }

        #endregion
    }
}