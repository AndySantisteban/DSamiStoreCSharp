using Datos;
using Entidades;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Negocio
{
    public class MonedaNegocio
    {
        private MonedaDato monedaDato = new MonedaDato();
        public List<Moneda> ConsultarMonedas()
        {
            List<Moneda> monedas = monedaDato.ConsultarMonedas();

            return monedas;
        }
    }
}
