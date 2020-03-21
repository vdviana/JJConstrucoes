using System;
using System.Data;
using System.IO;
using System.Net;
using System.Web.UI;
using System.Web.UI.WebControls;
using JML_JJConstrucoes_BLL;
using JML_JJConstrucoes_CLL;
using JML_JJConstrucoes_GLL;

namespace JML_JJConstrucoes_PL.Admin
{
    public partial class Imagem : Page
    {
        private  ConexaoMDL _conexaoMDL2 = new ConexaoMDL();
        private readonly ImagemCLL _imagemCLL = new ImagemCLL();
        private readonly ImagemMDL _imagemMDL = new ImagemMDL();
        private readonly UsuarioGLL _usuarioGLL = new UsuarioGLL();
        private ConexaoMDL _conexaoMDL = new ConexaoMDL();

        private ConexaoMDL _imgconexao = new ConexaoMDL();
        private int _linha;

        #region Page Load

        protected void Page_Load(object sender, EventArgs e)
        {
            _conexaoMDL.Ds = (DataSet) Session["PassaInfo"];
            _conexaoMDL = _usuarioGLL.ValidaAcesso(_conexaoMDL);

            if (_conexaoMDL.ValidaProc)
            {
                Page.ClientScript.RegisterClientScriptBlock(GetType(), "alertscript",
                                                            "<script>alert('Voce não está autorizado a acessar o sistema');location.href='login.aspx';</script>");
            }

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

            _imgconexao.Ds.Clear();

            _imgconexao = _imagemCLL.PesquisaImagem(parametro);

            grdadminGaleria.DataSource = _imgconexao.Ds;
            grdadminGaleria.DataBind();

            for (int i = 0; i < _imgconexao.Ds.Tables[0].Rows.Count; i++)
            {
                var imgNome = (Image) grdadminGaleria.Rows[i].FindControl("imgNome");
                var lblDescricao = (Label) grdadminGaleria.Rows[i].FindControl("lblDescricao");

                _imagemMDL.NomeImagem = _imgconexao.Ds.Tables[0].Rows[i]["nome_imagem"].ToString();
                imgNome.ImageUrl = (_imagemMDL.CarregaImagem + _imagemMDL.NomeImagem + ".jpg");

                lblDescricao.Text = _imgconexao.Ds.Tables[0].Rows[i]["descricao_imagem"].ToString();
            }
        }

        #endregion

        #region grdadminGaleriaRowCommand

        protected void GrdadminGaleriaRowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Delete")
            {
                _linha = Convert.ToInt32(e.CommandArgument);
            }
        }

        #endregion

        #region grdadminGaleriaRowDeleting

        protected void GrdadminGaleriaRowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            _linha = e.RowIndex;

            _imagemMDL.IdImagem = Convert.ToInt32(_imgconexao.Ds.Tables[0].Rows[_linha]["id_imagem"].ToString());
            _imagemMDL.NomeImagem = _imgconexao.Ds.Tables[0].Rows[_linha]["nome_imagem"].ToString();

            _conexaoMDL2 = _imagemCLL.ExcluiImagem(_imagemMDL);

            if (_conexaoMDL2.ValidaProc)
            {
                FtpWebRequest request = (FtpWebRequest)FtpWebRequest.Create("ftp://ftp.jjconstrucoes.com.br/httpdocs/Galeria/" + _imagemMDL.NomeImagem + ".jpg");

                request.Method = WebRequestMethods.Ftp.DeleteFile;
                request.Credentials = new NetworkCredential("jjconstrucoes", "Jj1231_");
                request.KeepAlive = false;
                
                Page.ClientScript.RegisterClientScriptBlock(GetType(), "alertscript",
                                            "<script>alert('Imagem excluida com sucesso!');</script>");
            }
            else
            {
                Page.ClientScript.RegisterClientScriptBlock(GetType(), "alertscript",
                            "<script>alert('Ocorreu um erro durante a exclusão da Imagem!');</script>");
            }

            CarregaGridImagens();
        }

        #endregion

        #region GrdadminGaleriaUndexChanged

        protected void grdadminGaleria_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        #endregion

        #region Botão Nova Imagem

        protected void BtnImagemClick(object sender, EventArgs e)
        {
            Response.Redirect("novaimagem.aspx");
        }

        #endregion
    }
}