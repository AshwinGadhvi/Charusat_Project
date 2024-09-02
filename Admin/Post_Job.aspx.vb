
Partial Class Admin_Post_Job
    Inherits System.Web.UI.Page
    Dim var As Integer = 0
    Private Sub Admin_Post_Job_Load(sender As Object, e As EventArgs) Handles Me.Load

        If Not Page.IsPostBack Then

            Session.Add("Flag", 0)

            Dim d As New Dao

            Dim ds As Data.DataSet = d.getData("Select company_id,company_name  from Company_Details")
            company_name.DataTextField = "company_name"
            company_name.DataValueField = "company_id"
            company_name.DataSource = ds.Tables(0)
            company_name.DataBind()

            Dim ds1 As Data.DataSet = d.getData("Select * from Job_Master where company_id = '" & company_name.SelectedValue & "' ")
            job_title.DataTextField = "job_title"
            job_title.DataValueField = "job_id"
            job_title.DataSource = ds1.Tables(0)
            job_title.DataBind()
        End If
        var = company_name.Text
    End Sub

    Private Sub company_name_SelectedIndexChanged(sender As Object, e As EventArgs) Handles company_name.SelectedIndexChanged
        Dim d1 As New Dao
        var = company_name.Text
        If company_name.AutoPostBack = True Then

            Dim ds1 As Data.DataSet = d1.getData("Select * from Job_Master where company_id = '" & var & "' ")
            job_title.DataTextField = "job_title"
            job_title.DataValueField = "job_id"
            job_title.DataSource = ds1.Tables(0)
            job_title.DataBind()

        End If
    End Sub
End Class
