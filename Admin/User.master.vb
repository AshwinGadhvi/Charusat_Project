
Partial Class Admin_User
    Inherits System.Web.UI.MasterPage

    Private Sub Admin_User_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            If Session("user_name") IsNot Nothing Then
                lbluser.Text = "Welcome, " & Session("user_name")
            Else
                lbluser.Text = "Welcome, Guest!"
            End If
        End If
    End Sub
End Class

