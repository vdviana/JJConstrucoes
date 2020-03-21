using JML_JJConstrucoes_BLL;

namespace JML_JJConstrucoes_CLL
{
    public class NoticiaCLL
    {
        private readonly NoticiaDAO _noticiaDAO = new NoticiaDAO();

        #region Método Cadastra Noticia

        public ConexaoMDL CadastraNoticia(NoticiaMDL noticiaMDL)
        {
            return _noticiaDAO.CadastraNoticia(noticiaMDL);
        }

        #endregion

        #region Método Pesquisa Noticia

        public ConexaoMDL PesquisaNoticia(string parametro)
        {
            return _noticiaDAO.PesquisaNoticia(parametro);
        }

        #endregion

        #region Método Exclui Noticia

        public ConexaoMDL ExcluiNoticia(NoticiaMDL noticiaMDL)
        {
            return _noticiaDAO.ExcluiNoticia(noticiaMDL);
        }

        #endregion
    }
}