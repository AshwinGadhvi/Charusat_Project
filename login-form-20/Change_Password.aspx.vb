Imports Dao
Imports System.Data
Imports BCrypt.Net
Partial Class login_form_20_Change_Password
    Inherits System.Web.UI.Page

    Private Sub Login_Click(sender As Object, e As EventArgs) Handles Login.Click
        If c1.Text = c2.Text Then
            Dim d As New Dao
            Dim obj As DataSet
            Dim hashedPassword As String = BCrypt.Net.BCrypt.HashPassword(c2.Text)
            obj = d.get_data("update Student_Registration set student_password='" & hashedPassword & "' where student_id='" & Session("u_id") & "'")

            Response.Redirect("Login.aspx")
        Else
            ScriptManager.RegisterStartupScript(Me, Me.GetType(), "alertMessage", "swal('Password Did not Match!', 'The Both Password Are Not Same!', 'error');", True)
        End If
    End Sub
End Class
