
Partial Class Company
    Inherits System.Web.UI.MasterPage

    Private Sub Company_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            If Session("u_name") IsNot Nothing Then
                lblUserName.Text = "Welcome, " & Session("u_name")
            Else
                lblUserName.Text = "Welcome, Guest!"
            End If
        End If
    End Sub
End Class

