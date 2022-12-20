using Entidades;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Datos
{
    public class MonedaDato : Conexion
    {
        private SqlCommand cmd;
        private SqlDataReader dr;
        public List<Moneda> ConsultarMonedas()
        {
            int i = 0;
            List<Moneda> resultado = null;

            try
            {
                Conectar();

                cmd = new SqlCommand("sp_moneda_listar");

                cmd.Connection = con;

                dr = cmd.ExecuteReader();

                if (dr.HasRows)
                {
                    resultado = new List<Moneda>();

                    while (dr.Read())
                    {
                        i += 1;

                        Moneda moneda = new Moneda
                        {

                            Codigo = dr["i_id_moneda"].ToString(),
                            Nombre = dr["v_nombre_moneda"].ToString(),
                        };

                        resultado.Add(moneda);
                    }
                }
            }
            finally
            {
                Desconectar();
            }

            return resultado;
        }
    }
}
