Imports Dao
Imports System.Data
Partial Class login_form_20_Change_Password
    Inherits System.Web.UI.Page

    Private Sub Login_Click(sender As Object, e As EventArgs) Handles Login.Click
        If c1.Text = c2.Text Then
            Dim d As New Dao
            Dim obj As DataSet
            obj = d.get_data("update Login_master set u_pass='" & c1.Text & "' where u_name='" & Session("u_name") & "'")

            Response.Redirect("Login.aspx")
        Else
            ScriptManager.RegisterStartupScript(Me, Me.GetType(), "alertMessage", "swal('Password Did not Match!', 'The Both Password Are Not Same!', 'error');", True)
        End If
    End Sub
End Class
