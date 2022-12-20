using Entidades;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Datos
{
    public class ImagenDato : Conexion
    {
        private SqlCommand cmd;
        private SqlDataReader dr;
        public List<Imagen> ConsultarImagenes()
        {
            int i = 0;
            List<Imagen> resultado = null;

            try
            {
                Conectar();

                cmd = new SqlCommand("sp_imagen_listar");

                cmd.Connection = con;

                dr = cmd.ExecuteReader();

                if (dr.HasRows)
                {
                    resultado = new List<Imagen>();

                    while (dr.Read())
                    {
                        i += 1;

                        Imagen imagen = new Imagen
                        {

                            Codigo = dr["i_id_imagen"].ToString(),
                            Nombre = dr["v_nombre_imagen"].ToString(),
                        };

                        resultado.Add(imagen);
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
