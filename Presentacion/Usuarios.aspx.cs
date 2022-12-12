using Entidades;
using Negocio;
using System;
using System.Collections.Generic;
using System.Data;
using System.Web.UI.WebControls;

namespace Presentacion
{
    public partial class Usuarios : System.Web.UI.Page
    {
        public UsuarioNegocio usuarioNegocio = new UsuarioNegocio();

        protected void Page_Load(object sender, EventArgs e)
        {
            List<Usuario> usuarios = usuarioNegocio.ObtenerUsuarios("", 1, 5);

            if (!IsPostBack)
            {
                DataTable dt = new DataTable();
                dt.Columns.AddRange(new DataColumn[] {
                    new DataColumn("Codigo"),
                    new DataColumn("NombreUsuario"),
                    new DataColumn("Empleado"),
                    new DataColumn("Rol")
                });

                for (int i = 0; i < usuarios.Count; i++)
                {
                    dt.Rows.Add(usuarios[i].Codigo, usuarios[i].NombreUsuario, usuarios[i].NombreEmpleado + " " + usuarios[i].ApellidoEmpleado, usuarios[i].NombreRol);
                }
                GridView1.DataSource = dt;
                GridView1.DataBind();
            }

        }

        protected void Display(object sender, EventArgs e)
        {
            int rowIndex = Convert.ToInt32(((sender as LinkButton).NamingContainer as GridViewRow).RowIndex);

            GridViewRow row = GridView1.Rows[rowIndex];

            string codigo = (row.FindControl("tlbCodigo") as Label).Text;

            Usuario usuario = usuarioNegocio.ObtenerUsuarioPorCodigo(codigo);

            flbCodigo.Text = usuario.Codigo;
            flbNombreUsuario.Text = usuario.NombreUsuario;
            ClientScript.RegisterStartupScript(this.GetType(), "Pop", "openModal();", true);
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            //Your Saving code.
        }
    }
}