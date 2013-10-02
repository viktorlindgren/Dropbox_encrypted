DIM objShell
set objShell=wscript.createObject("wscript.shell")
iReturn=objShell.Run("automount.bat >nul: 2>nul:", 0, FALSE)
