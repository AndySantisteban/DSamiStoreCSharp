using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Datos
{
    public class Conexion
    {
        protected SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["cnDBS"].ConnectionString);

        public bool Conectar()
        {
            try
            {
                con.Open();
                return true;
            } catch
            {
                return false;
            }
        }

        public bool Desconectar()
        {
            try
            {
                if (con.State == ConnectionState.Open)
                {
                    con.Close();
                }
                return true;
            }
            catch
            {
                return false;
            }
        }
    }
}
