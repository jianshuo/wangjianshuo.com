Set dicBasePage = CreateObject("Scripting.Dictionary")

dicBasePage("http://www.wangjiansuo.com") = "This is a test"


' Force to use Image Viewer to view the images.
'
'On Error Resume Next
For Each e in document.all

	If e.tagname = "A" Then
		msgbox a.href
		strTarget = Replace(e.href, "\", "/")
		strTarget = Replace(strTarget,"file://sha-jswang-01/d$/My/Web/www.wangjianshuo.com","")
		
		document.write starTarget
		If strTarget = objDic(strURL) Then
			e.style.fontSize = "30pt"
		End If
	End If

Next
