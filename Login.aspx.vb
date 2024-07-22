Imports MySql.Data.MySqlClient

Public Class Login
    Inherits System.Web.UI.Page

    Protected Sub btnLogin_Click(ByVal sender As Object, ByVal e As EventArgs)
        Dim username As String = txtUser.Text
        Dim password As String = txtPassword.Text

        Dim connString As String = ConfigurationManager.ConnectionStrings("MySqlConnectionString").ConnectionString
        Using conn As New MySqlConnection(connString)
            Dim query As String = "SELECT COUNT(*) FROM Users WHERE Username = @username AND Password = @password"
            Using cmd As New MySqlCommand(query, conn)
                cmd.Parameters.AddWithValue("@username", username)
                cmd.Parameters.AddWithValue("@password", password)

                conn.Open()
                Dim count As Integer = Convert.ToInt32(cmd.ExecuteScalar())

                If count > 0 Then
                    Response.Redirect("Admin.aspx")
                Else
                    lblMessage.Text = "Usuario o contraseña incorrectos."
                End If
            End Using
        End Using
    End Sub
End Class

