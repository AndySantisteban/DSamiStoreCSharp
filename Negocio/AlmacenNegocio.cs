using Datos;
using Entidades;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Negocio
{
    public class AlmacenNegocio
    {
        private AlmacenDato almacenDato = new AlmacenDato();
        public List<Almacen> ConsultarAlmacenes()
        {
            List<Almacen> almacenes = almacenDato.ConsultarAlmacenes();

            return almacenes;
        }
    }
}
