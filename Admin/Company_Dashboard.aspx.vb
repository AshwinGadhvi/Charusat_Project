
Partial Class Company_Dashboard
    Inherits System.Web.UI.Page

    Private Sub Company_Dashboard_Load(sender As Object, e As EventArgs) Handles Me.Load
        user_id.value = Session("u_id")
        user_name.value = Session("u_name")
    End Sub
End Class
