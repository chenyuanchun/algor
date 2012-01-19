@echo off
::
:: Common script to start ASE Apps
::

:: ensure environment variable changes are not propagated to calling script
setlocal EnableDelayedExpansion

:: #### ASE_BIN_FILE needs to be defined ####
if not defined ASE_BIN_FILE goto ERRORDONE

:: #### Set up ASE_BIN ####
set ASE_BIN=%~dp0

:: #### Set up ASE_HOME ####
if not defined ASE_HOME (
  call :RESOLVE "%ASE_BIN%\.." ASE_HOME
)

:: #### Set up ASELOGDIR, the default log directory             ####
:: #### according to TCO spec, it should be in "%ALGO_TOP%\log" ####
if not defined ASELOGDIR (
  set ASELOGDIR=%ALGO_TOP%\log
  if not defined ALGO_TOP (
    echo Warning: ALGO_TOP was not set, using current directory as default log directory!
    set ASELOGDIR=%CD%) 
)

:: #### Set up ASECFGDIR, the default cfg directory             ####
:: #### according to TCO spec, it should be in "%ALGO_TOP%\cfg" ####
if not defined ASECFGDIR (
  set ASECFGDIR=%ALGO_TOP%\cfg
  if not defined ALGO_TOP (
    echo Warning: ALGO_TOP was not set, using current directory as default cfg directory!
    set ASECFGDIR=%CD%
  ) 
)

:: #### Set up SAPI_HOME to be in lib\SAPI\ below ASE_HOME ####
if not defined SAPI_HOME (
  set SAPI_HOME=%ASE_HOME%\lib\SAPI
)

:: #### Temporarily unset the SHOME environment variable (if it is already set) ####
:: #### so that SHOME will be set to the proper S-Plus runtime directory in the ####
:: #### file Splus5SDK                                                          ####
set SHOME=

:: #### Set up ALGO_HOME to be one dir up from ASE_HOME ####
if not defined ALGO_HOME (
  call :RESOLVE "%ASE_HOME%\.." ALGO_HOME
)

:: #### Set the default DB HOME if not existed... ####
set DBHOME=%DB_LIB32_PATH%\..
if not defined ORACLE_HOME (
  set ORACLE_HOME=%DBHOME%
)
if not defined SYBASE (
  set SYBASE=%DBHOME%
)
if not defined DB2DIR (
  set DB2DIR=%DBHOME%
)

:: #### Include CM's common script for the AlgoSuite extra library  ####
:: #### ALGO_LD_LIBRARY_PATH/ALGO_MT_LIBRARY_PATH will be set after ####
:: #### running setlibpath.sh                                       ####

:: #### default ld path ####
:: set default_ld_path=%ASE_LD_LIBRARY_PATH%;%ASE_HOME%\lib\pthread;%ASE_HOME%\lib;%ALGO_HOME%\lib\pthread;%DB_LIB32_PATH%;%ALGO_LD_LIBRARY_PATH%;%ALGO_MT_LIBPATH%
set default_ld_path=%ASE_HOME%\lib;%ASE_HOME%\bin;%ALGO_HOME%\bin;%ALGO_HOME%\lib

:: #### Set up PATH environment ####
if not defined PATH (
  set PATH=%default_ld_path%
) else (
  set PATH=%default_ld_path%;!PATH!;
)
set PATH=%PATH%;%ALGO_HOME%\third-party-apps\perl\bin;

:: #### Check if ASE_CONFIG_PATH is set and append the standard path to it ####
set default_config_path=%ASECFGDIR%;%ALGO_HOME%\cfg;%ASE_HOME%\cfg\;%CD%
if not defined ASE_CONFIG_PATH (
  set ASE_CONFIG_PATH=%default_config_path%
) else (
  set ASE_CONFIG_PATH=%ASE_CONFIG_PATH%;%default_config_path%
)

:: #### Set up ASE_DATA_PATH ####
set ASE_DATA_PATH=%ASE_DATA_PATH%;%ASE_HOME%\examples\FileFormats\;%ASE_CONFIG_PATH%

:: #### Set up ASE_WWW_PATH, for Web service
if not defined ASE_WWW_PATH (
  set ASE_WWW_PATH=%ASE_HOME%\util\wwwdoc
)

:: #### Set up PROP_DIR for algosuite-test domain
set ALGO_PROP_DIR=%ALGO_TOP%\cfg\aserc;%ALGO_HOME%\etc\
if not defined PROP_DIR (
  set PROP_DIR=%ALGO_PROP_DIR%
) else (
  set PROP_DIR=%PROP_DIR%;%ALGO_PROP_DIR%
)

:: #### get start date and environment file name (in case of core dumps) ####
For /f "tokens=2-4 delims=/ " %%a in ('date /t') do (set start_time=%%c-%%a-%%b)
set env_file=%ASELOGDIR%\ASECoreEnv-%start_time%.log

:: #### start ASE app with command line parameters passed to this script ####
if exist %ASE_BIN%%ASE_BIN_FILE% (
  echo Starting %ASEPRELOAD% %ASE_BIN_FILE%...
  "C:\Program Files\Debugging Tools for Windows (x64)\windbg.exe" %ASE_BIN%%ASE_BIN_FILE% %*
  if not errorlevel 0 (
    echo.
    echo %ASE_BIN%%ASE_BIN_FILE% returned error code %ERRORLEVEL%
    echo Please check your configuration and refer to the server log for more information
    if %ERRORLEVEL% GTR 128 (
      set /a signalcode=%ERRORLEVEL% - 128
      if !signalcode! LSS 39 (
        if not exist %ASE_HOME%\util\Bug-Reporter.sh (
          echo.
          echo Unfortunately, but application core dump with signal^("!signalcode!"^) on %start_time%.
          echo The application commnad line is:%ASEPRELOAD% %ASE_BIN%%ASE_BIN_FILE% %*
          set > %env_file%
          echo current user env file was written at '%env_file%'
          echo.
        ) 
      )
    ) else (
      if %ERRORLEVEL% EQU 12 (
        echo.
        echo Memory is exhausted on this machine, need to run vmstat here, todo
        echo.
      )
    )
    endlocal
    exit /B %ERRORLEVEL%
  )
) else (
  echo ASE executable %ASE_BIN%\%ASE_BIN_FILE% not found.  Exiting...
  call :ERRORDONE
)

endlocal
goto :EOF

:RESOLVE
set %2=%~f1
goto :EOF

:ERRORDONE
endlocal
exit /B 1
::call %ALGO_HOME%\bin\utils\algoexit.exe 1
goto :EOF
