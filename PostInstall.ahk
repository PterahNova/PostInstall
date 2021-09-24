﻿#SingleInstance Force					; Replaces script if running.
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
;#Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
SetControlDelay -1
CoordMode, Mouse
CoordMode, Pixel
#Include %A_ScriptDir%\FindText.ahk
#Include %A_ScriptDir%\PostInstall-Images.ahk
Menu, tray, Icon, % "HBITMAP:*" . Create_PostInstall_ico()
IniRead, ahk, config.ini, config, AutoHotKey

;restart script in admin mode
if not (A_IsAdmin) {
try {
	if A_IsCompiled
		Run *RunAs "%A_ScriptFullPath%" /restart
    else
		Run *RunAs "%ahk%" /restart "%A_ScriptFullPath%"
}
ExitApp
}

goto, update
vars:

On:="HBITMAP:*" . Create_On_Png()
Off:="HBITMAP:*" . Create_Off_Png()
Button:="HBITMAP:*" . Create_Button_Png()
TitleL:="HBITMAP:*" . Create_TitleLeft_Png()
TitleR:="HBITMAP:*" . Create_TitleRight_Png()
Background:="HBITMAP:*" . Create_Background_Png()
Minimize:="HBITMAP:*" . Create_Minimize_Png()
Close:="HBITMAP:*" . Create_Close_Png()

Loop 10 {
	IniRead, Menu%A_Index%, config.ini, config, Item-%A_Index%-Menu
	IniRead, MSG%A_Index%, config.ini, config, Item-%A_Index%-MSG
	IniRead, Dir%A_Index%, config.ini, config, Item-%A_Index%-Dir
	IniRead, Args%A_Index%, config.ini, config, Item-%A_Index%-Args
}

IniRead, Name1, config.ini, config, Item-1-Name
IniRead, Email, config.ini, config, Email-Ending

Defaults:
loop 10 {
	IniRead, Opt%A_Index%, config.ini, config, Opt%A_Index%
}

temp:
FileMove, %A_ScriptDir%\3000 customer.xml, %A_ScriptDir%\WiFi.xml ;Needed for v8 update.

;GUI
Gui, -Caption
Gui, Font, Verdana s19 cWhite

Gui, Add, Button, x-100 y0 w100 h30, Unused ;Stops focus on Edit Box
Gui, Add, Picture, x0 y0 w289 h-1 gUImove, %TitleL%
Gui, Add, Picture, x289 y0 w71 h-1, %TitleR%
Gui, Add, Picture, x0 y42 w360 h-1 , %Background%
Gui, Add, Picture, x289 y14 w14 h-1 gMinimize, %Minimize%
Gui, Add, Picture, x332 y14 w14 h-1 gGuiClose, %Close%

Gui, Add, Text, x12 y52 w300 h30 +BackgroundTrans, %Menu1%
Gui, Add, Picture, x290 y52 w-1 h30 vOn1 gsub1 +BackgroundTrans,%On%
Gui, Add, Picture, x290 y52 w-1 h30 vOff1 gsub1 +BackgroundTrans hidden,%Off%

Gui, Add, Text, x12 y99 w300 h30 +BackgroundTrans, %Menu2%
Gui, Add, Picture, x290 y99 w-1 h30 vOn2 gsub2 +BackgroundTrans,%On%
Gui, Add, Picture, x290 y99 w-1 h30 vOff2 gsub2 +BackgroundTrans hidden,%Off%


Gui, Add, Text, x12 y146 w300 h30 +BackgroundTrans, %Menu3%
Gui, Add, Picture, x290 y146 w-1 h30 vOn3 gsub3 +BackgroundTrans,%On%
Gui, Add, Picture, x290 y146 w-1 h30 vOff3 gsub3 +BackgroundTrans hidden,%Off%


Gui, Add, Text, x12 y193 w300 h30 +BackgroundTrans, %Menu4%
Gui, Add, Picture, x290 y193 w-1 h30 vOn4 gsub4 +BackgroundTrans,%On%
Gui, Add, Picture, x290 y193 w-1 h30 vOff4 gsub4 +BackgroundTrans hidden,%Off%


Gui, Add, Text, x12 y240 w300 h30 +BackgroundTrans, %Menu5%
Gui, Add, Picture, x290 y240 w-1 h30 vOn5 gsub5 +BackgroundTrans,%On%
Gui, Add, Picture, x290 y240 w-1 h30 vOff5 gsub5 +BackgroundTrans hidden,%Off%


Gui, Add, Text, x12 y287 w300 h30 +BackgroundTrans, %Menu6%
Gui, Add, Picture, x290 y287 w-1 h30 vOn6 gsub6 +BackgroundTrans,%On%
Gui, Add, Picture, x290 y287 w-1 h30 vOff6 gsub6 +BackgroundTrans hidden,%Off%


Gui, Add, Text, x12 y334 w300 h30 +BackgroundTrans, %Menu7%
Gui, Add, Picture, x290 y334 w-1 h30 vOn7 gsub7 +BackgroundTrans,%On%
Gui, Add, Picture, x290 y334 w-1 h30 vOff7 gsub7 +BackgroundTrans hidden,%Off%


Gui, Add, Text, x12 y428 w300 h30 +BackgroundTrans, %Menu8%
Gui, Add, Picture, x290 y428 w-1 h30 vOn8 gsub8 +BackgroundTrans,%On%
Gui, Add, Picture, x290 y428 w-1 h30 vOff8 gsub8 +BackgroundTrans hidden,%Off%


Gui, Add, Text, x12 y381 w300 h30 +BackgroundTrans, %Menu9%
Gui, Add, Picture, x290 y381 w-1 h30 vOn9 gsub9 +BackgroundTrans,%On%
Gui, Add, Picture, x290 y381 w-1 h30 vOff9 gsub9 +BackgroundTrans hidden,%Off%

Gui, Add, Text, x12 y475 w300 h30 +BackgroundTrans, %Menu10%
Gui, Add, Picture, x290 y475 w-1 h30 vOn10 gsub10 +BackgroundTrans,%On%
Gui, Add, Picture, x290 y475 w-1 h30 vOff10 gsub10 +BackgroundTrans hidden,%Off%

Gui, Font, Impact s17 cA3A6AB

Gui, Add, Picture, x252 y559 w-1 h30 gCount, %Button%
Gui, Add, Text, x285 Y559 +BackgroundTrans, Go

Gui, Add, Picture, x8 y559 w-1 h30 gClear, %Button%
Gui, Add, Text, x27 Y559 +BackgroundTrans, Clear

Gui, Font, S16 cRED
Gui, Color,, 3E4146

Gui, Add, Edit, x125 y559 w110 h30 +Center +Uppercase +Limit8 vOrderNumber gOrderNumber

Gui, Font

Gui, Add, Progress, x8 y601 w344 h31 c6F7071 Background3E4146 Range0-99 vOverallProgress, 0

Gui, Font, Impact s17 cA3A6AB

Gui, Add, Text, x8 y601 w344 h31 vStatus +BackgroundTrans Center, Select Items

Gui, Font
; Generated using SmartGUI Creator 4.0

Gui, Show, h640 w360, Post Install

return

Clear:
Loop 10{ ;<-- Number of options to check for.
Opt%A_Index%=0
GuiControl, Hide, On%A_Index%
GuiControl, Show, Off%A_Index%
}
return

Count:
GuiControl,, OverallProgress, 0
Todo=0
Loop 9{ ;<-- Number of options to check for.
if (Opt%A_Index%=1) {
	Todo+=1
}
}
Todo := 100 / Todo

Apply:
Loop 9{ ;<-- Number of options to check for.
if (Opt%A_Index%=1) {
	Opt%A_Index%=0
	GuiControl, Hide, On%A_Index%
	GuiControl, Show, Off%A_Index%
	goto, Act%A_Index%
}
}
GuiControl, Text, Status, Finished
Gui, Flash
return

OrderNumber:
gui, Submit, nohide
Return

;Button Presses
sub1:
if (Opt1=0) {
	Opt1=1
	GuiControl, Show, On1
	GuiControl, Hide, Off1
}else {
	Opt1=0
	GuiControl, Hide, On1
	GuiControl, Show, Off1
}
return

sub2:
if (Opt2=0) {
	Opt2=1
	GuiControl, Show, On2
	GuiControl, Hide, Off2
}else {
	Opt2=0
	GuiControl, Hide, On2
	GuiControl, Show, Off2
}
return

sub3:
if (Opt3=0) {
	Opt3=1
	GuiControl, Show, On3
	GuiControl, Hide, Off3
}else {
	Opt3=0
	GuiControl, Hide, On3
	GuiControl, Show, Off3
}
return

sub4:
if (Opt4=0) {
	Opt4=1
	GuiControl, Show, On4
	GuiControl, Hide, Off4
}else {
	Opt4=0
	GuiControl, Hide, On4
	GuiControl, Show, Off4
}
return

sub5:
if (Opt5=0) {
	Opt5=1
	GuiControl, Show, On5
	GuiControl, Hide, Off5
}else {
	Opt5=0
	GuiControl, Hide, On5
	GuiControl, Show, Off5
}
return

sub6:
if (Opt6=0) {
	Opt6=1
	GuiControl, Show, On6
	GuiControl, Hide, Off6
}else {
	Opt6=0
	GuiControl, Hide, On6
	GuiControl, Show, Off6
}
return

sub7:
if (Opt7=0) {
	Opt7=1
	GuiControl, Show, On7
	GuiControl, Hide, Off7
}else {
	Opt7=0
	GuiControl, Hide, On7
	GuiControl, Show, Off7
}
return

sub9:
if (Opt9=0) {
	Opt9=1
	GuiControl, Show, On9
	GuiControl, Hide, Off9
}else {
	Opt9=0
	GuiControl, Hide, On9
	GuiControl, Show, Off9
}
return

sub8:
if (Opt8=0) {
	Opt8=1
	GuiControl, Show, On8
	GuiControl, Hide, Off8
}else {
	Opt8=0
	GuiControl, Hide, On8
	GuiControl, Show, Off8
}
return

sub10:
if (Opt10=0) {
	Opt10=1
	GuiControl, Show, On10
	GuiControl, Hide, Off10
}else {
	Opt10=0
	GuiControl, Hide, On10
	GuiControl, Show, Off10
}
return

UIMove:
PostMessage, 0xA1, 2,,, A
Return

Act1:
GuiControl, Text, Status, %MSG1%
ProfileLocation=%A_ScriptDir%\%Dir1%
RunWait, %ComSpec% /C Netsh WLAN add profile filename="%A_ScriptDir%\WiFi.xml" user=all && Netsh WLAN connect name=%Name1%
GuiControl,, OverallProgress, +%Todo%
Goto, Apply

Act2:
GuiControl, Text, Status, %MSG2%
RunWait, %Dir2% %Args2%
GuiControl,, OverallProgress, +%Todo%
Goto, Apply

Act3:
GuiControl, Text, Status, %MSG3%
RunWait, %Dir3% %Args3%
GuiControl,, OverallProgress, +%Todo%
Goto, Apply

Act4:
GuiControl, Text, Status, %MSG4%
RunWait, %Dir4% %Args4%
GuiControl,, OverallProgress, +%Todo%
Goto, Apply

Act5:
GuiControl, Text, Status, %MSG5%
RunWait, %Dir5% %Args5%
GuiControl,, OverallProgress, +%Todo%
Goto, Apply

Act6:
GuiControl, Text, Status, %MSG6%
RunWait, %Dir6% %Args6%
GuiControl,, OverallProgress, +%Todo%
Goto, Apply

Act7:
GuiControl, Text, Status, %MSG7%
RunWait, %Dir7% %Args7%
GuiControl,, OverallProgress, +%Todo%
Goto, Apply

Act8:
GuiControl, Text, Status, %MSG8%
Run, %Dir8% %Args8%
GuiControl,, OverallProgress, +%Todo%

;BullGuard Automation
GuiControl, Text, Status, %MSG10%
if (Opt10=1) {
	Opt10=0
	GuiControl, Show, Off10
	;Terms and Conditions
	WinWaitActive, BullGuard Internet Security Setup
		sleep 500
		ControlClick, Button3, BullGuard Internet Security Setup
		ControlClick, Button1, BullGuard Internet Security Setup
	;Create Account
	WinWaitActive, Internet Security
	sleep 5000
		loop{
			Text:="|<>*195$31.zU00Bs0006w0000S1xltjyvAarUNa3PkAnDhs6Ngqw3AqPTxaNxi"
			if (ok:=FindText(394-150000, 321-150000, 394+150000, 321+150000, 0, 0, Text))
			{
			CoordMode, Mouse
			X:=ok.1.x, Y:=ok.1.y, Comment:=ok.1.id
			Click, %X%, %Y%
			Send %OrderNumber%%Email%
			sleep 250
			break
			}
			}
		loop{
			Text:="|<>*197$56.z00000000wM0000000D200000003kbnlm8bbbwNBaWrPBXTw3MABqnMXk7nltJAqMw3A63RnBWD0nNcbQnMnk7nlsm7a7s"
			if (ok:=FindText(407-150000, 363-150000, 407+150000, 363+150000, 0, 0, Text))
			{
			CoordMode, Mouse
			X:=ok.1.x, Y:=ok.1.y, Comment:=ok.1.id
			Click, %X%, %Y%
			Send %OrderNumber%
			sleep 250
			break
			}
			}
		loop{
			Text:="|<>*196$40.zU00003604000AA0E000knnsjVv6NYavAjlWHP6Xn7tBAPz6M4QlcA9aFngnknlaDVs0008k00001X00000AA02"
			if (ok:=FindText(399-150000, 404-150000, 399+150000, 404+150000, 0, 0, Text))
			{
			CoordMode, Mouse
			X:=ok.1.x, Y:=ok.1.y, Comment:=ok.1.id
			Click, %X%, %Y%
			Send %OrderNumber%
			sleep 250
			break
			}
			}
		loop{
			Text:="|<>*171$37.D00020AM0030A1tlvna0lhanP0NaDNZUAzRgzk6MAqMAP6qvBXtVlwnY"
			if (ok:=FindText(462-150000, 481-150000, 462+150000, 481+150000, 0, 0, Text))
			{
			CoordMode, Mouse
			X:=ok.1.x, Y:=ok.1.y, Comment:=ok.1.id
			Click, %X%, %Y%
			break
			}
			}
			
	;Skip
	loop{
		sleep 500
		Text:="|<>*165$26.SA60An1U30k00sAqT7XNaMwwNW3j6MkPNaPAnNaSAqT00060001U000M8"
		if (ok:=FindText(915-150000, 601-150000, 915+150000, 601+150000, 0, 0, Text))
		{
		CoordMode, Mouse
		X:=ok.1.x, Y:=ok.1.y, Comment:=ok.1.id
		Click, %X%, %Y%
		break
		}
		}
		}
	
Goto, Apply

Act9:
GuiControl, Text, Status, %MSG9%
WinMinimizeAll
run, %Dir9% %Args9%
sleep 2000
WinActivate chrome.exe
loop{
	Send {PgDn}
	sleep 500
	Text:="|<>*190$44.DzzzzzznzzzzzzwzzzzzzzDkw233kHta0UaMUztD8nmQDUHmQ0U3tYwbDtwyNU9s60DUQ2T3kTzzwzzzzzzUTzzzzzwDzzzs"
	if (ok:=FindText(1019-150000, 936-150000, 1019+150000, 936+150000, 0, 0, Text))
	{
	CoordMode, Mouse
	X:=ok.1.x, Y:=ok.1.y, Comment:=ok.1.id
	Click, %X%, %Y%
	}
	
	Send {PgUp}
	sleep 500
	Text:="|<>*170$44.sztzDzzyDyTnwzz1zbwzDzmS1kD0kMb0M3sM20naQzAQU8t7DnD1nCNnwlkwE60z20Da1kDkkM"
	if (ok:=FindText(1348-150000, 243-150000, 1348+150000, 243+150000, 0, 0, Text))
	{
	CoordMode, Mouse
	X:=ok.1.x, Y:=ok.1.y, Comment:=ok.1.id
	Click, %X%, %Y%
	}
	
	Text:="|<>*200$22.60MAQ1Unk6393twaNgrt6XMYOB3PgwByTU"
	if (ok:=FindText(965-150000, 246-150000, 965+150000, 246+150000, 0, 0, Text))
	{
    CoordMode, Mouse
    X:=ok.1.x, Y:=ok.1.y, Comment:=ok.1.id
    Click, %X%, %Y%
	break
	}
}
GuiControl,, OverallProgress, +%Todo%
Goto, Apply

Minimize:
Gui, Minimize
return

GuiEscape:
GuiClose:
ExitApp

update:
IniRead, LatestVersionURL, config.ini, config, LatestVersionURL
IniRead, LatestVersionINI, config.ini, config, LatestVersionINI
IniRead, Updater, config.ini, config, Updater
IniRead, CurVer, config.ini, config, Version
IniRead, UpdateURL, config.ini, config, UpdateURL

UrlDownloadToFile, %LatestVersionURL%, %LatestVersionINI%
if (ErrorLevel=1) {
goto, vars	
}
IniRead, NextVer, %LatestVersionINI%, config, Version
if (NextVer > CurVer) {
	MsgBox, 4, Update?, A new version is available for download`, would you like to update?
}
else {
	FileDelete, %LatestVersionINI%
	goto, vars
}
IfMsgBox, Yes
{
	URLUPDATER=%UpdateURL%%NextVer%/%Updater%
	FileDelete, %Updater%
	UrlDownloadToFile, %URLUPDATER%, %Updater%
	Run, %ahk% %Updater%
	ExitApp
}
IfMsgBox, No
{
	FileDelete, %LatestVersionINI%
	goto, vars
}