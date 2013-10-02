@echo off
pushd %~dp0

echo Installing dropbox...
::"Ninite Dropbox Installer.exe"
::start "%appdata%\Dropbox\bin\Dropbox.exe /home" 
echo Installing required library dokan
echo if any error occure ignore it
::DokanInstall_0.6.0.exe /S
cls

echo Installing automount
installAtStartup.vbs "%~dp0"

echo Please enter the encrypted folder you are going to use, 
echo Example C:\Dropbox\Crypt
::set /p encrypted=
set encrypted=C:\Dropbox\Crypt

echo.

set decrypt=H:

echo You will need to enter a password three times
echo The password is used to decrypt your files.
echo When you are finish, you can store your files in %decrypt%
echo Password
set /p password=

:: Create folder and ignore if it exist
mkdir %encrypted% >nul 2>&1

@echo off
set SCRIPT=automount.bat
echo rem @echo off > %SCRIPT%

echo :: Change to right Dropbox Path and set a password >> %SCRIPT%
echo. >> %SCRIPT%

echo set crypt=%encrypted% >> %SCRIPT%
echo set decrypt=%decrypt% >> %SCRIPT%
echo set password=%password% >> %SCRIPT%

echo. >> %SCRIPT%
echo echo %%password%% ^| encfs %%crypt%% %%decrypt%% -S >> %SCRIPT%

Echo Please reenter password again
echo p | echo %password% | echo %password% | encfs %encrypted% %decrypt%

::%SCRIPT%
::StartAutoMount.vbs





::Echo Use encfsw in your tray icon to created an encrypted folder
::start /B encfsw.exe
::pause
