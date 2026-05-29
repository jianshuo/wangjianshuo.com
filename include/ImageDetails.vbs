'  
'   Propose: Extracts image information from image name
'   Author: Jian Shuo Wang (jianshuo@hotmail.com) 
'   Created: 12/12/2001
'   
'   Copyright: Jian Shuo Wang 2001-2002
'

'Always do this: (good programming practice!)

'The safest way in web page
On Error Resume Next

Sub GetInfoByName(strPhotoName, ByRef strCity, ByRef strLocation, ByRef strPersons, ByRef strDescription)

	On Error Resume Next

	'Declar our variables
	Dim objRegExpr
	
	'Create an instance of regexp object
	Set objRegExpr = New RegExp

	'Analyse the name of photos and get result.
	'Example names are:
	'	shanghai-fanfan.jianshuo-before.big.tree.jpg
	'	beijing-fanfan-in.forbiddencity.jpg
	'	shanghai.pudong-mom.dad-walking.jpg
	'I need to get place name, persons and descriptoin from the names\
	
	objRegExpr.Pattern = "([a-z]*)\.*([a-z.]*)-([a-z.]*)-{0,1}([a-z.]*).jpg"
	objRegExpr.Global = False
	objRegExpr.IgnoreCase = True
	
	'This is the string to search.
	Dim colMatches
	
	Set colMatches = objRegExpr.Execute(strPhotoName)
	
	'step through our matches
	Dim objMatch 
	For Each objMatch In colMatches
		strCity = objMatch.SubMatches(0)
		strLocation = objMatch.SubMatches(1)
		strPersons = objMatch.SubMatches(2)
		strDescription = objMatch.SubMatches(3)

		strCity = Replace(strCity, ".", " ")
		strLocation = Replace(strLocation , ".", " ")
		strPersons = Replace(strPersons, ".", " ")
		strDescription = Replace(strDescription, ".", " ")
	Next

	Set colMatches = Nothing
	Set objMatch = Nothing

End Sub

'Sample code
'
'	Dim strCity, strLoc, strPers, strDescr
'	
'	GetInfoByName "shanghai.pudong-mom.dad-walking.jpg", strCity, strLoc, strPers, strDescr
'	Msgbox strCity
'	Msgbox strLoc
'	Msgbox strPers
'	Msgbox strDescr
'