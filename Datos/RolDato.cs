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

        public bool InsertarRol(Rol rol)
        {
            bool resultado = false;

            try
            {
                Conectar();

                string sql = "sp_rol_agregar  @nombre";

                cmd = new SqlCommand(sql, con);
                cmd.Parameters.AddWithValue("@nombre", rol.Nombre);

                if (cmd.ExecuteNonQuery() != 0)
                {
                    resultado = true;
                }
            }
            finally
            {
                Desconectar();
            }

            return resultado;
        }

        public bool ActualizarRol(Rol rol)
        {
            bool resultado = false;

            try
            {
                Conectar();

                string sql = "sp_rol_actualizar  @codigo, @nombre";

                cmd = new SqlCommand(sql, con);
                cmd.Parameters.AddWithValue("@codigo", rol.Codigo);
                cmd.Parameters.AddWithValue("@nombre", rol.Nombre);

                if (cmd.ExecuteNonQuery() != 0)
                {
                    resultado = true;
                }
            }
            finally
            {
                Desconectar();
            }

            return resultado;
        }

        public bool EliminarRol(string codigo)
        {
            bool resultado = false;

            try
            {
                Conectar();

                string sql = "sp_rol_eliminar  @codigo";

                cmd = new SqlCommand(sql, con);
                cmd.Parameters.AddWithValue("@codigo", codigo);

                if (cmd.ExecuteNonQuery() != 0)
                {
                    resultado = true;
                }
            }
            finally
            {
                Desconectar();
            }

            return resultado;
        }

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

        public int EncontrarRolesCantidad(string consulta, int limite)
        {
            int resultado = 0;

            try
            {
                Conectar();

                cmd = new SqlCommand("sp_rol_listar_paginacion_count @consulta, @limite");
                cmd.Parameters.AddWithValue("@consulta", consulta);
                cmd.Parameters.AddWithValue("@limite", limite);

                cmd.Connection = con;

                resultado = (int)cmd.ExecuteScalar();
            }
            finally
            {
                Desconectar();
            }

            return resultado;
        }

        public List<Rol> EncontrarRoles(string consulta, int pagina, int limite)
        {
            int i = 0;
            List<Rol> resultado = null;

            try
            {
                Conectar();

                cmd = new SqlCommand("sp_rol_listar_paginacion @consulta, @pagina, @limite");
                cmd.Parameters.AddWithValue("@consulta", consulta);
                cmd.Parameters.AddWithValue("@pagina", pagina);
                cmd.Parameters.AddWithValue("@limite", limite);

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

        public Rol EncontrarRolPorCodigo(string codigo)
        {
            Rol resultado = null;

            try
            {
                Conectar();

                cmd = new SqlCommand("sp_rol_encontrar_por_codigo @codigo");
                cmd.Parameters.AddWithValue("@codigo", codigo);

                cmd.Connection = con;

                dr = cmd.ExecuteReader();

                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        Rol rol = new Rol
                        {
                            Codigo = dr["i_id_rol"].ToString(),
                            Nombre = dr["v_nombre_rol"].ToString(),
                        };

                        resultado = rol;
                    }
                }
            }
            finally
            {
                Desconectar();
            }

            return resultado;
        }

        public Rol EncontrarRolPorNombre(string nombre)
        {
            Rol resultado = null;

            try
            {
                Conectar();

                cmd = new SqlCommand("sp_rol_encontrar_por_nombre @nombre");
                cmd.Parameters.AddWithValue("@nombre", nombre);

                cmd.Connection = con;

                dr = cmd.ExecuteReader();

                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        Rol rol = new Rol
                        {
                            Codigo = dr["i_id_rol"].ToString(),
                            Nombre = dr["v_nombre_rol"].ToString(),
                        };

                        resultado = rol;
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
