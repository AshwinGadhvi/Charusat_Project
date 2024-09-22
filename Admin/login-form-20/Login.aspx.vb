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
        Dim ds1 As New Data.DataSet
        Dim ds2 As New Data.DataSet

        ' Check if the email exists in Company_Master
        ds = d.getData("SELECT * FROM Company_Master WHERE company_email = '" & company_email.Text & "'")
        If ds.Tables(0).Rows.Count > 0 Then
            ' Verify password for Company_Master
            If BCrypt.Net.BCrypt.Verify(company_password.Text, ds.Tables(0).Rows(0)("company_password").ToString()) Then
                Session("u_id") = ds.Tables(0).Rows(0)("company_id").ToString()
                Session("u_name") = ds.Tables(0).Rows(0)("company_name").ToString()
                Response.Redirect("../Company_Dashboard.aspx")
            Else
                company_email.Text = ""
                lbl_msg.Text = "Incorrect Id And Password..!!!!"
                lbl_msg.ForeColor = Drawing.Color.White
                company_email.Focus()
                Return
            End If
        End If

        ' Check for Admin
        ds1 = d.getData("SELECT * FROM Admin_Master WHERE user_name = '" & company_email.Text & "'")
        If ds1.Tables(0).Rows.Count > 0 Then
            ' Verify password for Admin_Master
            If BCrypt.Net.BCrypt.Verify(company_password.Text, ds1.Tables(0).Rows(0)("user_password").ToString()) Then
                Session("admin_name") = ds1.Tables(0).Rows(0)("user_name").ToString()
                Response.Redirect("../Home.aspx")
            Else
                company_email.Text = ""
                lbl_msg.Text = "Incorrect Id And Password..!!!!"
                lbl_msg.ForeColor = Drawing.Color.White
                company_email.Focus()
                Return
            End If
        End If

        ' Check for User
        ds2 = d.getData("SELECT * FROM Admin_Master WHERE user_name = '" & company_email.Text & "' AND user_type = 'User'")
        If ds2.Tables(0).Rows.Count > 0 Then
            ' Verify password for User
            If BCrypt.Net.BCrypt.Verify(company_password.Text, ds2.Tables(0).Rows(0)("user_password").ToString()) Then
                Session("user_name") = ds2.Tables(0).Rows(0)("user_name").ToString()
                Response.Redirect("../employee.aspx")
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
End Class
