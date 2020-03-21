namespace JML_JJConstrucoes_BLL
{
    public class NoticiaDAO
    {
        private readonly ConexaoDAL _conexaoDAL = new ConexaoDAL();
        private ConexaoMDL _conexaoMDL = new ConexaoMDL();

        #region Método Cadastra Noticia

        public ConexaoMDL CadastraNoticia(NoticiaMDL noticiaMDL)
        {
            _conexaoMDL = _conexaoDAL.ProcValidaNoticia(noticiaMDL);

            if (_conexaoMDL.ValidaProc == false)
            {
                _conexaoMDL = _conexaoDAL.ProcCadastraNoticia(noticiaMDL);
            }

            return _conexaoMDL;
        }

        #endregion

        #region Método Pesquisa Noticia

        public ConexaoMDL PesquisaNoticia(string parametro)
        {
            return _conexaoMDL = _conexaoDAL.ProcPesquisaNoticia(parametro);
        }

        #endregion

        #region Método Exclui Noticia

        public ConexaoMDL ExcluiNoticia(NoticiaMDL noticiaMDL)
        {
            return _conexaoDAL.ProcExcluiNoticia(noticiaMDL);
        }

        #endregion
    }
}