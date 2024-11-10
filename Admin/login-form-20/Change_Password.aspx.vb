Imports Dao
Imports System.Data
Imports BCrypt.Net
Partial Class login_form_20_Change_Password
    Inherits System.Web.UI.Page

    Private Sub Login_Click(sender As Object, e As EventArgs) Handles Login.Click
        se.Text = Session("u_name")
        If c1.Text.Equals(c2.Text) Then
            Dim d As New Dao
            Dim hashedPassword As String = BCrypt.Net.BCrypt.HashPassword(c2.Text)

            d.modifyData("update Company_Master set company_password='" & hashedPassword & "' where company_name='" & se.Text & "'")

            Response.Redirect("Login.aspx")
        Else
            ScriptManager.RegisterStartupScript(Me, Me.GetType(), "alertMessage", "swal('Password Did not Match!', 'The Both Password Are Not Same!', 'error');", True)
        End If
    End Sub
End Class
