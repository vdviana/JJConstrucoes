using System;

namespace JML_JJConstrucoes_BLL
{
    public class UsuarioDAO
    {
        private readonly ConexaoDAL _conexaoDAL = new ConexaoDAL();
        private ConexaoMDL _conexaoMDL = new ConexaoMDL();

        #region Método Cadastra Usuario

        public ConexaoMDL CadastraUsuario(UsuarioMDL usuarioMDL)
        {
            _conexaoMDL = _conexaoDAL.ProcValidaEmail(usuarioMDL);

            if (_conexaoMDL.ValidaProc == false)
            {
                _conexaoMDL = _conexaoDAL.ProcCadastraUsuario(usuarioMDL);
                _conexaoMDL = _conexaoDAL.ProcCarregaUsuario(usuarioMDL);
            }

            return _conexaoMDL;
        }

        #endregion

        #region Método Carrega Usuario

        public ConexaoMDL CarregaUsuario(UsuarioMDL usuarioMDL)
        {
            _conexaoMDL = _conexaoDAL.ProcValidaLogin(usuarioMDL);

            if (_conexaoMDL.ValidaProc)
            {
                _conexaoMDL = _conexaoDAL.ProcCarregaUsuario(usuarioMDL);
            }

            return _conexaoMDL;
        }

        #endregion

        #region Método Pesquisa Conta

        public ConexaoMDL PesquisaConta(string excessao)
        {
            return _conexaoDAL.ProcPesquisaConta(excessao);
        }

        #endregion

        #region Método Altera Acesso

        public bool AlteraAcesso(int intacesso, string email)
        {
            return _conexaoDAL.ProcAlteraAcesso(intacesso, email);
        }

        #endregion

        #region Método Exclui Conta

        public ConexaoMDL ExcluiConta(UsuarioMDL usuarioMDL)
        {
            return _conexaoDAL.ProcExcluiConta(usuarioMDL);
        }

        #endregion
    }
}