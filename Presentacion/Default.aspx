<%@ Page Title="" Language="C#" MasterPageFile="~/Landing.Master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Presentacion.Default" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="navbar border-bottom">
        <div class="container">
            <a href="/" class="navbar-brand fw-bold">D'Sami Store</a>
        </div>
    </div>
    <div class="container">
        <form runat="server" class="card mt-5 mx-auto" style="max-width: 512px;"  method="POST">
            <div class="card-body">
                <div class="mt-3 mb-3">
                    <h1 class="h4 fw-bold text-center">Inicio de sesión</h1>
                </div>
                <div class="mb-3">
                    <asp:Label ID="Label2" runat="server" Text="Nombre de usuario" AssociatedControlId="tbUsername" CssClass="form-label"></asp:Label>
                    <asp:TextBox ID="tbUsername" runat="server" CssClass="form-control" placeholder="Ingresar nombre de usuario"></asp:TextBox>
                </div>
                <div class="mb-3">
                    <asp:Label ID="Label1" runat="server" Text="Clave" AssociatedControlId="tbPassword" CssClass="form-label"></asp:Label>
                    <asp:TextBox ID="tbPassword" runat="server" TextMode="Password" CssClass="form-control" placeholder="Ingresar clave"></asp:TextBox>
                </div>   
                <asp:Label ID="lbMsg" runat="server" Text=""></asp:Label>
                <div class="text-center">
                    <asp:Button ID="Button1" runat="server" Text="Acceder" CssClass="btn btn-primary" OnClick="BtnCreate_Click" />
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
