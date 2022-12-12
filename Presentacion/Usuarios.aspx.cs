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
            List<Usuario> usuarios = usuarioNegocio.ObtenerUsuarios("", 1, 5);

            for (int i = 0; i < usuarios.Count; i++)
            {
                TableRow tr = new TableRow();

                TableCell td = new TableCell();
                TableCell td1 = new TableCell();
                TableCell td2 = new TableCell();
                TableCell td3 = new TableCell();
                TableCell td4 = new TableCell();

                td.Text = (i + 1) + "";
                td1.Text = usuarios[i].NombreUsuario;
                td2.Text = usuarios[i].NombreEmpleado + " " + usuarios[i].ApellidoEmpleado;
                td3.Text = usuarios[i].NombreRol;
                td4.Text = "";

                tr.Cells.Add(td);
                tr.Cells.Add(td1);
                tr.Cells.Add(td2);
                tr.Cells.Add(td3);
                tr.Cells.Add(td4);

                Table1.Rows.Add(tr);
            }


        }
    }
}