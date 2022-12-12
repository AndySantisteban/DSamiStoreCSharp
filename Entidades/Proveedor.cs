using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    internal class Proveedor : Persona
    {
        public string CodigoProveedor { get; set; }
        public string Empresa { get; set; }
        public string Direccion { get; set; }
        public string Tipo { get; set; }
        public string Documento { get; set; }
        public string RUC { get; set; }
        public string PaisProveedor { get; set; }
        public string Region { get; set; }
        public string Distrito { get; set; }
        public string Provincia { get; set; }
    }
}
