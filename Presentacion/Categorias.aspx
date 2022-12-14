<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeFile="Categorias.aspx.cs" Inherits="Presentacion.Categorias" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
     <form id="form1" runat="server">

    <div class="container px-4">
        <div class="py-4 bd-highlight row">
                <div class="title-proveedores py-2">
                    <h2>Categorias</h2>
                </div>

                <div class="d-flex justify-content-between align-items-center">
                    <div>
                        <asp:LinkButton ID="tbtnEditaC" runat="server" Text="Agregar" OnClick="MostrarSaveModalC" CssClass="btn btn-primary"></asp:LinkButton>

                    </div>

                    <div class="d-flex">
                        <asp:TextBox ID="TbBuscarC" runat="server" type="search" name="q" value="" placeholder="Buscar Categoria" class="form-control me-2"></asp:TextBox>
                        <asp:LinkButton runat="server" OnClick="BuscarC" CssClass="btn btn-primary">Buscar</asp:LinkButton>

                      
                    </div>
                </div>
            </div>

        <%--  --%>
        <div class="card">
                <div class="table-responsive">
                    <asp:GridView ID="GridViewTableC" runat="server" CssClass="table table-borderless"
                        DataKeyNames="Codigo" AutoGenerateColumns="false" GridLines="None">
                        <Columns>
                            <asp:TemplateField HeaderText="N">
                                <ItemTemplate>
                                    <asp:Label ID="tlbNC" runat="server" Text='<%# Eval("N") %>'></asp:Label>
                                    <asp:Label ID="tlbCodigoC" runat="server" Text='<%# Eval("Codigo") %>' CssClass="d-none"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Nombre de usuario">
                                <ItemTemplate>
                                    <asp:Label ID="tlbNombreC" runat="server" Text='<%# Eval("Nombre") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>

                           <asp:TemplateField HeaderText="Nombre de usuario">
                                <ItemTemplate>
                                    <asp:Label ID="tlbDescripcionC" runat="server" Text='<%# Eval("Descripcion") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>

                           

                            <asp:TemplateField HeaderText="Acciones">
                                <ItemTemplate>
                                    <div class="d-flex justify-content-center">
                                        <asp:LinkButton ID="tBtnEditC" runat="server" Text="Editar" OnClick="MostrarUpdateModalC" CssClass="btn btn-secondary me-2"></asp:LinkButton>
                                        <asp:LinkButton ID="tBtnDeleteC" runat="server" Text="Eliminar" OnClick="MostrarDeleteModalC" CssClass="btn btn-danger me-2"></asp:LinkButton>
                                    </div>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
            </div>

        <%--  --%>
    
        <!-- Modal para Agregar-->
        <div class="modal fade" id="saveModalC" role="dialog">
            <div class="modal-dialog ">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Agregar categoría</h5>
                        <button type="button" class="btn-close p-2" data-bs-dismiss="modal" aria-label="Close">
                        </button>
                    </div>

                    <div class="modal-body">
                        <div class="row">
                            <div class="mb-3">
                                <label for="agregar-nombre" class="col-form-label">Nombre</label>
                                <asp:TextBox ID="TbNombreCategoriaSave" runat="server" Text="" CssClass="form-control" placeholder="Ingregar nombre de categoria"></asp:TextBox>

                            </div>
                            <div>
                                <label for="agregar-descripcion" class="col-form-label">Descripción</label>
                                <asp:TextBox ID="TbDescripcionCategoriaSave" runat="server" Text="" CssClass="form-control" placeholder="Ingregar Descripción  de categoria"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                        <asp:Button ID="btnSaveC" runat="server" Text="Aceptar" OnClick="btnSave_ClickC" CssClass="btn btn-primary" />

                    </div>

                </div>
            </div>
            <script type='text/javascript'>
                function saveModalC() {
                    const myModal = new bootstrap.Modal(document.getElementById("saveModalC"), {});

                    myModal.show();
                }
            </script>
        </div>
        <!-- Modal para EDITAR-->
        <div class="modal fade" id="updateModalC" role="dialog">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="staticBackdropLabel">Editar categoría</h5>
                        <button type="button" class="btn-close p-2" data-bs-dismiss="modal" aria-label="Close">
                        </button>
                    </div>

                    
                    <div class="modal-body" id="cont_modal">
                        <div class="mb-3">
                                <label class="form-label">Código</label>
                                <asp:TextBox ID="TbCodigoUpdateC" runat="server" Text="" CssClass="form-control" placeholder="Ingregar código" ReadOnly="true"></asp:TextBox>
                            </div>
                        <div class="mb-3">
                            <label for="editar-nombre" class="col-form-label">Nombre</label>
                            <asp:TextBox ID="TbNombreCategoriaUpdate" runat="server" Text="" CssClass="form-control" placeholder="Ingregar nombre de Categoria"></asp:TextBox>

                        </div>

                        <div>
                            <label for="editar-descripcion" class="col-form-label">Descripción</label>
                            <asp:TextBox ID="TbNombreDescripcionUpdate" runat="server" Text="" CssClass="form-control" placeholder="Ingregar descripcion de Categoria"></asp:TextBox>

                        </div>
                    </div>

                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                        <asp:Button ID="btnUpdateC" runat="server" Text="Aceptar" OnClick="btnUpdate_ClickC" CssClass="btn btn-primary" />

                    </div>
                </div>
            </div>
             <script type='text/javascript'>
                 function updateModalC() {
                     const myModal = new bootstrap.Modal(document.getElementById("updateModalC"), {});

                     myModal.show();
                 }
             </script>
        </div>
        <!-- Modal para ELIMINAR-->
        <div class="modal fade" id="deleteModalC" role="dialog">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                       <asp:TextBox ID="TbCodigoDeleteC" runat="server" Text="" CssClass="d-none" placeholder="Ingregar código" disabled="true"></asp:TextBox>
                       <asp:Label ID="LbNombreCategoriaDelete" runat="server" Text="" Style="text-align: center !important"></asp:Label>

                    </div>

                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                        <asp:Button runat="server" Text="Aceptar" OnClick="btnDelete_ClickC" CssClass="btn btn-danger" />

                    </div>
                </div>
            </div>
            <script type='text/javascript'>
                function deleteModalC() {
                    const myModal = new bootstrap.Modal(document.getElementById("deleteModalC"), {});
                    myModal.show();
                }
            </script>
        </div>



    </div>

        <nav class="mt-2 d-flex justify-content-between align-items-center">
            <div>
                <span>Cantidad</span>
                <asp:DropDownList AutoPostBack="True" ID="DropDownLimiteC" runat="server" CssClass="form-select" OnSelectedIndexChanged="CambiarLimiteC"></asp:DropDownList>
            </div>

            <div>
                <div>
                    <span>Página</span>
                    <asp:DropDownList AutoPostBack="True" ID="DropDownPaginaC" runat="server" CssClass="form-select" OnSelectedIndexChanged="CambiarPaginaC"></asp:DropDownList>
                </div>
            </div>
        </nav>
    

    </form>

</asp:Content>
