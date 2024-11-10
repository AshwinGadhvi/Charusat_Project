
Imports System.Data

Partial Class Admin_login_form_20_Forgot_Password
    Inherits System.Web.UI.Page

    Private Sub submit_Click(sender As Object, e As EventArgs) Handles submit.Click
        Try
            Dim d As New Dao
            Dim ds As New Data.DataSet
            ds = d.getData("select student_email from Student_Registration where student_email='" & txtEmail.Text & "'")
            If ds.Tables(0).Rows.Count > 0 Then
                Dim otp As String
                Dim rand As Random = New Random()
                otp = (rand.Next(999999)).ToString()

                Session("otp") = otp
                Session("email") = txtEmail.Text
                Dim d1 As New Dao
                d1.send_mail(txtEmail.Text, "The OTP for Resetting the password is " & otp & vbCrLf & "Please Do Not Share this OTP With Anyone.")
                Response.Redirect("otp.aspx")
            Else
                MsgBox("Email Not Shown")
                ScriptManager.RegisterStartupScript(Me, Me.GetType(), "alertMessage", "swal('E-mail Not Registered!', 'The Specified Email is not in the Records!', 'error');", True)
            End If
        Catch ex As Exception
            MsgBox(ex.Message)
        End Try
    End Sub
End Class
