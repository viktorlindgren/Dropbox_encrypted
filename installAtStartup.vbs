Set wsc = WScript.CreateObject("WScript.Shell")
Set lnk = wsc.CreateShortcut(wsc.SpecialFolders("startup") & "\decryptDropbox.LNK")

lnk.targetpath = (WScript.Arguments(0) & "\StartAutoMount.vbs")
lnk.description = "This will automount the dropbox folder when the computer starts"
lnk.workingdirectory = WScript.Arguments(0)
lnk.save

