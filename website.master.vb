Partial Class website
    Inherits System.Web.UI.MasterPage

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            If Session("u_name") IsNot Nothing Then
                u_name.Text = "Welcome, " & Session("u_name").ToString()
                loginRegisterLinks.Visible = False
                'btnLogout.Visible = True
                btnUserImage.Visible = True
            Else
                u_name.Text = ""
                loginRegisterLinks.Visible = True
                'btnLogout.Visible = False
            End If
        End If
    End Sub

    Protected Sub btnLogout_Click(sender As Object, e As EventArgs)
        Session.Abandon()
        Response.Redirect("Main.aspx") ' Redirect to home or login page after logout
    End Sub
End Class