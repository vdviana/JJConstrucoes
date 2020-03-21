using System;
using System.Web.UI;
using JML_JJConstrucoes_BLL;
using JML_JJConstrucoes_CLL;
using JML_JJConstrucoes_GLL;

namespace JML_JJConstrucoes_PL.Admin
{
    public partial class Login : Page
    {
        private readonly UsuarioCLL _usuarioCLL = new UsuarioCLL();
        private readonly UsuarioGLL _usuarioGLL = new UsuarioGLL();
        private readonly UsuarioMDL _usuarioMDL = new UsuarioMDL();
        private ConexaoMDL _conexaoMDL = new ConexaoMDL();

        #region Page Load

        protected void Page_Load(object sender, EventArgs e)
        {
            txtEmail.Focus();
        }

        #endregion

        #region Botão Entrar

        protected void BtnEntrarClick(object sender, ImageClickEventArgs e)
        {
            if (string.IsNullOrWhiteSpace(txtEmail.Text) || string.IsNullOrWhiteSpace(txtSenha.Text))
            {
                Page.ClientScript.RegisterClientScriptBlock(GetType(), "alertscript",
                                                            "<script>alert('Por favor, preencha todos os campos no login.');</script>");
            }
            else
            {
                _conexaoMDL.Ds.Clear();

                _usuarioMDL.EmailUsuario = txtEmail.Text;
                _usuarioMDL.SenhaUsuario = txtSenha.Text;

                _conexaoMDL = _usuarioCLL.CarregaUsuario(_usuarioMDL);

                if (_conexaoMDL.ValidaProc)
                {
                    _conexaoMDL = _usuarioGLL.ValidaAcesso(_conexaoMDL);

                    if (_conexaoMDL.ValidaProc == false)
                    {
                        Session["PassaInfo"] = _conexaoMDL.Ds;
                        _usuarioMDL.NomeUsuario = _conexaoMDL.Ds.Tables[0].Rows[0]["nome_usuario"].ToString();

                        Page.ClientScript.RegisterClientScriptBlock(GetType(), "alertscript",
                                                                    "<script>alert('Bem vindo, " +
                                                                    _usuarioMDL.NomeUsuario +
                                                                    "');location.href='home.aspx';</script>");
                    }
                    else
                    {
                        Page.ClientScript.RegisterClientScriptBlock(GetType(), "alertscript",
                                                                    "<script>alert('Voce não está autorizado a acessar o sistema.');location.href='login.aspx';</script>");
                    }
                }
                else
                {
                    Page.ClientScript.RegisterClientScriptBlock(GetType(), "alertscript",
                                                                "<script>alert('Login ou senha incorretos!');</script>");
                }
            }
        }

        #endregion
    }
}