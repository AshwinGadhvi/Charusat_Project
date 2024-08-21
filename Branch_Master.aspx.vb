
Partial Class Branch_Master
    Inherits System.Web.UI.Page
    Private Sub example1_PreRender(sender As Object, e As EventArgs) Handles example1.PreRender
        Try
            example1.UseAccessibleHeader = True
            example1.HeaderRow.TableSection = TableRowSection.TableHeader
        Catch ex As Exception

        End Try
    End Sub

    Private Sub example1_RowDataBound(sender As Object, e As GridViewRowEventArgs) Handles example1.RowDataBound
        If (e.Row.RowType = DataControlRowType.Header) Then
            e.Row.TableSection = TableRowSection.TableHeader
        End If
    End Sub

    Private Sub Branch_Master_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            Session.Add("Flag", 0)
        End If
    End Sub





    Private Sub submit_Click(sender As Object, e As EventArgs) Handles submit.Click
        Try
            If Session("Flag") = 0 Then
                SqlDataSource2.InsertParameters("college_id").DefaultValue = college_name.SelectedValue
                SqlDataSource2.InsertParameters("branch_name").DefaultValue = branch_name.Text
                SqlDataSource2.Insert()
                clear()
            Else
                SqlDataSource2.UpdateParameters("college_id").DefaultValue = college_name.SelectedValue
                SqlDataSource2.UpdateParameters("branch_name").DefaultValue = branch_name.Text
                SqlDataSource2.UpdateParameters("branch_id").DefaultValue = branch_id.Value
                SqlDataSource2.Update()
                clear()
            End If

        Catch ex As Exception

        End Try
    End Sub

    Protected Sub Edit1_Click(sender As Object, e As EventArgs)
        Dim gvRow As GridViewRow = CType(CType(sender, Control).Parent.Parent, GridViewRow)
        Dim index As Integer = gvRow.RowIndex
        college_name.Text = example1.Rows(index).Cells(1).Text
        branch_name.Text = example1.Rows(index).Cells(2).Text
        branch_id.Value = Convert.ToInt32(example1.DataKeys(index).Values("branch_id"))
        Session("Flag") = 1
    End Sub

    Protected Sub example1_RowCommand(sender As Object, e As GridViewCommandEventArgs) Handles example1.RowCommand
        If e.CommandName = "del" Then
            SqlDataSource2.DeleteParameters("branch_id").DefaultValue = e.CommandArgument
            SqlDataSource2.Delete()
            example1.DataBind()
        End If
    End Sub

    Public Sub clear()
        branch_name.Text = ""
    End Sub
End Class
