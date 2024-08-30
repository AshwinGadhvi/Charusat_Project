
Partial Class Admin_Round_Information
    Inherits System.Web.UI.Page

    Private Sub Admin_Round_Information_Load(sender As Object, e As EventArgs) Handles Me.Load
        Dim d As New Dao
        Dim ds As New Data.DataSet
        ds = d.getData("select company_id from Company_Details where c_id='" & Session("u_id") & "'")
        If ds.Tables(0).Rows.Count > 0 Then
            company_id.Text = ds.Tables(0).Rows(0)("company_id")
        End If
    End Sub
End Class
