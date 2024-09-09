Partial Class Main
    Inherits System.Web.UI.Page

    ' Method to calculate time difference
    Protected Function CalculatePostedTime(ByVal postDate As Object) As String
        If postDate IsNot Nothing Then
            Dim postedDate As DateTime = Convert.ToDateTime(postDate)
            Dim timeDifference As TimeSpan = DateTime.Now - postedDate

            ' Calculate how long ago the job was posted
            If timeDifference.TotalDays >= 1 Then
                Return String.Format("{0} day(s) ago", Math.Floor(timeDifference.TotalDays))
            ElseIf timeDifference.TotalHours >= 1 Then
                Return String.Format("{0} hour(s) ago", Math.Floor(timeDifference.TotalHours))
            ElseIf timeDifference.TotalMinutes >= 1 Then
                Return String.Format("{0} minute(s) ago", Math.Floor(timeDifference.TotalMinutes))
            Else
                Return "Just now"
            End If
        Else
            Return String.Empty
        End If
    End Function

    ' Page Load event to set current date parameter
    Private Sub Main_Load(sender As Object, e As EventArgs) Handles Me.Load
        SqlDataSource1.SelectParameters("CurrentDate").DefaultValue = DateTime.Now.ToString("yyyy-MM-dd")
    End Sub

End Class
