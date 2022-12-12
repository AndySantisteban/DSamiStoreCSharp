using Entidades;
using Negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Presentacion
{
    public partial class Default : System.Web.UI.Page
    {
        public UsuarioNegocio usuarioNegocio = new UsuarioNegocio();

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void BtnCreate_Click(object sender, EventArgs e)
        {
            string username = tbUsername.Text;
            string password = tbPassword.Text;

            if (username == "")
            {
                lbMsg.Text = "Nombre de usuairo es requerido";
                return;
            }
            
            if (password == "")
            {
                lbMsg.Text = "Clave es requerido";
                return;
            }

            try
            {
                Usuario usuario = usuarioNegocio.Ingresar(username, password);

                Response.Redirect("/usuarios");

            }
            catch (Exception ex)
            {
                lbMsg.Text = ex.Message;
            }
        }
    }
}