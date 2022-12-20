using Entidades;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;

namespace Datos
{
    public class MarcaDato : Conexion
    {
        private SqlCommand cmd;
        private SqlDataReader dr;
        public List<Marca> ConsultarMarcas()
        {
            int i = 0;
            List<Marca> resultado = null;

            try
            {
                Conectar();

                cmd = new SqlCommand("sp_marca_listar");

                cmd.Connection = con;

                dr = cmd.ExecuteReader();

                if (dr.HasRows)
                {
                    resultado = new List<Marca>();

                    while (dr.Read())
                    {
                        i += 1;

                        Marca marca = new Marca
                        {

                            Codigo = dr["i_id_marca"].ToString(),
                            Nombre = dr["v_nombre_marca"].ToString(),
                        };

                        resultado.Add(marca);
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
