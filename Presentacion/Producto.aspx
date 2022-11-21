<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeFeli="Producto.aspx.cs" Inherits="Presentacion.Producto" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous" defer></script>
  <div class="container px-4">
    <div class="py-4 bd-highlight row">
        <div class="title-proveedores py-2">
            <h2>Productos</h2>
        </div>

        <div class="d-flex justify-content-between align-items-center">
            <div>
                <button type="button" class="btn btn-primary" data-bs-toggle="modal"
                        data-bs-target="#agregar">Agregar
                </button>
            </div>

            <div class="d-flex">
                <input type="text" class="form-control me-2" placeholder="Buscar un producto" aria-label="Recipient's username" aria-describedby="basic-addon2">
                <button class="btn btn-primary" id="basic-addon2" type="button ">Buscar</button>
            </div>
        </div>
    </div>
    <!-- Modal para Agregar-->
    <div class="modal fade modal-lg" id="agregar" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
      <div class="modal-dialog modal-dialog-centered">
          <div class="modal-content">
              <form name="form-data" action="productos" method="POST">
                  <div class="modal-header">
                      <h5 class="modal-title" id="staticBackdropLabel">Agregar producto</h5>
                      <button type="button" class="btn-close p-2" data-bs-dismiss="modal" aria-label="Close"></button>
                  </div>

                  <div class="modal-body row">
                      <div class="form-group col-md-6">
                          <div>
                              <label for="agregar-nombre" class="col-form-label">Nombre</label>
                              <input type="text" class="form-control" id="agregar-nombre" name="crearNombre" placeholder="Agregar nombre" required autofocus>
                          </div>

                          <div>
                              <label for="agregar-descripcion" class="col-form-label">Apellido Paterno</label>
                              <input type="text" class="form-control" id="agregar-descripcion" name="creardescripcion" placeholder="Agregar descripcion" required>
                          </div>

                          <div>
                              <label for="agregar-precio" class="col-form-label">Apellido Materno</label>
                              <input type="text" class="form-control" id="agregar-precio" name="crearPrecio" placeholder="Agregar precio" required>
                          </div>

                      </div>

                      <div class="form-group col-md-6">
                          <div>
                              <label for="agregar-idMarca" class="col-form-label">Marca</label>
                              <select class="form-select" id="agregar-idMarca" accion="idMarca" name="idMarca" aria-label=".form-select-sm example">
                                  <option selected>Seleccionar Marca</option>
                              </select>
                          </div>

                          <div>
                              <label  for="agregar-idCategoria" class="col-form-label">Categoria</label>
                              <select class="form-select" id="agregar-idCategoria" accion="idCategoria" name="idCategoria" aria-label=".form-select-sm example">
                                  <option selected>Seleccionar Categoria</option>
                              </select>                                                                                                    
                          </div>

                          <div>
                              <label for="agregar-idAlmacen" class="col-form-label">Almacen</label>
                              <select class="form-select" id="agregar-idAlmacen" accion="idAlmacen" name="idAlmacen" aria-label=".form-select-sm example">
                                  <option selected>Seleccionar Almacen</option>
                              </select>
                          </div>

                          <div>
                              <label for="agregar-idMoneda" class="col-form-label">Moneda</label>
                              <select class="form-select" id="agregar-idMoneda" accion="idMoneda" name="idMoneda" aria-label=".form-select-sm example">
                                  <option selected>Seleccionar Moneda</option>
                              </select>
                          </div>

                      </div>
                  </div>

                  <div class="modal-footer">
                      <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                      <input type="submit" class="btn btn-primary"  name="accion" value="agregar" />
                  </div>
              </form>
          </div>
      </div>
  </div>
<!-- Mostrar tabla -->
<div class="card">
  <div class="table-responsive">
      <table class="table table-borderless">
          <thead>
              <tr>
                  <th scope="col">N°</th>
                  <th scope="col">Nombres</th>
                  <th scope="col">Descripcion</th>
                  <th scope="col">Precio</th>
                  <th scope="col">Marca</th>
                  <th scope="col">Categoria</th>
                  <th scope="col">Almacen</th>
                  <th scope="col">Moneda</th>
                  <th scope="col" class="text-center">Acciones</th>
              </tr>
          </thead>
          <tbody>
              <c:forEach var="producto" items="${productos}" varStatus="loop">
                  <tr>
                      <td>1</td>
                      <td>Pasta Dental Colgate Triple Acción menta tubo 100 ml Pack 3 unid</td>
                      <td>Pasta Dental Colgate Triple Acción menta tubo 100 ml Pack 3 unid</td>
                      <td>16.0</td>
                      <td>Visibush</td>
                      <td>Pastas dentales</td>
                      <td>Tienda central</td>
                      <td>Sol</td>
                      <td>
                          <div class="d-flex justify-content-center">
                              <button class="btn btn-secondary me-2" type="button" data-bs-toggle="modal" data-bs-target="#editarProducto">Editar</button>

                              <!--ventana para Editar--->
                              <div class="modal fade modal-lg" id="editarProducto" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" role="dialog" aria-hidden="true" aria-labelledby="editaCat">
                                  <div class="modal-dialog modal-dialog-centered">
                                      <div class="modal-content">
                                          <div class="modal-header">
                                              <h5 class="modal-title" id="staticBackdropLabel">Editar producto</h5>
                                              <button type="button" class="btn-close p-2" data-bs-dismiss="modal" aria-label="Close"></button>
                                          </div>

                                          <form name="form-data" action="productos" method="POST">
                                              <input type="hidden" name="idProducto" value="${producto.getCodigoProducto()}">

                                              <div class="modal-body row" id="cont_modal">
                                                  <div class="form-group col-md-6">
                                                      <div>
                                                          <label for="editar-nombre" class="col-form-label">Nombre</label>
                                                          <input type="text" class="form-control" id="editar-nombre" name="nombre" placeholder="Editar nombre" value="Pasta Dental Colgate Triple Acción menta tubo 100 ml Pack 3 unid" required="true">
                                                      </div>

                                                      <div>
                                                          <label for="editar-descripcion" class="col-form-label">Descripcion</label>
                                                          <input type="text" class="form-control" id="editar-descripcion" name="editardescripcion" value="Pasta Dental Colgate Triple Acción menta tubo 100 ml Pack 3 unid" placeholder="Editar descripcion" required>
                                                      </div>

                                                      <div>
                                                          <label for="editar-precio" class="col-form-label">Precio</label>
                                                          <input type="text" class="form-control" id="editar-precio" name="editarprecio" value="16.0" placeholder="Editar precio" required>
                                                      </div>

                                                  </div>

                                                  <div class="form-group col-md-6">
                                                      <div>
                                                          <label for="editar-idMarca" class="col-form-label">Marca</label>
                                                          <select class="form-select" id="editar-idMarca-${producto.getCodigoproducto()}" accion="idMarca" name="idMarca" value="Visibush" aria-label=".form-select-sm example">
                                                              <option>Visibush</option>
                                                          </select>
                                                      </div>

                                                      <div>
                                                          <label for="editar-idCategoria" class="col-form-label">Categoria</label>
                                                          <select class="form-select" id="editar-idCategoria-${producto.getCodigoproducto()}" accion="idCategoria" name="idCategoria"value="Pastas dentales" aria-label=".form-select-sm example">
                                                              <option>Pastas dentales</option>
                                                          </select>
                                                      </div>

                                                      <div>
                                                          <label for="editar-idAlmacen" class="col-form-label">Almacen</label>
                                                          <select class="form-select" id="editar-idAlmacen-${producto.getCodigoproducto()}" accion="idAlmacen" name="idAlmacen"value="Tienda central" aria-label=".form-select-sm example">
                                                              <option>Tienda central</option>
                                                          </select>
                                                      </div>

                                                      <div>
                                                          <label for="editar-idMoneda" class="col-form-label">Moneda</label>
                                                          <select class="form-select" id="editar-idMoneda-${producto.getCodigoproducto()}" accion="idMoneda" name="idMoneda" value="Sol" aria-label=".form-select-sm example">
                                                              <option>Sol</option>
                                                          </select>
                                                      </div>

                                                  </div>
                                              </div>

                                              <div class="modal-footer">
                                                  <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                                                  <input  type="submit" name="accion" value="editar" class="btn btn-primary" />
                                              </div>
                                          </form>
                                      </div>
                                  </div>
                              </div>
                              <!---fin ventana para Editar --->

                              <button class="btn btn-danger" type="button" data-bs-toggle="modal" data-bs-target="#eliminarProducto">Eliminar</button>

                              <!-- Ventana modal para eliminar -->
                              <div class="modal fade" id="eliminarProducto" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                  <div class="modal-dialog modal-dialog-centered" role="document">
                                      <div class="modal-content">
                                          <form name="form-data" action="productos" method="POST">
                                              <div class="modal-header">
                                                  <h5 class="modal-title" id="myModalLabel">Deseas eliminar al producto</h5>
                                                  <button type="button" class="btn-close p-2" data-bs-dismiss="modal" aria-label="Close"></button>
                                              </div>

                                              <div class="modal-body">
                                                  <input type="hidden" name="idProducto" value="${producto.getCodigoProducto()}">
                                                  <strong style="text-align: center !important">Pasta Dental Colgate Triple Acción menta tubo 100 ml Pack 3 unid</strong>
                                              </div>

                                              <div class="modal-footer">
                                                  <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                                                  <button type="submit" class="btn btn-primary btnBorrar btn-block" data-bs-dismiss="modal" id="${producto.getCodigoProducto()}" name="accion" value="eliminar">Eliminar</button>
                                              </div>
                                          </form>
                                      </div>
                                  </div>
                              </div>
                          </div>
                          <!---fin ventana eliminar--->
                      </td>
                  </tr>
              </c:forEach>
          </tbody>
      </table>
  </div>
</div>     


<nav class="mt-2 d-flex justify-content-between align-items-center">
  <div>
      <span>Cantidad</span>
      <select class="form-select" onchange="cambiarCantidad(this)">
          <option value="10" ${cantidad == 10 ? "selected" : ""}>10</option>
          <option value="25" ${cantidad == 25 ? "selected" : ""}>25</option>
          <option value="50" ${cantidad == 50 ? "selected" : ""}>50</option>
      </select> 
  </div>

  <div>
      <ul class="pagination mb-0">
          <li class="page-item ${pagina == 1 ? "disabled" : ""}">
              <a class="page-link" href="#">Anterior</a>
          </li>

          <c:forEach var="i" begin="1" end="${paginas}">
              <li class="page-item ${pagina == i ? "active" : ""}">
                  <a class="page-link" href="#">1</a>
              </li>
          </c:forEach>

          <li class="page-item ${pagina == paginas ? "disabled" : ""}">
              <a class="page-link" href="#">Siguiente</a>
          </li>
      </ul>
  </div>
</nav>
</div>
</div>

<script>
function cambiarCantidad(event) {
const params = new URLSearchParams(window.location.search);
params.set("cantidad", event.value);
window.location.search = params.toString();
}
</script>

</asp:Content>
