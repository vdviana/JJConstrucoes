using System;

namespace JML_JJConstrucoes_BLL
{
    public class ImagemMDL
    {
        public string CaminhoImagem = (@"~/Galeria/");
        public string CarregaImagem = (@"~\Galeria\");

        public int IdImagem { get; set; }
        public String NomeImagem { get; set; }
        public String DescricaoImagem { get; set; }
    }
}