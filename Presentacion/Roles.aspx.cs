using Entidades;
using Negocio;
using System;
using System.Collections.Generic;
using System.Data;
using System.Web.UI.WebControls;

namespace Presentacion
{
    public partial class Roles : System.Web.UI.Page
    {
        private RolNegocio rolNegocio = new RolNegocio();
        private DataTable dtLimite = new DataTable();
        private DataTable dtPagina = new DataTable();
        private string consulta = "";
        private int pagina = 1;
        private int totalPagina = 1;
        private int limite = 50;

        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                dtLimite.Columns.Add("valor");
                dtLimite.Columns.Add("texto");
                dtLimite.Rows.Add(5, "5");
                dtLimite.Rows.Add(10, "10");
                dtLimite.Rows.Add(25, "25");
                dtLimite.Rows.Add(50, "50");
                DropDownLimite.DataValueField = "valor";
                DropDownLimite.DataTextField = "texto";
                DropDownLimite.DataSource = new DataView(dtLimite);
                DropDownLimite.DataBind();
                DropDownLimite.SelectedIndex = 3;


                totalPagina = rolNegocio.ObtenerRolesCantidad(consulta, limite);
                dtPagina.Columns.Add("id");
                dtPagina.Columns.Add("nombre");
                for (int x = 0; x < totalPagina; x++)
                {
                    dtPagina.Rows.Add(x + 1, x + 1);
                }
                DropDownPagina.DataValueField = "id";
                DropDownPagina.DataTextField = "nombre";
                DropDownPagina.DataSource = new DataView(dtPagina);
                DropDownPagina.DataBind();
                CargarDatos();
            }

        }

        protected void CargarDatos()
        {
            List<Rol> roles = rolNegocio.ObtenerRoles(consulta, pagina, limite);


            DataTable dt = new DataTable();
            dt.Columns.AddRange(new DataColumn[] {
                    new DataColumn("N"),
                    new DataColumn("Codigo"),
                    new DataColumn("Nombre")
                });

            for (int i = 0; i < roles.Count; i++)
            {
                dt.Rows.Add(i + 1, roles[i].Codigo, roles[i].Nombre);
            }
            GridViewTable.DataSource = dt;
            GridViewTable.DataBind();

        }

        protected void CambiarLimite(object sender, EventArgs e)
        {
            limite = Convert.ToInt32(DropDownLimite.SelectedValue);
            CargarDatos();

        }

        protected void CambiarPagina(object sender, EventArgs e)
        {
            pagina = Convert.ToInt32(DropDownPagina.SelectedValue);
            CargarDatos();
        }

        protected void Buscar(object sender, EventArgs e)
        {
            consulta = TbBuscar.Text;
            CargarDatos();

        }

        protected void MostrarSaveModal(object sender, EventArgs e)
        {
            TbNombreSave.Text = "";

            ClientScript.RegisterStartupScript(this.GetType(), "Pop", "saveModal();", true);
        }

        protected void MostrarUpdateModal(object sender, EventArgs e)
        {
            int rowIndex = Convert.ToInt32(((sender as LinkButton).NamingContainer as GridViewRow).RowIndex);

            GridViewRow row = GridViewTable.Rows[rowIndex];

            string codigo = (row.FindControl("tlbCodigo") as Label).Text;

            Rol rol = rolNegocio.ObtenerRolPorCodigo(codigo);


            TbCodigoUpdate.Text = rol.Codigo;
            TbNombreUpdate.Text = rol.Nombre;

            ClientScript.RegisterStartupScript(this.GetType(), "Pop", "updateModal();", true);
        }

        protected void MostrarDeleteModal(object sender, EventArgs e)
        {
            int rowIndex = Convert.ToInt32(((sender as LinkButton).NamingContainer as GridViewRow).RowIndex);

            GridViewRow row = GridViewTable.Rows[rowIndex];

            string codigo = (row.FindControl("tlbCodigo") as Label).Text;

            Rol rol = rolNegocio.ObtenerRolPorCodigo(codigo);


            TbCodigoDelete.Text = rol.Codigo;
            LbNombreDelete.Text = rol.Nombre;


            ClientScript.RegisterStartupScript(this.GetType(), "Pop", "deleteModal();", true);
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            string nombre= TbNombreSave.Text;

            try
            {
                rolNegocio.InsertarRol("", nombre);
                CargarDatos();
            }
            catch (Exception ex)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "Pop", "alert('" + ex.Message + "');", true);
            }

        }
        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            try
            {
                string codigo = TbCodigoUpdate.Text;
                string nombre = TbNombreUpdate.Text;

                rolNegocio.ActualizarRol(codigo, nombre);
                CargarDatos();
            }
            catch (Exception ex)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "Pop", "alert('" + ex.Message + "');", true);
            }
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            string codigo = TbCodigoDelete.Text;

            try
            {
                rolNegocio.EliminarRol(codigo);
                CargarDatos();
            }
            catch (Exception ex)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "Pop", "alert('" + ex.Message + "');", true);
            }
        }
    }
}