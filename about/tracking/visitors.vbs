Option Explicit

Dim strDocInfo, xmldom
Dim strIP, strBase
Dim objNode
Dim tag
Dim incomingNodes, outgoingNodes

Set xmldom = CreateObject("Microsoft.XMLDOM")
xmldom.async = False
xmldom.Load "d:\my\web\www.wangjianshuo.com\include\data.xml"

If document.cookie <> "" Then
	strIP = Replace(document.cookie, "IP=", "")
Else
	strIP = "61.152.182.194"
End If

printDocInfo "Visotor: <a href='http://www.geektools.com/cgi-bin/proxy.cgi?targetnic=auto&query=" & strIP & "'>" & strIP & "</a> <a href='../../include/admin.htm'>Change</a>"

strBase = GetRegURL(location.href )

Dim strQuery, intCount
Dim nodes
intCount = 0
strQuery = "//row[@IP = '" & strIP & "' && @Base='" & strBase & "' || @Target='" & strBase & "']"
Set nodes = xmldom.documentElement.selectNodes(strQuery)
For each objNode in nodes
	intCount = intCount + 1
	objNode.text = intCount
Next

printDocInfo "strBase: " & strBase

Set incomingNodes = xmldom.documentElement.selectNodes("//row[@IP = '" & strIP & "' && @Target='" & strBase & "']")
For each objNode in incomingNodes
	printDocInfo "incoming: " & objNode.GetAttributeNode("Base").text & " " & objNode.GetAttributeNode("Time").text
Next

Set outgoingNodes = xmldom.documentElement.selectNodes("//row[@IP = '" & strIP & "' && @Base='" & strBase & "']")
For each objNode in outgoingNodes
	printDocInfo "outgoing: " & objNode.GetAttributeNode("Target").text & " " & objNode.GetAttributeNode("Time").text
Next

For Each tag In document.all.tags("A")
		CheckTag tag
Next

document.write "<div id='idDocInfo' style='background-color:lightgreen;font-family:verdana;font-size:8pt;font-color:black;position: absolute; top: 480; left: 50; width: 800; height: 50'>" & strDocInfo & "</div>"


'
'
'
'
'
'
'   Functions
'
'
'
'
'
'

Sub printDocInfo(str)
	strDocInfo = strDocInfo + str & "<br>"
End Sub


Function GetRegURL(sBase)
	Dim objAltURLs
	Dim n

	Set objAltURLs = xmldom.documentElement.selectNodes("//doc/alturl/row")
	sBase = Replace(sBase, "\", "/")
	For each n in objAltURLs
		sBase = Replace(sBase, n.text, "")
		'printDocInfo "alt url: " & n.text
	Next
	GetRegURL = sBase
End Function

'
' Mark the tag
'

Sub MarkTag(tag, index, description)

	Dim c
	tag.className = "nextlink"
	tag.title = description

	tag.innerHTML = tag.innerHTML + "<span class='linknumber' title='" & description & "'>" & index & "</span>"

	For each c in tag.children
		If c.TagName = "IMG" Then
			c.style.borderWidth = "3px"
			c.style.borderColor  = "green"
		End If
	Next
End Sub

Function CheckTag(tag)

	Dim n
	Dim strTarget

	'printDocInfo "Checking: " & GetRegURL(tag.href)

	For each n in outgoingNodes
		strTarget = n.GetAttributeNode("Target").text
		if GetRegURL(tag.href) = strTarget Then 
			MarkTag tag, n.text, n.GetAttributeNode("Time").text
		End If
	Next
End Function

