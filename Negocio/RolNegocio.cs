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

        public List<Rol> ConsultarRoles()
        {
            List<Rol> roles = rolDato.ConsultarRoles();

            return roles;
        }

    }
}
