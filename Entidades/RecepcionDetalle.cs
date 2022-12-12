using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    internal class RecepcionDetalle
    {
        public string Codigo { get; set; }
        public string CodigoRecepcion { get; set; }
        public string CodigoProducto { get; set; }
        public string PrecioRecepcion { get; set; }
        public string CantidadRecepcion { get; set; }
        public Recepcion Recepcion { get; set; }
        public Producto Producto { get; set; }
    }
}
