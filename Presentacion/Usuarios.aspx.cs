using Entidades;
using Negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection.Emit;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Presentacion
{
    public partial class Usuarios : System.Web.UI.Page
    {
        public UsuarioNegocio usuarioNegocio = new UsuarioNegocio();

        protected void Page_Load(object sender, EventArgs e)
        {
            Usuario usuario = usuarioNegocio.Ingresar("jose", "jose");

            NombreUsuarioLabel.Text = usuario.ApellidoEmpleado;
        }
    }
}