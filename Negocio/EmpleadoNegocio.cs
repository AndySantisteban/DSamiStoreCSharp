using Datos;
using Entidades;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Negocio
{
    public class EmpleadoNegocio
    {
        private EmpleadoDato empleadoDato = new EmpleadoDato();

        public List<Empleado> ConsultarEmpleado()
        {
            List<Empleado> empleados = empleadoDato.ConsultarEmpleado();

            return empleados;
        }
    }
}
