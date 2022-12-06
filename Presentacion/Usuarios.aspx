<%@ Page Title="Usuarios" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeFile="Usuarios.aspx.cs" Inherits="Presentacion.Usuarios" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container px-4">
        <div class="py-4 bd-highlight row">
            <div class="title-proveedores py-2">
                <h2>Usuarios</h2>
                <asp:Label ID="NombreUsuarioLabel" runat="server" Text="Label"></asp:Label>
            </div>
            <div class="d-flex justify-content-between align-items-center">
                <div>
                    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#agregar-modal">Agregar</button>
                </div>

                <form action="usuarios" class="d-flex">
                    <input type="hidden" name="pagina" value="1" />
                    <input type="hidden" name="cantidad" value="5" />
                    <input type="search" name="q" value="" placeholder="Buscar un usuario" class="form-control me-2">
                    <button type="submit" class="btn btn-primary">Buscar</button>
                </form>
            </div>
        </div>

        <!-- Modal para Agregar-->
        <div class="modal fade" id="agregar-modal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <form action="usuarios" method="POST" name="crearUsuario" onsubmit="return validateFormCreate();">
                        <div class="modal-header">
                            <h5 class="modal-title">Agregar usuario</h5>
                            <button type="button" class="btn-close p-2" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>

                        <div class="modal-body">
                            <div id="createAlert"></div>
                            <div id="agregar-alert-danger" class="alert alert-danger alert-dismissible fade show" role="alert" style="display: none;">
                                <span id="agregar-alert-danger-mensaje"></span>
                                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                            </div>

                            <div class="mb-3">
                                <label for="agregar-nombre-usuario-input" class="form-label">Nombre de usuario</label>
                                <input type="text" class="form-control" id="agregar-nombre-usuario-input" name="nombreUsuario" placeholder="Agregar nombre de usuario" required>
                            </div>

                            <div class="mb-3">
                                <label for="agregar-clave-input" class="form-label">Clave</label>
                                <input type="password" class="form-control" id="agregar-clave-input" name="clave" placeholder="Agregar clave" required>
                            </div>

                            <div class="mb-3">
                                <label for="agregar-codigo-rol-select" class="col-form-label">Rol</label>
                                <select class="form-select" id="agregar-codigo-rol-select" name="codigoRol" aria-label=".form-select-sm example">
                                    <option value="" selected>Seleccionar rol</option>
                                </select>
                            </div>

                            <div>
                                <label for="agregar-codigo-empleado-select" class="col-form-label">Empleado</label>
                                <select class="form-select" id="agregar-codigo-empleado-select" name="codigoEmpleado" aria-label=".form-select-sm example">
                                    <option value="" selected>Seleccionar empleado</option>
                                </select>
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
                            <th scope="col">Nombre de usuario</th>
                            <th scope="col">Empleado</th>
                            <th scope="col">Rol</th>
                            <th scope="col" class="text-center">Acciones</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>1</td>
                            <td>jose</td>
                            <td>Jose Rodriguez Choca</td>
                            <td>Administrador</td>
                            <td>
                                <div class="d-flex justify-content-center">
                                    <button type="button" class="btn btn-secondary me-2" data-bs-toggle="modal" data-bs-target="#editar-modal-12a5cdce">Editar</button>

                                    <!--ventana para Update--->
                                    <div class="modal fade" id="editar-modal-12a5cdce" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" role="dialog" aria-hidden="true" aria-labelledby="editaUsuario">
                                        <div class="modal-dialog modal-dialog-centered">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title">Editar usuario</h5>
                                                    <button type="button" class="btn-close p-2" data-bs-dismiss="modal" aria-label="Close"></button>
                                                </div>

                                                <form action="usuarios" method="POST">
                                                    <div class="modal-body">
                                                        <div id="editar-alert-danger-12a5cdce" class="alert alert-danger alert-dismissible fade show" role="alert" style="display: none;">
                                                            <span id="editar-alert-danger-mensaje-12a5cdce"></span>
                                                            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                                                        </div>

                                                        <input type="hidden" name="codigoUsuario" value="1">
                                                        <input type="hidden" name="codigoEmpleado" value="1">

                                                        <div class="mb-3">
                                                            <label class="col-form-label">Codigo</label>
                                                            <input type="text" class="form-control" value="12a5cdce" disabled>
                                                        </div>

                                                        <div class="mb-3">
                                                            <label for="editar-nombre-usuario-input-12a5cdce" class="col-form-label">Nombre de usuario</label>
                                                            <input type="text" id="editar-nombre-usuario-input-12a5cdce" name="nombreUsuario" class="form-control" value="jose" placeholder="Ingregar nombre de usuario" required>
                                                        </div>

                                                        <div class="mb-3">
                                                            <label for="editar-clave-input-12a5cdce" class="form-label">Clave</label>
                                                            <input type="password" class="form-control" id="editar-clave-input-12a5cdce" name="clave" value="" placeholder="Ingregar clave">
                                                        </div>

                                                        <div class="mb-3">
                                                            <label for="editar-codigo-rol-select-12a5cdce" class="col-form-label">Rol</label>
                                                            <select class="form-select" id="editar-codigo-rol-select-12a5cdce" name="codigoRol" aria-label=".form-select-sm example">
                                                                <option>Administrador</option>
                                                            </select>
                                                        </div>

                                                        <div>
                                                            <label for="editar-codigo-empleado-select-12a5cdce" class="col-form-label">Empleado</label>
                                                            <select class="form-select" id="editar-codigo-empleado-select-12a5cdce" name="codigoEmpleado" aria-label=".form-select-sm example">
                                                                <option>Jose Rodriguez Choca</option>
                                                            </select>
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

                                    <button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#eliminar-usuario-12a5cdce">Eliminar</button>

                                    <!-- Ventana modal para eliminar -->
                                    <div class="modal fade" id="eliminar-usuario-12a5cdce" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                        <div class="modal-dialog modal-dialog-centered" role="document">
                                            <div class="modal-content">
                                                <form name="form-data" action="usuarios" method="POST">
                                                    <div class="modal-header">
                                                        <h5 class="modal-title">Deseas eliminar el Usuario</h5>
                                                        <button type="button" class="btn-close p-2" data-bs-dismiss="modal" aria-label="Close"></button>
                                                    </div>

                                                    <div class="modal-body">
                                                        <input type="hidden" name="codigoUsuario" value="12a5cdce">
                                                        <strong style="text-align: center !important">jose</strong>
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                                                        <button type="submit" class="btn btn-danger btnBorrar btn-block" data-bs-dismiss="modal" id="jose" name="accion" value="eliminar">Borrar</button>
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
                            <td>santiago</td>
                            <td>Santiago Gomez Barturen</td>
                            <td>Despacho</td>
                            <td>
                                <div class="d-flex justify-content-center">
                                    <button type="button" class="btn btn-secondary me-2" data-bs-toggle="modal" data-bs-target="#editar-modal-12b158a1">Editar</button>

                                    <!--ventana para Update--->
                                    <div class="modal fade" id="editar-modal-12b158a1" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" role="dialog" aria-hidden="true" aria-labelledby="editaUsuario">
                                        <div class="modal-dialog modal-dialog-centered">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title">Editar usuario</h5>
                                                    <button type="button" class="btn-close p-2" data-bs-dismiss="modal" aria-label="Close"></button>
                                                </div>

                                                <form action="usuarios" method="POST">
                                                    <div class="modal-body">
                                                        <div id="editar-alert-danger-12b158a1" class="alert alert-danger alert-dismissible fade show" role="alert" style="display: none;">
                                                            <span id="editar-alert-danger-mensaje-12b158a1"></span>
                                                            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                                                        </div>

                                                        <input type="hidden" name="codigoUsuario" value="1">
                                                        <input type="hidden" name="codigoEmpleado" value="1">

                                                        <div class="mb-3">
                                                            <label class="col-form-label">Codigo</label>
                                                            <input type="text" class="form-control" value="12b158a1" disabled>
                                                        </div>

                                                        <div class="mb-3">
                                                            <label for="editar-nombre-usuario-input-12b158a1" class="col-form-label">Nombre de usuario</label>
                                                            <input type="text" id="editar-nombre-usuario-input-12b158a1" name="nombreUsuario" class="form-control" value="santiago" placeholder="Ingregar nombre de usuario" required>
                                                        </div>

                                                        <div class="mb-3">
                                                            <label for="editar-clave-input-12b158a1" class="form-label">Clave</label>
                                                            <input type="password" class="form-control" id="editar-clave-input-12b158a1" name="clave" value="" placeholder="Ingregar clave">
                                                        </div>

                                                        <div class="mb-3">
                                                            <label for="editar-codigo-rol-select-12b158a1" class="col-form-label">Rol</label>
                                                            <select class="form-select" id="editar-codigo-rol-select-12b158a1" name="codigoRol" aria-label=".form-select-sm example">
                                                                <option>Despacho</option>
                                                            </select>
                                                        </div>

                                                        <div>
                                                            <label for="editar-codigo-empleado-select-12b158a1" class="col-form-label">Empleado</label>
                                                            <select class="form-select" id="editar-codigo-empleado-select-12b158a1" name="codigoEmpleado" aria-label=".form-select-sm example">
                                                                <option>Santiago Gomez Barturen</option>
                                                            </select>
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

                                    <button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#eliminar-usuario-12b158a1">Eliminar</button>

                                    <!-- Ventana modal para eliminar -->
                                    <div class="modal fade" id="eliminar-usuario-12b158a1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                        <div class="modal-dialog modal-dialog-centered" role="document">
                                            <div class="modal-content">
                                                <form name="form-data" action="usuarios" method="POST">
                                                    <div class="modal-header">
                                                        <h5 class="modal-title">Deseas eliminar el Usuario</h5>
                                                        <button type="button" class="btn-close p-2" data-bs-dismiss="modal" aria-label="Close"></button>
                                                    </div>

                                                    <div class="modal-body">
                                                        <input type="hidden" name="codigoUsuario" value="12b158a1">
                                                        <strong style="text-align: center !important">santiago</strong>
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                                                        <button type="submit" class="btn btn-danger btnBorrar btn-block" data-bs-dismiss="modal" id="santiago" name="accion" value="eliminar">Borrar</button>
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
                            <td>samuel</td>
                            <td>Samuel Sanchez Orti</td>
                            <td>Recepción</td>
                            <td>
                                <div class="d-flex justify-content-center">
                                    <button type="button" class="btn btn-secondary me-2" data-bs-toggle="modal" data-bs-target="#editar-modal-12b15a73">Editar</button>

                                    <!--ventana para Update--->
                                    <div class="modal fade" id="editar-modal-12b15a73" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" role="dialog" aria-hidden="true" aria-labelledby="editaUsuario">
                                        <div class="modal-dialog modal-dialog-centered">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title">Editar usuario</h5>
                                                    <button type="button" class="btn-close p-2" data-bs-dismiss="modal" aria-label="Close"></button>
                                                </div>

                                                <form action="usuarios" method="POST">
                                                    <div class="modal-body">
                                                        <div id="editar-alert-danger-12b15a73" class="alert alert-danger alert-dismissible fade show" role="alert" style="display: none;">
                                                            <span id="editar-alert-danger-mensaje-12b15a73"></span>
                                                            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                                                        </div>

                                                        <input type="hidden" name="codigoUsuario" value="1">
                                                        <input type="hidden" name="codigoEmpleado" value="1">

                                                        <div class="mb-3">
                                                            <label class="col-form-label">Codigo</label>
                                                            <input type="text" class="form-control" value="12b15a73" disabled>
                                                        </div>

                                                        <div class="mb-3">
                                                            <label for="editar-nombre-usuario-input-12b15a73" class="col-form-label">Nombre de usuario</label>
                                                            <input type="text" id="editar-nombre-usuario-input-12b15a73" name="nombreUsuario" class="form-control" value="samuel" placeholder="Ingregar nombre de usuario" required>
                                                        </div>

                                                        <div class="mb-3">
                                                            <label for="editar-clave-input-12b15a73" class="form-label">Clave</label>
                                                            <input type="password" class="form-control" id="editar-clave-input-12b15a73" name="clave" value="" placeholder="Ingregar clave">
                                                        </div>

                                                        <div class="mb-3">
                                                            <label for="editar-codigo-rol-select-12b15a73" class="col-form-label">Rol</label>
                                                            <select class="form-select" id="editar-codigo-rol-select-12b15a73" name="codigoRol" aria-label=".form-select-sm example">
                                                                <option>Recepción</option>
                                                            </select>
                                                        </div>

                                                        <div>
                                                            <label for="editar-codigo-empleado-select-12b15a73" class="col-form-label">Empleado</label>
                                                            <select class="form-select" id="editar-codigo-empleado-select-12b15a73" name="codigoEmpleado" aria-label=".form-select-sm example">
                                                                <option>Samuel Sanchez Orti</option>
                                                            </select>
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

                                    <button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#eliminar-usuario-12b15a73">Eliminar</button>

                                    <!-- Ventana modal para eliminar -->
                                    <div class="modal fade" id="eliminar-usuario-12b15a73" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                        <div class="modal-dialog modal-dialog-centered" role="document">
                                            <div class="modal-content">
                                                <form name="form-data" action="usuarios" method="POST">
                                                    <div class="modal-header">
                                                        <h5 class="modal-title">Deseas eliminar el Usuario</h5>
                                                        <button type="button" class="btn-close p-2" data-bs-dismiss="modal" aria-label="Close"></button>
                                                    </div>

                                                    <div class="modal-body">
                                                        <input type="hidden" name="codigoUsuario" value="12b15a73">
                                                        <strong style="text-align: center !important">samuel</strong>
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                                                        <button type="submit" class="btn btn-danger btnBorrar btn-block" data-bs-dismiss="modal" id="samuel" name="accion" value="eliminar">Borrar</button>
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
                            <td>greis</td>
                            <td>Greis Gutierrez Flores</td>
                            <td>Contador</td>
                            <td>
                                <div class="d-flex justify-content-center">
                                    <button type="button" class="btn btn-secondary me-2" data-bs-toggle="modal" data-bs-target="#editar-modal-12b15b1e">Editar</button>

                                    <!--ventana para Update--->
                                    <div class="modal fade" id="editar-modal-12b15b1e" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" role="dialog" aria-hidden="true" aria-labelledby="editaUsuario">
                                        <div class="modal-dialog modal-dialog-centered">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title">Editar usuario</h5>
                                                    <button type="button" class="btn-close p-2" data-bs-dismiss="modal" aria-label="Close"></button>
                                                </div>

                                                <form action="usuarios" method="POST">
                                                    <div class="modal-body">
                                                        <div id="editar-alert-danger-12b15b1e" class="alert alert-danger alert-dismissible fade show" role="alert" style="display: none;">
                                                            <span id="editar-alert-danger-mensaje-12b15b1e"></span>
                                                            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                                                        </div>

                                                        <input type="hidden" name="codigoUsuario" value="1">
                                                        <input type="hidden" name="codigoEmpleado" value="1">

                                                        <div class="mb-3">
                                                            <label class="col-form-label">Codigo</label>
                                                            <input type="text" class="form-control" value="12b15b1e" disabled>
                                                        </div>

                                                        <div class="mb-3">
                                                            <label for="editar-nombre-usuario-input-12b15b1e" class="col-form-label">Nombre de usuario</label>
                                                            <input type="text" id="editar-nombre-usuario-input-12b15b1e" name="nombreUsuario" class="form-control" value="greis" placeholder="Ingregar nombre de usuario" required>
                                                        </div>

                                                        <div class="mb-3">
                                                            <label for="editar-clave-input-12b15b1e" class="form-label">Clave</label>
                                                            <input type="password" class="form-control" id="editar-clave-input-12b15b1e" name="clave" value="" placeholder="Ingregar clave">
                                                        </div>

                                                        <div class="mb-3">
                                                            <label for="editar-codigo-rol-select-12b15b1e" class="col-form-label">Rol</label>
                                                            <select class="form-select" id="editar-codigo-rol-select-12b15b1e" name="codigoRol" aria-label=".form-select-sm example">
                                                                <option>Contador</option>
                                                            </select>
                                                        </div>

                                                        <div>
                                                            <label for="editar-codigo-empleado-select-12b15b1e" class="col-form-label">Empleado</label>
                                                            <select class="form-select" id="editar-codigo-empleado-select-12b15b1e" name="codigoEmpleado" aria-label=".form-select-sm example">
                                                                <option>Greis Gutierrez Flores</option>
                                                            </select>
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

                                    <button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#eliminar-usuario-12b15b1e">Eliminar</button>

                                    <!-- Ventana modal para eliminar -->
                                    <div class="modal fade" id="eliminar-usuario-12b15b1e" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                        <div class="modal-dialog modal-dialog-centered" role="document">
                                            <div class="modal-content">
                                                <form name="form-data" action="usuarios" method="POST">
                                                    <div class="modal-header">
                                                        <h5 class="modal-title">Deseas eliminar el Usuario</h5>
                                                        <button type="button" class="btn-close p-2" data-bs-dismiss="modal" aria-label="Close"></button>
                                                    </div>

                                                    <div class="modal-body">
                                                        <input type="hidden" name="codigoUsuario" value="12b15b1e">
                                                        <strong style="text-align: center !important">greis</strong>
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                                                        <button type="submit" class="btn btn-danger btnBorrar btn-block" data-bs-dismiss="modal" id="greis" name="accion" value="eliminar">Borrar</button>
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
                            <td>fiorella</td>
                            <td>Fiorella San Garcia</td>
                            <td>Gerente</td>
                            <td>
                                <div class="d-flex justify-content-center">
                                    <button type="button" class="btn btn-secondary me-2" data-bs-toggle="modal" data-bs-target="#editar-modal-12b15bb3">Editar</button>

                                    <!--ventana para Update--->
                                    <div class="modal fade" id="editar-modal-12b15bb3" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" role="dialog" aria-hidden="true" aria-labelledby="editaUsuario">
                                        <div class="modal-dialog modal-dialog-centered">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title" id="staticBackdropLabel">Editar usuario</h5>
                                                    <button type="button" class="btn-close p-2" data-bs-dismiss="modal" aria-label="Close"></button>
                                                </div>

                                                <form action="usuarios" method="POST">
                                                    <div class="modal-body" id="cont_modal">
                                                        <div id="editar-alert-danger-12b15bb3" class="alert alert-danger alert-dismissible fade show" role="alert" style="display: none;">
                                                            <span id="editar-alert-danger-mensaje-12b15bb3"></span>
                                                            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                                                        </div>

                                                        <input type="hidden" name="codigoUsuario" value="1">
                                                        <input type="hidden" name="codigoEmpleado" value="1">

                                                        <div class="mb-3">
                                                            <label class="col-form-label">Codigo</label>
                                                            <input type="text" class="form-control" value="12b15bb3" disabled>
                                                        </div>

                                                        <div class="mb-3">
                                                            <label for="editar-nombre-usuario-input-12b15bb3" class="col-form-label">Nombre de usuario</label>
                                                            <input type="text" id="editar-nombre-usuario-input-12b15bb3" name="nombreUsuario" class="form-control" value="fiorella" placeholder="Ingregar nombre de usuario" required>
                                                        </div>

                                                        <div class="mb-3">
                                                            <label for="editar-clave-input-12b15bb3" class="form-label">Clave</label>
                                                            <input type="password" class="form-control" id="editar-clave-input-12b15bb3" name="clave" value="" placeholder="Ingregar clave">
                                                        </div>

                                                        <div class="mb-3">
                                                            <label for="editar-codigo-rol-select-12b15bb3" class="col-form-label">Rol</label>
                                                            <select class="form-select" id="editar-codigo-rol-select-12b15bb3" name="codigoRol" aria-label=".form-select-sm example">
                                                                <option>Gerente</option>
                                                            </select>
                                                        </div>

                                                        <div>
                                                            <label for="editar-codigo-empleado-select-12b15bb3" class="col-form-label">Empleado</label>
                                                            <select class="form-select" id="editar-codigo-empleado-select-12b15bb3" name="codigoEmpleado" aria-label=".form-select-sm example">
                                                                <option>Fiorella San Garcia</option>
                                                            </select>
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

                                    <button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#eliminar-usuario-12b15bb3">Eliminar</button>

                                    <!-- Ventana modal para eliminar -->
                                    <div class="modal fade" id="eliminar-usuario-12b15bb3" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                        <div class="modal-dialog modal-dialog-centered" role="document">
                                            <div class="modal-content">
                                                <form name="form-data" action="usuarios" method="POST">
                                                    <div class="modal-header">
                                                        <h5 class="modal-title" id="myModalLabel">Deseas eliminar el Usuario</h5>
                                                        <button type="button" class="btn-close p-2" data-bs-dismiss="modal" aria-label="Close"></button>
                                                    </div>

                                                    <div class="modal-body">
                                                        <input type="hidden" name="codigoUsuario" value="12b15bb3">
                                                        <strong style="text-align: center !important">fiorella</strong>
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                                                        <button type="submit" class="btn btn-danger btnBorrar btn-block" data-bs-dismiss="modal" id="fiorella" name="accion" value="eliminar">Borrar</button>
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
                        <a class="page-link" href="usuarios?pagina=1&cantidad=5&q=">Anterior</a>
                    </li>

                    <li class="page-item">
                        <a class="page-link active" href="usuarios?pagina=1&cantidad=5&q=">1</a>
                    </li>

                    <li class="page-item">
                        <a class="page-link" href="usuarios?pagina=2&cantidad=5&q=">2</a>
                    </li>

                    <li class="page-item">
                        <a class="page-link" href="usuarios?pagina=2&cantidad=5&q=">Siguiente</a>
                    </li>
                </ul>
            </div>
        </nav>
    </div>
</asp:Content>
