using System;
using System.Data;
using System.Web.UI;
using JML_JJConstrucoes_BLL;
using JML_JJConstrucoes_GLL;

namespace JML_JJConstrucoes_PL.Admin
{
    public partial class Mensagem : Page
    {
        private readonly ConexaoMDL _msgconexaoMDL = new ConexaoMDL();
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
            else
            {
                CarregaMensagem();
            }
        }

        #endregion

        #region Carrega Mensagem

        protected void CarregaMensagem()
        {
            _msgconexaoMDL.Ds = (DataSet) Session["PassaMsg"];

            lblNome.Text = _msgconexaoMDL.Ds.Tables[0].Rows[0]["Nome_solicitante"].ToString();
            lblTelefone.Text = _msgconexaoMDL.Ds.Tables[0].Rows[0]["Telefone_solicitante"].ToString();
            lblEmail.Text = _msgconexaoMDL.Ds.Tables[0].Rows[0]["email_solicitante"].ToString();
            lblAssunto.Text = _msgconexaoMDL.Ds.Tables[0].Rows[0]["assunto_mensagem"].ToString();
            lblMensagem.Text = _msgconexaoMDL.Ds.Tables[0].Rows[0]["mensagem_solicitante"].ToString();
        }

        #endregion

        #region Botão Fechar

        protected void BtnFecharClick(object sender, EventArgs e)
        {
            Response.Redirect("home.aspx");
        }

        #endregion
    }
}