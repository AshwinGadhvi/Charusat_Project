Imports BCrypt

Partial Class login_form_20_Register
    Inherits System.Web.UI.Page

    Private Sub Login_Click(sender As Object, e As EventArgs) Handles Login.Click
        ' Validate the email domain
        If student_email.Text.EndsWith("@charusat.edu.in") Then
            Dim hashedPassword As String = BCrypt.Net.BCrypt.HashPassword(student_password.Text)
            SqlDataSource1.InsertParameters("student_f_name").DefaultValue = student_f_name.Text
            SqlDataSource1.InsertParameters("student_l_name").DefaultValue = student_l_name.Text
            SqlDataSource1.InsertParameters("student_id").DefaultValue = student_id.Text
            SqlDataSource1.InsertParameters("student_email").DefaultValue = student_email.Text
            SqlDataSource1.InsertParameters("student_phone").DefaultValue = student_phone.Text
            SqlDataSource1.InsertParameters("student_password").DefaultValue = hashedPassword  ' Use hashed password here

            ' Insert the record into the database
            SqlDataSource1.Insert()

            ' Optional: Show success message or redirect
            Response.Redirect("Login.aspx")
        Else
            ' Handle invalid email domain case
            ' You might want to display an error message to the user
            Response.Write("<script>alert('Please use a valid charusat.edu.in email address.');</script>")
            student_email.Text = ""
            student_email.Focus()
        End If
    End Sub
End Class
