using Entidades;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Datos
{
    public class AlmacenDato : Conexion
    {
        private SqlCommand cmd;
        private SqlDataReader dr;
        public List<Almacen> ConsultarAlmacenes()
        {
            int i = 0;
            List<Almacen> resultado = null;

            try
            {
                Conectar();

                cmd = new SqlCommand("sp_almacen_listar");

                cmd.Connection = con;

                dr = cmd.ExecuteReader();

                if (dr.HasRows)
                {
                    resultado = new List<Almacen>();

                    while (dr.Read())
                    {
                        i += 1;

                        Almacen almacen = new Almacen
                        {

                            Codigo = dr["i_id_almacen"].ToString(),
                            Nombre = dr["v_nombre_almacen"].ToString(),
                        };

                        resultado.Add(almacen);
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
