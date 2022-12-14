using Entidades;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;

namespace Datos
{
    public class CategoriaDato : Conexion
    {
        private SqlCommand cmd;
        private SqlDataReader dr;


        public bool InsertarCategorias(Categoria categoria)
        {
            bool resultado = false;
            try
            {
                Conectar();

                string sql = "sp_categoria_crear @nombre, @descripcion";
                cmd = new SqlCommand(sql, con);

                cmd.Parameters.AddWithValue("@nombre", categoria.Nombre);
                cmd.Parameters.AddWithValue("@descripcion", categoria.Descripcion);

                if (cmd.ExecuteNonQuery() != 0)
                {
                    resultado = true;
                }
            }
            catch (Exception e)
            {
                Console.WriteLine("La Categoria Agregar ", e.Message);
            }
            finally
            {
                Desconectar();
            }

            return resultado;
        }

        public bool ActualizarCategoria(Categoria categoria)
        {
            bool resul = false;
            try
            {
                Conectar();

                String sql = "sp_categoria_actualizar @codigo, @nombre, @descripcion";
                cmd = new SqlCommand(sql, con);
                cmd.Parameters.AddWithValue("@codigo", categoria.Codigo);
                cmd.Parameters.AddWithValue("@nombre", categoria.Nombre);
                cmd.Parameters.AddWithValue("@descripcion", categoria.Descripcion);

                if (cmd.ExecuteNonQuery() != 0)
                {
                    resul = true;
                }

            }

            finally
            {
                Desconectar();
            }
            return resul;
        }

        public bool EliminarCategoria(string codigo)
        {
            bool resul = false;
            try
            {
                Conectar();
                string sql = "sp_categoria_eliminar @codigo";
                cmd = new SqlCommand(sql, con);
                cmd.Parameters.AddWithValue("@codigo", codigo);
                if (cmd.ExecuteNonQuery() != 0)
                {
                    resul = true;
                }


            }

            finally
            {
                Desconectar();
            }
            return resul;
        }

        public List<Categoria> ConsultarCategoria()
        {
            int i = 0;
            List<Categoria> listaCategoria = null;

            try
            {
                Conectar();
                cmd = new SqlCommand("sp_categoria_listar");
                cmd.Connection = con;
                dr = cmd.ExecuteReader();
                if (dr.HasRows)
                    listaCategoria = new List<Categoria>();
                {
                    while (dr.Read())
                    {
                        i += 1;
                        Categoria categoria = new Categoria
                        {
                            Codigo = dr["i_id_categoria"].ToString(),
                            Nombre = dr["v_nombre_categoria"].ToString(),
                            Descripcion = dr["v_descripcion_categoria"].ToString()
                        };
                        listaCategoria.Add(categoria);

                    }
                }
            }
            catch (Exception e)
            {
                Console.WriteLine("La Categoria eliminar ", e.Message);

            }
            finally
            {
                Desconectar();
            }
            return listaCategoria;

        }

        public int EncontrarCategoriasCantidad(string consulta, int limite)
        {
            int total = 0;
            try
            {
                Conectar();
                cmd = new SqlCommand("sp_categoria_listar_paginacion_count @consulta, @limite");
                cmd.Parameters.AddWithValue("@consulta", consulta);
                cmd.Parameters.AddWithValue("@limite", limite);

                cmd.Connection = con;

                total = (int)cmd.ExecuteScalar();
            }
            catch (Exception e)
            {
                Console.WriteLine("La Categoria eliminar ", e.Message);

            }
            finally
            {
                Desconectar();
            }
            return total;
        }

        public List<Categoria> EncontrarCategorias(string consulta, int pagina, int limite)
        {
            int i = 0;
            List<Categoria> lista = null;

            try
            {
                Conectar();
                cmd = new SqlCommand("sp_categoria_listar_paginacion @consulta, @pagina, @limite");
                cmd.Parameters.AddWithValue("@consulta", consulta);
                cmd.Parameters.AddWithValue("@pagina", pagina);
                cmd.Parameters.AddWithValue("@limite", limite);

                cmd.Connection = con;

                dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    lista = new List<Categoria>();
                    while (dr.Read())
                    {
                        i += 1;
                        Categoria categoria = new Categoria
                        {
                            Codigo = dr["i_id_categoria"].ToString(),
                            Nombre = dr["v_nombre_categoria"].ToString(),
                            Descripcion = dr["v_descripcion_categoria"].ToString()

                        };
                        lista.Add(categoria);
                    }

                }
            }

            finally
            {
                Desconectar();
            }
            return lista;
        }

        public Categoria EncontrarCategoriaPorCodigo(string codigo)
        {
            Categoria resultado = null;

            try
            {
                Conectar();

                cmd = new SqlCommand("sp_categoria_encontrar_por_codigo @codigo");
                cmd.Parameters.AddWithValue("@codigo", codigo);

                cmd.Connection = con;

                dr = cmd.ExecuteReader();

                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        Categoria categoria = new Categoria
                        {

                            Codigo = dr["i_id_categoria"].ToString(),
                            Nombre = dr["v_nombre_categoria"].ToString(),
                            Descripcion = dr["v_descripcion_categoria"].ToString()

                        };

                        resultado = categoria;
                    }
                }
            }
            finally
            {
                Desconectar();
            }

            return resultado;
        }


        public Categoria EncontrarPorNombreCategoria(string nombre)
        {
            Categoria resultado = null;

            try
            {
                Conectar();

                cmd = new SqlCommand("sp_categoria_encontrar_por_nombre @in_v_nombre");
                cmd.Parameters.AddWithValue("@in_v_nombre", nombre);

                cmd.Connection = con;

                dr = cmd.ExecuteReader();

                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        Categoria categoria = new Categoria
                        {

                            Codigo = dr["i_id_categoria"].ToString(),
                            Nombre = dr["v_nombre_categoria"].ToString(),
                            Descripcion = dr["v_descripcion_categoria"].ToString()

                        };

                        resultado = categoria;
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
