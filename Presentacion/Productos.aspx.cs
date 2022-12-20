using Entidades;
using Negocio;
using System;
using System.Collections.Generic;
using System.Data;
using System.Web.UI.WebControls;

namespace Presentacion
{
    public partial class Productos : System.Web.UI.Page
    {
        private ProductoNegocio productoNegocio = new ProductoNegocio();
        private MarcaNegocio marcaNegocio = new MarcaNegocio();
        private CategoriaNegocio categoriaNegocio = new CategoriaNegocio();
        private AlmacenNegocio almacenNegocio = new AlmacenNegocio();
        private MonedaNegocio monedaNegocio = new MonedaNegocio();
        private DataTable dtMarca = new DataTable();
        private DataTable dtCategoria = new DataTable();
        private DataTable dtAlmacen = new DataTable();
        private DataTable dtMoneda = new DataTable();
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


                totalPagina = productoNegocio.ObtenerProductosCantidad(consulta, limite);
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
            List<Producto> productos = productoNegocio.ObtenerProductos(consulta, pagina, limite);




            DataTable dt = new DataTable();
            dt.Columns.AddRange(new DataColumn[] {
                    new DataColumn("N"),
                    new DataColumn("Codigo"),
                    new DataColumn("Nombre"),
                    new DataColumn("Descripcion"),
                    new DataColumn("Precio"),
                    new DataColumn("Marca"),
                    new DataColumn("Categoria"),
                    new DataColumn("Almacen"),
                    new DataColumn("Moneda")
                });

            for (int i = 0; i < productos.Count; i++)
            {
                dt.Rows.Add(i + 1, productos[i].Codigo, productos[i].Nombre, productos[i].Descripcion, productos[i].Precio, productos[i].NombreMarca,
                    productos[i].NombreCategoria, productos[i].NombreAlmacen, productos[i].NombreMoneda);
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
            TbNombreProductoSave.Text = "";
            TbDescripcionSave.Text = "";
            TbPrecioSave.Text = "";

            List<Marca> marcas = marcaNegocio.ConsultarMarcas();
            dtMarca.Columns.Add("id");
            dtMarca.Columns.Add("nombre");
            for (int x = 0; x < marcas.Count; x++)
            {
                dtMarca.Rows.Add(marcas[x].Codigo, marcas[x].Nombre);
            }
            DropDownMarcaSave.DataValueField = "id";
            DropDownMarcaSave.DataTextField = "nombre";
            DropDownMarcaSave.DataSource = new DataView(dtMarca);
            DropDownMarcaSave.DataBind();

            List<Categoria> categorias = categoriaNegocio.ConsultarCategorias();
            dtCategoria.Columns.Add("id");
            dtCategoria.Columns.Add("nombre");

            for (int x = 0; x < categorias.Count; x++)
            {
                dtCategoria.Rows.Add(categorias[x].Codigo, categorias[x].Nombre);
            }
            DropDownCategoriaSave.DataValueField = "id";
            DropDownCategoriaSave.DataTextField = "nombre";
            DropDownCategoriaSave.DataSource = new DataView(dtCategoria);
            DropDownCategoriaSave.DataBind();

            List<Almacen> almacenes = almacenNegocio.ConsultarAlmacenes();
            dtAlmacen.Columns.Add("id");
            dtAlmacen.Columns.Add("nombre");

            for (int x = 0; x < almacenes.Count; x++)
            {
                dtAlmacen.Rows.Add(almacenes[x].Codigo, almacenes[x].Nombre);
            }
            DropDownAlmacenSave.DataValueField = "id";
            DropDownAlmacenSave.DataTextField = "nombre";
            DropDownAlmacenSave.DataSource = new DataView(dtAlmacen);
            DropDownAlmacenSave.DataBind();

            List<Moneda> monedas = monedaNegocio.ConsultarMonedas();
            dtMoneda.Columns.Add("id");
            dtMoneda.Columns.Add("nombre");

            for (int x = 0; x < monedas.Count; x++)
            {
                dtMoneda.Rows.Add(monedas[x].Codigo, monedas[x].Nombre);
            }
            DropDownMonedaSave.DataValueField = "id";
            DropDownMonedaSave.DataTextField = "nombre";
            DropDownMonedaSave.DataSource = new DataView(dtAlmacen);
            DropDownMonedaSave.DataBind();


            ClientScript.RegisterStartupScript(this.GetType(), "Pop", "saveModal();", true);
        }

        protected void MostrarUpdateModal(object sender, EventArgs e)
        {
            int rowIndex = Convert.ToInt32(((sender as LinkButton).NamingContainer as GridViewRow).RowIndex);

            GridViewRow row = GridViewTable.Rows[rowIndex];

            string codigo = (row.FindControl("tlbCodigo") as Label).Text;

            Producto producto = productoNegocio.ObtenerProductoPorCodigo(codigo);


            TbCodigoUpdate.Text = producto.Codigo;
            TbNombreProductoUpdate.Text = producto.Nombre;
            TbDescripcionUpdate.Text = producto.Descripcion;
            TbPrecioUpdate.Text = Convert.ToString(producto.Precio);
            List<Marca> marcas = marcaNegocio.ConsultarMarcas();
            dtMarca.Columns.Add("id");
            dtMarca.Columns.Add("nombre");
            for (int x = 0; x < marcas.Count; x++)
            {
                dtMarca.Rows.Add(marcas[x].Codigo, marcas[x].Nombre);
            }
            DropDownMarcaUpdate.DataValueField = "id";
            DropDownMarcaUpdate.DataTextField = "nombre";
            DropDownMarcaUpdate.DataSource = new DataView(dtMarca);
            DropDownMarcaUpdate.DataBind();

            List<Categoria> categorias = categoriaNegocio.ConsultarCategorias();
            dtCategoria.Columns.Add("id");
            dtCategoria.Columns.Add("nombre");

            for (int x = 0; x < categorias.Count; x++)
            {
                dtCategoria.Rows.Add(categorias[x].Codigo, categorias[x].Nombre);
            }
            DropDownCategoriaUpdate.DataValueField = "id";
            DropDownCategoriaUpdate.DataTextField = "nombre";
            DropDownCategoriaUpdate.DataSource = new DataView(dtCategoria);
            DropDownCategoriaUpdate.DataBind();

            List<Almacen> almacenes = almacenNegocio.ConsultarAlmacenes();
            dtAlmacen.Columns.Add("id");
            dtAlmacen.Columns.Add("nombre");

            for (int x = 0; x < almacenes.Count; x++)
            {
                dtAlmacen.Rows.Add(almacenes[x].Codigo, almacenes[x].Nombre);
            }
            DropDownAlmacenUpdate.DataValueField = "id";
            DropDownAlmacenUpdate.DataTextField = "nombre";
            DropDownAlmacenUpdate.DataSource = new DataView(dtAlmacen);
            DropDownAlmacenUpdate.DataBind();

            List<Moneda> monedas = monedaNegocio.ConsultarMonedas();
            dtMoneda.Columns.Add("id");
            dtMoneda.Columns.Add("nombre");

            for (int x = 0; x < monedas.Count; x++)
            {
                dtMoneda.Rows.Add(monedas[x].Codigo, monedas[x].Nombre);
            }
            DropDownMonedaUpdate.DataValueField = "id";
            DropDownMonedaUpdate.DataTextField = "nombre";
            DropDownMonedaUpdate.DataSource = new DataView(dtAlmacen);
            DropDownMonedaUpdate.DataBind();

            ClientScript.RegisterStartupScript(this.GetType(), "Pop", "updateModal();", true);
        }

        protected void MostrarDeleteModal(object sender, EventArgs e)
        {
            int rowIndex = Convert.ToInt32(((sender as LinkButton).NamingContainer as GridViewRow).RowIndex);

            GridViewRow row = GridViewTable.Rows[rowIndex];

            string codigo = (row.FindControl("tlbCodigo") as Label).Text;

            Producto producto = productoNegocio.ObtenerProductoPorCodigo(codigo);


            TbCodigoDelete.Text = producto.Codigo;
            LbNombreProductoDelete.Text = producto.Nombre;


            ClientScript.RegisterStartupScript(this.GetType(), "Pop", "deleteModal();", true);
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            string nombreProducto = TbNombreProductoSave.Text;
            string descripcion = TbDescripcionSave.Text;
            string precio = TbPrecioSave.TextMode.ToString();
            string codigoMarca = DropDownMarcaSave.SelectedValue;
            string codigoCategoria = DropDownCategoriaSave.SelectedValue;
            string codigoAlmacen = DropDownAlmacenSave.SelectedValue;
            string codigoMoneda = DropDownMonedaSave.SelectedValue;

            try
            {
                productoNegocio.InsertarProducto("", nombreProducto,descripcion,precio,codigoMarca,codigoCategoria,codigoAlmacen,codigoMoneda);
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
            string nombreProducto = TbNombreProductoUpdate.Text;
            string descripcion = TbDescripcionUpdate.Text;
            string precio = TbPrecioUpdate.TextMode.ToString();
            string codigoMarca = DropDownMarcaUpdate.SelectedValue;
            string codigoCategoria = DropDownCategoriaUpdate.SelectedValue;
            string codigoAlmacen = DropDownAlmacenUpdate.SelectedValue;
            string codigoMoneda = DropDownMonedaUpdate.SelectedValue;

            try
            {
                productoNegocio.ActualizarProducto(codigo, nombreProducto, descripcion, precio, codigoMarca, codigoCategoria,codigoAlmacen, codigoMoneda);
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
                productoNegocio.EliminarProducto(codigo);
                CargarDatos();
            }
            catch (Exception ex)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "Pop", "alert('" + ex.Message + "');", true);
            }
        }
    }
}