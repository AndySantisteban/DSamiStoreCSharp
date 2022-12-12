using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    internal class Persona
    {
        public string Codigo { get; set; }
        public string Nombre { get; set; }
        public string ApellidoPaterno { get; set; }
        public string ApellidoMaterno { get; set; }
        public string CodigoDocumento { get; set; }
        public string FechaNacimiento { get; set; }
        public string Ubicacion { get; set; }
        public Pais Pais { get; set; }
    }
}
