
Partial Class Main
    Inherits System.Web.UI.Page

    Private Sub Main_Load(sender As Object, e As EventArgs) Handles Me.Load
        ' Set the current date to filter jobs that haven't expired
        SqlDataSource1.SelectParameters("CurrentDate").DefaultValue = DateTime.Now.ToString("yyyy-MM-dd")

    End Sub



End Class
