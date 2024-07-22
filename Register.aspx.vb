Imports MySql.Data.MySqlClient
Imports System.Text.RegularExpressions

Public Class Register
    Inherits System.Web.UI.Page

    Protected Sub btnRegister_Click(ByVal sender As Object, ByVal e As EventArgs)
        ' Obtiene los valores del formulario
        Dim name As String = txtName.Text.Trim()
        Dim id As String = txtID.Text.Trim()
        Dim dob As String = txtDOB.Value
        Dim phone As String = txtPhone.Text.Trim()
        Dim username As String = txtUsername.Text.Trim()
        Dim password As String = txtPassword.Text.Trim()

        ' Validación
        If String.IsNullOrEmpty(name) OrElse Not Regex.IsMatch(name, "^[a-zA-Z\s]+$") Then
            lblMessage.Text = "Nombre y Apellido son obligatorios y solo deben contener letras."
            pnlAlert.Visible = True
            Return
        End If

        If String.IsNullOrEmpty(id) OrElse Not Regex.IsMatch(id, "^\d+$") Then
            lblMessage.Text = "Cédula no puede estar vacía y debe ser un número válido."
            pnlAlert.Visible = True
            Return
        End If

        Dim dateOfBirth As Date
        If Not Date.TryParse(dob, dateOfBirth) OrElse dateOfBirth >= Date.Now.AddYears(-18) Then
            lblMessage.Text = "Fecha de Nacimiento debe ser una fecha válida y debes ser mayor de edad."
            pnlAlert.Visible = True
            Return
        End If

        If String.IsNullOrEmpty(phone) OrElse Not Regex.IsMatch(phone, "^\+?\d{10,15}$") Then
            lblMessage.Text = "Teléfono no puede estar vacío y debe tener un formato válido."
            pnlAlert.Visible = True
            Return
        End If

        If String.IsNullOrEmpty(username) Then
            lblMessage.Text = "Usuario no puede estar vacío."
            pnlAlert.Visible = True
            Return
        End If

        ' Validación de contraseña
        Dim passwordPattern As String = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$"
        If String.IsNullOrEmpty(password) OrElse Not Regex.IsMatch(password, passwordPattern) Then
            lblMessage.Text = "Contraseña debe tener al menos 8 caracteres, incluyendo una mayúscula, una minúscula, un número y un carácter especial."
            pnlAlert.Visible = True
            Return
        End If

        ' Conecta a la base de datos y guarda los datos del usuario
        Dim connString As String = ConfigurationManager.ConnectionStrings("MySqlConnectionString").ConnectionString
        Using conn As New MySqlConnection(connString)
            ' Verifica si el usuario ya existe
            Dim checkQuery As String = "SELECT COUNT(*) FROM Users WHERE Username = @username OR DocumentID = @id"
            Using checkCmd As New MySqlCommand(checkQuery, conn)
                checkCmd.Parameters.AddWithValue("@username", username)
                checkCmd.Parameters.AddWithValue("@id", id)
                conn.Open()
                Dim count As Integer = Convert.ToInt32(checkCmd.ExecuteScalar())
                If count > 0 Then
                    lblMessage.Text = "El usuario o la cédula ya están registrados."
                    pnlAlert.Visible = True
                    Return
                End If
            End Using

            ' Guarda los datos del usuario
            Dim query As String = "INSERT INTO Users (FullName, DocumentID, DOB, Phone, Username, Password) VALUES (@name, @id, @dob, @phone, @username, @password)"
            Using cmd As New MySqlCommand(query, conn)
                cmd.Parameters.AddWithValue("@name", name)
                cmd.Parameters.AddWithValue("@id", id)
                cmd.Parameters.AddWithValue("@dob", dateOfBirth)
                cmd.Parameters.AddWithValue("@phone", phone)
                cmd.Parameters.AddWithValue("@username", username)
                cmd.Parameters.AddWithValue("@password", password)

                Dim rowsAffected As Integer = cmd.ExecuteNonQuery()
                If rowsAffected > 0 Then
                    ' Limpiar los campos del formulario
                    txtName.Text = ""
                    txtID.Text = ""
                    txtDOB.Value = ""
                    txtPhone.Text = ""
                    txtUsername.Text = ""
                    txtPassword.Text = ""

                    ' Mostrar el modal de éxito
                    ClientScript.RegisterStartupScript(Me.GetType(), "SuccessModal", "$('#successModal').modal('show');", True)
                Else
                    lblMessage.Text = "No se pudo registrar el usuario. Intenta de nuevo más tarde."
                    pnlAlert.Visible = True
                End If
            End Using
        End Using
    End Sub
End Class




