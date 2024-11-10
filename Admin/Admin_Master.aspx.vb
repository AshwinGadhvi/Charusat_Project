Imports BCrypt.Net ' Import BCrypt library

Partial Class Admin_Master
    Inherits System.Web.UI.Page

    Private Sub example1_PreRender(sender As Object, e As EventArgs) Handles example1.PreRender
        Try
            example1.UseAccessibleHeader = True
            example1.HeaderRow.TableSection = TableRowSection.TableHeader
        Catch ex As Exception
            ' Handle exceptions if necessary
        End Try
    End Sub
    Private Sub BindGrid()
        ' Optionally rebind the grid if needed, otherwise, the SqlDataSource should handle this
        example1.DataBind()
    End Sub
    Private Sub example1_RowDataBound(sender As Object, e As GridViewRowEventArgs) Handles example1.RowDataBound
        If (e.Row.RowType = DataControlRowType.Header) Then
            e.Row.TableSection = TableRowSection.TableHeader
        End If
    End Sub

    Private Sub submit_Click(sender As Object, e As EventArgs) Handles submit.Click
        Try
            ' Hash the password using BCrypt before storing it in the database
            Dim hashedPassword As String = BCrypt.Net.BCrypt.HashPassword(user_password.Text)

            If Session("Flag") = 0 Then
                ' Insert new user with hashed password
                SqlDataSource1.InsertParameters("user_name").DefaultValue = user_name.Text
                SqlDataSource1.InsertParameters("user_password").DefaultValue = hashedPassword ' Use hashed password
                SqlDataSource1.InsertParameters("user_type").DefaultValue = user_type.SelectedValue
                SqlDataSource1.Insert()
                popup()
            Else
                ' Update existing user with hashed password
                SqlDataSource1.UpdateParameters("user_name").DefaultValue = user_name.Text
                SqlDataSource1.UpdateParameters("user_password").DefaultValue = hashedPassword ' Use hashed password
                SqlDataSource1.UpdateParameters("user_type").DefaultValue = user_type.SelectedValue
                SqlDataSource1.UpdateParameters("user_id").DefaultValue = user_id.Value
                SqlDataSource1.Update()
                popup()
            End If
        Catch ex As Exception
            MsgBox(ex.Message)
        End Try
    End Sub

    Private Sub Admin_Master_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            Session.Add("Flag", 0)
            BindGrid()
        End If
    End Sub

    Protected Sub Edit1_Click(sender As Object, e As EventArgs)
        Dim gvRow As GridViewRow = CType(CType(sender, Control).Parent.Parent, GridViewRow)
        Dim index As Integer = gvRow.RowIndex
        user_name.Text = example1.Rows(index).Cells(1).Text
        user_password.Text = example1.Rows(index).Cells(2).Text
        user_type.SelectedValue = example1.Rows(index).Cells(3).Text
        user_id.Value = Convert.ToInt32(example1.DataKeys(index).Values("user_id"))
        Session("Flag") = 1
    End Sub

    Protected Sub example1_RowCommand(sender As Object, e As GridViewCommandEventArgs) Handles example1.RowCommand
        If e.CommandName = "del" Then
            SqlDataSource1.DeleteParameters("user_id").DefaultValue = e.CommandArgument
            SqlDataSource1.Delete()
            example1.DataBind()
            popup()
        End If
    End Sub

    Public Sub popup()
        example1.DataBind()
        ScriptManager.RegisterStartupScript(Me, Me.GetType(), "showalert", "success();", True)
        user_name.Text = ""
        user_password.Text = ""
        user_type.SelectedValue = "Select Type"
        user_id.Value = ""
    End Sub
End Class
