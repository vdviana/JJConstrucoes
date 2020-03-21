using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using JML_JJConstrucoes_BLL;
using JML_JJConstrucoes_CLL;

namespace JML_JJConstrucoes_PL
{
    public partial class Galeria : Page
    {
        private readonly ImagemCLL _imagemCLL = new ImagemCLL();
        private readonly ImagemMDL _imagemMDL = new ImagemMDL();
        private ConexaoMDL _conexaoMDL2 = new ConexaoMDL();

        #region Page Load

        protected void Page_Load(object sender, EventArgs e)
        {
            CarregaGridImagens();
        }

        #endregion

        # region Botão Pesquisar

        protected void BtnPesquisarClick(object sender, EventArgs e)
        {
            CarregaGridImagens();
        }

        #endregion

        #region Metodo CarregaGridImagens

        private void CarregaGridImagens()
        {
            const string parametro = "";

            _conexaoMDL2.Ds.Clear();
            _conexaoMDL2 = _imagemCLL.PesquisaImagem(parametro);
            rptImagem.DataSource = _conexaoMDL2.Ds;
            rptImagem.DataBind();

            
        }

        #endregion
    }
}