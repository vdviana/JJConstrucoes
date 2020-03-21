using System;

namespace JML_JJConstrucoes_BLL
{
    public class ImagemDAO
    {
        private readonly ConexaoDAL _conexaoDAL = new ConexaoDAL();
        private ConexaoMDL _conexaoMDL = new ConexaoMDL();

        #region Método Cadastra Imagem

        public ConexaoMDL CadastraImagem(ImagemMDL imagemMDL)
        {
            _conexaoMDL = _conexaoDAL.ProcValidaImagem(imagemMDL);

            if (_conexaoMDL.ValidaProc == false)
            {
                _conexaoMDL = _conexaoDAL.ProcCadastraImagem(imagemMDL);
            }

            return _conexaoMDL;
        }

        #endregion

        #region Método Pesquisa Imagem

        public ConexaoMDL PesquisaImagem(string parametro)
        {
            return _conexaoMDL = _conexaoDAL.ProcPesquisaImagem(parametro);
        }

        #endregion

        #region Método Exclui Imagem

        public ConexaoMDL ExcluiImagem(ImagemMDL imagemMDL)
        {
            return _conexaoDAL.ProcExcluiImagem(imagemMDL);
        }

        #endregion
    }
}