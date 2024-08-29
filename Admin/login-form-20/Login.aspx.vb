Imports System.Net
Imports System.Net.Mail
Imports System.Text
Imports System.Security.Cryptography
Partial Class login_form_20_Login
    Inherits System.Web.UI.Page

    Private Sub Login_Click(sender As Object, e As EventArgs) Handles Login.Click
        Dim d As New Dao
        Dim ds As New Data.DataSet
        Dim ds1 As New Data.DataSet
        Dim ds2 As New Data.DataSet
        ds = d.getData("select * from Company_Master where company_email='" & company_email.Text & "' and company_password='" & company_password.Text & "' ")
        ds1 = d.getData("select * from Admin_Master where user_name ='" & company_email.Text & "' and user_password ='" & company_password.Text & "' and user_type='Admin'")
        ds2 = d.getData("select * from Admin_Master where user_name ='" & company_email.Text & "' and user_password ='" & company_password.Text & "' and user_type='User'")


        If ds.Tables(0).Rows.Count > 0 Then
            Session("u_id") = ds.Tables(0).Rows(0)("company_id").ToString()
            Session("u_name") = ds.Tables(0).Rows(0)("company_name").ToString()
            Response.Redirect("../Company_Dashboard.aspx")
        ElseIf ds1.Tables(0).Rows.Count > 0 Then
            Session("admin_name") = ds1.Tables(0).Rows(0)("user_name").ToString()
            Response.Redirect("../Home.aspx")
        ElseIf ds2.Tables(0).Rows.Count > 0 Then
            Session("user_name") = ds1.Tables(0).Rows(0)("user_name").ToString()
            'Response.Redirect("../Home.aspx")
        Else
            company_email.Text = ""
            lbl_msg.Text = "Incorrect Id And Password..!!!!" 'popup
            lbl_msg.ForeColor = Drawing.Color.White
            company_email.Focus()
        End If
    End Sub
End Class
