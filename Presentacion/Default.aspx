<%@ Page Title="" Language="C#" MasterPageFile="~/Landing.Master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Presentacion.Default" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="navbar border-bottom">
        <div class="container">
            <a href="/" class="navbar-brand fw-bold">D'Sami Store</a>
        </div>
    </div>
    <div class="container">
        <form class="card mt-5 mx-auto" style="max-width: 512px;" action="/usuarios" method="POST">
            <div class="card-body">
                <div class="mt-3 mb-3">
                    <h1 class="h4 fw-bold text-center">Inicio de sesión</h1>
                </div>
                <div class="mb-3">
                    <label for="username" class="form-label">Nombre de usuario</label>
                    <input class="form-control" id="username" name="nombreUsuario" placeholder="Ingresa nombre de usario" required>
                </div>
                <div class="mb-3">
                    <label for="password" class="form-label">Clave</label>
                    <input type="password" id="password" name="clave" class="form-control" placeholder="Ingresar clave" required>
                </div>
                <div class="text-center">
                    <button type="submit" class="btn btn-primary">Acceder</button>
                </div>
            </div>
        </form>
    </div>
    <footer>
        <div class="container position-absolute bottom-0 start-50 translate-middle-x">
            <div class="py-5">
                <p class="text-center text-muted">© 2021 D'Sami Store</p>
            </div>
        </div>
    </footer>
</asp:Content>
