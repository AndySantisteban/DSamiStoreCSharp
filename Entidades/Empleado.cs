using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class Empleado: Persona
    {
        public string CodigoEmpleado { get; set; }
        public string Direccion { get; set; }
        public string TipoDocumento { get; set; }
        public string NumeroDocumento { get; set; }
        public string CodigoRegion { get; set; }
        public string CodigoDistrito { get; set; }
        public string CodigoProvincia { get; set; }
        public string CodigoPais { get; set; }
    }
}
