set fs  = CreateObject("Scripting.FileSystemObject")
set ws  = WScript.CreateObject("WScript.Shell")
set arg = Wscript.Arguments

linkFile = arg(0)
targetFile = arg(1)

set link = ws.CreateShortcut(linkFile)
    link.TargetPath = targetFile
    link.Save
