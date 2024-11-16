Imports System.IO

Partial Class Student_Internship
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Session("Flag") = 0 ' 0 for Insert, 1 for Update
        End If
        student_id.Text = Session("Main_id")
    End Sub

    Protected Sub submit_Click(sender As Object, e As EventArgs) Handles submit.Click
        Try
            ' Insert or Update logic based on the "Flag"
            If Session("Flag") = 0 Then ' Insert Operation
                SqlDataSource1.InsertParameters("company_name").DefaultValue = company_name.Text
                SqlDataSource1.InsertParameters("role").DefaultValue = role.Text
                SqlDataSource1.InsertParameters("duration").DefaultValue = duration.Text
                SqlDataSource1.InsertParameters("location").DefaultValue = location.Text
                SqlDataSource1.InsertParameters("industry").DefaultValue = industry.Text
                SqlDataSource1.InsertParameters("skill_gain").DefaultValue = technology_stack.Text
                SqlDataSource1.InsertParameters("responsibility").DefaultValue = respon.Text
                SqlDataSource1.InsertParameters("Supervisor_name").DefaultValue = sp_name.Text
                SqlDataSource1.InsertParameters("paid_unpaid").DefaultValue = p_up.Text
                SqlDataSource1.InsertParameters("time").DefaultValue = time.Text
                SqlDataSource1.InsertParameters("remote_site").DefaultValue = r_s.Text
                SqlDataSource1.InsertParameters("sr_id").DefaultValue = student_id.Text
                SqlDataSource1.Insert()
                MsgBox("Data Inserted")
            Else ' Update Operation
                SqlDataSource1.UpdateParameters("company_name").DefaultValue = company_name.Text
                SqlDataSource1.UpdateParameters("role").DefaultValue = role.Text
                SqlDataSource1.UpdateParameters("duration").DefaultValue = duration.Text
                SqlDataSource1.UpdateParameters("location").DefaultValue = location.Text
                SqlDataSource1.UpdateParameters("industry").DefaultValue = industry.Text
                SqlDataSource1.UpdateParameters("skill_gain").DefaultValue = technology_stack.Text
                SqlDataSource1.UpdateParameters("responsibility").DefaultValue = respon.Text
                SqlDataSource1.UpdateParameters("Supervisor_name").DefaultValue = sp_name.Text
                SqlDataSource1.UpdateParameters("paid_unpaid").DefaultValue = p_up.Text
                SqlDataSource1.UpdateParameters("time").DefaultValue = time.Text
                SqlDataSource1.UpdateParameters("remote_site").DefaultValue = r_s.Text
                SqlDataSource1.UpdateParameters("intern_id").DefaultValue = intern_no.Value
                SqlDataSource1.Update()
                MsgBox("Data Updated")

            End If

            ' Reset form
            ClearForm()
        Catch ex As Exception
            MsgBox(ex.Message)
            'DisplayMessage("Error: " & ex.Message, Drawing.Color.Red)
        End Try
    End Sub

    Protected Sub GridView1_RowDeleting(sender As Object, e As GridViewDeleteEventArgs) Handles GridView1.RowDeleting
        Try
            Dim internshipId As Integer = Convert.ToInt32(e.Keys("intern_id"))
            SqlDataSource1.DeleteParameters("intern_id").DefaultValue = internshipId.ToString()
            SqlDataSource1.Delete()
            MsgBox("Internship deleted successfully!")
            'DisplayMessage("", Drawing.Color.Green)
        Catch ex As Exception
            MsgBox(ex.Message)
            'DisplayMessage("Error: " & ex.Message, Drawing.Color.Red)
        End Try
    End Sub

    Protected Sub Edit1_Click(sender As Object, e As EventArgs)
        Try
            Dim gvRow As GridViewRow = CType(CType(sender, Control).Parent.Parent, GridViewRow)
            Dim index As Integer = gvRow.RowIndex

            company_name.Text = GridView1.Rows(index).Cells(1).Text
            role.Text = GridView1.Rows(index).Cells(2).Text
            duration.Text = GridView1.Rows(index).Cells(3).Text
            location.Text = GridView1.Rows(index).Cells(4).Text
            industry.Text = GridView1.Rows(index).Cells(5).Text
            technology_stack.Text = GridView1.Rows(index).Cells(6).Text
            respon.Text = GridView1.Rows(index).Cells(7).Text
            sp_name.Text = GridView1.Rows(index).Cells(8).Text
            p_up.Text = GridView1.Rows(index).Cells(9).Text
            time.Text = GridView1.Rows(index).Cells(10).Text
            r_s.Text = GridView1.Rows(index).Cells(11).Text
            intern_no.Value = Convert.ToInt32(GridView1.DataKeys(index).Values("intern_id"))

            Session("Flag") = 1 ' Set to Update mode
        Catch ex As Exception
            MsgBox(ex.Message)
            'DisplayMessage("Error: " & ex.Message, Drawing.Color.Red)
        End Try
    End Sub

    Private Sub ClearForm()
        company_name.Text = String.Empty
        role.Text = String.Empty
        duration.Text = String.Empty
        location.Text = String.Empty
        industry.Text = String.Empty
        technology_stack.Text = String.Empty
        respon.Text = String.Empty
        sp_name.Text = String.Empty
        p_up.Text = String.Empty
        time.Text = String.Empty
        r_s.Text = String.Empty
        Session("Flag") = 0 ' Reset to Insert mode
    End Sub

    'Private Sub DisplayMessage(message As String, color As Drawing.Color)
    '    Dim lblMessage As New Label()
    '    lblMessage.Text = message
    '    lblMessage.ForeColor = color
    '    'form1.Controls.Add(lblMessage)
    'End Sub
End Class
