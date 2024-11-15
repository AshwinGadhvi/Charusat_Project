Imports System.Net
Imports System.Net.Mail
Imports System.Text
Imports System.Security.Cryptography
Imports BCrypt.Net ' Make sure to include the BCrypt library

Partial Class login_form_20_Login
    Inherits System.Web.UI.Page

    Private Sub Login_Click(sender As Object, e As EventArgs) Handles Login.Click
        Dim d As New Dao
        Dim ds As New Data.DataSet
        ' Check if the email exists in Company_Master
        ds = d.getData("SELECT * FROM Student_Registration WHERE student_email = '" & company_email.Text & "'")
        If ds.Tables(0).Rows.Count > 0 Then
            ' Verify password for Company_Master
            If BCrypt.Net.BCrypt.Verify(company_password.Text, ds.Tables(0).Rows(0)("student_password").ToString()) Then
                Session("Main_id") = ds.Tables(0).Rows(0)("sr_id").ToString()
                Session("u_id") = ds.Tables(0).Rows(0)("student_id").ToString()
                Session("u_name") = ds.Tables(0).Rows(0)("student_f_name").ToString()
                Response.Redirect("../Main.aspx")
            Else
                company_email.Text = ""
                lbl_msg.Text = "Incorrect Id And Password..!!!!"
                lbl_msg.ForeColor = Drawing.Color.White
                company_email.Focus()
                Return
            End If
        End If


        ' If no match found
        company_email.Text = ""
        lbl_msg.Text = "Incorrect Id And Password..!!!!"
        lbl_msg.ForeColor = Drawing.Color.White
        company_email.Focus()
    End Sub

    Private Sub Forgot_Click(sender As Object, e As EventArgs) Handles Forgot.Click

    End Sub
End Class
