
Partial Class login_form_20_otp
    Inherits System.Web.UI.Page

    Private Sub otp_Load(sender As Object, e As EventArgs) Handles otp.Load
        If Not Page.IsPostBack Then
            ScriptManager.RegisterStartupScript(Me, Me.GetType(), "alertMessage", "swal('OTP Sent!', 'The OTP Has been Sent to the Specified E-mail!', 'success');", True)
        End If
    End Sub

    Private Sub Confirm_Click(sender As Object, e As EventArgs) Handles Confirm.Click
        If otp.Text = Session("Otp") Then
            Response.Redirect("Change_Password.aspx")
        Else
            ScriptManager.RegisterStartupScript(Me, Me.GetType(), "alertMessage", "swal('Wrong OTP!', 'The OTP is Not Correct!', 'error');", True)
        End If
    End Sub
End Class
