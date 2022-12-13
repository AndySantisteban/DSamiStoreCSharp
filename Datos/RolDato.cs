using Entidades;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Datos
{
    public class RolDato : Conexion
    {

        private SqlCommand cmd;
        private SqlDataReader dr;

        public List<Rol> ConsultarRoles()
        {
            int i = 0;
            List<Rol> resultado = null;

            try
            {
                Conectar();

                cmd = new SqlCommand("sp_usuario_listar");

                cmd.Connection = con;

                dr = cmd.ExecuteReader();

                if (dr.HasRows)
                {
                    resultado = new List<Rol>();

                    while (dr.Read())
                    {
                        i += 1;

                        Rol rol = new Rol
                        {

                            Codigo = dr["i_id_rol"].ToString(),
                            Nombre = dr["v_nombre_rol"].ToString(),
                        };

                        resultado.Add(rol);
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
