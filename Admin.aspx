<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Admin.aspx.vb" Inherits="PruebaTecnica.Admin" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Administración de Usuarios</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.min.css" />
    <style>
        .action-buttons {
            display: flex;
            justify-content: space-between;
        }
        .form-control-plaintext {
            border: none;
            background: none;
            padding: 0;
            margin: 0;
        }
        .grid-view {
            margin: 20px;
        }
        .btn-group {
            display: flex;
            justify-content: center;
        }
        .btn-group .btn {
            margin: 0 10px;
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
        <!-- Navbar -->
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
                        <a class="nav-link btn btn-outline-light mr-2  shadow-sm" href="Register.aspx">Registrar Usuario</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link btn btn-outline-light shadow-sm" href="Login.aspx">Cerrar Sesion</a>
                    </li>
                </ul>
            </div>
        </nav>

        <!-- Content -->
<div class="container">
    <h1 class="mt-4 mb-4">Administración de Usuarios</h1>
    
    <!-- Error Message Label -->
    <asp:Label ID="lblMessage" runat="server" CssClass="text-danger"></asp:Label>
    
    <asp:GridView ID="gvUsers" runat="server" AutoGenerateColumns="False" CssClass="table table-striped table-bordered grid-view"
        OnRowEditing="gvUsers_RowEditing" OnRowUpdating="gvUsers_RowUpdating" OnRowCancelingEdit="gvUsers_RowCancelingEdit"
        OnRowDeleting="gvUsers_RowDeleting" DataKeyNames="UserID">
        <Columns>
            <asp:BoundField DataField="UserID" HeaderText="ID" ReadOnly="True" />
            <asp:TemplateField HeaderText="Nombre Completo">
                <EditItemTemplate>
                    <asp:TextBox ID="txtFullName" runat="server" CssClass="form-control" Text='<%# Bind("FullName") %>' />
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="lblFullName" runat="server" CssClass="form-control-plaintext" Text='<%# Bind("FullName") %>' />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Cédula">
                <EditItemTemplate>
                    <asp:TextBox ID="txtDocumentID" runat="server" CssClass="form-control" Text='<%# Bind("DocumentID") %>' />
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="lblDocumentID" runat="server" CssClass="form-control-plaintext" Text='<%# Bind("DocumentID") %>' />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Fecha de Nacimiento">
                <EditItemTemplate>
                    <asp:TextBox ID="txtDOB" runat="server" CssClass="form-control datepicker" Text='<%# Bind("DOB", "{0:yyyy-MM-dd}") %>' />
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="lblDOB" runat="server" CssClass="form-control-plaintext" Text='<%# Bind("DOB", "{0:yyyy-MM-dd}") %>' />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Teléfono">
                <EditItemTemplate>
                    <asp:TextBox ID="txtPhone" runat="server" CssClass="form-control" Text='<%# Bind("Phone") %>' />
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="lblPhone" runat="server" CssClass="form-control-plaintext" Text='<%# Bind("Phone") %>' />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Usuario">
                <EditItemTemplate>
                    <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control" Text='<%# Bind("Username") %>' />
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="lblUsername" runat="server" CssClass="form-control-plaintext" Text='<%# Bind("Username") %>' />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Contraseña">
                <EditItemTemplate>
                    <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" Text='<%# Bind("Password") %>' />
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="lblPassword" runat="server" CssClass="form-control-plaintext" Text='<%# Bind("Password") %>' />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Acciones">
                <ItemTemplate>
                    <div class="btn-group">
                        <asp:Button ID="btnEdit" runat="server" CommandName="Edit" CssClass="btn btn-primary btn-sm" Text="Editar" />
                        <asp:Button ID="btnDeactivate" runat="server" CommandName="Delete" CssClass="btn btn-danger btn-sm" Text="Desactivar" />
                    </div>
                </ItemTemplate>
                <EditItemTemplate>
                    <div class="btn-group">
                        <asp:Button ID="btnUpdate" runat="server" CommandName="Update" CssClass="btn btn-success btn-sm" Text="Actualizar" />
                        <asp:Button ID="btnCancel" runat="server" CommandName="Cancel" CssClass="btn btn-secondary btn-sm" Text="Cancelar" />
                    </div>
                </EditItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
</div>

<!-- Include Bootstrap and DatePicker scripts -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script>
<script>
    $(document).ready(function () {
        $('.datepicker').datepicker({
            format: 'yyyy-mm-dd',
            autoclose: true
        });
    });
</script>

    </form>
</body>
</html>

















