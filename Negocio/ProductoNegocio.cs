using Datos;
using Entidades;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;
using static System.Net.Mime.MediaTypeNames;

namespace Negocio
{
    public class ProductoNegocio
    {
        private ProductoDato productoDato = new ProductoDato();

        public void InsertarProducto(string codigo, string nombreProducto, string descripcion, string precio, 
            string codigoMarca, string codigoCategoria, string codigoAlmacen, string codigoMoneda)
        {
            Producto productoEncontrato = productoDato.EncontrarPorNombreProducto(nombreProducto);

            if (productoEncontrato != null)
            {
                throw new Exception("Nombre de producto ya existe");
            }


            Producto producto = new Producto
            {
                Codigo = codigo,
                Nombre = nombreProducto,
                Descripcion = descripcion,
                Precio = precio,
                Marca = codigoMarca,
                Categoria = codigoCategoria,
                Almacen = codigoAlmacen,
                Moneda = codigoMoneda
            };

            productoDato.InsertarProducto(producto);
        }
        public void ActualizarProducto(string codigo, string nombreProducto, string descripcion, string precio,
            string codigoMarca, string codigoCategoria, string codigoAlmacen, string codigoMoneda)
        {
            Producto producto = productoDato.EncontrarProductoPorCodigo(codigo);

            if (producto == null)
            {
                throw new Exception("Producto no existe");
            }


            if (producto.Nombre == nombreProducto)
            {

            }
            else
            {
                Producto productoEncontrato = productoDato.EncontrarPorNombreProducto(nombreProducto);

                if (productoEncontrato != null)
                {
                    throw new Exception("Nombre de producto ya existe");
                }

                producto.Nombre = nombreProducto;
            }

            producto.Descripcion = descripcion;
            producto.Precio = precio;
            producto.Marca = codigoMarca;
            producto.Categoria = codigoCategoria;
            producto.Almacen = codigoAlmacen;
            producto.Moneda = codigoMoneda;

            productoDato.ActualizarProducto(producto);
        }
        public void EliminarProducto(string codigo)
        {
            productoDato.EliminarProducto(codigo);
        }

        public List<Producto> ConsultarProductos()
        {
            List<Producto> productos = productoDato.ConsultarProducto();

            return productos;
        }

        public int ObtenerProductosCantidad(string consulta, int limite)
        {
            int cantidad = productoDato.EncontrarProductosCantidad(consulta, limite);

            return cantidad;
        }

        public List<Producto> ObtenerProductos(string consulta, int pagina, int limite)
        {
            List<Producto> productos = productoDato.EncontrarProductos(consulta, pagina, limite);

            return productos;
        }

        public Producto ObtenerProductoPorCodigo(string codigo)
        {
            Producto producto = productoDato.EncontrarProductoPorCodigo(codigo);

            return producto;
        }
    }
}
