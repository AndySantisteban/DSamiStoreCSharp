using Entidades;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Datos
{
    public class ProductoDato : Conexion
    {
        private SqlCommand cmd;
        private SqlDataReader dr;

        public bool InsertarProducto(Producto producto)
        {
            bool resultado = false;

            try
            {
                Conectar();

                string sql = "sp_producto_agregar  @idMarca, @idCategoria, @idAlmacen, @idMoneda, @nombre, @descripcion, @precio";

                cmd = new SqlCommand(sql, con);
                cmd.Parameters.AddWithValue("@idMarca", producto.Marca);
                cmd.Parameters.AddWithValue("@idCategoria", producto.Categoria);
                cmd.Parameters.AddWithValue("@idAlmacen", producto.Almacen);
                cmd.Parameters.AddWithValue("@idMoneda", producto.Moneda);
                cmd.Parameters.AddWithValue("@nombre", producto.Nombre);
                cmd.Parameters.AddWithValue("@descripcion", producto.Descripcion);
                cmd.Parameters.AddWithValue("@precio", producto.Precio);

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

        public bool ActualizarProducto(Producto producto)
        {
            bool resultado = false;

            try
            {
                Conectar();

                string sql = "sp_producto_actualizar  @idMarca, @idCategoria, @idAlmacen, @idMoneda, @nombre, @descripcion, @precio, @codigo";

                cmd = new SqlCommand(sql, con);
                cmd.Parameters.AddWithValue("@idMarca", producto.Marca);
                cmd.Parameters.AddWithValue("@idCategoria", producto.Categoria);
                cmd.Parameters.AddWithValue("@idAlmacen", producto.Almacen);
                cmd.Parameters.AddWithValue("@idMoneda", producto.Moneda);
                cmd.Parameters.AddWithValue("@nombre", producto.Nombre);
                cmd.Parameters.AddWithValue("@descripcion", producto.Descripcion);
                cmd.Parameters.AddWithValue("@precio", producto.Precio);
                cmd.Parameters.AddWithValue("@codigo", producto.Codigo);

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
        public bool EliminarProducto(string codigo)
        {
            bool resultado = false;

            try
            {
                Conectar();

                string sql = "sp_producto_eliminar @codigo";

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
        public List<Producto> ConsultarProducto()
        {
            int i = 0;
            List<Producto> resultado = null;

            try
            {
                Conectar();

                cmd = new SqlCommand("sp_producto_listar");

                cmd.Connection = con;

                dr = cmd.ExecuteReader();

                if (dr.HasRows)
                {
                    resultado = new List<Producto>();

                    while (dr.Read())
                    {
                        i += 1;

                        Producto producto = new Producto
                        {

                            Codigo = dr["i_id_producto"].ToString(),
                            Nombre = dr["v_nombre_producto"].ToString(),
                            Descripcion = dr["v_descripcion_producto"].ToString(),
                            Precio = dr["d_precio_referencia_producto"].ToString(),
                            Marca = dr["i_id_marca"].ToString(),
                            Categoria = dr["i_id_categoria"].ToString(),
                            Almacen = dr["i_id_almacen"].ToString(),
                            Moneda = dr["i_id_moneda"].ToString(),
                            NombreMarca = dr["v_nombre_marca"].ToString(),
                            NombreAlmacen = dr["v_nombre_almacen"].ToString(),
                            NombreCategoria = dr["v_nombre_categoria"].ToString(),
                            NombreMoneda = dr["v_nombre_moneda"].ToString()
                        };

                        resultado.Add(producto);
                    }
                }
            }
            finally
            {
                Desconectar();
            }

            return resultado;
        }
        public int EncontrarProductosCantidad(string consulta, int limite)
        {
            int resultado = 0;

            try
            {
                Conectar();

                cmd = new SqlCommand("sp_producto_listar_paginacion_count @consulta, @limite");
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
        public List<Producto> EncontrarProductos(string consulta, int pagina, int limite)
        {
            int i = 0;
            List<Producto> resultado = null;

            try
            {
                Conectar();

                cmd = new SqlCommand("sp_producto_listar_paginacion @consulta, @pagina, @limite");
                cmd.Parameters.AddWithValue("@consulta", consulta);
                cmd.Parameters.AddWithValue("@pagina", pagina);
                cmd.Parameters.AddWithValue("@limite", limite);

                cmd.Connection = con;

                dr = cmd.ExecuteReader();

                if (dr.HasRows)
                {
                    resultado = new List<Producto>();

                    while (dr.Read())
                    {
                        i += 1;

                        Producto producto = new Producto
                        {

                            Codigo = dr["i_id_producto"].ToString(),
                            Nombre = dr["v_nombre_producto"].ToString(),
                            Descripcion = dr["v_descripcion_producto"].ToString(),
                            Precio = dr["d_precio_referencia_producto"].ToString(),
                            Marca = dr["i_id_marca"].ToString(),
                            Categoria = dr["i_id_categoria"].ToString(),
                            Almacen = dr["i_id_almacen"].ToString(),
                            Moneda = dr["i_id_moneda"].ToString(),
                            NombreMarca = dr["v_nombre_marca"].ToString(),
                            NombreAlmacen = dr["v_nombre_almacen"].ToString(),
                            NombreCategoria = dr["v_nombre_categoria"].ToString(),
                            NombreMoneda = dr["v_nombre_moneda"].ToString()
                        };

                        resultado.Add(producto);
                    }
                }
            }
            finally
            {
                Desconectar();
            }

            return resultado;
        }
        public Producto EncontrarProductoPorCodigo(string codigo)
        {
            Producto resultado = null;

            try
            {
                Conectar();

                cmd = new SqlCommand("sp_producto_buscar_id @codigo");
                cmd.Parameters.AddWithValue("@codigo", codigo);

                cmd.Connection = con;

                dr = cmd.ExecuteReader();

                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        Producto producto = new Producto
                        {

                            Codigo = dr["i_id_producto"].ToString(),
                            Nombre = dr["v_nombre_producto"].ToString(),
                            Descripcion = dr["v_descripcion_producto"].ToString(),
                            Precio = dr["d_precio_referencia_producto"].ToString(),
                            Marca = dr["i_id_marca"].ToString(),
                            Categoria = dr["i_id_categoria"].ToString(),
                            Almacen = dr["i_id_almacen"].ToString(),
                            Moneda = dr["i_id_moneda"].ToString(),
                            NombreMarca = dr["v_nombre_marca"].ToString(),
                            NombreAlmacen = dr["v_nombre_almacen"].ToString(),
                            NombreCategoria = dr["v_nombre_categoria"].ToString(),
                            NombreMoneda = dr["v_nombre_moneda"].ToString()
                        };

                        resultado = producto;
                    }
                }
            }
            finally
            {
                Desconectar();
            }

            return resultado;
        }
        public Producto EncontrarPorNombreProducto(string nombreProducto)
        {
            Producto resultado = null;

            try
            {
                Conectar();

                cmd = new SqlCommand("sp_producto_buscar_nombre @nombreProducto");
                cmd.Parameters.AddWithValue("@nombreProducto", nombreProducto);

                cmd.Connection = con;

                dr = cmd.ExecuteReader();

                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        Producto producto = new Producto
                        {

                            Codigo = dr["i_id_producto"].ToString(),
                            Nombre = dr["v_nombre_producto"].ToString(),
                            Descripcion = dr["v_descripcion_producto"].ToString(),
                            Precio = dr["d_precio_referencia_producto"].ToString(),
                            Marca = dr["i_id_marca"].ToString(),
                            Categoria = dr["i_id_categoria"].ToString(),
                            Almacen = dr["i_id_almacen"].ToString(),
                            Moneda = dr["i_id_moneda"].ToString(),
                            NombreMarca = dr["v_nombre_marca"].ToString(),
                            NombreAlmacen = dr["v_nombre_almacen"].ToString(),
                            NombreCategoria = dr["v_nombre_categoria"].ToString(),
                            NombreMoneda = dr["v_nombre_moneda"].ToString()
                        };

                        resultado = producto;
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
