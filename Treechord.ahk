
#Include %A_ScriptDir%\Natural_keyboard_4000_support.ahk
#Include %A_ScriptDir%\JSON.ahk

#NoEnv

SendMode Input
SetWorkingDir %A_ScriptDir%

Menu, Tray, Icon, shell32.dll, 42, 1

/* Configuration variables.
 */

configurationFile := "C:\Users\" . A_UserName . "\Treechord.json"

/* Functions.
 */

InitConfiguration(fileName)
{
    if ! FileExist(fileName)
    {
        FileAppend,
        (
{

	"bindA": "",
    "bindB": "",
	"bindC": "",
	"bindE": [ "CabinetWClass", "C:/Windows/explorer.exe" ],
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

	"bindAltA": "",
	"bindAltC": "",
	"bindAltD": "",
	"bindAltE": "",
	"bindAltF": "",
	"bindAltG": "",
	"bindAltH": "",
	"bindAltI": "",
	"bindAltJ": "",
	"bindAltK": "",
	"bindAltL": "",
	"bindAltM": "",
	"bindAltN": "",
	"bindAltO": "",
	"bindAltP": "",
	"bindAltS": "",
	"bindAltT": "",
	"bindAltU": "",
	"bindAltW": "",
	"bindAltX": "",
	"bindAltY": "",
	"bindAltZ": "",
    "bindAltB": "",
    "bindAltQ": "",
    "bindAltR": "",
    "bindAltV": "",

	"bindEnter": "",
	"bindShiftEnter": "",

    "bindLaunch1": "",
    "bindLaunch2": "",
    "bindLaunch3": "",
    "bindLaunch4": "",
    "bindLaunch5": ""

}
        ), %fileName%
        TrayTip, [CREATED CONFIGURATION], -> %fileName% <-
    }
}

ReturnArrayLength(array)
{
    counter := 0
    for value in array
        counter++
    return counter
}

ProcessValue(variableData)
{
    arrayLength := ReturnArrayLength(variableData)
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

RaiseOrRun(WindowStat, ProgramPath)
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
            TrayTip, [FAILURE], %ProgramPath%.
    }
}

ToggleTreechord()
{
    if (A_IsSuspended)
        state = ENABLED
    else
        state = DISABLED

    Traytip [%state%], %state% %A_ScriptName%.
    Suspend,Toggle
    return
}

/* General init.
 */

InitConfiguration(configurationFile)

filePointer := FileOpen(configurationFile, "r")
JSONStr     := filePointer.Read()
filePointer.Close()
JSONData    := JSON.Load(JSONStr)

for variableName, variableData in JSONData
{
    switch (variableName)
    {
        case "bindA": bindA := ProcessValue(variableData)
        case "bindB": bindB := ProcessValue(variableData)
        case "bindC": bindC := ProcessValue(variableData)
        case "bindE": bindE := ProcessValue(variableData)
        case "bindF": bindF := ProcessValue(variableData)
        case "bindG": bindG := ProcessValue(variableData)
        case "bindH": bindH := ProcessValue(variableData)
        case "bindI": bindI := ProcessValue(variableData)
        case "bindJ": bindJ := ProcessValue(variableData)
        case "bindK": bindK := ProcessValue(variableData)
        case "bindL": bindL := ProcessValue(variableData)
        case "bindM": bindM := ProcessValue(variableData)
        case "bindN": bindN := ProcessValue(variableData)
        case "bindO": bindO := ProcessValue(variableData)
        case "bindP": bindP := ProcessValue(variableData)
        case "bindQ": bindQ := ProcessValue(variableData)
        case "bindS": bindS := ProcessValue(variableData)
        case "bindT": bindT := ProcessValue(variableData)
        case "bindU": bindU := ProcessValue(variableData)
        case "bindV": bindV := ProcessValue(variableData)
        case "bindW": bindW := ProcessValue(variableData)
        case "bindY": bindY := ProcessValue(variableData)
        case "bindZ": bindZ := ProcessValue(variableData)

        case "bindShiftA": bindShiftA := ProcessValue(variableData)
        case "bindShiftB": bindShiftB := ProcessValue(variableData)
        case "bindShiftC": bindShiftC := ProcessValue(variableData)
        case "bindShiftD": bindShiftD := ProcessValue(variableData)
        case "bindShiftE": bindShiftE := ProcessValue(variableData)
        case "bindShiftF": bindShiftF := ProcessValue(variableData)
        case "bindShiftG": bindShiftG := ProcessValue(variableData)
        case "bindShiftH": bindShiftH := ProcessValue(variableData)
        case "bindShiftI": bindShiftI := ProcessValue(variableData)
        case "bindShiftJ": bindShiftJ := ProcessValue(variableData)
        case "bindShiftK": bindShiftK := ProcessValue(variableData)
        case "bindShiftL": bindShiftL := ProcessValue(variableData)
        case "bindShiftM": bindShiftM := ProcessValue(variableData)
        case "bindShiftN": bindShiftN := ProcessValue(variableData)
        case "bindShiftO": bindShiftO := ProcessValue(variableData)
        case "bindShiftP": bindShiftP := ProcessValue(variableData)
        case "bindShiftQ": bindShiftQ := ProcessValue(variableData)
        case "bindShiftR": bindShiftR := ProcessValue(variableData)
        case "bindShiftS": bindShiftS := ProcessValue(variableData)
        case "bindShiftT": bindShiftT := ProcessValue(variableData)
        case "bindShiftU": bindShiftU := ProcessValue(variableData)
        case "bindShiftV": bindShiftV := ProcessValue(variableData)
        case "bindShiftW": bindShiftW := ProcessValue(variableData)
        case "bindShiftX": bindShiftX := ProcessValue(variableData)
        case "bindShiftY": bindShiftY := ProcessValue(variableData)
        case "bindShiftZ": bindShiftZ := ProcessValue(variableData)

        case "bindAltA": bindAltA := ProcessValue(variableData)
        case "bindAltB": bindAltB := ProcessValue(variableData)
        case "bindAltC": bindAltC := ProcessValue(variableData)
        case "bindAltD": bindAltD := ProcessValue(variableData)
        case "bindAltE": bindAltE := ProcessValue(variableData)
        case "bindAltF": bindAltF := ProcessValue(variableData)
        case "bindAltG": bindAltG := ProcessValue(variableData)
        case "bindAltH": bindAltH := ProcessValue(variableData)
        case "bindAltI": bindAltI := ProcessValue(variableData)
        case "bindAltJ": bindAltJ := ProcessValue(variableData)
        case "bindAltK": bindAltK := ProcessValue(variableData)
        case "bindAltL": bindAltL := ProcessValue(variableData)
        case "bindAltM": bindAltM := ProcessValue(variableData)
        case "bindAltN": bindAltN := ProcessValue(variableData)
        case "bindAltO": bindAltO := ProcessValue(variableData)
        case "bindAltP": bindAltP := ProcessValue(variableData)
        case "bindAltQ": bindAltQ := ProcessValue(variableData)
        case "bindAltR": bindAltR := ProcessValue(variableData)
        case "bindAltS": bindAltS := ProcessValue(variableData)
        case "bindAltT": bindAltT := ProcessValue(variableData)
        case "bindAltU": bindAltU := ProcessValue(variableData)
        case "bindAltV": bindAltV := ProcessValue(variableData)
        case "bindAltW": bindAltW := ProcessValue(variableData)
        case "bindAltX": bindAltX := ProcessValue(variableData)
        case "bindAltY": bindAltY := ProcessValue(variableData)
        case "bindAltZ": bindAltZ := ProcessValue(variableData)

        case "bindEnter": bindEnter := ProcessValue(variableData)
        case "bindShiftEnter": bindShiftEnter := ProcessValue(variableData)

        case "bindLaunch1": bindLaunch1 := ProcessValue(variableData)
        case "bindLaunch2": bindLaunch2 := ProcessValue(variableData)
        case "bindLaunch3": bindLaunch3 := ProcessValue(variableData)
        case "bindLaunch4": bindLaunch4 := ProcessValue(variableData)
        case "bindLaunch5": bindLaunch5 := ProcessValue(variableData)

        Default:
            TrayTip, [ERROR], %configurationFile%: "%variableName%": "%variableData%".
            ToggleTreechord()
    }
}

/* Windows + ?
 */

#a:: RaiseOrRun(bindA[1], bindA[2])
#b:: RaiseOrRun(bindB[1], bindB[2])
#c:: RaiseOrRun(bindC[1], bindC[2])
;#d:: RaiseOrRun(bindD[1], bindD[2])
#e:: RaiseOrRun(bindE[1], bindE[2])
#f:: RaiseOrRun(bindF[1], bindF[2])
#g:: RaiseOrRun(bindG[1], bindG[2])
#h:: RaiseOrRun(bindH[1], bindH[2])
#i:: RaiseOrRun(bindI[1], bindI[2])
#j:: RaiseOrRun(bindJ[1], bindJ[2])
#k:: RaiseOrRun(bindK[1], bindK[2])
#l:: RaiseOrRun(bindL[1], bindL[2])
#m:: RaiseOrRun(bindM[1], bindM[2])
#n:: RaiseOrRun(bindN[1], bindN[2])
#o:: RaiseOrRun(bindO[1], bindO[2])
#p:: RaiseOrRun(bindP[1], bindP[2])
#q:: RaiseOrRun(bindQ[1], bindQ[2])
;#r:: RaiseOrRun(bindR[1], bindR[2])
#s:: RaiseOrRun(bindS[1], bindS[2])
#t:: RaiseOrRun(bindT[1], bindT[2])
#u:: RaiseOrRun(bindU[1], bindU[2])
#v:: RaiseOrRun(bindV[1], bindV[2])
#w:: RaiseOrRun(bindW[1], bindW[2])
;#x:: RaiseOrRun(bindX[1], bindX[2])
#y:: RaiseOrRun(bindY[1], bindY[2])
#z:: RaiseOrRun(bindZ[1], bindZ[2])

/* Windows + Shift + ?
 */

#+a:: RaiseOrRun(bindShiftA[1], bindShiftA[2])
#+b:: RaiseOrRun(bindShiftB[1], bindShiftB[2])
#+c:: RaiseOrRun(bindShiftC[1], bindShiftC[2])
#+d:: RaiseOrRun(bindShiftD[1], bindShiftD[2])
#+e:: RaiseOrRun(bindShiftE[1], bindShiftE[2])
#+f:: RaiseOrRun(bindShiftF[1], bindShiftF[2])
#+g:: RaiseOrRun(bindShiftG[1], bindShiftG[2])
#+h:: RaiseOrRun(bindShiftH[1], bindShiftH[2])
#+i:: RaiseOrRun(bindShiftI[1], bindShiftI[2])
#+j:: RaiseOrRun(bindShiftJ[1], bindShiftJ[2])
#+k:: RaiseOrRun(bindShiftK[1], bindShiftK[2])
#+l:: RaiseOrRun(bindShiftL[1], bindShiftL[2])
#+m:: RaiseOrRun(bindShiftM[1], bindShiftM[2])
#+n:: RaiseOrRun(bindShiftN[1], bindShiftN[2])
#+o:: RaiseOrRun(bindShiftO[1], bindShiftO[2])
#+p:: RaiseOrRun(bindShiftP[1], bindShiftP[2])
#+q:: RaiseOrRun(bindShiftQ[1], bindShiftQ[2])
#+r:: RaiseOrRun(bindShiftR[1], bindShiftR[2])
#+s:: RaiseOrRun(bindShiftS[1], bindShiftS[2])
#+t:: RaiseOrRun(bindShiftT[1], bindShiftT[2])
#+u:: RaiseOrRun(bindShiftU[1], bindShiftU[2])
#+v:: RaiseOrRun(bindShiftV[1], bindShiftV[2])
#+w:: RaiseOrRun(bindShiftW[1], bindShiftW[2])
#+x:: RaiseOrRun(bindShiftX[1], bindShiftX[2])
#+y:: RaiseOrRun(bindShiftY[1], bindShiftY[2])
#+z:: RaiseOrRun(bindShiftZ[1], bindShiftZ[2])

/* Windows + Alt + ?
 */

#!a:: RaiseOrRun(bindAltA[1], bindAltA[2])
#!b:: RaiseOrRun(bindAltB[1], bindAltB[2])
#!c:: RaiseOrRun(bindAltC[1], bindAltC[2])
#!d:: RaiseOrRun(bindAltD[1], bindAltD[2])
#!e:: RaiseOrRun(bindAltE[1], bindAltE[2])
#!f:: RaiseOrRun(bindAltF[1], bindAltF[2])
#!g:: RaiseOrRun(bindAltG[1], bindAltG[2])
#!h:: RaiseOrRun(bindAltH[1], bindAltH[2])
#!i:: RaiseOrRun(bindAltI[1], bindAltI[2])
#!j:: RaiseOrRun(bindAltJ[1], bindAltJ[2])
#!k:: RaiseOrRun(bindAltK[1], bindAltK[2])
#!l:: RaiseOrRun(bindAltL[1], bindAltL[2])
#!m:: RaiseOrRun(bindAltM[1], bindAltM[2])
#!n:: RaiseOrRun(bindAltN[1], bindAltN[2])
#!o:: RaiseOrRun(bindAltO[1], bindAltO[2])
#!p:: RaiseOrRun(bindAltP[1], bindAltP[2])
#!q:: RaiseOrRun(bindAltQ[1], bindAltQ[2])
#!r:: RaiseOrRun(bindAltR[1], bindAltR[2])
#!s:: RaiseOrRun(bindAltS[1], bindAltS[2])
#!t:: RaiseOrRun(bindAltT[1], bindAltT[2])
#!u:: RaiseOrRun(bindAltU[1], bindAltU[2])
#!v:: RaiseOrRun(bindAltV[1], bindAltV[2])
#!w:: RaiseOrRun(bindAltW[1], bindAltW[2])
#!x:: RaiseOrRun(bindAltX[1], bindAltX[2])
#!y:: RaiseOrRun(bindAltY[1], bindAltY[2])
#!z:: RaiseOrRun(bindAltZ[1], bindAltZ[2])

#Enter:: RaiseOrRun(bindEnter[1], bindEnter[2])
#+Enter:: RaiseOrRun(bindShiftEnter[1], bindShiftEnter[2])

#^r:: Reload

/* Microsoft Natural 4000 Ergonomic Keyboard Keys.
 *
 * If you don't have this keyboard, that's okay. The only thing you'll miss
 * is the extended key set. Beside that, you can use this normally.
 */

MsNatural4000_Favorites1:
    RaiseOrRun(bindLaunch1[1], bindLaunch1[2])
    return
MsNatural4000_Favorites2:
    RaiseOrRun(bindLaunch2[1], bindLaunch2[2])
    return
MsNatural4000_Favorites3:
    RaiseOrRun(bindLaunch3[1], bindLaunch3[2])
    return
MsNatural4000_Favorites4:
    RaiseOrRun(bindLaunch4[1], bindLaunch4[2])
    return
MsNatural4000_Favorites5:
    RaiseOrRun(bindLaunch5[1], bindLaunch5[2])
    return

MsNatural4000_MyFavorites:
    ToggleTreechord()
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
