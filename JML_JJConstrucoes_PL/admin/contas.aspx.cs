using System;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;
using JML_JJConstrucoes_BLL;
using JML_JJConstrucoes_CLL;
using JML_JJConstrucoes_GLL;

namespace JML_JJConstrucoes_PL.Admin
{
    public partial class Contas : Page
    {
        private readonly UsuarioCLL _usuarioCLL = new UsuarioCLL();
        private readonly UsuarioGLL _usuarioGLL = new UsuarioGLL();
        private UsuarioMDL _usuarioMDL = new UsuarioMDL();
        private string _checaAcesso;
        private ConexaoMDL _conexaoMDL = new ConexaoMDL();
        private ConexaoMDL _conexaoMDL2 = new ConexaoMDL();
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
            else if (IsPostBack == false)
            {
                CarregaGrid();
            }

            _conexaoMDL = _usuarioGLL.ValidaUsuario(_conexaoMDL);

            if (_conexaoMDL.ValidaProc)
            {
                Page.ClientScript.RegisterClientScriptBlock(GetType(), "alertscript",
                                                            "<script>alert('Voce não está autorizado a administrar contas');location.href='home.aspx';</script>");
            }
            else if (IsPostBack == false)
            {
                CarregaGrid();
            }
        }

        #endregion

        #region Metodo Carrega Grid

        private void CarregaGrid()
        {
            _conexaoMDL2.Ds.Clear();

            string excessaoEmail = _conexaoMDL.Ds.Tables[0].Rows[0]["email_usuario"].ToString();
            _conexaoMDL2 = _usuarioCLL.PesquisaConta(excessaoEmail);

            grdContas.DataSource = _conexaoMDL2.Ds;
            grdContas.DataBind();

            for (int i = 0; i < _conexaoMDL2.Ds.Tables[0].Rows.Count; i++)
            {
                var lblNome = (Label) grdContas.Rows[i].FindControl("lblNome");
                var lblEmail = (Label) grdContas.Rows[i].FindControl("lblEmail");
                var ddlAcesso = ((DropDownList) grdContas.Rows[i].Cells[0].FindControl("ddlAcesso"));

                int acesso = Convert.ToInt32(_conexaoMDL2.Ds.Tables[0].Rows[i]["nivel_acesso"]);
                lblNome.Text = Convert.ToString(_conexaoMDL2.Ds.Tables[0].Rows[i]["nome_usuario"].ToString());
                lblEmail.Text = Convert.ToString(_conexaoMDL2.Ds.Tables[0].Rows[i]["email_usuario"].ToString());

                if (acesso == 0)
                    ddlAcesso.SelectedValue = "0";

                else if (acesso == 1)
                    ddlAcesso.SelectedValue = "1";

                else if (acesso == 2)
                    ddlAcesso.SelectedValue = "2";
            }
        }

        #endregion

        #region GrdContasRowCommand

        protected void GrdContasRowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Delete")
            {
                _linha = Convert.ToInt32(e.CommandArgument);
            }
        }

        #endregion

        #region GrdContasRowDeleting

        protected void GrdContasRowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            var lblEmail = (Label) grdContas.Rows[_linha].FindControl("lblEmail");

            _usuarioMDL.EmailUsuario = lblEmail.Text;

            _conexaoMDL2 = _usuarioCLL.ExcluiConta(_usuarioMDL);

            Page.ClientScript.RegisterClientScriptBlock(GetType(), "alertscript",
                                                        _conexaoMDL2.ValidaProc
                                                            ? "<script>alert('Cadastro excluido com sucesso!')</script>"
                                                            :"<script>alert('Ocorreu um erro durante a exclusão da Conta!')</script>" );

            grdContas.DataSource = _conexaoMDL2.Ds;
            _conexaoMDL2.Ds.Dispose();

            CarregaGrid();
        }

        #endregion

        #region GrdContasSelectedChanged

        protected void grdContas_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        #endregion

        # region Botão Salvar

        protected void BtnSalvarClick(object sender, EventArgs e)
        {
            _conexaoMDL2.Ds.Clear();

            string excessaoEmail = _conexaoMDL.Ds.Tables[0].Rows[0]["email_usuario"].ToString();

            _conexaoMDL2 = _usuarioCLL.PesquisaConta(excessaoEmail);

            for (int i = 0; i < grdContas.Rows.Count; i++)
            {
                var ddlAcesso = (DropDownList) grdContas.Rows[i].Cells[3].FindControl("ddlAcesso");

                _checaAcesso = ddlAcesso.SelectedValue;

                if (_checaAcesso != _conexaoMDL2.Ds.Tables[0].Rows[i]["nivel_acesso"].ToString())
                {
                    string email = _conexaoMDL2.Ds.Tables[0].Rows[i]["email_usuario"].ToString();
                    int intacesso = Convert.ToInt32(_checaAcesso);

                    _conexaoMDL2.ValidaProc = _usuarioCLL.AlteraAcesso(intacesso, email);

                    Page.ClientScript.RegisterClientScriptBlock(GetType(), "alertscript",
                                                                _conexaoMDL2.ValidaProc
                                                                    ? "<script>alert('Cadastro alterado com sucesso!')</script>"
                                                                    : "<script>alert('Ocorreu um erro durante a alteração')</script>");
                }
            }
        }

        #endregion
    }
}