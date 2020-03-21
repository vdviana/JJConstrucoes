using System;

namespace JML_JJConstrucoes_BLL
{
    public class ContatoMDL
    {
        public int IdChamado { get; set; }
        public String NomeSolicitante { get; set; }
        public String TelefoneSolicitante { get; set; }
        public String EmailSolicitante { get; set; }
        public String AssuntoMensagem { get; set; }
        public String MensagemSolicitante { get; set; }
    }
}