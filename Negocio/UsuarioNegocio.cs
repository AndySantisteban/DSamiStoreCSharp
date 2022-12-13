using Datos;
using Entidades;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Negocio
{
    public class UsuarioNegocio
    {
        private UsuarioDato usuarioDato = new UsuarioDato();
        private Encrypt encrypt = new Encrypt();

        public void InsertarUsuario(string codigo, string nombreUsuario, string clave, string codigoEmpleado, string codigoRol)
        {
            Usuario usuarioEncontrato = usuarioDato.EncontrarPorNombreUsuario(nombreUsuario);

            if (usuarioEncontrato != null)
            {
                throw new Exception("Nombre de usuario ya existe");
            }

            clave = encrypt.Generate(clave);

            Usuario usuario = new Usuario
            {
                Codigo = codigo,
                NombreUsuario = nombreUsuario,
                Clave = clave,
                CodigoEmpleado = codigoEmpleado,
                CodigoRol = codigoRol
            };

            usuarioDato.InsertarUsuario(usuario);
        }

        public void ActualizarUsuario(string codigo, string nombreUsuario, string clave, string codigoRol)
        {
            Usuario usuario = usuarioDato.EncontrarUsuarioPorCodigo(codigo);

            if (usuario == null)
            {
                throw new Exception("Usuario no existe");
            }


            if (usuario.NombreUsuario == nombreUsuario)
            {

            } else
            {
                Usuario usuarioEncontrato = usuarioDato.EncontrarPorNombreUsuario(nombreUsuario);

                if (usuarioEncontrato != null)
                {
                    throw new Exception("Nombre de usuario ya existe");
                }

                usuario.NombreUsuario = nombreUsuario;
            }

            usuario.CodigoRol = codigoRol;

            usuarioDato.ActualizarUsuario(usuario);
        }

        public void EliminarUsuario(string codigo)
        {
            usuarioDato.EliminarUsuario(codigo);
        }

        public List<Usuario> ConsultarUsuarios()
        {
            List<Usuario> usuarios = usuarioDato.ConsultarUsuario();

            return usuarios;
        }

        public int ObtenerUsuariosCantidad(string consulta, int limite)
        {
            int cantidad = usuarioDato.EncontrarUsuariosCantidad(consulta, limite);

            return cantidad;
        }

        public List<Usuario> ObtenerUsuarios(string consulta, int pagina, int limite)
        {
            List<Usuario> usuarios = usuarioDato.EncontrarUsuarios(consulta, pagina, limite);

            return usuarios;
        }

        public Usuario ObtenerUsuarioPorCodigo(string codigo)
        {
            Usuario usuario = usuarioDato.EncontrarUsuarioPorCodigo(codigo);

            return usuario;
        }

        public Usuario Ingresar(string nombreUsuario, string clave)
        {
            Usuario usuario = usuarioDato.EncontrarPorNombreUsuario(nombreUsuario);

            if (nombreUsuario == null)
            {
                throw new Exception("Usuario no existe");
            }

            if (!encrypt.verify(clave, usuario.Clave))
            {
                throw new Exception("Clave incorrecta");
            }

            return usuario;
        }
    }
}
