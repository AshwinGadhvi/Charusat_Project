Partial Class Home
    Inherits System.Web.UI.Page

    Private Sub Home_Load(sender As Object, e As EventArgs) Handles Me.Load
        ' First query for Student_Registration
        Dim d As New Dao
        Dim ds As New Data.DataSet
        ds = d.getData("select * from Student_Registration")
        If ds.Tables(0).Rows.Count > 0 Then
            Label1.Text = ds.Tables(0).Rows.Count.ToString()
        End If

        ' Second query for College_Master
        Dim d1 As New Dao
        Dim ds1 As New Data.DataSet
        ds1 = d1.getData("select * from Company_Master")
        If ds1.Tables(0).Rows.Count > 0 Then
            Label2.Text = ds1.Tables(0).Rows.Count.ToString()
        End If
    End Sub
End Class
