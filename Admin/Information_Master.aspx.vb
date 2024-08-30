
Partial Class Information_Master
    Inherits System.Web.UI.Page

    Private Sub Information_Master_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            Session.Add("Flag", 0)
        End If
        u_id.Text = Session("u_id")
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
                SqlDataSource1.DeleteParameters("company_id").DefaultValue = e.CommandArgument
                SqlDataSource1.Delete()
                example1.DataBind()
                clear()
            End If
        Catch ex As Exception
            MsgBox(ex.Message)
        End Try
    End Sub

    Private Sub submit_Click(sender As Object, e As EventArgs) Handles submit.Click
        Try
            If Session("Flag") = 0 Then
                SqlDataSource1.InsertParameters("company_name").DefaultValue = company_name.Text
                SqlDataSource1.InsertParameters("company_address").DefaultValue = company_address.Text
                SqlDataSource1.InsertParameters("company_city").DefaultValue = company_city.Text
                SqlDataSource1.InsertParameters("company_state").DefaultValue = company_state.Text
                SqlDataSource1.InsertParameters("company_country").DefaultValue = company_country.Text
                SqlDataSource1.InsertParameters("company_zipcode").DefaultValue = company_zipcode.Text
                SqlDataSource1.InsertParameters("company_email").DefaultValue = company_email.Text
                SqlDataSource1.InsertParameters("company_phone").DefaultValue = company_phone.Text
                SqlDataSource1.InsertParameters("company_website").DefaultValue = company_website.Text
                SqlDataSource1.InsertParameters("company_industry").DefaultValue = company_industry.Text
                SqlDataSource1.InsertParameters("company_contact_person_name").DefaultValue = cm_c_p_n.Text
                SqlDataSource1.InsertParameters("company_contact_person_email").DefaultValue = cm_c_p_e.Text
                SqlDataSource1.InsertParameters("company_contact_person_phone").DefaultValue = cm_c_p_m.Text
                SqlDataSource1.InsertParameters("company_description").DefaultValue = company_description.Text
                SqlDataSource1.InsertParameters("c_id").DefaultValue = Session("u_id")

                SqlDataSource1.Insert()
                clear()
            Else
                SqlDataSource1.UpdateParameters("company_name").DefaultValue = company_name.Text
                SqlDataSource1.UpdateParameters("company_address").DefaultValue = company_address.Text
                SqlDataSource1.UpdateParameters("company_city").DefaultValue = company_city.Text
                SqlDataSource1.UpdateParameters("company_state").DefaultValue = company_state.Text
                SqlDataSource1.UpdateParameters("company_country").DefaultValue = company_country.Text
                SqlDataSource1.UpdateParameters("company_zipcode").DefaultValue = company_zipcode.Text
                SqlDataSource1.UpdateParameters("company_email").DefaultValue = company_email.Text
                SqlDataSource1.UpdateParameters("company_phone").DefaultValue = company_phone.Text
                SqlDataSource1.UpdateParameters("company_website").DefaultValue = company_website.Text
                SqlDataSource1.UpdateParameters("company_industry").DefaultValue = company_industry.Text
                SqlDataSource1.UpdateParameters("company_contact_person_name").DefaultValue = cm_c_p_n.Text
                SqlDataSource1.UpdateParameters("company_contact_person_email").DefaultValue = cm_c_p_e.Text
                SqlDataSource1.UpdateParameters("company_contact_person_phone").DefaultValue = cm_c_p_m.Text
                SqlDataSource1.UpdateParameters("company_description").DefaultValue = company_description.Text
                SqlDataSource1.UpdateParameters("company_id").DefaultValue = company_id.Value
                SqlDataSource1.UpdateParameters("c_id").DefaultValue = Session("u_id")
                SqlDataSource1.Update()
                clear()

            End If
        Catch ex As Exception
            MsgBox(ex.Message)
        End Try
    End Sub

    Protected Sub Edit1_Click(sender As Object, e As EventArgs)
        Dim gvRow As GridViewRow = CType(CType(sender, Control).Parent.Parent, GridViewRow)
        Dim index As Integer = gvRow.RowIndex
        company_name.Text = example1.Rows(index).Cells(1).Text
        company_address.Text = example1.Rows(index).Cells(2).Text
        company_city.Text = example1.Rows(index).Cells(3).Text
        company_state.Text = example1.Rows(index).Cells(4).Text
        company_country.Text = example1.Rows(index).Cells(5).Text
        company_zipcode.Text = example1.Rows(index).Cells(6).Text
        company_email.Text = example1.Rows(index).Cells(7).Text
        company_phone.Text = example1.Rows(index).Cells(8).Text
        company_website.Text = example1.Rows(index).Cells(9).Text
        company_industry.Text = example1.Rows(index).Cells(10).Text
        cm_c_p_n.Text = example1.Rows(index).Cells(11).Text
        cm_c_p_e.Text = example1.Rows(index).Cells(12).Text
        cm_c_p_m.Text = example1.Rows(index).Cells(13).Text
        company_description.Text = example1.Rows(index).Cells(14).Text
        company_id.Value = Convert.ToInt32(example1.DataKeys(index).Values("company_id"))

        Session("Flag") = 1
    End Sub
    Public Sub clear()
        company_name.Text = ""
        company_address.Text = ""
        company_city.Text = ""
        company_state.Text = ""
        company_country.Text = ""
        company_zipcode.Text = ""
        company_email.Text = ""
        company_phone.Text = ""
        company_website.Text = ""
        company_industry.Text = ""
        cm_c_p_n.Text = ""
        cm_c_p_e.Text = ""
        cm_c_p_m.Text = ""
        company_description.Text = ""
        Session("Flag") = 0

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
End Class
