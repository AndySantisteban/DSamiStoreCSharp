using Entidades;
using Negocio;
using System.Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Presentacion
{
    public partial class Categorias : System.Web.UI.Page
    {
        
            private CategoriaNegocio categoriaNegocio = new CategoriaNegocio();
            private DataTable dtLimite = new DataTable();
            private DataTable dtPagina = new DataTable();
            private string consulta = "";
            private int pagina = 1;
            private int totalPagina = 1;
            private int limite = 5;
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
                    DropDownLimiteC.DataValueField = "valor";
                    DropDownLimiteC.DataTextField = "texto";
                    DropDownLimiteC.DataSource = new DataView(dtLimite);
                    DropDownLimiteC.DataBind();


                    totalPagina = categoriaNegocio.ObtenerCategoriasCantidad(consulta, limite);

                    dtPagina.Columns.Add("id");
                    dtPagina.Columns.Add("nombre");
                    for (int x = 0; x < totalPagina; x++)
                    {
                        dtPagina.Rows.Add(x + 1, x + 1);
                    }
                    DropDownPaginaC.DataValueField = "id";
                    DropDownPaginaC.DataTextField = "nombre";
                    DropDownPaginaC.DataSource = new DataView(dtPagina);
                    DropDownPaginaC.DataBind();
                    CargarDatos();
                }
            }

            protected void CargarDatos()
            {
                List<Entidades.Categoria> categoria = categoriaNegocio.ObtenerCategorias(consulta, pagina, limite);




                DataTable dt = new DataTable();
                dt.Columns.AddRange(new DataColumn[] {
                    new DataColumn("N"),
                    new DataColumn("Codigo"),
                    new DataColumn("Nombre"),
                    new DataColumn("Descripcion"),

                });

                for (int i = 0; i < categoria.Count; i++)
                {
                    dt.Rows.Add(i + 1, categoria[i].Codigo, categoria[i].Nombre, categoria[i].Descripcion);
                }
                GridViewTableC.DataSource = dt;
                GridViewTableC.DataBind();

            }


            protected void CambiarLimiteC(object sender, EventArgs e)
            {
                limite = Convert.ToInt32(DropDownLimiteC.SelectedValue);
                CargarDatos();

            }

            protected void CambiarPaginaC(object sender, EventArgs e)
            {
                pagina = Convert.ToInt32(DropDownPaginaC.SelectedValue);
                CargarDatos();
            }

            protected void BuscarC(object sender, EventArgs e)
            {
                consulta = TbBuscarC.Text;
                CargarDatos();

            }

            protected void MostrarSaveModalC(object sender, EventArgs e)
            {
                TbNombreCategoriaSave.Text = "";
                TbDescripcionCategoriaSave.Text = "";

                ClientScript.RegisterStartupScript(this.GetType(), "Pop", "saveModalC();", true);
            }

            protected void MostrarUpdateModalC(object sender, EventArgs e)
            {
            int rowIndex = Convert.ToInt32(((sender as LinkButton).NamingContainer as GridViewRow).RowIndex);

                GridViewRow row = GridViewTableC.Rows[rowIndex];

                string codigo = (row.FindControl("tlbCodigoC") as Label).Text;


                // Categoria categoria = categoriaNegocio.ObtenerCategoriaPorCodigo(codigo);



                // TbCodigoUpdateC.Text = categoria.Codigo  ;
                // TbNombreCategoriaUpdate.Text = categoria.Nombre;


                ClientScript.RegisterStartupScript(this.GetType(), "Pop", "updateModalC();", true);
            }

            protected void MostrarDeleteModalC(object sender, EventArgs e)
            {
                int rowIndex = Convert.ToInt32(((sender as LinkButton).NamingContainer as GridViewRow).RowIndex);

                GridViewRow row = GridViewTableC.Rows[rowIndex];

                string codigo = (row.FindControl("tlbCodigoC") as Label).Text;

                Categoria categoria = categoriaNegocio.ObtenerCategoriaPorCodigo(codigo);


                TbCodigoDeleteC.Text = categoria.Codigo;
                LbNombreCategoriaDelete.Text = categoria.Nombre;


                ClientScript.RegisterStartupScript(this.GetType(), "Pop", "deleteModalC();", true);
            }

            protected void btnSave_ClickC(object sender, EventArgs e)
            {
                string nombreCategoria = TbNombreCategoriaSave.Text;
                string descripcion = TbDescripcionCategoriaSave.Text;


                try
                {
                    categoriaNegocio.InsertarCategoria("", nombreCategoria, descripcion);
                    CargarDatos();
                }
                catch (Exception ex)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "Pop", "alert('" + ex.Message + "');", true);
                }

            }
            protected void btnUpdate_ClickC(object sender, EventArgs e)
            {
                string codigo = TbCodigoUpdateC.Text;
                string nombreCategoria = TbNombreCategoriaUpdate.Text;
                string descrripcion = TbNombreDescripcionUpdate.Text;


                try
                {
                    categoriaNegocio.ActualizarCategoria(codigo, nombreCategoria, descrripcion);
                    CargarDatos();
                }
                catch (Exception ex)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "Pop", "alert('" + ex.Message + "');", true);
                }
            }

            protected void btnDelete_ClickC(object sender, EventArgs e)
            {
                string codigo = TbCodigoDeleteC.Text;

                try
                {
                    categoriaNegocio.EliminarCategoria(codigo);
                    CargarDatos();
                }
                catch (Exception ex)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "Pop", "alert('" + ex.Message + "');", true);
                }
            }



        }
    
}