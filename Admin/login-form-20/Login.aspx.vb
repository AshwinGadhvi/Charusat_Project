Imports System.Net
Imports System.Net.Mail
Imports System.Text
Imports System.Security.Cryptography
Partial Class login_form_20_Login
    Inherits System.Web.UI.Page

    Private Sub Login_Click(sender As Object, e As EventArgs) Handles Login.Click
        Dim d As New Dao
        Dim ds As New Data.DataSet
        ds = d.getData("select * from Company_Master where company_email='" & company_email.Text & "' and company_password='" & company_password.Text & "' ")



        If ds.Tables(0).Rows.Count > 0 Then
            Session("u_id") = ds.Tables(0).Rows(0)("company_id").ToString()
            Session("u_name") = ds.Tables(0).Rows(0)("company_name").ToString()
            Response.Redirect("../Company_Dashboard.aspx")
        Else
            company_email.Text = ""
            lbl_msg.Text = "Incorrect Id And Password..!!!!" 'popup
            lbl_msg.ForeColor = Drawing.Color.White
            company_email.Focus()
        End If
    End Sub
End Class
