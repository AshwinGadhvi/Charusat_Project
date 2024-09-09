Partial Class Admin_Post_Job
    Inherits System.Web.UI.Page
    Dim var As Integer = 0

    Private Sub Admin_Post_Job_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            Session("Flag") = 0
            BindCompanyDropDown()
            BindJobDropDown(company_name.SelectedValue)
        End If
    End Sub

    Private Sub BindCompanyDropDown()
        Dim d As New Dao
        Dim ds As Data.DataSet = d.getData("Select company_id, company_name from Company_Details")
        company_name.DataTextField = "company_name"
        company_name.DataValueField = "company_id"
        company_name.DataSource = ds.Tables(0)
        company_name.DataBind()
    End Sub

    Private Sub BindJobDropDown(companyID As String)
        Dim d As New Dao
        Dim ds As Data.DataSet = d.getData("Select job_id, job_title from Job_Master where company_id = '" & companyID & "'")
        job_title.DataTextField = "job_title"
        job_title.DataValueField = "job_id"
        job_title.DataSource = ds.Tables(0)
        job_title.DataBind()
    End Sub

    Private Sub company_name_SelectedIndexChanged(sender As Object, e As EventArgs) Handles company_name.SelectedIndexChanged
        BindJobDropDown(company_name.SelectedValue)
    End Sub

    Private Sub submit_Click(sender As Object, e As EventArgs) Handles submit.Click
        Try
            If Session("Flag") = 0 Then
                ' Insert new record
                SqlDataSource1.InsertParameters("company_id").DefaultValue = company_name.SelectedValue
                SqlDataSource1.InsertParameters("job_id").DefaultValue = job_title.SelectedValue
                SqlDataSource1.InsertParameters("end_date").DefaultValue = end_date.Text
                SqlDataSource1.InsertParameters("company_name").DefaultValue = company_name.SelectedItem.Text
                SqlDataSource1.InsertParameters("job_title").DefaultValue = job_title.SelectedItem.Text

                SqlDataSource1.Insert()
                clear()
                'trigger sweetalert
                ScriptManager.RegisterStartupScript(Me, Me.GetType(), "SuccessInsert", "showSuccessMessage('inserted');", True)

            Else
                ' Update existing record
                SqlDataSource1.UpdateParameters("post_id").DefaultValue = post_id.Value
                SqlDataSource1.UpdateParameters("company_id").DefaultValue = company_name.SelectedValue
                SqlDataSource1.UpdateParameters("job_id").DefaultValue = job_title.SelectedValue
                SqlDataSource1.UpdateParameters("end_date").DefaultValue = end_date.Text
                SqlDataSource1.UpdateParameters("company_name").DefaultValue = company_name.SelectedItem.Text
                SqlDataSource1.UpdateParameters("job_title").DefaultValue = job_title.SelectedItem.Text
                SqlDataSource1.Update()
                clear()
                ' Trigger SweetAlert success
                ScriptManager.RegisterStartupScript(Me, Me.GetType(), "SuccessUpdate", "showSuccessMessage('updated');", True)

            End If

        Catch ex As Exception
            ' Trigger SweetAlert error
            ScriptManager.RegisterStartupScript(Me, Me.GetType(), "ErrorMessage", "showErrorMessage('" & ex.Message & "');", True)

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
        If e.Row.RowType = DataControlRowType.Header Then
            e.Row.TableSection = TableRowSection.TableHeader
        End If
    End Sub

    Protected Sub example1_RowCommand(sender As Object, e As GridViewCommandEventArgs) Handles example1.RowCommand
        If e.CommandName = "del" Then
            Try
                SqlDataSource1.DeleteParameters("post_id").DefaultValue = e.CommandArgument
                SqlDataSource1.Delete()
                example1.DataBind()
                clear()

                ' Trigger SweetAlert success for deletion
                ScriptManager.RegisterStartupScript(Me, Me.GetType(), "SuccessDelete", "showSuccessMessage('deleted');", True)
            Catch ex As Exception
                ' Trigger SweetAlert error
                ScriptManager.RegisterStartupScript(Me, Me.GetType(), "ErrorMessage", "showErrorMessage('" & ex.Message & "');", True)
            End Try
        End If
    End Sub


    Protected Sub Edit1_Click(sender As Object, e As EventArgs)
        ' Get the row index of the clicked edit button
        Dim gvRow As GridViewRow = CType(CType(sender, Control).Parent.Parent, GridViewRow)
        Dim index As Integer = gvRow.RowIndex

        ' Retrieve the company_id from the GridView
        Dim companyID As String = example1.Rows(index).Cells(1).Text
        Dim jobID As String = example1.Rows(index).Cells(2).Text

        ' Re-populate the DropDownList for company_name
        BindCompanyDropDown()

        ' Set the selected value to the company_id from the GridView
        If company_name.Items.FindByValue(companyID) IsNot Nothing Then
            company_name.SelectedValue = companyID
        End If

        ' Re-populate the DropDownList for job_title based on the selected company_id
        BindJobDropDown(companyID)

        ' Set the selected value to the job_id from the GridView
        If job_title.Items.FindByValue(jobID) IsNot Nothing Then
            job_title.SelectedValue = jobID
        End If

        ' Set the other fields (end_date, post_id)
        end_date.Text = example1.Rows(index).Cells(3).Text
        post_id.Value = Convert.ToInt32(example1.DataKeys(index).Values("post_id"))

        ' Set session flag to indicate an update
        Session("Flag") = 1
    End Sub

    Public Sub clear()
        BindCompanyDropDown()
        BindJobDropDown(company_name.SelectedValue)

        ' Set the dropdown to default state (-1 means no selection)
        company_name.SelectedIndex = -1
        job_title.SelectedIndex = -1

        ' Clear other fields like end_date
        end_date.Text = ""

        ' Reset the session flag to 0 (indicating insert mode)
        Session("Flag") = 0
    End Sub

    Protected Sub UpdatePanel1_PreRender(ByVal sender As Object, ByVal e As EventArgs)
        ' Ensure that the DateTimePicker is correctly initialized after partial postbacks
        ScriptManager.RegisterStartupScript(Me, Me.GetType(), "DateTimePickerInit", "refreshDateTimePicker();", True)
    End Sub
End Class
