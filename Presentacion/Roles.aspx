<%@ Page Title="Roles" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeFile="Roles.aspx.cs" Inherits="Presentacion.Roles" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container px-4">
        <div class="py-4 bd-highlight row">
            <div class="title-proveedores py-2">
                <h2>Roles</h2>
            </div>

            <div class="d-flex justify-content-between align-items-center">
                <div>
                    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#agregar-modal">Agregar</button>
                </div>

                <form action="roles" class="d-flex">
                    <input type="hidden" name="pagina" value="1" />
                    <input type="hidden" name="cantidad" value="5" />
                    <input type="search" name="q" value="" placeholder="Buscar un rol" class="form-control me-2">
                    <button type="submit" class="btn btn-primary">Buscar</button>
                </form>
            </div>
        </div>

        <!-- Modal para Agregar-->
        <div class="modal fade" id="agregar-modal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <form action="roles" method="POST" name="createRol" onsubmit="return validateRol();">
                        <div class="modal-header">
                            <h5 class="modal-title">Agregar rol</h5>
                            <button type="button" class="btn-close p-2" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>

                        <div class="modal-body">
                            <div id="createRolContainer"></div>
                            <div id="agregar-alert-danger" class="alert alert-danger alert-dismissible fade show" role="alert" style="display: none;">
                                <span id="agregar-alert-danger-mensaje"></span>
                                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                            </div>

                            <div>
                                <label for="agregar-nombre-input" class="form-label">Nombre</label>
                                <input type="text" class="form-control" id="agregar-nombre-input" name="nombre" placeholder="Agregar nombre" required autofocus>
                            </div>
                        </div>

                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                            <button type="submit" class="btn btn-primary" name="accion" value="agregar">Aceptar</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <div class="card">
            <div class="table-responsive">
                <table class="table table-borderless">
                    <thead>
                        <tr>
                            <th scope="col">N</th>
                            <th scope="col">Nombre</th>
                            <th scope="col" class="text-center">Acciones</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>1</td>
                            <td>Administrador</td>
                            <td>
                                <div class="d-flex justify-content-center">
                                    <button class="btn btn-secondary me-2" type="button" data-bs-toggle="modal" data-bs-target="#editar-modal-81fcb902">
                                        Editar
                                    </button>

                                    <!--ventana para Update--->
                                    <div class="modal fade" id="editar-modal-81fcb902" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" role="dialog" aria-hidden="true" aria-labelledby="editaRol">
                                        <div class="modal-dialog modal-dialog-centered">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title">Editar Rol</h5>
                                                    <button type="button" class="btn-close p-2" data-bs-dismiss="modal" aria-label="Close"></button>
                                                </div>

                                                <form action="roles" method="POST">
                                                    <div class="modal-body">
                                                        <div id="editar-alert-danger-81fcb902" class="alert alert-danger alert-dismissible fade show" role="alert" style="display: none;">
                                                            <span id="editar-alert-danger-mensaje-81fcb902"></span>
                                                            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                                                        </div>

                                                        <input type="hidden" name="codigoRol" value="1">

                                                        <div class="mb-3">
                                                            <label class="col-form-label">Codigo</label>
                                                            <input type="text" class="form-control" value="81fcb902" disabled>
                                                        </div>

                                                        <div>
                                                            <label for="editar-nombre-input-81fcb902" class="col-form-label">Nombre</label>
                                                            <input type="text" id="editar-nombre-input-81fcb902" name="nombre" class="form-control" value="Administrador" placeholder="Ingresar nombre" required autofocus>
                                                        </div>
                                                    </div>

                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                                                        <button type="submit" class="btn btn-primary" name="accion" value="editar">Aceptar</button>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                    <!---fin ventana Update --->


                                    <button class="btn btn-danger" type="button" data-bs-toggle="modal" data-bs-target="#eliminar-rol-81fcb902">Eliminar</button>

                                    <!-- Ventana modal para eliminar -->
                                    <div class="modal fade" id="eliminar-rol-81fcb902" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                        <div class="modal-dialog modal-dialog-centered" role="document">
                                            <div class="modal-content">
                                                <form name="form-data" action="roles" method="POST">
                                                    <div class="modal-header">
                                                        <h5 class="modal-title">Deseas eliminar el rol </h5>
                                                        <button type="button" class="btn-close p-2" data-bs-dismiss="modal" aria-label="Close"></button>
                                                    </div>

                                                    <div class="modal-body">
                                                        <input type="hidden" name="codigoRol" value="81fcb902">
                                                        <strong style="text-align: center !important">Administrador</strong>
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                                                        <button type="submit" class="btn btn-primary btnBorrar btn-block" data-bs-dismiss="modal" id="81fcb902" name="accion" value="eliminar">Borrar</button>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                    <!---fin ventana eliminar--->
                                </div>
                            </td>
                        </tr>

                        <tr>
                            <td>2</td>
                            <td>Despacho</td>
                            <td>
                                <div class="d-flex justify-content-center">
                                    <button class="btn btn-secondary me-2" type="button" data-bs-toggle="modal" data-bs-target="#editar-modal-8204dc33">
                                        Editar
                                    </button>

                                    <!--ventana para Update--->
                                    <div class="modal fade" id="editar-modal-8204dc33" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" role="dialog" aria-hidden="true" aria-labelledby="editaRol">
                                        <div class="modal-dialog modal-dialog-centered">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title">Editar Rol</h5>
                                                    <button type="button" class="btn-close p-2" data-bs-dismiss="modal" aria-label="Close"></button>
                                                </div>

                                                <form action="roles" method="POST">
                                                    <div class="modal-body">
                                                        <div id="editar-alert-danger-8204dc33" class="alert alert-danger alert-dismissible fade show" role="alert" style="display: none;">
                                                            <span id="editar-alert-danger-mensaje-8204dc33"></span>
                                                            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                                                        </div>

                                                        <input type="hidden" name="codigoRol" value="1">

                                                        <div class="mb-3">
                                                            <label class="col-form-label">Codigo</label>
                                                            <input type="text" class="form-control" value="8204dc33" disabled>
                                                        </div>

                                                        <div>
                                                            <label for="editar-nombre-input-8204dc33" class="col-form-label">Nombre</label>
                                                            <input type="text" id="editar-nombre-input-8204dc33" name="nombre" class="form-control" value="Despacho" placeholder="Ingresar nombre" required autofocus>
                                                        </div>
                                                    </div>

                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                                                        <button type="submit" class="btn btn-primary" name="accion" value="editar">Aceptar</button>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                    <!---fin ventana Update --->


                                    <button class="btn btn-danger" type="button" data-bs-toggle="modal" data-bs-target="#eliminar-rol-8204dc33">Eliminar</button>

                                    <!-- Ventana modal para eliminar -->
                                    <div class="modal fade" id="eliminar-rol-8204dc33" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                        <div class="modal-dialog modal-dialog-centered" role="document">
                                            <div class="modal-content">
                                                <form name="form-data" action="roles" method="POST">
                                                    <div class="modal-header">
                                                        <h5 class="modal-title">Deseas eliminar el rol </h5>
                                                        <button type="button" class="btn-close p-2" data-bs-dismiss="modal" aria-label="Close"></button>
                                                    </div>

                                                    <div class="modal-body">
                                                        <input type="hidden" name="codigoRol" value="8204dc33">
                                                        <strong style="text-align: center !important">Despacho</strong>
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                                                        <button type="submit" class="btn btn-primary btnBorrar btn-block" data-bs-dismiss="modal" id="8204dc33" name="accion" value="eliminar">Borrar</button>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                    <!---fin ventana eliminar--->
                                </div>
                            </td>
                        </tr>

                        <tr>
                            <td>3</td>
                            <td>Recepción</td>
                            <td>
                                <div class="d-flex justify-content-center">
                                    <button class="btn btn-secondary me-2" type="button" data-bs-toggle="modal" data-bs-target="#editar-modal-8204dd1c">
                                        Editar
                                    </button>

                                    <!--ventana para Update--->
                                    <div class="modal fade" id="editar-modal-8204dd1c" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" role="dialog" aria-hidden="true" aria-labelledby="editaRol">
                                        <div class="modal-dialog modal-dialog-centered">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title">Editar Rol</h5>
                                                    <button type="button" class="btn-close p-2" data-bs-dismiss="modal" aria-label="Close"></button>
                                                </div>

                                                <form action="roles" method="POST">
                                                    <div class="modal-body">
                                                        <div id="editar-alert-danger-8204dd1c" class="alert alert-danger alert-dismissible fade show" role="alert" style="display: none;">
                                                            <span id="editar-alert-danger-mensaje-8204dd1c"></span>
                                                            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                                                        </div>

                                                        <input type="hidden" name="codigoRol" value="1">

                                                        <div class="mb-3">
                                                            <label class="col-form-label">Codigo</label>
                                                            <input type="text" class="form-control" value="8204dd1c" disabled>
                                                        </div>

                                                        <div>
                                                            <label for="editar-nombre-input-8204dd1c" class="col-form-label">Nombre</label>
                                                            <input type="text" id="editar-nombre-input-8204dd1c" name="nombre" class="form-control" value="Recepción" placeholder="Ingresar nombre" required autofocus>
                                                        </div>
                                                    </div>

                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                                                        <button type="submit" class="btn btn-primary" name="accion" value="editar">Aceptar</button>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                    <!---fin ventana Update --->


                                    <button class="btn btn-danger" type="button" data-bs-toggle="modal" data-bs-target="#eliminar-rol-8204dd1c">Eliminar</button>

                                    <!-- Ventana modal para eliminar -->
                                    <div class="modal fade" id="eliminar-rol-8204dd1c" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                        <div class="modal-dialog modal-dialog-centered" role="document">
                                            <div class="modal-content">
                                                <form name="form-data" action="roles" method="POST">
                                                    <div class="modal-header">
                                                        <h5 class="modal-title">Deseas eliminar el rol </h5>
                                                        <button type="button" class="btn-close p-2" data-bs-dismiss="modal" aria-label="Close"></button>
                                                    </div>

                                                    <div class="modal-body">
                                                        <input type="hidden" name="codigoRol" value="8204dd1c">
                                                        <strong style="text-align: center !important">Recepción</strong>
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                                                        <button type="submit" class="btn btn-primary btnBorrar btn-block" data-bs-dismiss="modal" id="8204dd1c" name="accion" value="eliminar">Borrar</button>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                    <!---fin ventana eliminar--->
                                </div>
                            </td>
                        </tr>


                        <tr>
                            <td>4</td>
                            <td>Contador</td>
                            <td>
                                <div class="d-flex justify-content-center">
                                    <button class="btn btn-secondary me-2" type="button" data-bs-toggle="modal" data-bs-target="#editar-modal-8204dd54">
                                        Editar
                                    </button>

                                    <!--ventana para Update--->
                                    <div class="modal fade" id="editar-modal-8204dd54" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" role="dialog" aria-hidden="true" aria-labelledby="editaRol">
                                        <div class="modal-dialog modal-dialog-centered">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title">Editar Rol</h5>
                                                    <button type="button" class="btn-close p-2" data-bs-dismiss="modal" aria-label="Close"></button>
                                                </div>

                                                <form action="roles" method="POST">
                                                    <div class="modal-body">
                                                        <div id="editar-alert-danger-8204dd54" class="alert alert-danger alert-dismissible fade show" role="alert" style="display: none;">
                                                            <span id="editar-alert-danger-mensaje-8204dd54"></span>
                                                            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                                                        </div>

                                                        <input type="hidden" name="codigoRol" value="1">

                                                        <div class="mb-3">
                                                            <label class="col-form-label">Codigo</label>
                                                            <input type="text" class="form-control" value="8204dd54" disabled>
                                                        </div>

                                                        <div>
                                                            <label for="editar-nombre-input-8204dd54" class="col-form-label">Nombre</label>
                                                            <input type="text" id="editar-nombre-input-8204dd54" name="nombre" class="form-control" value="Contador" placeholder="Ingresar nombre" required autofocus>
                                                        </div>
                                                    </div>

                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                                                        <button type="submit" class="btn btn-primary" name="accion" value="editar">Aceptar</button>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                    <!---fin ventana Update --->


                                    <button class="btn btn-danger" type="button" data-bs-toggle="modal" data-bs-target="#eliminar-rol-8204dd54">Eliminar</button>

                                    <!-- Ventana modal para eliminar -->
                                    <div class="modal fade" id="eliminar-rol-8204dd54" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                        <div class="modal-dialog modal-dialog-centered" role="document">
                                            <div class="modal-content">
                                                <form name="form-data" action="roles" method="POST">
                                                    <div class="modal-header">
                                                        <h5 class="modal-title">Deseas eliminar el rol </h5>
                                                        <button type="button" class="btn-close p-2" data-bs-dismiss="modal" aria-label="Close"></button>
                                                    </div>

                                                    <div class="modal-body">
                                                        <input type="hidden" name="codigoRol" value="8204dd54">
                                                        <strong style="text-align: center !important">Contador</strong>
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                                                        <button type="submit" class="btn btn-primary btnBorrar btn-block" data-bs-dismiss="modal" id="8204dd54" name="accion" value="eliminar">Borrar</button>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                    <!---fin ventana eliminar--->
                                </div>
                            </td>
                        </tr>

                        <tr>
                            <td>5</td>
                            <td>Gerente</td>
                            <td>
                                <div class="d-flex justify-content-center">
                                    <button class="btn btn-secondary me-2" type="button" data-bs-toggle="modal" data-bs-target="#editar-modal-8204dd7e">
                                        Editar
                                    </button>

                                    <!--ventana para Update--->
                                    <div class="modal fade" id="editar-modal-8204dd7e" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" role="dialog" aria-hidden="true" aria-labelledby="editaRol">
                                        <div class="modal-dialog modal-dialog-centered">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title">Editar Rol</h5>
                                                    <button type="button" class="btn-close p-2" data-bs-dismiss="modal" aria-label="Close"></button>
                                                </div>

                                                <form action="roles" method="POST">
                                                    <div class="modal-body">
                                                        <div id="editar-alert-danger-8204dd7e" class="alert alert-danger alert-dismissible fade show" role="alert" style="display: none;">
                                                            <span id="editar-alert-danger-mensaje-8204dd7e"></span>
                                                            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                                                        </div>

                                                        <input type="hidden" name="codigoRol" value="1">

                                                        <div class="mb-3">
                                                            <label class="col-form-label">Codigo</label>
                                                            <input type="text" class="form-control" value="8204dd7e" disabled>
                                                        </div>

                                                        <div>
                                                            <label for="editar-nombre-input-8204dd7e" class="col-form-label">Nombre</label>
                                                            <input type="text" id="editar-nombre-input-8204dd7e" name="nombre" class="form-control" value="Gerente" placeholder="Ingresar nombre" required autofocus>
                                                        </div>
                                                    </div>

                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                                                        <button type="submit" class="btn btn-primary" name="accion" value="editar">Aceptar</button>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                    <!---fin ventana Update --->


                                    <button class="btn btn-danger" type="button" data-bs-toggle="modal" data-bs-target="#eliminar-rol-8204dd7e">Eliminar</button>

                                    <!-- Ventana modal para eliminar -->
                                    <div class="modal fade" id="eliminar-rol-8204dd7e" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                        <div class="modal-dialog modal-dialog-centered" role="document">
                                            <div class="modal-content">
                                                <form name="form-data" action="roles" method="POST">
                                                    <div class="modal-header">
                                                        <h5 class="modal-title">Deseas eliminar el rol </h5>
                                                        <button type="button" class="btn-close p-2" data-bs-dismiss="modal" aria-label="Close"></button>
                                                    </div>

                                                    <div class="modal-body">
                                                        <input type="hidden" name="codigoRol" value="8204dd7e">
                                                        <strong style="text-align: center !important">Gerente</strong>
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                                                        <button type="submit" class="btn btn-primary btnBorrar btn-block" data-bs-dismiss="modal" id="8204dd7e" name="accion" value="eliminar">Borrar</button>
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
                <select class="form-select">
                    <option value="5">5</option>
                    <option value="10">10</option>
                    <option value="25">25</option>
                    <option value="50">50</option>
                </select>
            </div>

            <div>
                <ul class="pagination mb-0">
                    <li class="page-item">
                        <a class="page-link" href="roles?pagina=1&cantidad=5&q=">Anterior</a>
                    </li>

                    <li class="page-item">
                        <a class="page-link active" href="roles?pagina=1&cantidad=5&q=">1</a>
                    </li>

                    <li class="page-item">
                        <a class="page-link" href="roles?pagina=2&cantidad=5&q=">2</a>
                    </li>

                    <li class="page-item">
                        <a class="page-link" href="roles?pagina=2&cantidad=5&q=">Siguiente</a>
                    </li>
                </ul>
            </div>
        </nav>
    </div>
</asp:Content>
