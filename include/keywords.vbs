'On Error Resume Next
'
'ref = document.referrer
'
'strNotice = ""
'strHREF = ""
'
'If InStr(ref, "job") Then
'	strNotice = "Find <b>jobs</b> in China here!"
'	strHREF = "feature/jobsinchina/index.htm"
'End If
'
'If InStr(ref, "girl") Then
'	strNotice = "There are <b>no girls</b> on this web site."
'	strHREF = "about/nogirl.htm"
'End If
'
'If InStr(ref, "shanghai-shanghai") Then
'	strNotice = "Welcome visitors from <b>Shanghai-Shanghai.net</b>. Click here for my Shanghai page."
'	strHREF = "personal/Shanghai/index.htm"
'End If
'
'strNotice = ref
'
'If strNotice <> "" Then
'	idNotice.innerHTML = "<br><br>   &nbsp;&nbsp;&nbsp;<a style='text-decoration:none;color:black;'  href=" & _
'				strHREF & ">" & strNotice & " >> </a> &nbsp;&nbsp;&nbsp;"
'End If