Imports System.Net.Mail
Imports System.Net
Imports System.Text
Imports System.Security.Cryptography

Partial Class Company_Login
    Inherits System.Web.UI.Page

    Private Sub example1_PreRender(sender As Object, e As EventArgs) Handles example1.PreRender
        Try
            example1.UseAccessibleHeader = True
            example1.HeaderRow.TableSection = TableRowSection.TableHeader
        Catch ex As Exception
            ' Handle exception if necessary
        End Try
    End Sub

    Private Sub example1_RowDataBound(sender As Object, e As GridViewRowEventArgs) Handles example1.RowDataBound
        If (e.Row.RowType = DataControlRowType.Header) Then
            e.Row.TableSection = TableRowSection.TableHeader
        End If
    End Sub

    Private Sub submit_Click(sender As Object, e As EventArgs) Handles submit.Click
        Try
            If Session("Flag") = 0 Then
                SqlDataSource1.InsertParameters("company_name").DefaultValue() = company_name.Text
                SqlDataSource1.InsertParameters("company_email").DefaultValue() = company_email.Text
                SqlDataSource1.InsertParameters("company_password").DefaultValue() = company_password.Text
                SqlDataSource1.Insert()
                clear()
            Else
                SqlDataSource1.UpdateParameters("company_name").DefaultValue() = company_name.Text
                SqlDataSource1.UpdateParameters("company_email").DefaultValue() = company_email.Text
                SqlDataSource1.UpdateParameters("company_password").DefaultValue() = company_password.Text
                SqlDataSource1.UpdateParameters("company_id").DefaultValue() = company_id.Value
                SqlDataSource1.Update()
                clear()
            End If
        Catch ex As Exception
            MsgBox(ex.Message)
        End Try
    End Sub

    Private Sub Company_Login_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            Session.Add("Flag", 0)
        End If
    End Sub

    Protected Sub Edit1_Click(sender As Object, e As EventArgs)
        Dim gvRow As GridViewRow = CType(CType(sender, Control).Parent.Parent, GridViewRow)
        Dim index As Integer = gvRow.RowIndex
        company_name.Text = example1.Rows(index).Cells(1).Text
        company_email.Text = example1.Rows(index).Cells(2).Text
        company_password.Text = example1.Rows(index).Cells(3).Text
        company_id.Value = Convert.ToInt32(example1.DataKeys(index).Values("company_id"))
        Session("Flag") = 1
    End Sub

    Protected Sub example1_RowCommand(sender As Object, e As GridViewCommandEventArgs) Handles example1.RowCommand
        Try
            If e.CommandName = "del" Then
                SqlDataSource1.DeleteParameters("company_id").DefaultValue = e.CommandArgument
                SqlDataSource1.Delete()
                example1.DataBind()
                clear()
            ElseIf e.CommandName = "email" Then
                Dim index As Integer = Convert.ToInt32(e.CommandArgument)
                ' Ensure the index is within the bounds of the GridView rows
                If index >= 0 AndAlso index < example1.Rows.Count Then
                    Dim email As String = example1.Rows(index).Cells(2).Text
                    Dim companyName As String = example1.Rows(index).Cells(1).Text
                    Dim password As String = example1.Rows(index).Cells(3).Text
                    SendEmail(email, companyName, password)
                Else
                    Throw New ArgumentOutOfRangeException("index", "Index was out of range. Must be non-negative and less than the size of the collection.")
                End If
            End If
        Catch ex As ArgumentOutOfRangeException
            MsgBox(ex.Message)
            'ClientScript.RegisterStartupScript(Me.GetType(), "Alert", $"alert('{ex.Message}');", True)
        Catch ex As Exception
            MsgBox(ex.Message)

            'ClientScript.RegisterStartupScript(Me.GetType(), "Alert", $"alert('An error occurred: {ex.Message}');", True)
        End Try
    End Sub

    Private Sub SendEmail(email As String, companyName As String, password As String)
        Try
            Dim fromAddress As New MailAddress("tfgpashwin397@gmail.com", "tfgp ashwin")
            Dim toAddress As New MailAddress(email)
            Dim fromPassword As String = "rayv ephx hpbd gezo" ' Update with your email password
            Dim subject As String = "Company Credential Information"
            Dim body As String = "Hello! I hope this email finds you well." & vbCrLf & "Your email and password for logging into the Charusat Company Dashboard are:" & vbCrLf & "Email: " & email & "Password: " & password

            Dim smtp As New SmtpClient("smtp.gmail.com", 587)
            smtp.EnableSsl = True
            smtp.DeliveryMethod = SmtpDeliveryMethod.Network
            smtp.UseDefaultCredentials = False
            smtp.Credentials = New NetworkCredential(fromAddress.Address, fromPassword)
            smtp.Timeout = 20000

            Dim message As New MailMessage(fromAddress, toAddress)
            message.Subject = subject
            message.Body = body
            message.BodyEncoding = Encoding.UTF8
            message.IsBodyHtml = False

            smtp.Send(message)

            ' Display success alert
            ClientScript.RegisterStartupScript(Me.GetType(), "Alert", "alert('Email sent successfully to your email.');", True)
        Catch ex As Exception
            ' Display error alert
            ' ClientScript.RegisterStartupScript(Me.GetType(), "Alert", $"alert('Failed to send email. Error message: {ex.Message.Replace("'", "\'")}');", True)
        End Try
    End Sub

    Public Sub clear()
        company_name.Text = ""
        company_password.Text = ""
        company_email.Text = ""
        company_id.Value = ""
    End Sub
End Class
