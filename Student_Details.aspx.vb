
Partial Class Student_Details
    Inherits System.Web.UI.Page

    Private Sub Student_Details_Load(sender As Object, e As EventArgs) Handles Me.Load
        student_id.Text = Session("Main_id")
    End Sub

    Protected Sub example1_RowDeleting(sender As Object, e As GridViewDeleteEventArgs)
        Try
            ' Get the certificate_id of the row being deleted
            Dim certificateId As Integer = Convert.ToInt32(example1.DataKeys(e.RowIndex).Value)

            ' Set up the SQL data source delete command with the certificate_id parameter
            SqlDataSource1.DeleteParameters("certificate_id").DefaultValue = certificateId.ToString()

            ' Execute the delete command to remove the record from the database
            SqlDataSource1.Delete()

            ' Optionally, you can refresh the GridView or show a confirmation message
            ' example1.DataBind() ' To rebind and refresh the grid if needed

            ' If you want to show a confirmation message
            MsgBox("Certificate deletd successfully")
        Catch ex As Exception
            ' Handle errors (if any)
            MsgBox("Error")
        End Try
    End Sub

End Class
