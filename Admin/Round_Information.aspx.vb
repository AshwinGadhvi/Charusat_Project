
Partial Class Admin_Round_Information
    Inherits System.Web.UI.Page

    Private Sub Admin_Round_Information_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            Session.Add("Flag", 0)
        End If
        Dim d As New Dao
            Dim ds As New Data.DataSet
            ds = d.getData("select company_id from Company_Details where c_id='" & Session("u_id") & "'")
            If ds.Tables(0).Rows.Count > 0 Then
                company_id.Text = ds.Tables(0).Rows(0)("company_id")
            End If


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
    Private Sub example1_RowCommand(sender As Object, e As GridViewCommandEventArgs) Handles example1.RowCommand
        Try
            If e.CommandName = "del" Then
                SqlDataSource1.DeleteParameters("round_id").DefaultValue = e.CommandArgument
                SqlDataSource1.Delete()
                example1.DataBind()

            End If
        Catch ex As Exception
            MsgBox(ex.Message)
        End Try
    End Sub

    Private Sub submit_Click(sender As Object, e As EventArgs) Handles submit.Click
        Try
            If Session("Flag") = 0 Then
                SqlDataSource1.InsertParameters("company_id").DefaultValue = company_name.SelectedValue
                SqlDataSource1.InsertParameters("round_number").DefaultValue = round_number.Text
                SqlDataSource1.InsertParameters("round_type").DefaultValue = round_type.Text
                SqlDataSource1.InsertParameters("round_date").DefaultValue = round_date.Text
                SqlDataSource1.InsertParameters("round_duration").DefaultValue = round_duration.Text
                SqlDataSource1.InsertParameters("round_instruction").DefaultValue = round_instruction.Text
                SqlDataSource1.InsertParameters("round_documents").DefaultValue = round_documents.Text
                SqlDataSource1.InsertParameters("round_interviewer").DefaultValue = round_interviewer.Text
                SqlDataSource1.InsertParameters("round_link").DefaultValue = round_link.Text
                SqlDataSource1.InsertParameters("round_description").DefaultValue = round_description.Text
                SqlDataSource1.InsertParameters("round_prerequisites").DefaultValue = round_prerequisites.Text
                SqlDataSource1.InsertParameters("round_evalution").DefaultValue = round_evalution.Text
                SqlDataSource1.InsertParameters("company_name").DefaultValue = company_name.SelectedItem.Text
                SqlDataSource1.Insert()
                clear()
            Else
                SqlDataSource1.UpdateParameters("company_id").DefaultValue = company_id.Text
                SqlDataSource1.UpdateParameters("round_number").DefaultValue = round_number.Text
                SqlDataSource1.UpdateParameters("round_type").DefaultValue = round_type.Text
                SqlDataSource1.UpdateParameters("round_date").DefaultValue = round_date.Text
                SqlDataSource1.UpdateParameters("round_duration").DefaultValue = round_duration.Text
                SqlDataSource1.UpdateParameters("round_instruction").DefaultValue = round_instruction.Text
                SqlDataSource1.UpdateParameters("round_documents").DefaultValue = round_documents.Text
                SqlDataSource1.UpdateParameters("round_interviewer").DefaultValue = round_interviewer.Text
                SqlDataSource1.UpdateParameters("round_link").DefaultValue = round_link.Text
                SqlDataSource1.UpdateParameters("round_description").DefaultValue = round_description.Text
                SqlDataSource1.UpdateParameters("round_prerequisites").DefaultValue = round_prerequisites.Text
                SqlDataSource1.UpdateParameters("round_evalution").DefaultValue = round_evalution.Text
                SqlDataSource1.UpdateParameters("company_name").DefaultValue = company_name.SelectedItem.Text
                SqlDataSource1.UpdateParameters("round_id").DefaultValue = round_id.Value
                SqlDataSource1.Update()
                clear()
            End If
        Catch ex As Exception
            MsgBox(ex.Message)
        End Try
    End Sub

    Public Sub clear()
        round_number.Text = ""

        round_type.Text = ""

        round_date.Text = ""

        round_duration.Text = ""

        round_instruction.Text = ""

        round_documents.Text = ""

        round_interviewer.Text = ""

        round_link.Text = ""

        round_description.Text = ""

        round_prerequisites.Text = ""

        round_evalution.Text = ""


    End Sub
    Protected Sub Edit1_Click(sender As Object, e As EventArgs)
        Dim gvRow As GridViewRow = CType(CType(sender, Control).Parent.Parent, GridViewRow)
        Dim index As Integer = gvRow.RowIndex
        company_id.Text = example1.Rows(index).Cells(1).Text
        round_number.Text = example1.Rows(index).Cells(2).Text
        round_type.Text = example1.Rows(index).Cells(3).Text
        round_date.Text = example1.Rows(index).Cells(4).Text
        round_duration.Text = example1.Rows(index).Cells(5).Text
        round_instruction.Text = example1.Rows(index).Cells(6).Text
        round_documents.Text = example1.Rows(index).Cells(7).Text
        round_interviewer.Text = example1.Rows(index).Cells(8).Text
        round_link.Text = example1.Rows(index).Cells(9).Text
        round_description.Text = example1.Rows(index).Cells(10).Text
        round_prerequisites.Text = example1.Rows(index).Cells(11).Text
        round_evalution.Text = example1.Rows(index).Cells(12).Text
        round_id.Value = Convert.ToInt32(example1.DataKeys(index).Values("round_id"))

        Session("Flag") = 1


    End Sub
End Class
