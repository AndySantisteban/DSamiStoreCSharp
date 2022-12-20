using Datos;
using Entidades;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Negocio
{
    public class MarcaNegocio
    {
        private MarcaDato marcaDato = new MarcaDato();
        public List<Marca> ConsultarMarcas()
        {
            List<Marca> marcas = marcaDato.ConsultarMarcas();

            return marcas;
        }
    }
}
