using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    internal class Recepcion
    {
        public string Codigo { get; set; }
        public string Empleado { get; set; }
        public string Proveedor { get; set; }
        public string FechaPedido { get; set; }
        public string FechaRespuesta { get; set; }
        public string Estado { get; set; }
    }
}
