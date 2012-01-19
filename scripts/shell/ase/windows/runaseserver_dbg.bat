@echo off
::
:: Script to start ASE Apps
::

:: ensure environment variable changes are not propagated to calling script
setlocal EnableDelayedExpansion

:: #### get ASE bin directory ####
set mydir=%~dp0

:: #### get name of this script ####
set myname=%~nx0

:: #### Decide which binary to run ####
set start_sapi=0

if /I %myname% EQU runasedata.bat (
  set ASE_BIN_FILE=asedata.exe
  goto RUN
)
if /I %myname% EQU runasedata (
  set ASE_BIN_FILE=asedata.exe
  goto RUN
)
if /I %myname% EQU runasedbdmp.bat (
  set ASE_BIN_FILE=asedbdmp.exe
  goto RUN
)
if /I %myname% EQU runasedbdmp (
  set ASE_BIN_FILE=asedbdmp.exe
  goto RUN
)
if /I %myname% EQU runaseload.bat (
  set ASE_BIN_FILE=aseload.exe
  goto RUN
)
if /I %myname% EQU runaseload (
  set ASE_BIN_FILE=aseload.exe
  goto RUN
)
if /i %myname% EQU runaseserver_dbg.bat (
  set ASE_BIN_FILE=aseserver.exe
  goto RUN
)
if /i %myname% EQU runaseserver (
  set ASE_BIN_FILE=aseserver.exe
  goto RUN
)
if /I %myname% EQU start-ase.bat (
  set ASE_BIN_FILE=aseserver.exe
  goto RUN
)
if /I %myname% EQU start-ase (
  set ASE_BIN_FILE=aseserver.exe
  goto RUN
)
if /I %myname% EQU runasecomponentconversiontool.bat (
  set ASE_BIN_FILE=asecomponentconversiontool.exe
  goto RUN
)
if /I %myname% EQU runasecomponentconversiontool (
  set ASE_BIN_FILE=asecomponentconversiontool.exe
  goto RUN
)
if /I %myname% EQU runasemimicgui.bat (
  set ASE_BIN_FILE=..\util\mimicgui.exe
  goto RUN
)
if /I %myname% EQU runasemimicgui (
  set ASE_BIN_FILE=..\util\mimicgui.exe
  goto RUN
)
if /I %myname% EQU runrwclient.bat (
  set ASE_BIN_FILE=..\util\rwclient.exe
  goto RUN
)
if /I %myname% EQU runrwclient (
  set ASE_BIN_FILE=..\util\rwclient.exe
  goto RUN
)
if /I %myname% EQU runaseutility.bat (
  set ASE_BIN_FILE=aseutility.exe
  goto RUN
)
if /I %myname% EQU runaseutility (
  set ASE_BIN_FILE=aseutility.exe
  goto RUN
)
if /I %myname% EQU ping-ase.bat (
  set ASE_BIN_FILE=aseutility.exe
  goto RUN
)
if /I %myname% EQU ping-ase (
  set ASE_BIN_FILE=aseutility.exe
  goto RUN
)
if /I %myname% EQU stop-ase.bat (
  set ASE_BIN_FILE=aseutility.exe
  goto RUN
)
if /I %myname% EQU stop-ase (
  set ASE_BIN_FILE=aseutility.exe
  goto RUN
)
if /I %myname% EQU runasemerge.bat (
  set ASE_BIN_FILE=asemerge.exe
  goto RUN
)
if /I %myname% EQU runasemerge (
  set ASE_BIN_FILE=asemerge.exe
  goto RUN
)
if /I %myname% EQU diagnose-runase.bat (
  call PRINTDIAGNOSTICMESSAGE
  goto DONE
) 
if /I %myname% EQU diagnose-runase (
  call PRINTDIAGNOSTICMESSAGE
  goto DONE
) 

:: #### if control gets to this point then ... ####
echo Unknown startup script: %myname%. Exiting...
goto ERRORDONE

:RUN
if not defined ASE_BIN_FILE (set ASE_BIN_FILE=runase)
if not exist %mydir%\asecommon.bat (
  if exist %ASE_HOME%\bin\asecommon_dbg.bat (
      set mydir=%ASE_HOME%\bin
  ) else (
    if exist %mydir%\..\bin\asecommon_dbg.bat (
      set mydir=%mydir%\..\bin
    )
  )
)
:: #### This is common script for ALL ase excutable. This will set the    ####
:: #### necessary environment setting inside and launch the corresponding ####
:: #### excutable                                                         ####
%mydir%\asecommon_dbg.bat %*
goto DONE

goto :EOF

:DONE
endlocal
goto :EOF

:ERRORDONE
endlocal
exit /B 1
::call %ALGO_HOME%\bin\utils\algoexit.exe 1
goto :EOF
