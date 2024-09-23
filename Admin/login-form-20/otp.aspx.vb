
Partial Class login_form_20_otp
    Inherits System.Web.UI.Page
    Private Sub submit_Click(sender As Object, e As EventArgs) Handles submit.Click
        If otp.Text = Session("otp") Then
            Response.Redirect("Change_Password.aspx")
        Else
            ScriptManager.RegisterStartupScript(Me, Me.GetType(), "alertMessage", "swal('Wrong OTP!', 'The OTP is Not Correct!', 'error');", True)
        End If
    End Sub

End Class
