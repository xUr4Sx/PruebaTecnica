<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Login.aspx.vb" Inherits="PruebaTecnica.Login" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Login</title>
    <!-- Bootstrap CSS -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-md-6 col-lg-4 mt-5">
                    <div class="card">
                        <div class="card-body">
                            <h3 class="text-center">Login</h3>
                            <div class="form-group">
                                <asp:Label ID="lblUser" runat="server" Text="Usuario:" CssClass="form-label" />
                                <asp:TextBox ID="txtUser" runat="server" CssClass="form-control" />
                            </div>
                            <div class="form-group">
                                <asp:Label ID="lblPassword" runat="server" Text="Contraseña:" CssClass="form-label" />
                                <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="form-control" />
                            </div>
                            <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="btn btn-primary btn-block" OnClick="btnLogin_Click" />
                            <asp:Label ID="lblMessage" runat="server" ForeColor="Red" CssClass="mt-3 d-block text-center" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
    <!-- Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
