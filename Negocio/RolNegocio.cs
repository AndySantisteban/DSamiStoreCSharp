using Datos;
using Entidades;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Negocio
{
    public class RolNegocio
    {
        private RolDato rolDato = new RolDato();

        public void InsertarRol(string codigo, string nombre)
        {
            Rol rolEncontrato = rolDato.EncontrarRolPorNombre(nombre);

            if (rolEncontrato != null)
            {
                throw new Exception("Nombre ya existe");
            }

            Rol rol = new Rol
            {
                Codigo = codigo,
                Nombre = nombre
            };

            rolDato.InsertarRol(rol);
        }

        public void ActualizarRol(string codigo, string nombre)
        {
            Rol rol = rolDato.EncontrarRolPorCodigo(codigo);

            if (rol == null)
            {
                throw new Exception("Rol no existe");
            }


            if (rol.Nombre == nombre)
            {

            }
            else
            {

                Rol rolEncontrato = rolDato.EncontrarRolPorNombre(nombre);

                if (rolEncontrato != null)
                {
                    throw new Exception("Nombre ya existe");
                }

                rol.Nombre = nombre;
            }


            rolDato.ActualizarRol(rol);
        }

        public void EliminarRol(string codigo)
        {
            rolDato.EliminarRol(codigo);
        }

        public int ObtenerRolesCantidad(string consulta, int limite)
        {
            int cantidad = rolDato.EncontrarRolesCantidad(consulta, limite);

            return cantidad;
        }

        public List<Rol> ObtenerRoles(string consulta, int pagina, int limite)
        {
            List<Rol> roles = rolDato.EncontrarRoles(consulta, pagina, limite);

            return roles;
        }

        public Rol ObtenerRolPorCodigo(string codigo)
        {
            Rol rol = rolDato.EncontrarRolPorCodigo(codigo);

            return rol;
        }

        public List<Rol> ConsultarRoles()
        {
            List<Rol> roles = rolDato.ConsultarRoles();

            return roles;
        }

    }
}
