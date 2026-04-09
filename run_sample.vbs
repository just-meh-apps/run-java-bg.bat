Set WshShell = CreateObject("WScript.Shell")
' 같은 폴더에 있는 open_sample.bat를 창 없이(0) 실행합니다.
WshShell.Run chr(34) & "open_sample.bat" & chr(34), 0
Set WshShell = Nothing
