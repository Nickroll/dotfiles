Set shell = CreateObject("WScript.Shell" ) 

shell.Run """C:\Users\Nick\Documents\wsl\caps esc switch.ahk"""
shell.Run """C:\Users\Nick\Documents\wsl\pulseaudio-1.1\bin\pulseaudio.exe"" --use-pid-file=false -D"
shell.Run """C:\Program Files\VcXsrv\vcxsrv.exe"" :0 -screen 0 @1 -nodecoration -ac"	
shell.Run "bash -c ""cd && bash ~/.scripts/wlaunch""", 0
