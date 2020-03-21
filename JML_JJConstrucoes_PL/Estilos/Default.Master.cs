using System;
using System.Web.UI;

namespace JML_JJConstrucoes_PL.Estilos
{
    public class DefaultMaster : MasterPage
    {
        private readonly Noticias _noticias = new Noticias();

        public string Parametro;

        #region Page Load

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        #endregion

        #region Botão Pesquisar

        protected void BtnPesquisaClick(object sender, EventArgs e)
        {
            //Parametro = txtPesquisa.text;
            
            //_noticias.CarregaGridNoticias(Parametro);

            //Response.Redirect("noticias.aspx");
        }

  
        #endregion
    }
}