
Partial Class College_Master
    Inherits System.Web.UI.Page

    Private Sub College_Master_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            Session.Add("Flag", 0)
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

    Private Sub submit_Click(sender As Object, e As EventArgs) Handles submit.Click
        Try
            If Session("Flag") = 0 Then
                SqlDataSource1.InsertParameters("college_name").DefaultValue = college_name.Text
                SqlDataSource1.InsertParameters("college_location").DefaultValue = college_location.Text
                SqlDataSource1.InsertParameters("college_email").DefaultValue = college_email.Text
                SqlDataSource1.InsertParameters("college_contact").DefaultValue = college_contact.Text
                SqlDataSource1.InsertParameters("college_details").DefaultValue = college_details.Text
                SqlDataSource1.Insert()
                clear()
            Else
                SqlDataSource1.UpdateParameters("college_name").DefaultValue = college_name.Text
                SqlDataSource1.UpdateParameters("college_location").DefaultValue = college_location.Text
                SqlDataSource1.UpdateParameters("college_email").DefaultValue = college_email.Text
                SqlDataSource1.UpdateParameters("college_contact").DefaultValue = college_contact.Text
                SqlDataSource1.UpdateParameters("college_details").DefaultValue = college_details.Text
                SqlDataSource1.UpdateParameters("college_id").DefaultValue = college_id.Value
                SqlDataSource1.Update()
                clear()
            End If
        Catch ex As Exception
            MsgBox(ex.Message)
        End Try
    End Sub
    Public Sub clear()
        college_name.Text = ""
        college_email.Text = ""
        college_details.Text = ""
        college_contact.Text = ""
        college_location.Text = ""
        Session("Flag") = 0
    End Sub

    Protected Sub Edit1_Click(sender As Object, e As EventArgs)
        Dim gvRow As GridViewRow = CType(CType(sender, Control).Parent.Parent, GridViewRow)
        Dim index As Integer = gvRow.RowIndex
        college_name.Text = example1.Rows(index).Cells(1).Text
        college_location.Text = example1.Rows(index).Cells(2).Text
        college_email.Text = example1.Rows(index).Cells(3).Text
        college_contact.Text = example1.Rows(index).Cells(4).Text
        college_details.Text = example1.Rows(index).Cells(5).Text
        college_id.Value = Convert.ToInt32(example1.DataKeys(index).Values("college_id"))
        Session("Flag") = 1
    End Sub

    Private Sub example1_RowCommand(sender As Object, e As GridViewCommandEventArgs) Handles example1.RowCommand
        Try
            If e.CommandName = "del" Then
                SqlDataSource1.DeleteParameters("college_id").DefaultValue = e.CommandArgument
                SqlDataSource1.Delete()
                example1.DataBind()
                clear()
            End If
        Catch ex As Exception
            MsgBox(ex.Message)
        End Try
    End Sub
End Class
