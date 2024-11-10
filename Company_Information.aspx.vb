Partial Class Company_Information
    Inherits System.Web.UI.Page

    Private Sub Company_Information_Load(sender As Object, e As EventArgs) Handles Me.Load
        post_id.Text = Session("post_id")
        Dim d As New Dao
        Dim ds As New Data.DataSet
        ds = d.getData("SELECT company_id, job_id FROM Post_Company WHERE post_id='" & post_id.Text & "'")

        If ds.Tables(0).Rows.Count > 0 Then
            company_id.Text = ds.Tables(0).Rows(0)("company_id").ToString()
            job_id.Text = ds.Tables(0).Rows(0)("job_id").ToString()
        End If
    End Sub

    Private Sub Repeater1_ItemCommand(source As Object, e As RepeaterCommandEventArgs) Handles Repeater1.ItemCommand
        If Session("u_name") IsNot Nothing AndAlso Not String.IsNullOrEmpty(Session("u_name").ToString()) Then
            ' Fetching Data Of Company
            Dim d1 As New Dao
            Dim ds2 As New Data.DataSet
            ds2 = d1.getData("SELECT * FROM Company_Details WHERE company_id='" & company_id.Text & "'")

            If ds2.Tables(0).Rows.Count > 0 Then
                Session("company_name") = ds2.Tables(0).Rows(0)("company_name").ToString()
            End If

            ' Fetching Data Of Job
            Dim d2 As New Dao
            Dim ds3 As New Data.DataSet
            ds3 = d2.getData("SELECT * FROM Job_Master WHERE job_id='" & job_id.Text & "'")

            If ds3.Tables(0).Rows.Count > 0 Then
                Session("job_title") = ds3.Tables(0).Rows(0)("job_title").ToString()
            End If

            ' Fetching Data Of Student
            Dim d3 As New Dao
            Dim ds4 As New Data.DataSet
            ds4 = d3.getData("SELECT * FROM Student_Registration WHERE student_f_name='" & Session("u_name").ToString() & "'")

            If ds4.Tables(0).Rows.Count > 0 Then
                ' Concatenate first name and last name
                Session("student_full") = ds4.Tables(0).Rows(0)("student_f_name").ToString() & " " & ds4.Tables(0).Rows(0)("student_l_name").ToString()
                Session("student_id") = ds4.Tables(0).Rows(0)("student_id").ToString()
                Session("student_email") = ds4.Tables(0).Rows(0)("student_email").ToString()
                Session("student_phone") = ds4.Tables(0).Rows(0)("student_phone").ToString()
            End If

            ' Get today's date and store in session
            Dim todayDate As DateTime = DateTime.Today
            Session("register_date") = todayDate.ToString("dd-MM-yyyy")

            ' Insert Data into Company_Registration (assuming modifyData returns nothing)
            Dim d As New Dao
            d.modifyData("INSERT INTO Company_Registration (company_id, job_id, post_id, company_name, job_title, student_name, student_id, student_email, register_date, student_phone) " &
                         "VALUES ('" & company_id.Text & "', '" & job_id.Text & "', '" & post_id.Text & "', '" & Session("company_name").ToString() & "', '" & Session("job_title").ToString() & "', '" &
                         Session("student_full").ToString() & "', '" & Session("student_id").ToString() & "', '" & Session("student_email").ToString() & "', '" & Session("register_date").ToString() & "', '" & Session("student_phone").ToString() & "')")

            ' Show SweetAlert success message
            ScriptManager.RegisterStartupScript(Me, Me.GetType(), "ShowSuccessMessage",
                "Swal.fire({ icon: 'success', title: 'Success', text: 'Registration complete!', confirmButtonText: 'OK' });", True)

        Else
            ' Redirect to login page if session variable is empty
            Response.Redirect("login-form-20/Login.aspx")
        End If
    End Sub
End Class
