using System;
using System.Data;
using System.Web.UI;
using JML_JJConstrucoes_BLL;
using JML_JJConstrucoes_CLL;
using JML_JJConstrucoes_GLL;

namespace JML_JJConstrucoes_PL.Admin
{
    public partial class Cadastro : Page
    {
        private readonly UsuarioCLL _usuarioCLL = new UsuarioCLL();
        private readonly UsuarioGLL _usuarioGLL = new UsuarioGLL();
        private readonly UsuarioMDL _usuarioMDL = new UsuarioMDL();
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

            _conexaoMDL = _usuarioGLL.ValidaUsuario(_conexaoMDL);

            if (_conexaoMDL.ValidaProc)
            {
                Page.ClientScript.RegisterClientScriptBlock(GetType(), "alertscript",
                                                            "<script>alert('Voce não está autorizado a cadastrar usuários');location.href='home.aspx';</script>");
            }

        }

        #endregion

        #region Botão Cadastrar

        protected void BtnCadastrarClick(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(txtNome.Text) || string.IsNullOrWhiteSpace(txtTelefone.Text) ||
                string.IsNullOrWhiteSpace(txtEmail.Text) || string.IsNullOrWhiteSpace(ddlAcesso.Text) ||
                string.IsNullOrWhiteSpace(txtSenha.Text) || string.IsNullOrWhiteSpace(txtConfirmaSenha.Text))
            {
                Page.ClientScript.RegisterClientScriptBlock(GetType(), "alertscript",
                                                            "<script>alert('Por favor, preencha todos os campos no cadastro');</script>");
            }
            else
            {
                if (txtSenha.Text.Equals(txtConfirmaSenha.Text))
                {
                    _usuarioMDL.NivelAcesso = Convert.ToInt16(ddlAcesso.SelectedValue);
                    _usuarioMDL.NomeUsuario = txtNome.Text;
                    _usuarioMDL.EmailUsuario = txtEmail.Text;
                    _usuarioMDL.SenhaUsuario = txtSenha.Text;
                    _usuarioMDL.TelefoneUsuario = txtTelefone.Text;

                    _conexaoMDL = _usuarioCLL.CadastraUsuario(_usuarioMDL);

                    Page.ClientScript.RegisterClientScriptBlock(GetType(), "alertscript",
                                                                _conexaoMDL.ValidaProc == false
                                                                    ? "<script>alert('Cadastro efetuado com sucesso!');location.href='home.aspx';</script>"
                                                                    : "<script>alert('Email já cadastrado!');</script>");
                }
                else
                {
                    Page.ClientScript.RegisterClientScriptBlock(GetType(), "alertscript",
                                                                "<script>alert('Senhas incompativeis!');</script>");
                }
            }
        }

        #endregion

        #region Botão Limpar

        protected void BtnLimparClick(object sender, EventArgs e)
        {
            txtNome.Text = "";
            txtTelefone.Text = "";
            txtEmail.Text = "";
            ddlAcesso.Text = "";
        }

        #endregion
    }
}