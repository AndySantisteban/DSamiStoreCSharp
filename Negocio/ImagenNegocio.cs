using Datos;
using Entidades;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Negocio
{
    public class ImagenNegocio
    {
        private ImagenDato imagenDato = new ImagenDato();
        public List<Imagen> ConsultarImagenes()
        {
            List<Imagen> imagenes = imagenDato.ConsultarImagenes();

            return imagenes;
        }
    }
}
