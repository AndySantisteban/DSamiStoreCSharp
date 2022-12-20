<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeFile="Productos.aspx.cs" Inherits="Presentacion.Productos" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <form id="form1" runat="server">
        <div class="container px-4">
            <div class="py-4 bd-highlight row">
                <div class="title-proveedores py-2">
                    <h2>Productos</h2>
                </div>
                <div class="d-flex justify-content-between align-items-center">
                    <div>
                        <asp:LinkButton ID="tBtnEdit" runat="server" Text="Agregar" OnClick="MostrarSaveModal" CssClass="btn btn-primary"></asp:LinkButton>
                    </div>

                    <div class="d-flex">
                        <asp:TextBox ID="TbBuscar" runat="server" type="search" name="q" value="" placeholder="Buscar un producto" class="form-control me-2"></asp:TextBox>
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

                            <asp:TemplateField HeaderText="Nombre del producto">
                                <ItemTemplate>
                                    <asp:Label ID="tlbNombreProducto" runat="server" Text='<%# Eval("Nombre") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Descripcion">
                                <ItemTemplate>
                                    <asp:Label ID="tlbDescripcion" runat="server" Text='<%# Eval("Descripcion") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Precio">
                                <ItemTemplate>
                                    <asp:Label ID="tlbPrecio" runat="server" Text='<%# Eval("Precio") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            
                            <asp:TemplateField HeaderText="Marca">
                                <ItemTemplate>
                                    <asp:Label ID="tlbMarca" runat="server" Text='<%# Eval("Marca") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            
                            <asp:TemplateField HeaderText="Categoria">
                                <ItemTemplate>
                                    <asp:Label ID="tlbCategoria" runat="server" Text='<%# Eval("Categoria") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Almacen">
                                <ItemTemplate>
                                    <asp:Label ID="tlbAlmacen" runat="server" Text='<%# Eval("Almacen") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Moneda">
                                <ItemTemplate>
                                    <asp:Label ID="tlbMoneda" runat="server" Text='<%# Eval("Moneda") %>'></asp:Label>
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
                            <h5 class="modal-title">Agregar producto</h5>
                            <button type="button" class="btn-close p-2" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <div class="mb-3">
                                <label class="form-label">Nombre de producto</label>
                                <asp:TextBox ID="TbNombreProductoSave" runat="server" Text="" CssClass="form-control" placeholder="Agregar nombre de producto"></asp:TextBox>
                            </div>
                            
                            <div class="mb-3">
                                <label class="form-label">Descripción</label>
                                <asp:TextBox ID="TbDescripcionSave" runat="server" Text="" CssClass="form-control" placeholder="Agregar una descripcion al producto"></asp:TextBox>
                            </div>
                            
                            <div class="mb-3">
                                <label class="form-label">Precio</label>
                                <asp:TextBox ID="TbPrecioSave" runat="server" Text="" CssClass="form-control" placeholder="Agregar un precio al producto"></asp:TextBox>
                            </div>

                            <div class="mb-3">
                                <label class="form-label">Marca</label>
                                <asp:DropDownList ID="DropDownMarcaSave" runat="server" CssClass="form-select"></asp:DropDownList>
                            </div>

                            <div class="mb-3">
                                <label class="form-label">Categoria</label>
                                <asp:DropDownList ID="DropDownCategoriaSave" runat="server" CssClass="form-select"></asp:DropDownList>
                            </div>

                            <div class="mb-3">
                                <label class="form-label">Almacen</label>
                                <asp:DropDownList ID="DropDownAlmacenSave" runat="server" CssClass="form-select"></asp:DropDownList>
                            </div>

                            <div class="mb-3">
                                <label class="form-label">Moneda</label>
                                <asp:DropDownList ID="DropDownMonedaSave" runat="server" CssClass="form-select"></asp:DropDownList>
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
                            <h5 class="modal-title">Editar productos</h5>
                            <button type="button" class="btn-close p-2" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <div class="mb-3">
                                <label class="form-label">Código</label>
                                <asp:TextBox ID="TbCodigoUpdate" runat="server" Text="" CssClass="form-control" placeholder="Agregar código" ReadOnly="true"></asp:TextBox>
                            </div>

                            <div class="mb-3">
                                <label class="form-label">Nombre de producto</label>
                                <asp:TextBox ID="TbNombreProductoUpdate" runat="server" Text="" CssClass="form-control" placeholder="Agregar nombre de producto"></asp:TextBox>
                            </div>

                            <div class="mb-3">
                                <label class="form-label">Descripción</label>
                                <asp:TextBox ID="TbDescripcionUpdate" runat="server" Text="" CssClass="form-control" placeholder="Agregar una descripción del producto"></asp:TextBox>
                            </div>

                            <div class="mb-3">
                                <label class="form-label">Precio</label>
                                <asp:TextBox ID="TbPrecioUpdate" runat="server" Text="" CssClass="form-control" placeholder="Agregar una descripción del producto"></asp:TextBox>
                            </div>

                            <div class="mb-3">
                                <label class="form-label">Marca</label>
                                <asp:DropDownList ID="DropDownMarcaUpdate" runat="server" CssClass="form-select"></asp:DropDownList>
                            </div>

                            <div class="mb-3">
                                <label class="form-label">Categoria</label>
                                <asp:DropDownList ID="DropDownCategoriaUpdate" runat="server" CssClass="form-select"></asp:DropDownList>
                            </div>

                            <div class="mb-3">
                                <label class="form-label">Almacen</label>
                                <asp:DropDownList ID="DropDownAlmacenUpdate" runat="server" CssClass="form-select"></asp:DropDownList>
                            </div>

                            <div class="mb-3">
                                <label class="form-label">Moneda</label>
                                <asp:DropDownList ID="DropDownMonedaUpdate" runat="server" CssClass="form-select"></asp:DropDownList>
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
                            <h5 class="modal-title">Eliminar producto</h5>
                            <button type="button" class="btn-close p-2" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <asp:TextBox ID="TbCodigoDelete" runat="server" Text="" CssClass="d-none" placeholder="Ingregar código" ReadOnly="true"></asp:TextBox>
                            <asp:Label ID="LbNombreProductoDelete" runat="server" Text="" Style="text-align: center !important"></asp:Label>
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