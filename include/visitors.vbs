On Error Resume Next

Set vis = CreateObject("Scripting.Dictionary")
vis("tomcat") = "cuanyu"
vis("lkf-pc") = "Unknwon"
vis("sha-wendy-y") = "Laptop of Fanfan"
vis("210.82.175.165") = "Qinhuangdao visitor"
vis("61.171.253.0") = "Yizhong Sun"
vis("61.171.12.217") = "Ying Jian Chang"
vis("202.107.221.131") = "Caca"
vis("202.107.221.132") = "Caca"
vis("61.203.164.238") = "bobbie"
vis("noelle") = "Zhu Zhan Ying [Zhongshan]"
vis("proxy") = "SHANGHAI-TELECOM-TECH-RESEARCH-INSTITUTE"
vis("211.94.103.30") = "cynic"
vis("218.75.204.10") = "Hunan"
vis("sumex-proxy") = "Christina"
vis("61.153.108.20") = "Jing Bo"
vis("218.80.60.68") = "Eric Zheng"

For Each e in Document.all
	If UCase(e.TagName) = "B" Then
		If vis(e.innerHTML) <> "" Then
			e.innerHTML = e.innerHTML & " <font color=red>" & vis(e.innerHTML) & "</font>"
		End If
	End If
Next