@echo off
  setlocal
  pushd "%~dp0"

  set "vc=10"

  if "%vc%"=="10" call "%VS100COMNTOOLS%\..\..\vc\vcvarsall.bat" x86
  if "%vc%"=="10" set "VisualStudioVersion=10.0"
  rem
  if "%vc%"=="12" call "%VS120COMNTOOLS%\..\..\vc\vcvarsall.bat" x86
  rem
  if "%vc%"=="14" call "%VS140COMNTOOLS%\..\..\vc\vcvarsall.bat" x86
  rem
  if "%vc%"=="15" pushd .
  if "%vc%"=="15" call "%VS150COMNTOOLS%\..\..\VC\Auxiliary\Build\vcvarsall.bat" x86
  if "%vc%"=="15" popd

  cl -nologo -EHsc -O1 -Os -Gr %XOPT% -I.. -DUNICODE -Fotool user32.lib advapi32.lib ole32.lib main.cpp
  if exist *.obj (1> nul del /q *.obj)

  popd
  endlocal
goto :EOF
