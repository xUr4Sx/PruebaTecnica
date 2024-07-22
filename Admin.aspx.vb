Imports MySql.Data.MySqlClient

Public Class Admin
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            BindGrid()
        End If
    End Sub

    Private Sub BindGrid()
        Dim connString As String = ConfigurationManager.ConnectionStrings("MySqlConnectionString").ConnectionString
        Using conn As New MySqlConnection(connString)
            Dim query As String = "SELECT UserID, FullName, DocumentID, DOB, Phone, Username, Password FROM Users"
            Dim cmd As New MySqlCommand(query, conn)
            Dim da As New MySqlDataAdapter(cmd)
            Dim dt As New DataTable()
            da.Fill(dt)
            gvUsers.DataSource = dt
            gvUsers.DataBind()
        End Using
    End Sub

    Protected Sub gvUsers_RowEditing(ByVal sender As Object, ByVal e As GridViewEditEventArgs)
        ' Set the GridView to edit mode for the selected row
        gvUsers.EditIndex = e.NewEditIndex
        BindGrid()
    End Sub

    Protected Sub gvUsers_RowUpdating(ByVal sender As Object, ByVal e As GridViewUpdateEventArgs)
        Dim userID As Integer = Convert.ToInt32(gvUsers.DataKeys(e.RowIndex).Value)
        Dim txtFullName As TextBox = CType(gvUsers.Rows(e.RowIndex).FindControl("txtFullName"), TextBox)
        Dim txtDocumentID As TextBox = CType(gvUsers.Rows(e.RowIndex).FindControl("txtDocumentID"), TextBox)
        Dim txtDOB As TextBox = CType(gvUsers.Rows(e.RowIndex).FindControl("txtDOB"), TextBox)
        Dim txtPhone As TextBox = CType(gvUsers.Rows(e.RowIndex).FindControl("txtPhone"), TextBox)
        Dim txtUsername As TextBox = CType(gvUsers.Rows(e.RowIndex).FindControl("txtUsername"), TextBox)
        Dim txtPassword As TextBox = CType(gvUsers.Rows(e.RowIndex).FindControl("txtPassword"), TextBox)

        Dim connString As String = ConfigurationManager.ConnectionStrings("MySqlConnectionString").ConnectionString
        Using conn As New MySqlConnection(connString)
            Dim query As String = "UPDATE Users SET FullName = @FullName, DocumentID = @DocumentID, DOB = @DOB, Phone = @Phone, Username = @Username, Password = @Password WHERE UserID = @UserID"
            Dim cmd As New MySqlCommand(query, conn)
            cmd.Parameters.AddWithValue("@FullName", txtFullName.Text)
            cmd.Parameters.AddWithValue("@DocumentID", txtDocumentID.Text)
            cmd.Parameters.AddWithValue("@DOB", txtDOB.Text)
            cmd.Parameters.AddWithValue("@Phone", txtPhone.Text)
            cmd.Parameters.AddWithValue("@Username", txtUsername.Text)
            cmd.Parameters.AddWithValue("@Password", txtPassword.Text)
            cmd.Parameters.AddWithValue("@UserID", userID)

            conn.Open()
            cmd.ExecuteNonQuery()
            conn.Close()
        End Using

        gvUsers.EditIndex = -1
        BindGrid()
    End Sub

    Protected Sub gvUsers_RowCancelingEdit(ByVal sender As Object, ByVal e As GridViewCancelEditEventArgs)
        gvUsers.EditIndex = -1
        BindGrid()
    End Sub

    Protected Sub gvUsers_RowDeleting(ByVal sender As Object, ByVal e As GridViewDeleteEventArgs)
        Dim userID As Integer = Convert.ToInt32(gvUsers.DataKeys(e.RowIndex).Value)

        Dim connString As String = ConfigurationManager.ConnectionStrings("MySqlConnectionString").ConnectionString
        Using conn As New MySqlConnection(connString)
            Dim query As String = "DELETE FROM Users WHERE UserID = @UserID"
            Dim cmd As New MySqlCommand(query, conn)
            cmd.Parameters.AddWithValue("@UserID", userID)

            conn.Open()
            cmd.ExecuteNonQuery()
            conn.Close()
        End Using

        BindGrid()
    End Sub
End Class



















