using System;
using System.Security.Cryptography;
using System.Text;
using JML_JJConstrucoes_BLL;

namespace JML_JJConstrucoes_CLL
{
    public class UsuarioCLL
    {
        private readonly UsuarioDAO _usuarioDAO = new UsuarioDAO();

        #region Método Cadastra Usuário

        public ConexaoMDL CadastraUsuario(UsuarioMDL usuarioMDL)
        {
            GeraSenha(usuarioMDL);

            return _usuarioDAO.CadastraUsuario(usuarioMDL);
        }

        #endregion

        #region Método Carrega Usuário

        public ConexaoMDL CarregaUsuario(UsuarioMDL usuarioMDL)
        {
            GeraSenha(usuarioMDL);

            return _usuarioDAO.CarregaUsuario(usuarioMDL);
        }

        #endregion

        #region Método Altera Acesso

        public bool AlteraAcesso(int intacesso, string email)
        {
            return _usuarioDAO.AlteraAcesso(intacesso, email);
        }

        #endregion

        #region Método Pesquisa Conta

        public ConexaoMDL PesquisaConta(string excessao)
        {
            return _usuarioDAO.PesquisaConta(excessao);
        }

        #endregion

        #region Método Exclui Conta

        public ConexaoMDL ExcluiConta(UsuarioMDL usuarioMDL)
        {
            return _usuarioDAO.ExcluiConta(usuarioMDL);
        }

        #endregion

        #region Método Gera Senha

        public string GeraSenha(UsuarioMDL usuarioMDL)
        {
            SHA1 sha1 = new SHA1CryptoServiceProvider();
            byte[] data = Encoding.ASCII.GetBytes(usuarioMDL.SenhaUsuario);
            byte[] hash = sha1.ComputeHash(data);
            var sb = new StringBuilder();

            for (int i = 0; i < hash.Length; i++)
            {
                sb.Append(hash[i].ToString("X2"));
            }

            return usuarioMDL.SenhaUsuario = sb.ToString();
        }

        #endregion
    }
}