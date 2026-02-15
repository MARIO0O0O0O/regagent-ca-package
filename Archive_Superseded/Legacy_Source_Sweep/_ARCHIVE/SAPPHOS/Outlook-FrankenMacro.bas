Public Sub DumpToHotFolder(MyMail As MailItem)
    Dim savePath As String
    savePath = "C:\Users\mespindola\InboxHot\" & Format(Now, "yyyymmdd_hhnnss_") & MyMail.Subject & ".msg"
    MyMail.SaveAs savePath, olMSG
End Sub
