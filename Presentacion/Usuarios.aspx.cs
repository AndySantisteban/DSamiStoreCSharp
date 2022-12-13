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
        private UsuarioNegocio usuarioNegocio = new UsuarioNegocio();
        private RolNegocio rolNegocio = new RolNegocio();
        private EmpleadoNegocio empleadoNegocio = new EmpleadoNegocio();
        private DataTable dtRol = new DataTable();
        private DataTable dtEmpleado = new DataTable();
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


                totalPagina = usuarioNegocio.ObtenerUsuariosCantidad(consulta, limite);
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
            List<Usuario> usuarios = usuarioNegocio.ObtenerUsuarios(consulta, pagina, limite);




            DataTable dt = new DataTable();
            dt.Columns.AddRange(new DataColumn[] {
                    new DataColumn("N"),
                    new DataColumn("Codigo"),
                    new DataColumn("NombreUsuario"),
                    new DataColumn("Empleado"),
                    new DataColumn("Rol")
                });

            for (int i = 0; i < usuarios.Count; i++)
            {
                dt.Rows.Add(i + 1, usuarios[i].Codigo, usuarios[i].NombreUsuario, usuarios[i].NombreEmpleado + " " + usuarios[i].ApellidoEmpleado, usuarios[i].NombreRol);
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
            TbNombreUsuarioSave.Text = "";
            TbClaveSave.Text = "";

            List<Rol> roles = rolNegocio.ConsultarRoles();
            dtRol.Columns.Add("id");
            dtRol.Columns.Add("nombre");
            for (int x = 0; x < roles.Count; x++)
            {
                dtRol.Rows.Add(roles[x].Codigo, roles[x].Nombre);
            }
            DropDownRolSave.DataValueField = "id";
            DropDownRolSave.DataTextField = "nombre";
            DropDownRolSave.DataSource = new DataView(dtRol);
            DropDownRolSave.DataBind();

            List<Empleado> empleados = empleadoNegocio.ConsultarEmpleado();
            dtEmpleado.Columns.Add("id");
            dtEmpleado.Columns.Add("nombre");

            for (int x = 0; x < empleados.Count; x++)
            {
                dtEmpleado.Rows.Add(empleados[x].CodigoEmpleado, empleados[x].Nombre + " " + empleados[x].ApellidoPaterno);
            }
            DropDownEmpleadoSave.DataValueField = "id";
            DropDownEmpleadoSave.DataTextField = "nombre";
            DropDownEmpleadoSave.DataSource = new DataView(dtEmpleado);
            DropDownEmpleadoSave.DataBind();


            ClientScript.RegisterStartupScript(this.GetType(), "Pop", "saveModal();", true);
        }

        protected void MostrarUpdateModal(object sender, EventArgs e)
        {
            int rowIndex = Convert.ToInt32(((sender as LinkButton).NamingContainer as GridViewRow).RowIndex);

            GridViewRow row = GridViewTable.Rows[rowIndex];

            string codigo = (row.FindControl("tlbCodigo") as Label).Text;

            Usuario usuario = usuarioNegocio.ObtenerUsuarioPorCodigo(codigo);


            TbCodigoUpdate.Text = usuario.Codigo;
            TbNombreUsuarioUpdate.Text = usuario.NombreUsuario;
            TbClaveUpdate.Text = usuario.Clave;

            List<Rol> roles = rolNegocio.ConsultarRoles();
            dtRol.Columns.Add("id");
            dtRol.Columns.Add("nombre");
            for (int x = 0; x < roles.Count; x++)
            {
                dtRol.Rows.Add(roles[x].Codigo, roles[x].Nombre);
                if (usuario.CodigoRol == roles[x].Codigo)
                {
                    DropDownRolUpdate.SelectedIndex = x;
                }
            }
            DropDownRolUpdate.DataValueField = "id";
            DropDownRolUpdate.DataTextField = "nombre";
            DropDownRolUpdate.DataSource = new DataView(dtRol);
            DropDownRolUpdate.DataBind();

            ClientScript.RegisterStartupScript(this.GetType(), "Pop", "updateModal();", true);
        }

        protected void MostrarDeleteModal(object sender, EventArgs e)
        {
            int rowIndex = Convert.ToInt32(((sender as LinkButton).NamingContainer as GridViewRow).RowIndex);

            GridViewRow row = GridViewTable.Rows[rowIndex];

            string codigo = (row.FindControl("tlbCodigo") as Label).Text;

            Usuario usuario = usuarioNegocio.ObtenerUsuarioPorCodigo(codigo);


            TbCodigoDelete.Text = usuario.Codigo;
            LbNombreUsuarioDelete.Text = usuario.NombreUsuario;


            ClientScript.RegisterStartupScript(this.GetType(), "Pop", "deleteModal();", true);
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            string nombreUsuario = TbNombreUsuarioSave.Text;
            string clave = TbClaveSave.Text;
            string codigoEmpleado = DropDownEmpleadoSave.SelectedValue;
            string codigoRol = DropDownRolSave.SelectedValue;

            try
            {
                usuarioNegocio.InsertarUsuario("", nombreUsuario, clave, codigoEmpleado, codigoRol);
                CargarDatos();
            }
            catch (Exception ex)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "Pop", "alert('" + ex.Message + "');", true);
            }

        }
        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            string codigo = TbCodigoUpdate.Text;
            string nombreUsuario = TbNombreUsuarioUpdate.Text;
            string clave= TbClaveUpdate.Text;
            string codigoRol = DropDownRolUpdate.SelectedValue;

            try
            {
                usuarioNegocio.ActualizarUsuario(codigo, nombreUsuario, clave, codigoRol);
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
                usuarioNegocio.EliminarUsuario(codigo);
                CargarDatos();
            }
            catch (Exception ex)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "Pop", "alert('" + ex.Message + "');", true);
            }
        }
    }
}