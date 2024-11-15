
Imports System.IO

Partial Class Student_Project
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Session("Flag") = 0 ' 0 for Insert, 1 for Update
        End If
        student_id.Text = Session("Main_id")
    End Sub

    Protected Sub submit_Click(sender As Object, e As EventArgs) Handles submit.Click
        Try
            Dim uniqueFileName As String = p_name.Text ' Default to existing file name
            Dim uploadFolder As String = Server.MapPath("~/project/")

            ' Ensure upload folder exists
            If Not Directory.Exists(uploadFolder) Then
                Directory.CreateDirectory(uploadFolder)
            End If

            ' Handle File Upload
            If p_upload.HasFile Then
                Dim ext As String = Path.GetExtension(p_upload.FileName).ToLower()
                If ext = ".jpg" Or ext = ".png" Or ext = ".jpeg" Or ext = ".pdf" Then
                    uniqueFileName = Guid.NewGuid().ToString() & ext
                    p_upload.SaveAs(Path.Combine(uploadFolder, uniqueFileName))

                    ' Delete old file if updating
                    If Session("Flag") = 1 AndAlso Not String.IsNullOrEmpty(p_name.Text) Then
                        Dim oldFilePath = Path.Combine(uploadFolder, p_name.Text)
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
                SqlDataSource1.InsertParameters("pro_name").DefaultValue = Project_name.Text
                SqlDataSource1.InsertParameters("pro_description").DefaultValue = project_description.Text
                SqlDataSource1.InsertParameters("pro_cname").DefaultValue = uniqueFileName
                SqlDataSource1.InsertParameters("sr_id").DefaultValue = student_id.Text
                SqlDataSource1.InsertParameters("tech_stack").DefaultValue = technology_stack.Text
                SqlDataSource1.Insert()

                p_name.ForeColor = Drawing.Color.Green
                p_name.Text = "Project added successfully!"
            Else ' Update Operation
                SqlDataSource1.UpdateParameters("pro_name").DefaultValue = Project_name.Text
                SqlDataSource1.UpdateParameters("pro_description").DefaultValue = project_description.Text
                SqlDataSource1.UpdateParameters("pro_cname").DefaultValue = uniqueFileName
                SqlDataSource1.UpdateParameters("pro_id").DefaultValue = project_no.Value
                SqlDataSource1.UpdateParameters("tech_stack").DefaultValue = technology_stack.Text
                SqlDataSource1.Update()

                p_name.ForeColor = Drawing.Color.Green
                p_name.Text = "Certificate updated successfully!"
            End If

            ' Reset form
            ClearForm()
        Catch ex As Exception
            p_name.ForeColor = Drawing.Color.Red
            p_name.Text = "Error: " & ex.Message
        End Try
    End Sub

    Protected Sub Example1_RowDeleting(sender As Object, e As GridViewDeleteEventArgs) Handles Example1.RowDeleting
        Try
            Dim certificateId As Integer = Convert.ToInt32(e.Keys("pro_id"))
            Dim fileName As String = e.Values("pro_cname").ToString()
            Dim uploadFolder As String = Server.MapPath("~/project/")

            ' Delete the associated file
            If Not String.IsNullOrEmpty(fileName) AndAlso File.Exists(Path.Combine(uploadFolder, fileName)) Then
                File.Delete(Path.Combine(uploadFolder, fileName))
            End If

            SqlDataSource1.DeleteParameters("pro_id").DefaultValue = certificateId.ToString()
            SqlDataSource1.Delete()
            p_name.ForeColor = Drawing.Color.Green
            p_name.Text = "Certificate deleted successfully!"
        Catch ex As Exception
            p_name.ForeColor = Drawing.Color.Red
            p_name.Text = "Error: " & ex.Message
        End Try
    End Sub
    Protected Sub Edit1_Click(sender As Object, e As EventArgs)
        Try
            Dim gvRow As GridViewRow = CType(CType(sender, Control).Parent.Parent, GridViewRow)
            Dim index As Integer = gvRow.RowIndex

            Project_name.Text = example1.Rows(index).Cells(1).Text
            project_description.Text = example1.Rows(index).Cells(2).Text
            p_name.Text = example1.Rows(index).Cells(3).Text
            technology_stack.Text = example1.Rows(index).Cells(5).Text
            project_no.Value = Convert.ToInt32(example1.DataKeys(index).Values("pro_id"))

            Session("Flag") = 1 ' Set to Update mode
        Catch ex As Exception
            p_name.ForeColor = Drawing.Color.Red
            p_name.Text = "Error: " & ex.Message
        End Try
    End Sub
    Private Sub ClearForm()
        Project_name.Text = String.Empty
        project_description.Text = String.Empty
        p_name.Text = String.Empty
        p_upload.Attributes.Clear()
        Session("Flag") = 0 ' Reset to Insert mode
    End Sub
End Class
