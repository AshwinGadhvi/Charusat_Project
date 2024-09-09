
Partial Class Admin_Job_Master
    Inherits System.Web.UI.Page

    Private Sub Admin_Job_Master_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            Session.Add("Flag", 0)
        End If
        Try
            Dim d As New Dao
            Dim ds As New Data.DataSet
            ds = d.getData("select * from company_details where c_id='" & Session("u_id") & "'")
            If ds.Tables(0).Rows.Count > 0 Then
                company_id.Text = ds.Tables(0).Rows(0)("company_id").ToString()
                job_location.Text = ds.Tables(0).Rows(0)("company_country").ToString()
                job_industry.Text = ds.Tables(0).Rows(0)("company_industry").ToString()
                job_logo.Text = ds.Tables(0).Rows(0)("company_logo").ToString()
            End If
        Catch ex As Exception
            MsgBox(ex.Message)
        End Try
    End Sub

    Private Sub submit_Click(sender As Object, e As EventArgs) Handles submit.Click
        Try
            If Session("Flag") = 0 Then
                SqlDataSource1.InsertParameters("company_id").DefaultValue = company_id.Text
                SqlDataSource1.InsertParameters("job_title").DefaultValue = job_title.Text
                SqlDataSource1.InsertParameters("job_type").DefaultValue = job_type.SelectedValue
                SqlDataSource1.InsertParameters("job_package").DefaultValue = job_package.Text
                SqlDataSource1.InsertParameters("job_location").DefaultValue = job_location.Text
                SqlDataSource1.InsertParameters("job_industry").DefaultValue = job_industry.Text
                SqlDataSource1.InsertParameters("job_description").DefaultValue = job_description.Text
                SqlDataSource1.InsertParameters("job_requirements").DefaultValue = job_requirements.Text
                SqlDataSource1.InsertParameters("job_logo").DefaultValue = job_logo.Text
                SqlDataSource1.Insert()
                clear()
            Else
                SqlDataSource1.UpdateParameters("company_id").DefaultValue = company_id.Text
                SqlDataSource1.UpdateParameters("job_title").DefaultValue = job_title.Text
                SqlDataSource1.UpdateParameters("job_type").DefaultValue = job_type.SelectedValue
                SqlDataSource1.UpdateParameters("job_package").DefaultValue = job_package.Text
                SqlDataSource1.UpdateParameters("job_location").DefaultValue = job_location.Text
                SqlDataSource1.UpdateParameters("job_industry").DefaultValue = job_industry.Text
                SqlDataSource1.UpdateParameters("job_description").DefaultValue = job_description.Text
                SqlDataSource1.UpdateParameters("job_requirements").DefaultValue = job_requirements.Text
                SqlDataSource1.UpdateParameters("job_logo").DefaultValue = job_logo.Text
                SqlDataSource1.UpdateParameters("job_id").DefaultValue = job_id.Value
                SqlDataSource1.Update()
                clear()
            End If
        Catch ex As Exception

        End Try
    End Sub

    Private Sub show_Click(sender As Object, e As EventArgs) Handles show.Click
        If show.Text = "Show" Then
            show.Text = "Hide"
            example1.Visible = True
        ElseIf show.Text = "Hide" Then
            show.Text = "Show"
            example1.Visible = False
        End If
    End Sub

    Private Sub example1_RowCommand(sender As Object, e As GridViewCommandEventArgs) Handles example1.RowCommand
        Try
            If e.CommandName = "del" Then
                SqlDataSource1.DeleteParameters("job_id").DefaultValue = e.CommandArgument
                SqlDataSource1.Delete()
                example1.DataBind()
                clear()
            End If
        Catch ex As Exception
            MsgBox(ex.Message)
        End Try
    End Sub

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

    Protected Sub Edit1_Click(sender As Object, e As EventArgs)
        Dim gvRow As GridViewRow = CType(CType(sender, Control).Parent.Parent, GridViewRow)
        Dim index As Integer = gvRow.RowIndex
        job_id.Value = Convert.ToInt32(example1.DataKeys(index).Values("job_id"))
        company_id.Text = example1.Rows(index).Cells(1).Text
        job_title.Text = example1.Rows(index).Cells(2).Text
        job_type.SelectedValue = example1.Rows(index).Cells(3).Text
        job_package.Text = example1.Rows(index).Cells(4).Text
        job_location.Text = example1.Rows(index).Cells(5).Text
        job_industry.Text = example1.Rows(index).Cells(6).Text
        job_description.Text = example1.Rows(index).Cells(7).Text
        job_requirements.Text = example1.Rows(index).Cells(8).Text
        job_logo.Text = example1.Rows(index).Cells(9).Text
        Session("Flag") = 1
    End Sub
    Public Sub clear()
        job_title.Text = ""
        job_package.Text = ""
        job_type.SelectedValue = 1
        job_description.Text = ""
        job_requirements.Text = ""

    End Sub
End Class
