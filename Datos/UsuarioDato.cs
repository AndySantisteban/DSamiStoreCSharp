using Entidades;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Datos
{
    public class UsuarioDato : Conexion
    {

        private SqlCommand cmd;
        private SqlDataReader dr;

        public bool InsertarUsuario(Usuario usuario)
        {
            bool resultado = false;

            try
            {
                Conectar();

                string sql = "sp_usuario_agregar @nombreUsuario, @clave, @codigoEmpleado, @codigoRol";

                cmd = new SqlCommand(sql, con);
                cmd.Parameters.AddWithValue("@nombreUsuario", usuario.NombreUsuario);
                cmd.Parameters.AddWithValue("@clave", usuario.Clave);
                cmd.Parameters.AddWithValue("@codigoEmpleado", usuario.CodigoEmpleado);
                cmd.Parameters.AddWithValue("@codigoRol", usuario.CodigoRol);

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

        public bool ActualizarUsuario(Usuario usuario)
        {
            bool resultado = false;

            try
            {
                Conectar();

                string sql = "sp_usuario_actualizar @codigo, @nombreUsuario, @clave, @codigoRol";

                cmd = new SqlCommand(sql, con);
                cmd.Parameters.AddWithValue("@codigo", usuario.Codigo);
                cmd.Parameters.AddWithValue("@nombreUsuario", usuario.NombreUsuario);
                cmd.Parameters.AddWithValue("@clave", usuario.Clave);
                cmd.Parameters.AddWithValue("@codigoRol", usuario.CodigoRol);

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

        public bool EliminarUsuario(string codigo)
        {
            bool resultado = false;

            try
            {
                Conectar();

                string sql = "sp_usuario_eliminar @codigo";

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

        public List<Usuario> ConsultarUsuario()
        {
            int i = 0;
            List<Usuario> resultado = null;

            try
            {
                Conectar();

                cmd = new SqlCommand("sp_usuario_listar");

                cmd.Connection = con;

                dr = cmd.ExecuteReader();

                if (dr.HasRows)
                {
                    resultado = new List<Usuario>();

                    while (dr.Read())
                    {
                        i += 1;

                        Usuario usuario = new Usuario
                        {
                            
                            Codigo = dr["i_id_usuario"].ToString(),
                            NombreUsuario = dr["v_username_usuario"].ToString(),
                            Clave = dr["v_password_usuario"].ToString(),
                            CodigoEmpleado = dr["i_id_empleado"].ToString(),
                            NombreEmpleado = dr["v_nombre_persona"].ToString(),
                            ApellidoEmpleado = dr["v_apellido_paterno_persona"].ToString(),
                            CodigoRol = dr["i_id_rol"].ToString(),
                            NombreRol = dr["v_nombre_rol"].ToString()
                        };

                        resultado.Add(usuario);
                    }
                }
            }
            finally
            {
                Desconectar();
            }

            return resultado;
        }

        public int EncontrarUsuariosCantidad(string consulta, int limite)
        {
            int resultado = 0;

            try
            {
                Conectar();

                cmd = new SqlCommand("sp_usuario_listar_paginacion_count @consulta, @limite");
                cmd.Parameters.AddWithValue("@consulta", consulta);
                cmd.Parameters.AddWithValue("@limite", limite);

                cmd.Connection = con;

                resultado = (int) cmd.ExecuteScalar();
            }
            finally
            {
                Desconectar();
            }

            return resultado;
        }

        public List<Usuario> EncontrarUsuarios(string consulta, int pagina, int limite)
        {
            int i = 0;
            List<Usuario> resultado = null;

            try
            {
                Conectar();

                cmd = new SqlCommand("sp_usuario_listar_paginacion @consulta, @pagina, @limite");
                cmd.Parameters.AddWithValue("@consulta", consulta);
                cmd.Parameters.AddWithValue("@pagina", pagina);
                cmd.Parameters.AddWithValue("@limite", limite);

                cmd.Connection = con;

                dr = cmd.ExecuteReader();

                if (dr.HasRows)
                {
                    resultado = new List<Usuario>();

                    while (dr.Read())
                    {
                        i += 1;

                        Usuario usuario = new Usuario
                        {

                            Codigo = dr["i_id_usuario"].ToString(),
                            NombreUsuario = dr["v_username_usuario"].ToString(),
                            Clave = dr["v_password_usuario"].ToString(),
                            CodigoEmpleado = dr["i_id_empleado"].ToString(),
                            NombreEmpleado = dr["v_nombre_persona"].ToString(),
                            ApellidoEmpleado = dr["v_apellido_paterno_persona"].ToString(),
                            CodigoRol = dr["i_id_rol"].ToString(),
                            NombreRol = dr["v_nombre_rol"].ToString()
                        };

                        resultado.Add(usuario);
                    }
                }
            }
            finally
            {
                Desconectar();
            }

            return resultado;
        }

        public Usuario EncontrarUsuarioPorCodigo(string codigo)
        {
            Usuario resultado = null;

            try
            {
                Conectar();

                cmd = new SqlCommand("sp_usuario_encontrar_por_codigo @codigo");
                cmd.Parameters.AddWithValue("@codigo", codigo);

                cmd.Connection = con;

                dr = cmd.ExecuteReader();

                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        Usuario usuario = new Usuario
                        {

                            Codigo = dr["i_id_usuario"].ToString(),
                            NombreUsuario = dr["v_username_usuario"].ToString(),
                            Clave = dr["v_password_usuario"].ToString(),
                            CodigoEmpleado = dr["i_id_empleado"].ToString(),
                            NombreEmpleado = dr["v_nombre_persona"].ToString(),
                            ApellidoEmpleado = dr["v_apellido_paterno_persona"].ToString(),
                            CodigoRol = dr["i_id_rol"].ToString(),
                            NombreRol = dr["v_nombre_rol"].ToString()
                        };

                        resultado = usuario;
                    }
                }
            }
            finally
            {
                Desconectar();
            }

            return resultado;
        }

        public Usuario EncontrarPorNombreUsuario(string nombreUsuario)
        {
            Usuario resultado = null;

            try
            {
                Conectar();

                cmd = new SqlCommand("sp_usuario_encontrar_por_nombre_usuario @nombreUsuario");
                cmd.Parameters.AddWithValue("@nombreUsuario", nombreUsuario);

                cmd.Connection = con;

                dr = cmd.ExecuteReader();

                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        Usuario usuario = new Usuario
                        {

                            Codigo = dr["i_id_usuario"].ToString(),
                            NombreUsuario = dr["v_username_usuario"].ToString(),
                            Clave = dr["v_password_usuario"].ToString(),
                            CodigoEmpleado = dr["i_id_empleado"].ToString(),
                            NombreEmpleado = dr["v_nombre_persona"].ToString(),
                            ApellidoEmpleado = dr["v_apellido_paterno_persona"].ToString(),
                            CodigoRol = dr["i_id_rol"].ToString(),
                            NombreRol = dr["v_nombre_rol"].ToString()
                        };

                        resultado = usuario;
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
