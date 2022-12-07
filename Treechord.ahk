#Include %A_ScriptDir%\Natural_keyboard_4000_support.ahk
#Include %A_ScriptDir%\JSON.ahk
#NoEnv
SendMode Input
SetWorkingDir %A_ScriptDir%

Menu, Tray, Icon, shell32.dll, 42, 1

/* Profiles
 *
 * These are global because AHK can't bind keys in functions.
 */

; bind keys
global bindA
global bindB
global bindC
;global bindD
;global bindE
global bindF
global bindG
global bindH
global bindI
global bindJ
global bindK
global bindL
global bindM
global bindN
global bindO
global bindP
global bindQ
;global bindR
global bindS
global bindT
global bindU
global bindV
global bindW
;global bindX
global bindY
global bindZ

global bindEnter

global bindShiftA
global bindShiftB
global bindShiftC
global bindShiftD
global bindShiftE
global bindShiftF
global bindShiftG
global bindShiftH
global bindShiftI
global bindShiftJ
global bindShiftK
global bindShiftL
global bindShiftM
global bindShiftN
global bindShiftO
global bindShiftP
global bindShiftQ
global bindShiftR
global bindShiftS
global bindShiftT
global bindShiftU
global bindShiftV
global bindShiftW
global bindShiftX
global bindShiftY
global bindShiftZ

global bindShiftEnter

global bindLaunch1
global bindLaunch2
global bindLaunch3
global bindLaunch4
global bindLaunch5

global configurationFile

/* File and Directory Variables
 *
 * - Standard AHK strings.
 */

/* Configuration variables.
 */

configurationFile := "C:\Users\" . A_UserName . "\Treechord.json"

/* Functions.
 */

initConfiguration(fileName)
{
    if ! FileExist(fileName)
    {
        FileAppend,
        (
{
	"bindA": "",
    "bindB": "",
	"bindC": "",
	"bindF": "",
	"bindG": "",
	"bindH": "",
	"bindI": "",
	"bindJ": "",
	"bindK": "",
	"bindL": "",
	"bindM": "",
	"bindN": "",
	"bindO": "",
	"bindP": "",
    "bindQ": "",
	"bindS": "",
	"bindT": "",
	"bindU": "",
    "bindV": "",
	"bindW": "",
	"bindY": "",
	"bindZ": "",

	"bindEnter": "",

	"bindShiftA": "",
    "bindShiftB": "",
	"bindShiftC": "",
	"bindShiftD": "",
	"bindShiftE": "",
	"bindShiftF": "",
	"bindShiftG": "",
	"bindShiftH": "",
	"bindShiftI": "",
	"bindShiftJ": "",
	"bindShiftK": "",
	"bindShiftL": "",
	"bindShiftM": "",
	"bindShiftN": "",
	"bindShiftO": "",
	"bindShiftP": "",
	"bindShiftS": "",
	"bindShiftT": "",
	"bindShiftU": "",
	"bindShiftW": "",
	"bindShiftX": "",
	"bindShiftY": "",
	"bindShiftZ": "",
    "bindShiftQ": "",
    "bindShiftR": "",
    "bindShiftV": "",

	"bindShiftEnter": "",

    "bindLaunch1": "",
    "bindLaunch2": "",
    "bindLaunch3": "",
    "bindLaunch4": "",
    "bindLaunch5": ""
}
        ), %fileName%
        TrayTip, Created configuration file, Created %fileName%.
    }
}

returnArrayLength(array)
{
    counter := 0
    for value in array
        counter++
    return counter
}

processValue(variableData)
{
    arrayLength := returnArrayLength(variableData)
    IfEqual, arrayLength, 2
        buffer := [ variableData[1], variableData[2] ]
    else
    {
        variableData := StrReplace(variableData, "/", "\\")
        SplitPath, variableData, executable
        buffer := [executable , variableData]
    }

    return buffer
}

raiseOrRun(WindowStat, ProgramPath)
{
    If WinActive("ahk_exe" WindowStat)
        WinActivateBottom, ahk_exe %WindowStat%
    else IfWinActive ahk_class %WindowStat%
        WinActivateBottom, ahk_class %WindowStat%
    else If WinExist("ahk_exe" WindowStat)
        WinActivate, ahk_exe %WindowStat%
    else IfWinExist ahk_class %WindowStat%
        WinActivate, ahk_class %WindowStat%
    else
    {
        Run, %ProgramPath%,, UseErrorLevel

        if (ErrorLevel = "ERROR")
            TrayTip, Failed to run program, Failed to run %ProgramPath%
    }
}

workspace(workspaceID)
{
    workspaceID--

    WinActivate, ahk_class Shell_TrayWnd

    Loop, 9
        Send ^#{Left}

    Loop, %workspaceID%
        Send ^#{Right}
}

toggleTreechord()
{
    if (A_IsSuspended)
        state = Enabled
    else
        state = Disabled

    Traytip %state% %A_ScriptName%, %state%.
    Suspend,Toggle
    return
}

parseConfiguration(fileName)
{
    filePointer := FileOpen(fileName, "r")
    JSONStr     := filePointer.Read()
    JSONData    := JSON.Load(JSONStr)

    for variableName, variableData in JSONData
    {
        ;MsgBox % variableName
        switch (variableName)
        {
            case "bindA": bindA := processValue(variableData)
            case "bindB": bindB := processValue(variableData)
            case "bindC": bindC := processValue(variableData)
            case "bindF": bindF := processValue(variableData)
            case "bindG": bindG := processValue(variableData)
            case "bindH": bindH := processValue(variableData)
            case "bindI": bindI := processValue(variableData)
            case "bindJ": bindJ := processValue(variableData)
            case "bindK": bindK := processValue(variableData)
            case "bindL": bindL := processValue(variableData)
            case "bindM": bindM := processValue(variableData)
            case "bindN": bindN := processValue(variableData)
            case "bindO": bindO := processValue(variableData)
            case "bindP": bindP := processValue(variableData)
            case "bindQ": bindQ := processValue(variableData)
            case "bindS": bindS := processValue(variableData)
            case "bindT": bindT := processValue(variableData)
            case "bindU": bindU := processValue(variableData)
            case "bindV": bindV := processValue(variableData)
            case "bindW": bindW := processValue(variableData)
            case "bindY": bindY := processValue(variableData)
            case "bindZ": bindZ := processValue(variableData)

			case "bindEnter": bindEnter := processValue(variableData)

            case "bindShiftA": bindShiftA := processValue(variableData)
            case "bindShiftB": bindShiftB := processValue(variableData)
            case "bindShiftC": bindShiftC := processValue(variableData)
            case "bindShiftD": bindShiftD := processValue(variableData)
            case "bindShiftE": bindShiftE := processValue(variableData)
            case "bindShiftF": bindShiftF := processValue(variableData)
            case "bindShiftG": bindShiftG := processValue(variableData)
            case "bindShiftH": bindShiftH := processValue(variableData)
            case "bindShiftI": bindShiftI := processValue(variableData)
            case "bindShiftJ": bindShiftJ := processValue(variableData)
            case "bindShiftK": bindShiftK := processValue(variableData)
            case "bindShiftL": bindShiftL := processValue(variableData)
            case "bindShiftM": bindShiftM := processValue(variableData)
            case "bindShiftN": bindShiftN := processValue(variableData)
            case "bindShiftO": bindShiftO := processValue(variableData)
            case "bindShiftP": bindShiftP := processValue(variableData)
            case "bindShiftQ": bindShiftQ := processValue(variableData)
            case "bindShiftR": bindShiftR := processValue(variableData)
            case "bindShiftS": bindShiftS := processValue(variableData)
            case "bindShiftT": bindShiftT := processValue(variableData)
            case "bindShiftU": bindShiftU := processValue(variableData)
            case "bindShiftV": bindShiftV := processValue(variableData)
            case "bindShiftW": bindShiftW := processValue(variableData)
            case "bindShiftX": bindShiftX := processValue(variableData)
            case "bindShiftY": bindShiftY := processValue(variableData)
            case "bindShiftZ": bindShiftZ := processValue(variableData)

			case "bindShiftEnter": bindShiftEnter := processValue(variableData)

			case "bindLaunch1": bindLaunch1 := processValue(variableData)
			case "bindLaunch2": bindLaunch2 := processValue(variableData)
			case "bindLaunch3": bindLaunch3 := processValue(variableData)
			case "bindLaunch4": bindLaunch4 := processValue(variableData)
			case "bindLaunch5": bindLaunch5 := processValue(variableData)

            Default:
                TrayTip, Error in %fileName%, "%variableName%": "%variableData%".
                toggleTreechord()
        }
    }

    TrayTip, %JSONData%, %JSONData%
}

/* General init.
 */

initConfiguration(configurationFile)
parseConfiguration(configurationFile)

; Windows + ?
#a:: raiseOrRun(bindA[1], bindA[2])
#b:: raiseOrRun(bindB[1], bindB[2])
#c:: raiseOrRun(bindC[1], bindC[2])
#f:: raiseOrRun(bindF[1], bindF[2])
#g:: raiseOrRun(bindG[1], bindG[2])
#h:: raiseOrRun(bindH[1], bindH[2])
#i:: raiseOrRun(bindI[1], bindI[2])
#j:: raiseOrRun(bindJ[1], bindJ[2])
#k:: raiseOrRun(bindK[1], bindK[2])
#l:: raiseOrRun(bindL[1], bindL[2])
#m:: raiseOrRun(bindM[1], bindM[2])
#n:: raiseOrRun(bindN[1], bindN[2])
#o:: raiseOrRun(bindO[1], bindO[2])
#p:: raiseOrRun(bindP[1], bindP[2])
#q:: raiseOrRun(bindQ[1], bindQ[2])
#s:: raiseOrRun(bindS[1], bindS[2])
#t:: raiseOrRun(bindT[1], bindT[2])
#u:: raiseOrRun(bindU[1], bindU[2])
#v:: raiseOrRun(bindV[1], bindV[2])
#w:: raiseOrRun(bindW[1], bindW[2])
#y:: raiseOrRun(bindY[1], bindY[2])
#z:: raiseOrRun(bindZ[1], bindZ[2])
;#d:: raiseOrRun(bindD[1], bindD[2])
;#e:: raiseOrRun(bindE[1], bindE[2])
;#r:: raiseOrRun(bindR[1], bindR[2])
;#x:: raiseOrRun(bindX[1], bindX[2])

#Enter:: raiseOrRun(bindEnter[1], bindEnter[2])

; Windows + Shift + ? ;
#+a:: raiseOrRun(bindShiftA[1], bindShiftA[2])
#+b:: raiseOrRun(bindShiftB[1], bindShiftB[2])
#+c:: raiseOrRun(bindShiftC[1], bindShiftC[2])
#+d:: raiseOrRun(bindShiftD[1], bindShiftD[2])
#+e:: raiseOrRun(bindShiftE[1], bindShiftE[2])
#+f:: raiseOrRun(bindShiftF[1], bindShiftF[2])
#+g:: raiseOrRun(bindShiftG[1], bindShiftG[2])
#+h:: raiseOrRun(bindShiftH[1], bindShiftH[2])
#+i:: raiseOrRun(bindShiftI[1], bindShiftI[2])
#+j:: raiseOrRun(bindShiftJ[1], bindShiftJ[2])
#+k:: raiseOrRun(bindShiftK[1], bindShiftK[2])
#+l:: raiseOrRun(bindShiftL[1], bindShiftL[2])
#+m:: raiseOrRun(bindShiftM[1], bindShiftM[2])
#+n:: raiseOrRun(bindShiftN[1], bindShiftN[2])
#+o:: raiseOrRun(bindShiftO[1], bindShiftO[2])
#+p:: raiseOrRun(bindShiftP[1], bindShiftP[2])
#+q:: raiseOrRun(bindShiftQ[1], bindShiftQ[2])
#+r:: raiseOrRun(bindShiftR[1], bindShiftR[2])
#+s:: raiseOrRun(bindShiftS[1], bindShiftS[2])
#+t:: raiseOrRun(bindShiftT[1], bindShiftT[2])
#+u:: raiseOrRun(bindShiftU[1], bindShiftU[2])
#+v:: raiseOrRun(bindShiftV[1], bindShiftV[2])
#+w:: raiseOrRun(bindShiftW[1], bindShiftW[2])
#+x:: raiseOrRun(bindShiftX[1], bindShiftX[2])
#+y:: raiseOrRun(bindShiftY[1], bindShiftY[2])
#+z:: raiseOrRun(bindShiftZ[1], bindShiftZ[2])

#+Enter:: raiseOrRun(bindShiftEnter[1], bindShiftEnter[2])

#^r:: Reload

; Alt + ?
!h:: Send  {Left}
!j:: Send  {Down}
!k:: Send    {Up}
!l:: Send {Right}

; F1 - F12
;
; Maximizes current window, but not the desktop, taskbar, start menu, or
; anything you wouldn't want to maximize normally.
$F1::
    if ( ! WinActive("ahk_class Progman")
    || ! WinActive("ahk_class WorkerW")
    || ! WinActive("ahk_Class DV2ControlHost")
    || (! WinActive("Start") && ! WinActive("ahk_class Button"))
    || ! WinActive("ahk_class Shell_TrayWnd"))
    {
        WinGet, MinMax, MinMax, A

        If (MinMax = 1)
        {
            WinRestore, A
            return
        }

        WinMaximize, A
        return
    }
$F2::  WinMinimize, A
$F4::  Send !{Tab}
$F6::  Send !{f4}
$F10:: Send {f11}
$F11:: Send ^{PgUp}
$F12:: Send ^{PgDn}

; Command keys
$Pause::   Send ^{w}
Capslock:: Escape

; Microsoft Natural 4000 Ergonomic Keyboard Keys.
;
; If you don't have this keyboard, that's okay. The only thing you'll miss
; is the extended key set. Beside that, you can use this normally.

MsNatural4000_Favorites1:
    raiseOrRun(bindLaunch1[1], bindLaunch1[2])
    return
MsNatural4000_Favorites2:
    raiseOrRun(bindLaunch2[1], bindLaunch2[2])
    return
MsNatural4000_Favorites3:
    raiseOrRun(bindLaunch3[1], bindLaunch3[2])
    return
MsNatural4000_Favorites4:
    raiseOrRun(bindLaunch4[1], bindLaunch4[2])
    return
MsNatural4000_Favorites5:
    raiseOrRun(bindLaunch5[1], bindLaunch5[2])
    return

MsNatural4000_MyFavorites:
    toggleTreechord()
    return

; Pressing NumpadEqual will toggle this script on/off.
MsNatural4000_NumpadEqual:
    Send ^{v}
    return
MsNatural4000_NumpadLeftBracket:
    Send ^#{Left}
    return
MsNatural4000_NumpadRightBracket:
    Send ^#{Right}
    return
MsNatural4000_ZoomDown:
    Send ^{-}
    return
MsNatural4000_ZoomUp:
    Send ^{+}
    return

NumpadEnd:: workspace(1)
NumpadDown:: workspace(2)
NumpadPgDn:: workspace(3)
NumpadLeft:: workspace(4)
NumpadClear:: workspace(5)
NumpadRight:: workspace(6)
NumpadHome:: workspace(7)
NumpadUp:: workspace(8)
NumpadPgUp:: workspace(9)
NumpadIns:: workspace(10)

; NumpadDot
; NumLock
; NumpadDiv
; NumpadMult
NumpadAdd:: Send ^#{Right}
NumpadSub:: Send ^#{Left}
; NumpadEnter