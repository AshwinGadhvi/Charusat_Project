
Partial Class Company_Information
    Inherits System.Web.UI.Page

    Private Sub Company_Information_Load(sender As Object, e As EventArgs) Handles Me.Load
        post_id.Text = Session("post_id")
        Dim d As New Dao
        Dim ds As New Data.DataSet
        ds = d.getData("select company_id,job_id from  Post_Company where post_id='" & post_id.Text & "'")
        If ds.Tables(0).Rows.Count > 0 Then
            company_id.Text = ds.Tables(0).Rows(0)("company_id")
            job_id.Text = ds.Tables(0).Rows(0)("job_id")
        End If
    End Sub
End Class
