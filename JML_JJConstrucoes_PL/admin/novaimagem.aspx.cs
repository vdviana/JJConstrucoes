using System;
using System.Data;
using System.IO;
using System.Web.UI;
using System.Net;
using JML_JJConstrucoes_BLL;
using JML_JJConstrucoes_CLL;
using JML_JJConstrucoes_GLL;

namespace JML_JJConstrucoes_PL.Admin
{
    public partial class Novaimagem : Page
    {
        private readonly ImagemCLL _imagemCLL = new ImagemCLL();
        private readonly ImagemMDL _imagemMDL = new ImagemMDL();
        private readonly UsuarioGLL _usuarioGLL = new UsuarioGLL();
        private ConexaoMDL _conexaoMDL = new ConexaoMDL();

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
        }

        #endregion

        #region Botão Enviar

        protected void BtnEnviarClick(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(txtDescricaoImagem.Text))
            {
                Page.ClientScript.RegisterClientScriptBlock(GetType(), "alertscript",
                                                            "<script>alert('Por favor, preencha todas as informações da imagem.');</script>");
            }
            else
            {
                if (UploadImagem())
                {
                    _imagemMDL.DescricaoImagem = txtDescricaoImagem.Text;

                    _conexaoMDL = _imagemCLL.CadastraImagem(_imagemMDL);

                    Page.ClientScript.RegisterClientScriptBlock(GetType(), "alertscript",
                                                                _conexaoMDL.ValidaProc == false
                                                                    ? "<script>alert('Imagem cadastrada com sucesso!');location.href='home.aspx';</script>"
                                                                    : "<script>alert('Já existe uma imagem com este nome no sistema.');</script>");
                }
                else
                    Page.ClientScript.RegisterClientScriptBlock(GetType(), "alertscript",
                                                                "<script>alert('Selecione a sua imagem antes de cadastra-la.');</script>");
            }
        }

        #endregion

        #region Método Upload Imagem

        private bool UploadImagem()
        {
            if (fuImagem.HasFile)
            {
                string extensaoFoto = Path.GetExtension(fuImagem.FileName.ToLower());

                if (extensaoFoto == ".png" || extensaoFoto == ".gif" || extensaoFoto == ".jpeg" ||
                    extensaoFoto == ".jpg")
                {
                    if (fuImagem.PostedFile.ContentLength < 2621440)
                    {
                        _imagemMDL.NomeImagem = fuImagem.FileName.ToLower();

                        FtpWebRequest request = (FtpWebRequest)FtpWebRequest.Create("ftp://ftp.jjconstrucoes.com.br/httpdocs/Galeria/" + _imagemMDL.NomeImagem);

                        request.Method = WebRequestMethods.Ftp.UploadFile;
                        request.Credentials = new NetworkCredential("jjconstrucoes", "Jj1231_");
                        request.KeepAlive = false;
                        request.Method = WebRequestMethods.Ftp.UploadFile;
                        request.UseBinary = true;
                        request.ContentLength = fuImagem.FileContent.Length;

                        Stream responseStream = request.GetRequestStream();
                        byte[] buffer = new byte[2048];

                        try
                        {
                            int readCount = fuImagem.FileContent.Read(buffer, 0, buffer.Length);

                            while (readCount > 0)
                            {
                                responseStream.Write(buffer, 0, readCount);
                                readCount = fuImagem.FileContent.Read(buffer, 0, buffer.Length);
                            }
                        }
                        finally
                        {
                            fuImagem.FileContent.Close();
                            responseStream.Close();
                        } 
                                     
                        return true;
                    }

                    Page.ClientScript.RegisterClientScriptBlock(GetType(), "alertscript",
                                                                "<script>alert('O tamanho máximo da imagem deve ser de 2,5Mb.');</script>");
                    return false;
                }

                Page.ClientScript.RegisterClientScriptBlock(GetType(), "alertscript",
                                                            "<script>alert('As imagens devem ter os formatos: .JPG, .PNG, .GIF OU .JPEG');</script>");
                return false;
            }

            return false;
        }

        #endregion

        #region Botão Limpar

        protected void BtnLimparClick(object sender, EventArgs e)
        {
            txtDescricaoImagem.Text = "";
        }

        #endregion
    }
}