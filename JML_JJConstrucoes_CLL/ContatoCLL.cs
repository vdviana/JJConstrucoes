using JML_JJConstrucoes_BLL;

namespace JML_JJConstrucoes_CLL
{
    public class ContatoCLL
    {
        private readonly ContatoDAO _contatoDAO = new ContatoDAO();

        #region Método Envia Mensagem

        public ConexaoMDL EnviaMensagem(ContatoMDL contatoMDL)
        {
            return _contatoDAO.EnviaMensagem(contatoMDL);
        }

        #endregion

        #region Método Pesquisa Mensagem

        public ConexaoMDL PesquisaMensagem(ConexaoMDL msgconexaoMDL)
        {
            return _contatoDAO.PesquisaMensagem(msgconexaoMDL);
        }

        #endregion

        #region Método Exclui Mensagem

        public ConexaoMDL ExcluiMensagem(ContatoMDL contatoMDL)
        {
            return _contatoDAO.ExcluiMensagem(contatoMDL);
        }

        #endregion

        #region Método Visualiza Mensagem

        public ConexaoMDL VisualizaMensagem(ContatoMDL contatoMDL)
        {
            return _contatoDAO.VisualizaMensagem(contatoMDL);
        }

        #endregion
    }
}