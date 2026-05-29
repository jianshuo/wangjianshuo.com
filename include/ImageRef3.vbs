'
' This version is used for files under the second level sub folder such as
' personal/family/*.*
'
'

Const cstrFolder = "../../../"


' Force to use Image Viewer to view the images.

On Error Resume Next

Set objXML = CreateObject("Microsoft.XMLDOM")
objXML.async = False
result = objXML.Load(cstrFolder & "about/photos.xml")

For Each e in document.all

	If e.tagname = "A" Then
		If InStr(LCase(e.href), ".jpg") Or InStr(LCase(e.href), ".gif") Then
			e.href = cstrFolder & "about/imageviewer.htm?" & e.href
		End If

	End If

	If e.tagname = "IMG" Then
		strImageSrc = e.src
		strName = Mid(strImageSrc, InStrRev(strImageSrc, "/") + 1)
		strName = Replace(strName, "_small", "")
		Set objNodes = objXML.selectNodes("//Photo[Name = '" & strName & "']")

		If objNodes.length = 1 Then
			e.title = objNodes(0).selectSingleNode("Title").Text
		End If

	End If

Next