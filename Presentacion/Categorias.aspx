<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeFile="Categorias.aspx.cs" Inherits="Presentacion.Categorias" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous" defer></script>
  <div class="container px-4">
    <div class="py-4 bd-highlight row">
        <div class="title-proveedores py-2">
            <h2>Categorias</h2>
        </div>

        <div class="d-flex justify-content-between align-items-center">
            <div>
                <button type="button" class="btn btn-primary" data-bs-toggle="modal"
                        data-bs-target="#agregar">Agregar
                </button>
            </div>

            <div class="d-flex">
                <input type="text" class="form-control me-2" placeholder="Buscar un empleado" aria-label="Recipient's username" aria-describedby="basic-addon2">
                <button class="btn btn-primary" id="basic-addon2" type="button ">Buscar</button>
            </div>
        </div>
    </div>
    <!-- Modal para Agregar-->
    <div class="modal fade" id="agregar" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <form id="agregar-form" action="../../controllers/categorias/agregar.php" method="POST">
        <div class="modal-header">
          <h5 class="modal-title" id="staticBackdropLabel">Agregar categoría</h5>
          <button type="button" class="btn-close p-2" data-bs-dismiss="modal" aria-label="Close">
          </button>
        </div>
        
        <div class="modal-body">
          <div class="row">
            <div class="mb-3">
              <label for="agregar-nombre" class="col-form-label">Nombre</label>
              <input type="text" class="form-control" id="agregar-nombre" name="nombre" placeholder="Nombre" required autofocus>
            </div>
            <div>
              <label for="agregar-descripcion" class="col-form-label">Descripción</label>
              <input type="text" class="form-control" id="agregar-descripcion" name="descripcion" placeholder="Descripción" required>
            </div>
          </div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
          <button type="button" id="agregar-categoria-btn" style="display: none" class="btn btn-primary" data-bs-toggle="modal" data-bs-dismiss="modal" data-bs-target="#agregar-confirmacion-categoria_modal"></button>
          <button type="submit" class="btn btn-primary">Aceptar</button>
        </div>
      </form>
    </div>
  </div>
</div>
<div class="modal fade" id="agregar-confirmacion-categoria_modal" aria-hidden="true" aria-labelledby="exampleModalToggleLabel2" tabindex="-1">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalToggleLabel2">¡Atención!</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        ¿Está seguro de agregar una nueva categoría?
      </div>
      <div class="modal-footer">
        <button class="btn btn-secondary" data-bs-target="#agregar" data-bs-toggle="modal" data-bs-dismiss="modal">Cancelar</button>
        <button id="aceptar-agregar-categoria-btn" type="button" class="btn btn-primary" data-bs-dismiss="modal">Aceptar</button>
      </div>
    </div>
  </div>
</div>
<script>
    (() => {
        const agregarFormCateforia = document.getElementById('agregar-form')
        const agregarAgregarBtn = document.getElementById('agregar-categoria-btn')
        const aceptarAgregarBtn = document.getElementById('aceptar-agregar-categoria-btn')
        aceptarAgregarBtn.addEventListener('click', (event) => {
            agregarFormCateforia.submit()
        })
        agregarFormCateforia.addEventListener('submit', (event) => {
            event.preventDefault()
            agregarAgregarBtn.click()
        });
    })()
</script>
<!-- Mostrar tabla -->
      <div class="card">
          <div class="table-responsive">
              <table class="table table-borderless">
                  <thead>
                      <tr>
                          <th scope="col">Código</th>
                          <th scope="col">Nombre</th>
                          <th scope="col">Descripción</th>
                          <th scope="col" class="text-center">Acciones</th>
                      </tr>
                  </thead>
                  <tbody>
                      <c:forEach var="producto" items="${categorias}" varStatus="loop">
                      <tr>
                          <td>1</td>
                          <td>categoria uno</td>
                          <td>descripcion uno</td>
                          <td>
                              <div class="d-flex justify-content-center">
                                  <button class="btn btn-secondary me-2" type="button" data-bs-toggle="modal" data-bs-target="#editarCat">
                                      Editar
                                  </button>
                                  <!--Ventana Modal para Actualizar--->
                                  <div class="modal fade" id="editarCat" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" role="dialog" aria-hidden="true" aria-labelledby="editaCat">
                                      <div class="modal-dialog modal-dialog-centered">
                                          <div class="modal-content">
                                              <div class="modal-header">
                                                  <h5 class="modal-title" id="staticBackdropLabel">Editar categoría</h5>
                                                  <button type="button" class="btn-close p-2" data-bs-dismiss="modal" aria-label="Close">
                                                  </button>
                                              </div>

                                              <form name="form-data" action="categorias" method="POST" >
                                                  <input type="hidden" name="idCategoria" value="${categorias.getCodigoCategoria()}">
                                                  <div class="modal-body" id="cont_modal">
                                                      <div class="mb-3">
                                                          <label for="editar-nombre" class="col-form-label">Nombre</label>
                                                          <input type="text" class="form-control" id="editar-nombre" name="nombre" placeholder="Agregar nombre" value="categoria uno" required="true">
                                                      </div>

                                                      <div>
                                                          <label for="editar-descripcion" class="col-form-label">Descripción</label>
                                                          <input type="text" class="form-control" id="editar-descripcion" name="descripcion" placeholder="Agregar descripción" value="descripcion uno" placeholder="" required="true">
                                                      </div>
                                                  </div>

                                                  <div class="modal-footer">
                                                      <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                                                      <button type="submit" class="btn btn-primary">Aceptar</button>
                                                  </div>
                                              </form>
                                          </div>
                                      </div>
                                  </div>
                                    <!---fin ventana Update --->

                                  

                                  <button class="btn btn-danger" type="button" data-bs-toggle="modal" data-bs-target="#eliminarCat">Eliminar</button>
                                <!--Ventana Modal para la Alerta de Eliminar--->
                                <div class="modal fade" id="eliminarCat" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                    <div class="modal-dialog modal-dialog-centered" role="document">
                                        <div class="modal-content">
                                            <form name="form-data" action="categorias" method="POST">
                                                <div class="modal-header">
                                                    <h5 class="modal-title" id="myModalLabel">¿Deseas eliminar la categoria?</h5>
                                                    <button type="button" class="btn-close p-2" data-bs-dismiss="modal" aria-label="Close">
                                                    </button>
                                                </div>

                                                <div class="modal-body">
                                                  <input type="hidden" name="idProducto" value="${categorias.getCodigoCategoria()}">
                                                  <strong style="text-align: center !important">Pasta Dental Colgate Triple Acción menta tubo 100 ml Pack 3 unid</strong>
                                              </div>

                                              <div class="modal-footer">
                                                  <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                                                  <button type="submit" class="btn btn-primary btnBorrar btn-block" data-bs-dismiss="modal" value="${categorias.getCodigoCategoria()}" name="accion" value="eliminar">Eliminar</button>
                                              </div>
                                            </form>
                                        </div>
                                    </div>
                                 </div>
<!---fin ventana eliminar--->
                            </div>
                        </td>
                    </tr>
                
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
