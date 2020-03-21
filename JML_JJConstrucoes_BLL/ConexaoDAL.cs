using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace JML_JJConstrucoes_BLL
{
    public class ConexaoDAL
    {
        private readonly ConexaoMDL _conexaoMDL = new ConexaoMDL();
        private readonly ConexaoMDL _conexaoMDL2 = new ConexaoMDL();

        #region ConnectionString Cnnconexao

        public readonly SqlConnection Cnnconexao = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["cs_jj_construcoes"].ToString());

        #endregion

        #region UsuarioDAO

        #region Proc Valida Email

        public ConexaoMDL ProcValidaEmail(UsuarioMDL usuarioMDL)
        {
            Cnnconexao.Open();

            _conexaoMDL.Cmd = new SqlCommand("jjcon_spc_valida_email") {CommandType = CommandType.StoredProcedure};
            _conexaoMDL.Cmd.Parameters.Add(new SqlParameter("@email_usuario", usuarioMDL.EmailUsuario));

            _conexaoMDL.Cmd.Connection = Cnnconexao;
            _conexaoMDL.ValidaProc = Convert.ToBoolean(_conexaoMDL.Cmd.ExecuteScalar());

            Cnnconexao.Close();

            return _conexaoMDL;
        }

        #endregion

        #region Proc Cadastra Usuário

        public ConexaoMDL ProcCadastraUsuario(UsuarioMDL usuarioMDL)
        {
            Cnnconexao.Open();

            _conexaoMDL.Cmd = new SqlCommand("jjcon_spc_cadastra_usuario") {CommandType = CommandType.StoredProcedure};
            _conexaoMDL.Cmd.Parameters.Add(new SqlParameter("@nivel_acesso", usuarioMDL.NivelAcesso));
            _conexaoMDL.Cmd.Parameters.Add(new SqlParameter("@nome_usuario", usuarioMDL.NomeUsuario));
            _conexaoMDL.Cmd.Parameters.Add(new SqlParameter("@telefone_usuario", usuarioMDL.TelefoneUsuario));
            _conexaoMDL.Cmd.Parameters.Add(new SqlParameter("@email_usuario", usuarioMDL.EmailUsuario.ToLower()));
            _conexaoMDL.Cmd.Parameters.Add(new SqlParameter("@senha_usuario", usuarioMDL.SenhaUsuario));

            _conexaoMDL.Cmd.Connection = Cnnconexao;
            _conexaoMDL.Cmd.ExecuteNonQuery();

            Cnnconexao.Close();

            return _conexaoMDL;
        }

        #endregion

        #region Proc Valida Login

        public ConexaoMDL ProcValidaLogin(UsuarioMDL usuarioMDL)
        {
            Cnnconexao.Open();

            _conexaoMDL.Cmd = new SqlCommand("jjcon_spc_valida_login") {CommandType = CommandType.StoredProcedure};

            _conexaoMDL.Cmd.Parameters.Add(new SqlParameter("@email_usuario", usuarioMDL.EmailUsuario));
            _conexaoMDL.Cmd.Parameters.Add(new SqlParameter("@senha_usuario", usuarioMDL.SenhaUsuario));

            _conexaoMDL.Cmd.Connection = Cnnconexao;
            _conexaoMDL.ValidaProc = Convert.ToBoolean(_conexaoMDL.Cmd.ExecuteScalar());

            Cnnconexao.Close();

            return _conexaoMDL;
        }

        #endregion

        #region Proc Carrega Usuario

        public ConexaoMDL ProcCarregaUsuario(UsuarioMDL usuarioMDL)
        {
            Cnnconexao.Open();

            _conexaoMDL.Cmd = new SqlCommand("jjcon_spc_carrega_usuario") {CommandType = CommandType.StoredProcedure};
            _conexaoMDL.Cmd.Parameters.Add(new SqlParameter("@email_usuario", usuarioMDL.EmailUsuario));
            _conexaoMDL.Cmd.Parameters.Add(new SqlParameter("@senha_usuario", usuarioMDL.SenhaUsuario));

            _conexaoMDL.Cmd.Connection = Cnnconexao;
            _conexaoMDL.Da = new SqlDataAdapter(_conexaoMDL.Cmd);
            _conexaoMDL.Da.Fill(_conexaoMDL.Ds);

            Cnnconexao.Close();

            return _conexaoMDL;
        }

        #endregion

        #region Proc Pesquisa Conta

        public ConexaoMDL ProcPesquisaConta(string excessao)
        {
            Cnnconexao.Open();

            _conexaoMDL2.Cmd = new SqlCommand("jjcon_spc_pesquisa_conta")
                                   {CommandType = CommandType.StoredProcedure, Connection = Cnnconexao};
            _conexaoMDL2.Cmd.Parameters.Add(new SqlParameter("@email_usuario", excessao));
            _conexaoMDL2.Da = new SqlDataAdapter(_conexaoMDL2.Cmd);
            _conexaoMDL2.Da.Fill(_conexaoMDL2.Ds);
            Cnnconexao.Close();

            return _conexaoMDL2;
        }

        #endregion

        #region Proc Altera Acesso

        public Boolean ProcAlteraAcesso(int intacesso, string email)
        {
            _conexaoMDL.Cmd = new SqlCommand("jjcon_spc_altera_acesso") {CommandType = CommandType.StoredProcedure};
            _conexaoMDL.Cmd.Parameters.Add(new SqlParameter("@email_usuario", email));
            _conexaoMDL.Cmd.Parameters.Add(new SqlParameter("@nivel_acesso", intacesso));

            _conexaoMDL.Cmd.Connection = Cnnconexao;
            Cnnconexao.Open();
            _conexaoMDL.ValidaProc = Convert.ToBoolean(_conexaoMDL.Cmd.ExecuteNonQuery());


            Cnnconexao.Close();
            return _conexaoMDL.ValidaProc;
        }

        #endregion

        #region Proc Exclui Conta

        public ConexaoMDL ProcExcluiConta(UsuarioMDL usuarioMDL)
        {
            Cnnconexao.Open();

            _conexaoMDL2.Cmd = new SqlCommand("jjcon_spc_exclui_conta") {CommandType = CommandType.StoredProcedure};
            _conexaoMDL2.Cmd.Parameters.Add(new SqlParameter("@email_usuario", usuarioMDL.EmailUsuario));

            _conexaoMDL2.Cmd.Connection = Cnnconexao;
            _conexaoMDL2.ValidaProc = Convert.ToBoolean(_conexaoMDL2.Cmd.ExecuteNonQuery());

            Cnnconexao.Close();

            return _conexaoMDL2;
        }

        #endregion

        #endregion

        #region ContatoDAO

        #region Proc Envia Mensagem

        public ConexaoMDL ProcEnviaMensagem(ContatoMDL contatoMDL)
        {
            Cnnconexao.Open();

            _conexaoMDL.Cmd = new SqlCommand("jjcon_spc_envia_mensagem") {CommandType = CommandType.StoredProcedure};
            _conexaoMDL.Cmd.Parameters.Add(new SqlParameter("@nome_solicitante", contatoMDL.NomeSolicitante));
            _conexaoMDL.Cmd.Parameters.Add(new SqlParameter("@email_solicitante", contatoMDL.EmailSolicitante.ToLower()));
            _conexaoMDL.Cmd.Parameters.Add(new SqlParameter("@telefone_solicitante", contatoMDL.TelefoneSolicitante));
            _conexaoMDL.Cmd.Parameters.Add(new SqlParameter("@assunto_mensagem", contatoMDL.AssuntoMensagem));
            _conexaoMDL.Cmd.Parameters.Add(new SqlParameter("@mensagem_solicitante", contatoMDL.MensagemSolicitante));
            _conexaoMDL.Cmd.Parameters.Add(new SqlParameter("@data_mensagem", DateTime.Now));

            _conexaoMDL.Cmd.Connection = Cnnconexao;
            _conexaoMDL.Cmd.ExecuteNonQuery();

            Cnnconexao.Close();

            return _conexaoMDL;
        }

        #endregion

        #region Proc Pesquisa Mensagem

        public ConexaoMDL ProcPesquisaMensagem(ConexaoMDL msgconexaoMDL)
        {
            Cnnconexao.Open();

            _conexaoMDL.Cmd = new SqlCommand("jjcon_spc_pesquisa_mensagem")
                                  {CommandType = CommandType.StoredProcedure, Connection = Cnnconexao};

            _conexaoMDL.Da = new SqlDataAdapter(_conexaoMDL.Cmd);
            _conexaoMDL.Da.Fill(_conexaoMDL2.Ds);
            Cnnconexao.Close();

            return _conexaoMDL2;
        }

        #endregion

        #region Proc Proc Visualiza Mensagem

        public ConexaoMDL ProcVisualizaMensagem(ContatoMDL contatoMDL)
        {
            Cnnconexao.Open();

            _conexaoMDL.Cmd = new SqlCommand("jjcon_spc_visualiza_mensagem") {CommandType = CommandType.StoredProcedure};
            _conexaoMDL.Cmd.Parameters.Add(new SqlParameter("@id_chamado", contatoMDL.IdChamado));
            _conexaoMDL.Cmd.Connection = Cnnconexao;
            _conexaoMDL.Da = new SqlDataAdapter(_conexaoMDL.Cmd);
            _conexaoMDL.Da.Fill(_conexaoMDL2.Ds);

            Cnnconexao.Close();

            return _conexaoMDL2;
        }

        #endregion

        #region Proc Exclui Mensagem

        public ConexaoMDL ProcExcluiMensagem(ContatoMDL contatoMDL)
        {
            Cnnconexao.Open();

            _conexaoMDL.Cmd = new SqlCommand("jjcon_spc_exclui_mensagem") {CommandType = CommandType.StoredProcedure};
            _conexaoMDL.Cmd.Parameters.Add(new SqlParameter("@id_chamado", contatoMDL.IdChamado));
            _conexaoMDL.Cmd.Connection = Cnnconexao;
            _conexaoMDL.Cmd.ExecuteNonQuery();

            Cnnconexao.Close();

            return _conexaoMDL;
        }

        #endregion

        #endregion

        #region NoticiaDAO

        #region Proc Valida Noticia

        public ConexaoMDL ProcValidaNoticia(NoticiaMDL noticiaMDL)
        {
            Cnnconexao.Open();

            _conexaoMDL.Cmd = new SqlCommand("jjcon_spc_valida_noticia") {CommandType = CommandType.StoredProcedure};
            _conexaoMDL.Cmd.Parameters.Add(new SqlParameter("@nome_noticia", noticiaMDL.NomeNoticia));

            _conexaoMDL.Cmd.Connection = Cnnconexao;
            _conexaoMDL.ValidaProc = Convert.ToBoolean(_conexaoMDL.Cmd.ExecuteScalar());

            Cnnconexao.Close();

            return _conexaoMDL;
        }

        #endregion

        #region Proc Cadastra Noticia

        public ConexaoMDL ProcCadastraNoticia(NoticiaMDL noticiaMDL)
        {
            Cnnconexao.Open();

            _conexaoMDL.Cmd = new SqlCommand("jjcon_spc_cadastra_noticia") {CommandType = CommandType.StoredProcedure};
            _conexaoMDL.Cmd.Parameters.Add(new SqlParameter("@nome_noticia", noticiaMDL.NomeNoticia));
            _conexaoMDL.Cmd.Parameters.Add(new SqlParameter("@descricao_noticia", noticiaMDL.DescricaoNoticia));
            _conexaoMDL.Cmd.Parameters.Add(new SqlParameter("@data_noticia", DateTime.Now));

            _conexaoMDL.Cmd.Connection = Cnnconexao;
            _conexaoMDL.ValidaProc = Convert.ToBoolean(_conexaoMDL.Cmd.ExecuteScalar());

            Cnnconexao.Close();

            return _conexaoMDL;
        }

        #endregion

        #region Proc Pesquisa Noticia

        public ConexaoMDL ProcPesquisaNoticia(string parametro)
        {
            Cnnconexao.Open();

            parametro = "%" + parametro + "%";
            _conexaoMDL2.Cmd = new SqlCommand("jjcon_spc_pesquisa_noticia")
                                   {CommandType = CommandType.StoredProcedure, Connection = Cnnconexao};
            _conexaoMDL2.Cmd.Parameters.Add(new SqlParameter("@parametro_pesquisa", parametro));

            _conexaoMDL2.Da = new SqlDataAdapter(_conexaoMDL2.Cmd);
            _conexaoMDL2.Da.Fill(_conexaoMDL2.Ds);
            Cnnconexao.Close();

            return _conexaoMDL2;
        }

        #endregion

        #region Proc Exclui Noticia

        public ConexaoMDL ProcExcluiNoticia(NoticiaMDL noticiaMDL)
        {
            Cnnconexao.Open();

            _conexaoMDL2.Cmd = new SqlCommand("jjcon_spc_exclui_noticia") {CommandType = CommandType.StoredProcedure};
            _conexaoMDL2.Cmd.Parameters.Add(new SqlParameter("@id_noticia", noticiaMDL.IdNoticia));

            _conexaoMDL2.Cmd.Connection = Cnnconexao;
            _conexaoMDL2.ValidaProc = Convert.ToBoolean(_conexaoMDL2.Cmd.ExecuteNonQuery());

            Cnnconexao.Close();

            return _conexaoMDL2;
        }

        #endregion

        #endregion

        #region ImagemDAO

        #region Proc Valida Imagem

        public ConexaoMDL ProcValidaImagem(ImagemMDL imagemMDL)
        {
            Cnnconexao.Open();

            _conexaoMDL.Cmd = new SqlCommand("jjcon_spc_valida_imagem") {CommandType = CommandType.StoredProcedure};
            _conexaoMDL.Cmd.Parameters.Add(new SqlParameter("@nome_imagem", imagemMDL.NomeImagem));

            _conexaoMDL.Cmd.Connection = Cnnconexao;
            _conexaoMDL.ValidaProc = Convert.ToBoolean(_conexaoMDL.Cmd.ExecuteScalar());

            Cnnconexao.Close();

            return _conexaoMDL;
        }

        #endregion

        #region Proc Cadastra Imagem

        public ConexaoMDL ProcCadastraImagem(ImagemMDL imagemMDL)
        {
            Cnnconexao.Open();

            _conexaoMDL.Cmd = new SqlCommand("jjcon_spc_cadastra_imagem") {CommandType = CommandType.StoredProcedure};
            _conexaoMDL.Cmd.Parameters.Add(new SqlParameter("@nome_imagem", imagemMDL.NomeImagem));
            _conexaoMDL.Cmd.Parameters.Add(new SqlParameter("@descricao_imagem", imagemMDL.DescricaoImagem));
            _conexaoMDL.Cmd.Parameters.Add(new SqlParameter("@data_imagem", DateTime.Now));

            _conexaoMDL.Cmd.Connection = Cnnconexao;
            _conexaoMDL.ValidaProc = Convert.ToBoolean(_conexaoMDL.Cmd.ExecuteScalar());

            Cnnconexao.Close();

            return _conexaoMDL;
        }

        #endregion

        #region Proc Pesquisa Imagem

        public ConexaoMDL ProcPesquisaImagem(string parametro)
        {
            Cnnconexao.Open();
            parametro = "%" + parametro + "%";
            _conexaoMDL2.Cmd = new SqlCommand("jjcon_spc_pesquisa_imagem")
                                   {CommandType = CommandType.StoredProcedure, Connection = Cnnconexao};
            _conexaoMDL2.Cmd.Parameters.Add(new SqlParameter("@parametro_imagem", parametro));

            _conexaoMDL2.Da = new SqlDataAdapter(_conexaoMDL2.Cmd);
            _conexaoMDL2.Da.Fill(_conexaoMDL2.Ds);
            Cnnconexao.Close();

            return _conexaoMDL2;
        }

        #endregion

        #region Proc Exclui Imagem

        public ConexaoMDL ProcExcluiImagem(ImagemMDL imagemMDL)
        {
            Cnnconexao.Open();

            _conexaoMDL2.Cmd = new SqlCommand("jjcon_spc_exclui_imagem") {CommandType = CommandType.StoredProcedure};
            _conexaoMDL2.Cmd.Parameters.Add(new SqlParameter("@id_imagem", imagemMDL.IdImagem));

            _conexaoMDL2.Cmd.Connection = Cnnconexao;
            _conexaoMDL2.ValidaProc = Convert.ToBoolean(_conexaoMDL2.Cmd.ExecuteNonQuery());

            Cnnconexao.Close();

            return _conexaoMDL2;
        }

        #endregion

        #endregion
    }
}