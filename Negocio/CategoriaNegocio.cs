using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Datos;
using Entidades;

namespace Negocio
{
    public class CategoriaNegocio
    {
        private CategoriaDato CategoriaD = new CategoriaDato();

        public void InsertarCategoria(string codigo, string nombre, string descripcion)
        {
            Categoria categoriaencontrada = CategoriaD.EncontrarPorNombreCategoria(nombre);
            if (categoriaencontrada != null)
            {
                throw new Exception("La categoria ya existe");
            }
            Categoria categoria = new Categoria
            {
                Codigo = codigo,
                Nombre = nombre,
                Descripcion = descripcion
            };
            CategoriaD.InsertarCategorias(categoria);
        }

        public void ActualizarCategoria(string codigo, string nombre, string descripcion)
        {
            Categoria categoria = CategoriaD.EncontrarCategoriaPorCodigo(codigo);
            if (categoria != null)
            {
                throw new Exception("Categoria no existe");
            }

            if (categoria.Nombre == nombre)
            {

            }
            else
            {
                Categoria categoriaNombre = CategoriaD.EncontrarPorNombreCategoria(nombre);
                if (categoriaNombre != null)
                {
                    throw new Exception("la categoria ya existe");
                }
                categoria.Nombre = nombre;
            }
            categoria.Nombre = nombre;
            CategoriaD.ActualizarCategoria(categoria);
        }

        public void EliminarCategoria(string codigo)
        {
            CategoriaD.EliminarCategoria(codigo);
        }


        public int ObtenerCategoriasCantidad(string consulta, int limite)
        {
            int cantidad = CategoriaD.EncontrarCategoriasCantidad(consulta, limite);
            return cantidad;


        }

        public List<Categoria> ObtenerCategorias(string consulta, int pagina, int limite)
        {
            List<Categoria> categorias = CategoriaD.EncontrarCategorias(consulta, pagina, limite);
            return categorias;

        }

        public Categoria ObtenerCategoriaPorCodigo(string codigo)
        {
            Categoria categoria = CategoriaD.EncontrarCategoriaPorCodigo(codigo);
            return categoria;
        }




    }
}
