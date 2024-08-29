
Partial Class Admin
    Inherits System.Web.UI.MasterPage

    Private Sub Admin_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            If Session("admin_name") IsNot Nothing Then
                lblAdminName.Text = "Welcome, " & Session("admin_name")
            Else
                lblAdminName.Text = "Welcome, Guest!"
            End If
        End If
    End Sub
End Class

