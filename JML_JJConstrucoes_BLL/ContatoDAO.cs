namespace JML_JJConstrucoes_BLL
{
    public class ContatoDAO
    {
        private readonly ConexaoDAL _conexaoDAL = new ConexaoDAL();

        #region Método Envia Mensagem

        public ConexaoMDL EnviaMensagem(ContatoMDL contatoMDL)
        {
            return _conexaoDAL.ProcEnviaMensagem(contatoMDL);
        }

        #endregion

        # region Método Pesquisa Mensagem

        public ConexaoMDL PesquisaMensagem(ConexaoMDL msgconexaoMDL)
        {
            return _conexaoDAL.ProcPesquisaMensagem(msgconexaoMDL);
        }

        #endregion

        # region Método Exclui Mensagem

        public ConexaoMDL ExcluiMensagem(ContatoMDL contatoMDL)
        {
            return _conexaoDAL.ProcExcluiMensagem(contatoMDL);
        }

        #endregion

        # region Método Visualiza Mensagem

        public ConexaoMDL VisualizaMensagem(ContatoMDL contatoMDL)
        {
            return _conexaoDAL.ProcVisualizaMensagem(contatoMDL);
        }

        #endregion
    }
}