Imports System.IO

Partial Class Student_Certificate
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Session("Flag") = 0 ' 0 for Insert, 1 for Update
        End If
        student_id.Text = Session("Main_id")
    End Sub

    ' Handle Insert or Update operations
    Protected Sub submit_Click(sender As Object, e As EventArgs) Handles submit.Click
        Try
            Dim uniqueFileName As String = c_name.Text ' Default to existing file name
            Dim uploadFolder As String = Server.MapPath("~/certificate/")

            ' Ensure upload folder exists
            If Not Directory.Exists(uploadFolder) Then
                Directory.CreateDirectory(uploadFolder)
            End If

            ' Handle File Upload
            If c_upload.HasFile Then
                Dim ext As String = Path.GetExtension(c_upload.FileName).ToLower()
                If ext = ".jpg" Or ext = ".png" Or ext = ".jpeg" Or ext = ".pdf" Then
                    uniqueFileName = Guid.NewGuid().ToString() & ext
                    c_upload.SaveAs(Path.Combine(uploadFolder, uniqueFileName))

                    ' Delete old file if updating
                    If Session("Flag") = 1 AndAlso Not String.IsNullOrEmpty(c_name.Text) Then
                        Dim oldFilePath = Path.Combine(uploadFolder, c_name.Text)
                        If File.Exists(oldFilePath) Then
                            File.Delete(oldFilePath)
                        End If
                    End If
                Else
                    Throw New Exception("Invalid file type. Only JPG, PNG, JPEG, and PDF files are allowed.")
                End If
            End If

            ' Insert or Update logic based on the "Flag"
            If Session("Flag") = 0 Then ' Insert Operation
                SqlDataSource1.InsertParameters("certificate_name").DefaultValue = certificate_name.Text
                SqlDataSource1.InsertParameters("certificate_description").DefaultValue = certificate_description.Text
                SqlDataSource1.InsertParameters("cp_name").DefaultValue = uniqueFileName
                SqlDataSource1.InsertParameters("sr_id").DefaultValue = student_id.Text
                SqlDataSource1.Insert()

                c_name.ForeColor = Drawing.Color.Green
                c_name.Text = "Certificate added successfully!"
            Else ' Update Operation
                SqlDataSource1.UpdateParameters("certificate_name").DefaultValue = certificate_name.Text
                SqlDataSource1.UpdateParameters("certificate_description").DefaultValue = certificate_description.Text
                SqlDataSource1.UpdateParameters("cp_name").DefaultValue = uniqueFileName
                SqlDataSource1.UpdateParameters("certificate_id").DefaultValue = certificate_no.Value
                SqlDataSource1.Update()

                c_name.ForeColor = Drawing.Color.Green
                c_name.Text = "Certificate updated successfully!"
            End If

            ' Reset form
            ClearForm()
        Catch ex As Exception
            c_name.ForeColor = Drawing.Color.Red
            c_name.Text = "Error: " & ex.Message
        End Try
    End Sub

    ' Handle Delete Operation
    Protected Sub Example1_RowDeleting(sender As Object, e As GridViewDeleteEventArgs) Handles Example1.RowDeleting
        Try
            Dim certificateId As Integer = Convert.ToInt32(e.Keys("certificate_id"))
            Dim fileName As String = e.Values("cp_name").ToString()
            Dim uploadFolder As String = Server.MapPath("~/certificate/")

            ' Delete the associated file
            If Not String.IsNullOrEmpty(fileName) AndAlso File.Exists(Path.Combine(uploadFolder, fileName)) Then
                File.Delete(Path.Combine(uploadFolder, fileName))
            End If

            SqlDataSource1.DeleteParameters("certificate_id").DefaultValue = certificateId.ToString()
            SqlDataSource1.Delete()
            c_name.ForeColor = Drawing.Color.Green
            c_name.Text = "Certificate deleted successfully!"
        Catch ex As Exception
            c_name.ForeColor = Drawing.Color.Red
            c_name.Text = "Error: " & ex.Message
        End Try
    End Sub

    ' Populate form fields for updating
    Protected Sub Edit1_Click(sender As Object, e As EventArgs)
        Try
            Dim gvRow As GridViewRow = CType(CType(sender, Control).Parent.Parent, GridViewRow)
            Dim index As Integer = gvRow.RowIndex

            certificate_name.Text = Example1.Rows(index).Cells(1).Text
            certificate_description.Text = Example1.Rows(index).Cells(2).Text
            c_name.Text = Example1.Rows(index).Cells(3).Text
            certificate_no.Value = Convert.ToInt32(Example1.DataKeys(index).Values("certificate_id"))

            Session("Flag") = 1 ' Set to Update mode
        Catch ex As Exception
            c_name.ForeColor = Drawing.Color.Red
            c_name.Text = "Error: " & ex.Message
        End Try
    End Sub

    ' Clear the form after submission or update
    Private Sub ClearForm()
        certificate_name.Text = String.Empty
        certificate_description.Text = String.Empty
        c_name.Text = String.Empty
        c_upload.Attributes.Clear()
        Session("Flag") = 0 ' Reset to Insert mode
    End Sub

End Class
