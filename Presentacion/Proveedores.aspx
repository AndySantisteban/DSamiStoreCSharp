<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Proveedores.aspx.cs" Inherits="Presentacion.Proveedor" %>


<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous" defer></script>

    <div class="container px-4">
        <div class="py-4 bd-highlight row">
            <div class="title-proveedores py-2">
                <h2>Proveedores</h2>
            </div>

            <div class="d-flex justify-content-between align-items-center">
                <div>
                    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#agregar">Agregar</button>
                </div>

                <form action="proveedores" class="d-flex">
                    <input type="search" name="q" placeholder="Buscar un proveedor" class="form-control me-2">
                    <button type="submit" class="btn btn-primary">Buscar</button>
                </form>
            </div>
        </div>

        
        <!-- Mostrar tabla -->
        <div class="card">
            <div class="table-responsive">
                <table class="table table-borderless">
                    <thead>
                        <tr>
                            <th scope="col">N</th>
                            <th scope="col">Nombre</th>
                            <th scope="col">N Documento</th>
                            <th scope="col">Empresa</th>
                            <th scope="col">Direccion</th>
                            <th scope="col" class="text-center">Acciones</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:foreach var="proveedor" items="${proveedores}" varstatus="loop">
                            <tr>
                                <td>1</td>
                                <td>Sam</td>
                                <td>75448908</td>
                                <td>Razón social</td>
                                <td>San juan 123</td>
                                <td>
                                    <div class="d-flex justify-content-center">
                                        <button class="btn btn-secondary me-2" type="button" data-bs-toggle="modal"
                                            data-bs-target="#editarProveedor">
                                            Editar</button>

                                        <button class="btn btn-danger" type="button" data-bs-toggle="modal" data-bs-target="#eliminarProveedor">Eliminar</button>
                                </td>
                            </tr>
                        </c:foreach>
                    </tbody>
                </table>
            </div>
        </div>

        <nav class="mt-2 d-flex justify-content-between align-items-center">
            <div>
                <span>Cantidad</span>
                <select class="form-select" onchange="cambiarCantidad(this)">
                    <option value="10">10</option>

                </select>
            </div>

            <div>
                <ul class="pagination mb-0">
                    <li class="page-item">
                        <a class="page-link" href="#">Anterior</a>
                    </li>

                    <c:foreach var="i" begin="1">
                        <li class="page-item">
                            <a class="page-link" href="#">1</a>
                        </li>
                    </c:foreach>

                    <li class="page-item">
                        <a class="page-link" href="#">Siguiente</a>
                    </li>
                </ul>
            </div>
        </nav>
    </div>


    <script>
        function cambiarCantidad(event) {
            const params = new URLSearchParams(window.location.search);
            params.set("cantidad", event.value);
            window.location.search = params.toString();
        }
    </script>
</asp:Content>


