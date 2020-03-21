using System;
using JML_JJConstrucoes_BLL;

namespace JML_JJConstrucoes_GLL
{
    public class UsuarioGLL
    {
        private readonly UsuarioMDL _usuarioMDL = new UsuarioMDL();

        #region Método Valida Acesso

        public ConexaoMDL ValidaAcesso(ConexaoMDL conexaoMDL)
        {
            try
            {
                _usuarioMDL.NivelAcesso = Convert.ToInt16(conexaoMDL.Ds.Tables[0].Rows[0]["nivel_acesso"].ToString());

                if (_usuarioMDL.NivelAcesso >= 1)
                {
                    conexaoMDL.ValidaProc = false;
                    return conexaoMDL;
                }
            }
            catch (NullReferenceException)
            {
                conexaoMDL.ValidaProc = true;
                return conexaoMDL;
            }

            return conexaoMDL;
        }

        #endregion

        #region Método Valida Usuário

        public ConexaoMDL ValidaUsuario(ConexaoMDL conexaoMDL)
        {
            try
            {
                _usuarioMDL.NivelAcesso = Convert.ToInt16(conexaoMDL.Ds.Tables[0].Rows[0]["nivel_acesso"].ToString());

                if (_usuarioMDL.NivelAcesso <= 1)
                {
                    conexaoMDL.ValidaProc = true;
                    return conexaoMDL;
                }
            }
            catch (NullReferenceException)
            {
                conexaoMDL.ValidaProc = true;
                return conexaoMDL;
            }

            return conexaoMDL;
        }

        #endregion
    }
}