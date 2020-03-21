using System;
using JML_JJConstrucoes_BLL;

namespace JML_JJConstrucoes_CLL
{
    public class ImagemCLL
    {
        private readonly ImagemDAO _imagemDAO = new ImagemDAO();

        #region Método Cadastra Imagem

        public ConexaoMDL CadastraImagem(ImagemMDL imagemMDL)
        {
            return _imagemDAO.CadastraImagem(imagemMDL);
        }

        #endregion

        #region Método Pesquisa Imagem

        public ConexaoMDL PesquisaImagem(string parametro)
        {
            return _imagemDAO.PesquisaImagem(parametro);
        }

        #endregion

        #region Método Exclui Imagem

        public ConexaoMDL ExcluiImagem(ImagemMDL imagemMDL)
        {
            return _imagemDAO.ExcluiImagem(imagemMDL);
        }

        #endregion
    }
}