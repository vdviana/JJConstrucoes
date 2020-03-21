using System;
using System.Data;
using System.Data.SqlClient;

namespace JML_JJConstrucoes_BLL
{
    public class ConexaoMDL
    {
        public SqlCommand Cmd = new SqlCommand();
        public SqlDataAdapter Da = new SqlDataAdapter();
        public DataSet Ds = new DataSet();
        public Boolean ValidaProc { get; set; }
    }
}