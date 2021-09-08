#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

IniRead, ahk, config.ini, config, AutoHotKey

IniRead, LatestVersionURL, config.ini, config, LatestVersionURL
IniRead, LatestVersionINI, config.ini, config, LatestVersionINI
IniRead, File, config.ini, config, File
IniRead, CurVer, config.ini, config, Version
IniRead, NextVer, %LatestVersionINI%, config, Version
IniRead, UpdateURL, config.ini, config, UpdateURL

FileDelete, %LatestVersionINI%
if (NextVer > CurVer) {
	FileDelete, %File%
	FileDelete, %Images%
	UrlDownloadToFile, %UpdateURL%%NextVer%/%File%, %File%
	UrlDownloadToFile, %UpdateURL%%NextVer%/%Images%, %Images%
	UrlDownloadToFile, %UpdateURL%%NextVer%/%Config%, %Config%
	IniWrite, %NextVer%, config.ini, config, Version
	Run, %ahk% %File%
}

ExitApp