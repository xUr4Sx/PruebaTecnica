<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Register.aspx.vb" Inherits="PruebaTecnica.Register" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Registro de Usuario</title>
    <!-- Bootstrap CSS -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        body {
            background-color: #f8f9fa;
        }
        .container {
            max-width: 900px;
        }
        .form-panel {
            border: 1px solid #dee2e6;
            border-radius: .375rem;
            padding: 2rem;
            background-color: #ffffff;
            box-shadow: 0 0 .125rem rgba(0, 0, 0, .2);
        }
        .form-group label {
            font-weight: 500;
        }
        .btn-primary {
            width: 100%;
        }
        .alert-custom {
            margin-bottom: 1rem;
        }
        .navbar-dark .navbar-nav .nav-link {
            color: #ffffff;
        }
        .nav-link:hover {
            color: #f8f9fa;
            background-color: rgba(255, 255, 255, 0.1);
        }
        .btn-outline-light {
            border-color: #ffffff;
        }
        .btn-outline-light:hover {
            background-color: #ffffff;
            color: #000000;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <a class="navbar-brand" href="#">Administración</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item">
                        <a class="nav-link btn btn-outline-light mr-2 shadow-sm" href="Admin.aspx">Usuarios</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link btn btn-outline-light mr-2 shadow-sm" href="Register.aspx">Registrar Usuario</a>
                    </li>
                    <li class="nav-item">
                       <a class="nav-link btn btn-outline-light shadow-sm" href="Login.aspx">Cerrar Sesion</a>
                    </li>
                </ul>
            </div>
        </nav>

        <div class="container mt-5">
            <h2 class="text-center mb-4">Registro de Usuario</h2>
            <div class="row justify-content-center">
                <div class="col-md-8 col-lg-6">
                    <asp:Panel ID="pnlRegister" runat="server" CssClass="form-panel">
                        <!-- Mensaje de Advertencia -->
                        <asp:Panel ID="pnlAlert" runat="server" CssClass="alert alert-danger alert-custom" Visible="False">
                            <asp:Label ID="lblMessage" runat="server" CssClass="mb-0" />
                        </asp:Panel>

                        <div class="form-group">
                            <asp:Label ID="lblName" runat="server" CssClass="form-label" Text="Nombre Completo:" />
                            <asp:TextBox ID="txtName" runat="server" CssClass="form-control" />
                        </div>
                        <div class="form-group">
                            <asp:Label ID="lblID" runat="server" CssClass="form-label" Text="Número de Documento:" />
                            <asp:TextBox ID="txtID" runat="server" CssClass="form-control" />
                        </div>
                        <div class="form-group">
                            <asp:Label ID="lblDOB" runat="server" CssClass="form-label" Text="Fecha de Nacimiento:" />
                            <input type="date" id="txtDOB" runat="server" class="form-control" />
                        </div>
                        <div class="form-group">
                            <asp:Label ID="lblPhone" runat="server" CssClass="form-label" Text="Teléfono:" />
                            <asp:TextBox ID="txtPhone" runat="server" CssClass="form-control" />
                        </div>
                        <div class="form-group">
                            <asp:Label ID="lblUsername" runat="server" CssClass="form-label" Text="Nombre de Usuario:" />
                            <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control" />
                        </div>
                        <div class="form-group">
                            <asp:Label ID="lblPassword" runat="server" CssClass="form-label" Text="Contraseña:" />
                            <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" TextMode="Password" />
                        </div>
                        <asp:Button ID="btnRegister" runat="server" CssClass="btn btn-primary" Text="Registrar" OnClick="btnRegister_Click" />
                    </asp:Panel>
                </div>
            </div>
        </div>

        <!-- Modal de Éxito -->
        <div class="modal fade" id="successModal" tabindex="-1" role="dialog" aria-labelledby="successModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="successModalLabel">Éxito</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        Usuario registrado con éxito.
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                    </div>
                </div>
            </div>
        </div>

        <!-- Scripts de Bootstrap -->
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </form>
</body>
</html>
