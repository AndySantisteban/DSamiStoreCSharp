<%@ Page Title="Usuarios" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeFile="Usuarios.aspx.cs" Inherits="Presentacion.Usuarios" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <form id="form1" runat="server">
        <div class="container px-4">
            <div class="py-4 bd-highlight row">
                <div class="title-proveedores py-2">
                    <h2>Usuarios</h2>
                </div>
                <div class="d-flex justify-content-between align-items-center">
                    <div>
                        <asp:LinkButton ID="tBtnEdit" runat="server" Text="Agregar" OnClick="MostrarSaveModal" CssClass="btn btn-primary"></asp:LinkButton>
                    </div>

                    <div class="d-flex">
                        <asp:TextBox ID="TbBuscar" runat="server" type="search" name="q" value="" placeholder="Buscar un usuario" class="form-control me-2"></asp:TextBox>
                        <asp:LinkButton runat="server" OnClick="Buscar" CssClass="btn btn-primary">Buscar</asp:LinkButton>
                    </div>
                </div>

            </div>
            <div class="card">
                <div class="table-responsive">
                    <asp:GridView ID="GridViewTable" runat="server" CssClass="table table-borderless"
                        DataKeyNames="Codigo" AutoGenerateColumns="false" GridLines="None">
                        <Columns>
                            <asp:TemplateField HeaderText="N">
                                <ItemTemplate>
                                    <asp:Label ID="tlbN" runat="server" Text='<%# Eval("N") %>'></asp:Label>
                                    <asp:Label ID="tlbCodigo" runat="server" Text='<%# Eval("Codigo") %>' CssClass="d-none"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Nombre de usuario">
                                <ItemTemplate>
                                    <asp:Label ID="tlbNombreUsuario" runat="server" Text='<%# Eval("NombreUsuario") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Empleado">
                                <ItemTemplate>
                                    <asp:Label ID="tlbEmpleado" runat="server" Text='<%# Eval("Empleado") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Rol">
                                <ItemTemplate>
                                    <asp:Label ID="tlbRol" runat="server" Text='<%# Eval("Rol") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Acciones">
                                <ItemTemplate>
                                    <div class="d-flex justify-content-center">
                                        <asp:LinkButton ID="tBtnEdit" runat="server" Text="Editar" OnClick="MostrarUpdateModal" CssClass="btn btn-secondary me-2"></asp:LinkButton>
                                        <asp:LinkButton ID="tBtnDelete" runat="server" Text="Eliminar" OnClick="MostrarDeleteModal" CssClass="btn btn-danger me-2"></asp:LinkButton>
                                    </div>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
            </div>

            <div class="modal fade" id="saveModal" role="dialog">
                <div class="modal-dialog">
                    <!-- Modal content-->
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title">Agregar usuario</h5>
                            <button type="button" class="btn-close p-2" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <div class="mb-3">
                                <label class="form-label">Nombre de usuario</label>
                                <asp:TextBox ID="TbNombreUsuarioSave" runat="server" Text="" CssClass="form-control" placeholder="Ingregar nombre de usuario"></asp:TextBox>
                            </div>

                            <div class="mb-3">
                                <label class="form-label">Clave</label>
                                <asp:TextBox ID="TbClaveSave" runat="server" TextMode="Password" Text="" CssClass="form-control" placeholder="Ingresar clave"></asp:TextBox>
                            </div>

                            <div class="mb-3">
                                <label class="form-label">Rol</label>
                                <asp:DropDownList ID="DropDownRolSave" runat="server" CssClass="form-select"></asp:DropDownList>
                            </div>

                            <div class="mb-3">
                                <label class="form-label">Empleado</label>
                                <asp:DropDownList ID="DropDownEmpleadoSave" runat="server" CssClass="form-select"></asp:DropDownList>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                            <asp:Button ID="btnSave" runat="server" Text="Aceptar" OnClick="btnSave_Click" CssClass="btn btn-primary" />
                        </div>
                    </div>
                </div>
                <script type='text/javascript'>
                    function saveModal() {
                        const myModal = new bootstrap.Modal(document.getElementById("saveModal"), {});

                        myModal.show();
                    }
                </script>

            </div>
            <div class="modal fade" id="updateModal" role="dialog">
                <div class="modal-dialog">
                    <!-- Modal content-->
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title">Editar usuario</h5>
                            <button type="button" class="btn-close p-2" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <div class="mb-3">
                                <label class="form-label">Código</label>
                                <asp:TextBox ID="TbCodigoUpdate" runat="server" Text="" CssClass="form-control" placeholder="Ingregar código" ReadOnly="true"></asp:TextBox>
                            </div>

                            <div class="mb-3">
                                <label class="form-label">Nombre de usuario</label>
                                <asp:TextBox ID="TbNombreUsuarioUpdate" runat="server" Text="" CssClass="form-control" placeholder="Ingregar nombre de usuario"></asp:TextBox>
                            </div>

                            <div class="mb-3">
                                <label class="form-label">Clave</label>
                                <asp:TextBox ID="TbClaveUpdate" runat="server" TextMode="Password" Text="" CssClass="form-control" placeholder="Ingresar clave"></asp:TextBox>
                            </div>

                            <div class="mb-3">
                                <label class="form-label">Rol</label>
                                <asp:DropDownList ID="DropDownRolUpdate" runat="server" CssClass="form-select"></asp:DropDownList>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                            <asp:Button ID="btnUpdate" runat="server" Text="Aceptar" OnClick="btnUpdate_Click" CssClass="btn btn-primary" />
                        </div>
                    </div>
                </div>
                <script type='text/javascript'>
                    function updateModal() {
                        const myModal = new bootstrap.Modal(document.getElementById("updateModal"), {});

                        myModal.show();
                    }
                </script>
            </div>

            <div class="modal fade" id="deleteModal" role="dialog">
                <div class="modal-dialog">
                    <!-- Modal content-->
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title">Eliminar usuario</h5>
                            <button type="button" class="btn-close p-2" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <asp:TextBox ID="TbCodigoDelete" runat="server" Text="" CssClass="d-none" placeholder="Ingregar código" ReadOnly="true"></asp:TextBox>
                            <asp:Label ID="LbNombreUsuarioDelete" runat="server" Text="" Style="text-align: center !important"></asp:Label>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                            <asp:Button runat="server" Text="Aceptar" OnClick="btnDelete_Click" CssClass="btn btn-danger" />
                        </div>
                    </div>
                </div>
                <script type='text/javascript'>
                    function deleteModal() {
                        const myModal = new bootstrap.Modal(document.getElementById("deleteModal"), {});

                        myModal.show();
                    }
                </script>
            </div>

            <nav class="mt-2 d-flex justify-content-between align-items-center">
                <div>
                    <span>Cantidad</span>
                    <asp:DropDownList AutoPostBack="True" ID="DropDownLimite" runat="server" CssClass="form-select" OnSelectedIndexChanged="CambiarLimite"></asp:DropDownList>
                </div>

                <div>
                    <div>
                        <span>Página</span>
                        <asp:DropDownList AutoPostBack="True" ID="DropDownPagina" runat="server" CssClass="form-select" OnSelectedIndexChanged="CambiarPagina"></asp:DropDownList>
                    </div>
                </div>
            </nav>
        </div>
    </form>
</asp:Content>
